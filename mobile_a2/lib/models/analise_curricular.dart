import 'disciplina.dart';

class AnaliseCurricular {
  final int alunoId;
  final List<Disciplina> disciplinasConcluidas;
  final List<Disciplina> disciplinasPendentes;

  AnaliseCurricular({required this.alunoId, required this.disciplinasConcluidas, required this.disciplinasPendentes});
}