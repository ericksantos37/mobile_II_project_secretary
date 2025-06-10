import 'package:flutter/material.dart';

class GradeCurricularScreen extends StatelessWidget {
  const GradeCurricularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SISTEMAS DE INFORMAÇÃO (Matriculado)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Matriz Curricular - SISTEMAS DE INFORMAÇÃO',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildPeriodo(
              '1º Período',
              [
                '011001131    ALGORITMOS E PROGRAMAÇÃO I',
                '011001132    ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES I',
                '011001133    DESENVOLVIMENTO PRONT-SND',
                '011001134    INGLÊS INSTRUMENTAL',
                '011001135    LEITURA E PRÁTICA DE PRODUÇÃO TEXTUAL',
              ],
            ),
            // ... outros períodos (mantidos iguais)
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodo(String title, List<String> disciplinas) {
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
              borderRadius: BorderRadius.circular(4.0)),
          child: Column(
            children: [
              for (var disciplina in disciplinas)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(child: Text(disciplina)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}