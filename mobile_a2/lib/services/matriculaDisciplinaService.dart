import 'package:flutter/material.dart';
import '../models/matricula_disciplina.dart';

class MatriculaDisciplinaService extends ChangeNotifier {
  final List<MatriculaDisciplina> _matriculas = [];
  int _nextId = 1; // ID incremental

  List<MatriculaDisciplina> getAll() {
    return List.unmodifiable(_matriculas);
  }

  MatriculaDisciplina? getById(int id) {
    try {
      return _matriculas.firstWhere((m) => m.id == id);
    } catch (e) {
      return null;
    }
  }

  List<MatriculaDisciplina> getByAluno(int alunoId) {
    return _matriculas.where((m) => m.alunoId == alunoId).toList();
  }

  List<MatriculaDisciplina> getByDisciplina(int disciplinaId) {
    return _matriculas.where((m) => m.disciplinaId == disciplinaId).toList();
  }

  void addMatricula(MatriculaDisciplina novaMatricula) {
    final matriculaComId = MatriculaDisciplina(
      id: _nextId++,
      alunoId: novaMatricula.alunoId,
      disciplinaId: novaMatricula.disciplinaId,
      notaA1: novaMatricula.notaA1,
      notaA2: novaMatricula.notaA2,
      frequencia: novaMatricula.frequencia,
      status: novaMatricula.status,
    );
    _matriculas.add(matriculaComId);
    notifyListeners(); // Notifica a UI
  }
}
