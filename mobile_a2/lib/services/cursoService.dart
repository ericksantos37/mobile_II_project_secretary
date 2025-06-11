import '../models/curso.dart';

class CursoService {
  final List<Curso> _curso = [
    Curso(id: 1, nome: 'Sistemas da Informação', duracaoSemestres: 8),
    Curso(id: 2, nome: 'Direito', duracaoSemestres: 10),
    Curso(id: 3, nome: 'Engenharia Agronomica', duracaoSemestres: 10),
  ];

  List<Curso> getAll() {
    return List.unmodifiable(_curso);
  }

  Curso? getById(int id) {
    return _curso.firstWhere((d) => d.id == id, orElse: () => null as Curso);
  }

}
