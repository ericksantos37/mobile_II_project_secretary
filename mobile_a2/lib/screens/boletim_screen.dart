import 'package:flutter/material.dart';
import 'package:mobile_a2/models/curso.dart';
import 'package:provider/provider.dart';

import '../models/aluno.dart';
import '../models/matricula_disciplina.dart';
import '../providers/aluno_provider.dart';
import '../services/cursoService.dart';
import '../services/matriculaDisciplinaService.dart';
import '../services/disciplinaService.dart';

class BoletimScreen extends StatelessWidget {
  const BoletimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alunoProvider = Provider.of<AlunoProvider>(context);
    final aluno = alunoProvider.aluno;

    if (aluno == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final curso = CursoService().getById(aluno.cursoId);

    if (curso == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final matriculaService = MatriculaDisciplinaService();
    final disciplinaService = DisciplinaService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boletim Acadêmico'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: matriculaService.fetchMatriculas(), // <-- Busca da API aqui
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar boletim'));
          }

          final disciplinasAluno = matriculaService.getByAluno(aluno.id);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(aluno, curso),
                const SizedBox(height: 20),
                _buildInfoCurso(),
                const SizedBox(height: 20),
                _buildDisciplinasTable(disciplinasAluno, disciplinaService),
                const SizedBox(height: 20),
                _buildFooterInfo(),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildHeader(Aluno aluno, Curso curso) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${curso.nome} (Matriculado)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(
          'Boletim Acadêmico - ${curso.nome}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Matrícula: ${aluno.matricula}',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildInfoCurso() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Disciplinas do Semestre Letivo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Período Letivo: 2025/01',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDisciplinasTable(
      List<MatriculaDisciplina> disciplinas,
      DisciplinaService disciplinaService,
      ) {
    if (disciplinas.isEmpty) {
      return const Center(
        child: Text('Nenhuma disciplina matriculada ainda.'),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12,
        headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) => Colors.blue.shade50,
        ),
        columns: const [
          DataColumn(label: Text('Código')),
          DataColumn(label: Text('Disciplina')),
          DataColumn(label: Text('Faltas %')),
          DataColumn(label: Text('A1')),
          DataColumn(label: Text('A2')),
          DataColumn(label: Text('Média')),
          DataColumn(label: Text('Situação')),
        ],
        rows: disciplinas.map((m) {
          final disciplina = disciplinaService.getById(m.disciplinaId);
          final nomeDisciplina = disciplina?.nome ?? 'Desconhecida';
          final media = ((m.notaA1 + m.notaA2) / 2).toStringAsFixed(1);

          return DataRow(cells: [
            DataCell(Text('${disciplina?.id ?? '-'}')),
            DataCell(Text(nomeDisciplina)),
            DataCell(Text('${m.frequencia.toStringAsFixed(0)}%')),
            DataCell(Text(m.notaA1.toStringAsFixed(1))),
            DataCell(Text(m.notaA2.toStringAsFixed(1))),
            DataCell(Text(media)),
            DataCell(Text(m.status)),
          ]);
        }).toList(),
      ),
    );
  }


  Widget _buildFooterInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Situação passiva da atenção de sistema de períodos letivos.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          'Disciplinas com a verificação.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          'Clique para ver os detalhes de vista.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
