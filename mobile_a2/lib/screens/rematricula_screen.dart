import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/matricula_disciplina.dart';
import '../models/disciplina.dart';
import '../providers/aluno_provider.dart';
import '../services/disciplinaService.dart';
import '../services/matriculaDisciplinaService.dart';

class RematriculaScreen extends StatefulWidget {
  const RematriculaScreen({super.key});

  @override
  State<RematriculaScreen> createState() => _RematriculaScreenState();
}

class _RematriculaScreenState extends State<RematriculaScreen> {
  final DisciplinaService disciplinaService = DisciplinaService();
  final Set<int> selectedDisciplinas = {};
  late Future<void> _fetchMatriculasFuture;

  @override
  void initState() {
    super.initState();
    final matriculaService = Provider.of<MatriculaDisciplinaService>(context, listen: false);
    _fetchMatriculasFuture = matriculaService.fetchMatriculas();
  }

  @override
  Widget build(BuildContext context) {
    final aluno = Provider.of<AlunoProvider>(context).aluno;
    final matriculaService = Provider.of<MatriculaDisciplinaService>(context);

    if (aluno == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rematrícula Online'),
      ),
      body: FutureBuilder<void>(
        future: _fetchMatriculasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados: ${snapshot.error}'));
          }

          final matriculasAluno = matriculaService.getByAluno(aluno.id);
          final disciplinasCurso = disciplinaService.getByCursoId(aluno.cursoId);

          // Verifica se tem alguma disciplina em andamento
          final possuiEmAndamento = matriculasAluno.any((m) => m.status.toLowerCase() == 'em andamento');

          // Disciplinas que já foram aprovadas ou estão em andamento
          final disciplinasCursadasOuEmAndamento = matriculasAluno
              .where((m) => m.status.toLowerCase() == 'aprovado' || m.status.toLowerCase() == 'em andamento')
              .map((m) => m.disciplinaId)
              .toSet();

          // Apenas disciplinas pendentes (ainda não cursadas)
          final disciplinasPendentes = disciplinasCurso
              .where((d) => !disciplinasCursadasOuEmAndamento.contains(d.id))
              .toList();

          if (possuiEmAndamento) {
            return const Center(
              child: Text(
                'Você já possui disciplinas em andamento.\nA rematrícula não está disponível.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecione as disciplinas para rematrícula:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: disciplinasPendentes.isEmpty
                      ? const Center(
                    child: Text('Nenhuma disciplina pendente para rematrícula.'),
                  )
                      : ListView.builder(
                    itemCount: disciplinasPendentes.length,
                    itemBuilder: (context, index) {
                      final disciplina = disciplinasPendentes[index];
                      return CheckboxListTile(
                        title: Text(disciplina.nome),
                        subtitle: Text('Período ${disciplina.periodo}'),
                        value: selectedDisciplinas.contains(disciplina.id),
                        onChanged: (selected) {
                          setState(() {
                            if (selected == true) {
                              selectedDisciplinas.add(disciplina.id);
                            } else {
                              selectedDisciplinas.remove(disciplina.id);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: selectedDisciplinas.isEmpty
                      ? null
                      : () {
                    for (var id in selectedDisciplinas) {
                      final novaMatricula = MatriculaDisciplina(
                        alunoId: aluno.id,
                        disciplinaId: id,
                        notaA1: 0.0,
                        notaA2: 0.0,
                        frequencia: 0.0,
                        status: 'Em andamento',
                      );
                      matriculaService.addMatricula(novaMatricula);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Rematrícula realizada com sucesso!')),
                    );

                    setState(() {
                      selectedDisciplinas.clear();
                    });
                  },
                  child: const Text('Confirmar Rematrícula'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
