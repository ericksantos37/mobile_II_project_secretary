import 'package:flutter/material.dart';

class Disciplina {
  final String codigo;
  final String nome;
  bool selecionada;

  Disciplina({
    required this.codigo,
    required this.nome,
    this.selecionada = false,
  });
}

class RematriculaScreen extends StatefulWidget {

  const RematriculaScreen({
    super.key
  });

  @override
  State<RematriculaScreen> createState() => _RematriculaScreenState();
}

class _RematriculaScreenState extends State<RematriculaScreen> {
  late List<Disciplina> disciplinas;

  @override
  void initState() {
    super.initState();
    // Carrega as disciplinas do período atual do aluno
    disciplinas = _carregarDisciplinasDoPeriodo(1);
  }

  List<Disciplina> _carregarDisciplinasDoPeriodo(int periodo) {
    // Simulação de disciplinas por período
    // Na prática, isso viria de um banco de dados ou API
    final todasDisciplinas = [
      Disciplina(codigo: "MAT101", nome: "Cálculo I"),
      Disciplina(codigo: "FIS101", nome: "Física I"),
      Disciplina(codigo: "PROG101", nome: "Programação I"),
      Disciplina(codigo: "MAT102", nome: "Cálculo II"),
      Disciplina(codigo: "FIS102", nome: "Física II"),
      Disciplina(codigo: "PROG102", nome: "Programação II"),
      Disciplina(codigo: "ALG101", nome: "Álgebra Linear"),
      Disciplina(codigo: "EST101", nome: "Estatística"),
    ];

    // Simulação - cada período tem 3 disciplinas
    final startIndex = (periodo - 1) * 3;
    return todasDisciplinas.sublist(
      startIndex,
      startIndex + 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rematrícula - ${1}º Período'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Cabeçalho informativo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selecione as disciplinas para o ${1}º período:',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),

          // Lista de disciplinas
          Expanded(
            child: ListView.builder(
              itemCount: disciplinas.length,
              itemBuilder: (context, index) {
                final disciplina = disciplinas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: CheckboxListTile(
                    title: Text(disciplina.nome),
                    subtitle: Text('Código: ${disciplina.codigo}'),
                    value: disciplina.selecionada,
                    onChanged: (bool? value) {
                      setState(() {
                        disciplina.selecionada = value!;
                      });
                    },
                    secondary: const Icon(Icons.book),
                  ),
                );
              },
            ),
          ),

          // Resumo e botão de confirmação
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final disciplinasSelecionadas = disciplinas.where((d) => d.selecionada).toList();
                      if (disciplinasSelecionadas.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Selecione pelo menos uma disciplina')),
                        );
                        return;
                      }

                      _confirmarMatricula(context, disciplinasSelecionadas);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'CONFIRMAR MATRÍCULA',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmarMatricula(BuildContext context, List<Disciplina> disciplinas) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar Matrícula'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Você está matriculando nas seguintes disciplinas:'),
              const SizedBox(height: 16),
              ...disciplinas.map((d) => Text('- ${d.nome} (${d.codigo})')).toList(),
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Matrícula confirmada com sucesso!')),
                );
                // Aqui você pode adicionar a lógica para salvar no banco de dados
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}