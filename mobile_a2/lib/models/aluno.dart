import 'usuario.dart';

class Aluno {
  final int id;
  final String nome;
  final String matricula;
  final String cpf;
  final int cursoId;
  final String email;
  final String senha;

  Aluno({required this.id, required this.nome, required this.matricula, required this.cpf, required this.cursoId, required this.email, required this.senha});
}