import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/aluno.dart';
import '../models/disciplina.dart';
import '../models/curso.dart';
import '../providers/aluno_provider.dart';
import '../services/cursoService.dart';
import '../services/disciplinaService.dart';

class GradeCurricularScreen extends StatelessWidget {
  const GradeCurricularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alunoProvider = Provider.of<AlunoProvider>(context);
    final aluno = alunoProvider.aluno;

    if (aluno == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final cursoService = CursoService();
    final disciplinaService = DisciplinaService();
    final curso = cursoService.getById(aluno.cursoId);

    if (curso == null) {
      return const Scaffold(
        body: Center(child: Text('Curso não encontrado')),
      );
    }

    // ✅ Usando o novo método para pegar disciplinas do curso
    final disciplinas = disciplinaService.getByCursoId(curso.id);

    // ✅ Agrupar por período
    final Map<int, List<Disciplina>> disciplinasPorPeriodo = {};
    for (var d in disciplinas) {
      disciplinasPorPeriodo.putIfAbsent(d.periodo, () => []).add(d);
    }

    final periodosOrdenados = disciplinasPorPeriodo.keys.toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: Text('${curso.nome} (Matriculado)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Matriz Curricular - ${curso.nome}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (var periodo in periodosOrdenados)
              _buildPeriodo('${periodo}º Período', disciplinasPorPeriodo[periodo]!),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodo(String title, List<Disciplina> disciplinas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            children: disciplinas.map((disciplina) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.only(right: 12.0),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${disciplina.id.toString().padLeft(9, '0')}  ${disciplina.nome}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
