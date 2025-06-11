import '../models/situacaoAcademica.dart';

class SituacaoAcademicaService {
  final List<SituacaoAcademica> _situacoes = [
    SituacaoAcademica(
      id: 1,
      alunoId: 1,
      foto: false,
      rg: true,
      certidaoNascimento: true,
      historicoEscolar: true,
      certificadoMilitar: true,
      cpf: true,
      diploma: true,
      comprovanteDeVotacao: false,
      comprovanteDeVacina: true,
      tituloEleitor: true,
    ),
    SituacaoAcademica(
      id: 2,
      alunoId: 2,
      foto: false,
      rg: true,
      certidaoNascimento: true,
      historicoEscolar: true,
      certificadoMilitar: true,
      cpf: true,
      diploma: true,
      comprovanteDeVotacao: false,
      comprovanteDeVacina: true,
      tituloEleitor: true,
    ),
    SituacaoAcademica(
      id: 3,
      alunoId: 3,
      foto: false,
      rg: true,
      certidaoNascimento: true,
      historicoEscolar: true,
      certificadoMilitar: true,
      cpf: true,
      diploma: true,
      comprovanteDeVotacao: false,
      comprovanteDeVacina: true,
      tituloEleitor: true,
    ),
  ];

  SituacaoAcademica? getByAlunoId(int alunoId) {
    try {
      return _situacoes.firstWhere((s) => s.alunoId == alunoId);
    } catch (_) {
      return null;
    }
  }
}
