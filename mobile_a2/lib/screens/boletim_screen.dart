import 'package:flutter/material.dart';

class BoletimScreen extends StatelessWidget {
  const BoletimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boletim Acadêmico'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildInfoCurso(),
            const SizedBox(height: 20),
            _buildDisciplinasTable(),
            const SizedBox(height: 20),
            _buildFooterInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SISTEMAS DE INFORMAÇÃO (Matriculado)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Boletim Acadêmico - SISTEMAS DE INFORMAÇÃO',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Período Letivo: 2025/01',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDisciplinasTable() {
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
          DataColumn(label: Text('Faltas')),
          DataColumn(label: Text('A1')),
          DataColumn(label: Text('A2')),
          DataColumn(label: Text('Final')),
          DataColumn(label: Text('Média Sem.')),
          DataColumn(label: Text('Média Final')),
          DataColumn(label: Text('Situação')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('011001171')),
            DataCell(Text('ELABORAÇÃO E GESTÃO DE PROJETOS')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('Matriculado')),
          ]),
          DataRow(cells: [
            DataCell(Text('011001173')),
            DataCell(Text('MINERAÇÃO DE DADOS')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('Matriculado')),
          ]),
          DataRow(cells: [
            DataCell(Text('011001174')),
            DataCell(Text('PROGRAMAÇÃO PARA DISPOSITIVOS MÓVEIS II')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('Matriculado')),
          ]),
          DataRow(cells: [
            DataCell(Text('011001172')),
            DataCell(Text('SISTEMAS DISTRIBUÍDOS')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('Matriculado')),
          ]),
          DataRow(cells: [
            DataCell(Text('011001188')),
            DataCell(Text('TÓPICOS ESPECIAIS EM PROGRAMAÇÃO')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('Matriculado')),
          ]),
          DataRow(cells: [
            DataCell(Text('011001175')),
            DataCell(Text('TRABALHO DE CONCLUSÃO DE CURSO I')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('Matriculado')),
          ]),
        ],
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