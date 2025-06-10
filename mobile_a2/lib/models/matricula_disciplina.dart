class MatriculaDisciplina {
  final int id;
  final int alunoId;
  final int disciplinaId;
  final int periodoLetivoId;
  final double nota;
  final double frequencia;
  final String status;

  MatriculaDisciplina({
    required this.id,
    required this.alunoId,
    required this.disciplinaId,
    required this.periodoLetivoId,
    required this.nota,
    required this.frequencia,
    required this.status,
  });
}