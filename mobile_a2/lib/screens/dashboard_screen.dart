import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/aluno_provider.dart';

class DashboardScreen extends StatelessWidget {
  final List<DashboardItem> items;

  const DashboardScreen({super.key})
      : items = const [
    DashboardItem(
      title: 'BOLETIM (SEMESTRE ATUAL)',
      description: 'Desempenho nas disciplinas do semestre atual',
      route: '/boletim',
    ),
    DashboardItem(
      title: 'SITUAÇÃO ACADÊMICA',
      description: 'Veja a sua situação junto a secretaria e demais departamentos da uniting.',
      route: '/situacao_academica',
    ),
    DashboardItem(
      title: 'GRADE CURRICULAR',
      description: 'Selecione um curso e veja as disciplinas distribuídas por período.',
      route: '/grade_curricular',
    ),
    DashboardItem(
      title: 'ANÁLISE CURRICULAR',
      description: 'Análise curricular completa',
      route: '/analise_curricular',
    ),
    DashboardItem(
      title: 'REMATRÍCULA ONLINE',
      description: 'Fazer a rematrícula nos semestres posteriores, conforme calendário acadêmico. Emissão da declaração de vínculo.',
      route: '/rematricula',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secretaria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // Limpar o aluno logado
              Provider.of<AlunoProvider>(context, listen: false).clearAluno();
              // Voltar para a tela de login
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (var item in items) ...[
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(item),
                    _buildAccessButton('Acessar', () {
                      Navigator.pushNamed(context, item.route);
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(DashboardItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            item.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccessButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: const Icon(Icons.arrow_forward, color: Colors.blue),
        title: Text(
          text,
          style: const TextStyle(color: Colors.blue),
        ),
        onTap: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.blue, width: 1),
        ),
        tileColor: Colors.blue.withOpacity(0.1),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String description;
  final String route;

  const DashboardItem({
    required this.title,
    required this.description,
    required this.route,
  });
}
