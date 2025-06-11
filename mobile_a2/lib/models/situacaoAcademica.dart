
class SituacaoAcademica {
  final int id;
  final int alunoId;
  final bool foto;
  final bool rg;
  final bool certidaoNascimento;
  final bool historicoEscolar;
  final bool certificadoMilitar;
  final bool cpf;
  final bool diploma;
  final bool comprovanteDeVotacao;
  final bool comprovanteDeVacina;
  final bool tituloEleitor;

  SituacaoAcademica({required this.alunoId, required this.certidaoNascimento, required this.certificadoMilitar, required this.comprovanteDeVacina, required this.comprovanteDeVotacao, required this.cpf, required this.diploma, required this.foto, required this.historicoEscolar,required this.id,required this.rg, required this.tituloEleitor});
}