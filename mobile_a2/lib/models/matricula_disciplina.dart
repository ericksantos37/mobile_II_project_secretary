class MatriculaDisciplina {
  final String? id; // MockAPI usa id como String
  final int alunoId;
  final int disciplinaId;
  final double notaA1;
  final double notaA2;
  final double frequencia;
  final String status;

  MatriculaDisciplina({
    this.id, // opcional para criação
    required this.alunoId,
    required this.disciplinaId,
    required this.notaA1,
    required this.notaA2,
    required this.frequencia,
    required this.status,
  });

  factory MatriculaDisciplina.fromJson(Map<String, dynamic> json) {
    return MatriculaDisciplina(
      id: json['id'],
      alunoId: int.parse(json['alunoId'].toString()),
      disciplinaId: int.parse(json['disciplinaId'].toString()),
      notaA1: double.parse(json['notaA1'].toString()),
      notaA2: double.parse(json['notaA2'].toString()),
      frequencia: double.parse(json['frequencia'].toString()),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'alunoId': alunoId,
      'disciplinaId': disciplinaId,
      'notaA1': notaA1,
      'notaA2': notaA2,
      'frequencia': frequencia,
      'status': status,
    };
  }
}
