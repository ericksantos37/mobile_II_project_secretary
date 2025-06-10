import 'usuario.dart';

class Aluno {
  final int id;
  final String nome;
  final String matricula;
  final String cpf;
  final int cursoId;
  final Usuario usuario;

  Aluno({required this.id, required this.nome, required this.matricula, required this.cpf, required this.cursoId, required this.usuario});
}