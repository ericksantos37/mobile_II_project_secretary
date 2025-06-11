import '../models/matricula_disciplina.dart';

class MatriculaDisciplinaService {
  final List<MatriculaDisciplina> _matriculas = [
    MatriculaDisciplina(
      id: 1,
      alunoId: 1,
      disciplinaId: 1,
      notaA1: 7.5,
      notaA2: 8.0,
      frequencia: 95.0,
      status: 'Aprovado',
    ),
    MatriculaDisciplina(
      id: 2,
      alunoId: 2,
      disciplinaId: 4,
      notaA1: 5.0,
      notaA2: 6.0,
      frequencia: 80.0,
      status: 'Em andamento',
    ),
    MatriculaDisciplina(
      id: 3,
      alunoId: 3,
      disciplinaId: 7,
      notaA1: 5.0,
      notaA2: 6.0,
      frequencia: 80.0,
      status: 'Em andamento',
    ),
  ];

  List<MatriculaDisciplina> getAll() {
    return List.unmodifiable(_matriculas);
  }

  MatriculaDisciplina? getById(int id) {
    return _matriculas.firstWhere((m) => m.id == id, orElse: () => null as MatriculaDisciplina);
  }

  List<MatriculaDisciplina> getByAluno(int alunoId) {
    return _matriculas.where((m) => m.alunoId == alunoId).toList();
  }

  List<MatriculaDisciplina> getByDisciplina(int disciplinaId) {
    return _matriculas.where((m) => m.disciplinaId == disciplinaId).toList();
  }
}
