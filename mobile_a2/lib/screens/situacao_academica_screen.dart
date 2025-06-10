import 'package:flutter/material.dart';

class SituacaoAcademicaScreen extends StatelessWidget {
  const SituacaoAcademicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (cabeçalho mantido igual)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (parte superior mantida igual)

            const SizedBox(height: 20),
            const Text(
              'Documentos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                children: [
                  _buildDocumentItem('Foto', obrigatorio: true),
                  _buildDocumentItem('Carteira de Identidade/RG', obrigatorio: true),
                  _buildDocumentItem('Certidão de Nascimento/Casamento', obrigatorio: true),
                  _buildDocumentItem('Histórico Escolar - Ensino Médio', obrigatorio: true),
                  _buildDocumentItem('Certificado Militar/Reservista'),
                  _buildDocumentItem('CPF (CIC)', obrigatorio: true),
                  _buildDocumentItem('Diploma/Certificado Registrado', obrigatorio: true),
                  _buildDocumentItem('Comprovante de Votação', obrigatorio: true),
                  _buildDocumentItem('Comprovante de Vacina'),
                  _buildDocumentItem('Título de Editor', obrigatorio: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem(String document, {bool obrigatorio = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Text(document),
          if (obrigatorio)
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('(Obrigatório)', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
    );
  }
}