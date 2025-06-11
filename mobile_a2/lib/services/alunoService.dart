import '../models/aluno.dart';

class AlunoService {
  final List<Aluno> _alunos = [
    Aluno(id: 1, nome: 'Megumin', matricula: '923456789', cpf: '89638798098', cursoId: 1, email: 'megumin@unitins.br', senha: 'megumin123'),
    Aluno(id: 2, nome: 'Schwi', matricula: '123456781', cpf: '29638798092', cursoId: 2, email: 'schwi@unitins.br', senha: 'schwi123'),
    Aluno(id: 3, nome: 'Riku', matricula: '323456783', cpf: '59638798095', cursoId: 3, email: 'riku@unitins.br', senha: 'riku123'),
  ];

  List<Aluno> getAll() {
    return List.unmodifiable(_alunos);
  }

  Aluno? getById(int id) {
    return _alunos.firstWhere((d) => d.id == id, orElse: () => null as Aluno);
  }

  Aluno? autenticar(String email, String senha) {
    return _alunos.firstWhere(
          (a) => a.email == email && a.senha == senha,
      orElse: () => null as Aluno,
    );
  }

}