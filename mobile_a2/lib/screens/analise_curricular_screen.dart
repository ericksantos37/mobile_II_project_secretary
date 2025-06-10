import 'package:flutter/material.dart';

class AnaliseCurricularScreen extends StatelessWidget {
  const AnaliseCurricularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SISTEMAS DE INFORMAÇÃO (Matriculado)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
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
            // Tabela com borda
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                      verticalInside: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    columnSpacing: 20.0,
                    columns: const [
                      DataColumn(label: Text('Matrícula')),
                      DataColumn(label: Text('CPF')),
                      DataColumn(label: Text('Nome')),
                      DataColumn(label: Text('Curso')),
                      DataColumn(label: Text('Modalidade')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Ação')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          const DataCell(Text('222222')),
                          const DataCell(Text('111.222.333-44')),
                          const DataCell(Text('MEGUMIN')),
                          const DataCell(Text('SISTEMAS DE INFORMAÇÃO')),
                          const DataCell(Text('CÂMPUS PALMAS')),
                          const DataCell(Text('Matriculado')),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Icon(Icons.check, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(Text('222222')),
                          const DataCell(Text('111.222.333-44')),
                          const DataCell(Text('MEGUMIN')),
                          const DataCell(Text('SISTEMAS DE INFORMAÇÃO')),
                          const DataCell(Text('CÂMPUS PALMAS')),
                          const DataCell(Text('Transferência de Grade')),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Icon(Icons.check, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}