import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/situacaoAcademica.dart';
import '../providers/aluno_provider.dart';
import '../services/situacaoAcademicaService.dart';

class SituacaoAcademicaScreen extends StatelessWidget {
  const SituacaoAcademicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alunoProvider = Provider.of<AlunoProvider>(context);
    final aluno = alunoProvider.aluno;

    if (aluno == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final situacao = SituacaoAcademicaService().getByAlunoId(aluno.id);

    if (situacao == null) {
      return const Center(child: Text('Nenhuma situação acadêmica encontrada.'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Situação Acadêmica'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Nº de Matrícula', aluno.matricula),
            _buildTextField('Nome', aluno.nome),
            _buildTextField('Curso', 'SISTEMAS DE INFORMAÇÃO'),
            _buildTextField('Situação', 'Matriculado'),
            const SizedBox(height: 16),
            const Text(
              'Documentos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDocList(situacao),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
        controller: TextEditingController(text: value),
      ),
    );
  }

  Widget _buildDocList(SituacaoAcademica s) {
    return Column(
      children: [
        _buildDocRow('Foto', s.foto),
        _buildDocRow('Carteira de Identidade/RG', s.rg),
        _buildDocRow('Certidão de Nascimento/Casamento', s.certidaoNascimento),
        _buildDocRow('Histórico Escolar - Ensino Médio', s.historicoEscolar),
        _buildDocRow('Certificado Militar/Reservista', s.certificadoMilitar),
        _buildDocRow('CPF (CIC)', s.cpf),
        _buildDocRow('Diploma/Certificado Registrado', s.diploma),
        _buildDocRow('Comprovante de Votação', s.comprovanteDeVotacao),
        _buildDocRow('Comprovante de Vacina', s.comprovanteDeVacina),
        _buildDocRow('Título de Eleitor', s.tituloEleitor),
      ],
    );
  }

  Widget _buildDocRow(String label, bool entregue) {
    return ListTile(
      dense: true,
      leading: Icon(
        entregue ? Icons.check_circle : Icons.cancel,
        color: entregue ? Colors.green : Colors.red,
      ),
      title: Text(label),
      subtitle: const Text('(Obrigatório)'),
    );
  }
}
