class MatriculaDisciplina {
  final int id;
  final int alunoId;
  final int disciplinaId;
  final double notaA1;
  final double notaA2;
  final double frequencia;
  final String status;

  MatriculaDisciplina({
    required this.id,
    required this.alunoId,
    required this.disciplinaId,
    required this.notaA1,
    required this.notaA2,
    required this.frequencia,
    required this.status,
  });
}