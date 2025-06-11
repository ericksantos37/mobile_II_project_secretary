import 'package:flutter/material.dart';
import '../models/aluno.dart';

class AlunoProvider extends ChangeNotifier {
  Aluno? _aluno;

  Aluno? get aluno => _aluno;

  void login(Aluno aluno) {
    _aluno = aluno;
    notifyListeners();
  }

  void clearAluno() {
    _aluno = null;
    notifyListeners();
  }

  bool get estaLogado => _aluno != null;
}
