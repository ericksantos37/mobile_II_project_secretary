import '../models/disciplina.dart';

class DisciplinaService {
  final List<Disciplina> _disciplinas = [
    Disciplina(id: 1, nome: 'Algoritmos', cargaHoraria: 60, cursoId: 1, periodo: 1),
    Disciplina(id: 2, nome: 'Estrutura de Dados', cargaHoraria: 60, cursoId: 1, periodo: 2),
    Disciplina(id: 3, nome: 'Banco de Dados', cargaHoraria: 60, cursoId: 1, periodo: 3),
    Disciplina(id: 4, nome: 'Leis', cargaHoraria: 60, cursoId: 2, periodo: 1),
    Disciplina(id: 5, nome: 'Leis 2', cargaHoraria: 60, cursoId: 2, periodo: 2),
    Disciplina(id: 6, nome: 'Legislação de Algo', cargaHoraria: 60, cursoId: 2, periodo: 3),
    Disciplina(id: 7, nome: 'Cavalo', cargaHoraria: 60, cursoId: 3, periodo: 1),
    Disciplina(id: 8, nome: 'Fazenda', cargaHoraria: 60, cursoId: 3, periodo: 2),
    Disciplina(id: 9, nome: 'Curral', cargaHoraria: 60, cursoId: 3, periodo: 3),
  ];

  List<Disciplina> getAll() {
    return List.unmodifiable(_disciplinas);
  }

  Disciplina? getById(int id) {
    return _disciplinas.firstWhere((d) => d.id == id, orElse: () => null as Disciplina);
  }

  List<Disciplina> getByCursoId(int cursoId) {
    return _disciplinas.where((d) => d.cursoId == cursoId).toList();
  }

}
