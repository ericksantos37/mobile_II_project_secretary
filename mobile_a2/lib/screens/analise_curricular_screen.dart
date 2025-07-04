import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/disciplina.dart';
import '../models/matricula_disciplina.dart';
import '../models/aluno.dart';
import '../services/cursoService.dart';
import '../services/disciplinaService.dart';
import '../services/matriculaDisciplinaService.dart';
import '../providers/aluno_provider.dart';

class AnaliseCurricularScreen extends StatefulWidget {
  const AnaliseCurricularScreen({super.key});

  @override
  State<AnaliseCurricularScreen> createState() => _AnaliseCurricularScreenState();
}

class _AnaliseCurricularScreenState extends State<AnaliseCurricularScreen> {
  late Future<void> _fetchFuture;

  @override
  void initState() {
    super.initState();
    final matriculaService = Provider.of<MatriculaDisciplinaService>(context, listen: false);
    _fetchFuture = matriculaService.fetchMatriculas();
  }

  @override
  Widget build(BuildContext context) {
    final alunoProvider = Provider.of<AlunoProvider>(context);
    final aluno = alunoProvider.aluno;
    final matriculaService = Provider.of<MatriculaDisciplinaService>(context);

    if (aluno == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return FutureBuilder(
      future: _fetchFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Erro ao carregar matrículas: ${snapshot.error}')));
        }

        final cursoService = CursoService();
        final disciplinaService = DisciplinaService();

        final curso = cursoService.getById(aluno.cursoId);
        final todasDisciplinas = disciplinaService.getByCursoId(aluno.cursoId);
        final matriculasAluno = matriculaService.getByAluno(aluno.id);

        final disciplinasConcluidas = matriculasAluno
            .where((m) => m.status.toLowerCase() == 'aprovado')
            .map((m) => disciplinaService.getById(m.disciplinaId))
            .whereType<Disciplina>()
            .toList();

        final disciplinasEmAndamento = matriculasAluno
            .where((m) => m.status.toLowerCase() == 'em andamento')
            .map((m) => disciplinaService.getById(m.disciplinaId))
            .whereType<Disciplina>()
            .toList();

        final idsConcluidas = disciplinasConcluidas.map((d) => d.id).toSet();
        final idsEmAndamento = disciplinasEmAndamento.map((d) => d.id).toSet();
        final disciplinasPendentes = todasDisciplinas
            .where((d) => !idsConcluidas.contains(d.id) && !idsEmAndamento.contains(d.id))
            .toList();

        final total = todasDisciplinas.length;
        final concluido = disciplinasConcluidas.length;
        final progresso = total > 0 ? concluido / total : 0.0;

        return Scaffold(
          appBar: AppBar(
            title: Text('${curso?.nome ?? "Curso"} (Matriculado)'),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
                tooltip: 'Voltar',
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Análise Curricular',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Progresso no curso:'),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progresso,
                      minHeight: 10,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text('${(progresso * 100).toStringAsFixed(1)}% concluído ($concluido de $total disciplinas)'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Disciplinas Concluídas', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildDisciplinaList(disciplinasConcluidas, Colors.green),
                const SizedBox(height: 20),
                const Text('Disciplinas em Andamento', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildDisciplinaList(disciplinasEmAndamento, Colors.orange),
                const SizedBox(height: 20),
                const Text('Disciplinas Pendentes', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildDisciplinaList(disciplinasPendentes, Colors.red),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDisciplinaList(List<Disciplina> disciplinas, Color dotColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        children: disciplinas.map((d) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(child: Text('${d.nome} (${d.cargaHoraria}h)')),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
