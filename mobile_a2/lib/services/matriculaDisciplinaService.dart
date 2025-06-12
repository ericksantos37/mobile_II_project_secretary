import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/matricula_disciplina.dart';

class MatriculaDisciplinaService extends ChangeNotifier {
  final String baseUrl = 'https://684a377d165d05c5d357ff2b.mockapi.io/api/v1/matricula_disciplina';
  List<MatriculaDisciplina> _matriculas = [];

  List<MatriculaDisciplina> get all => _matriculas;

  Future<void> fetchMatriculas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _matriculas = data.map((e) => MatriculaDisciplina.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception('Erro ao carregar matrículas');
    }
  }

  List<MatriculaDisciplina> getByAluno(int alunoId) {
    return _matriculas.where((m) => m.alunoId == alunoId).toList();
  }

  Future<void> addMatricula(MatriculaDisciplina novaMatricula) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(novaMatricula.toJson()),
    );

    if (response.statusCode == 201) {
      final created = MatriculaDisciplina.fromJson(json.decode(response.body));
      _matriculas.add(created);
      notifyListeners();
    } else {
      throw Exception('Erro ao adicionar matrícula');
    }
  }
}
