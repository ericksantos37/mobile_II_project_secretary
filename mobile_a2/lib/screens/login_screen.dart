import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/aluno.dart';
import '../providers/aluno_provider.dart';
import '../services/alunoService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final AlunoService _alunoService = AlunoService();

  void _fazerLogin(BuildContext context) {
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    final aluno = _alunoService.autenticar(email, senha);

    if (aluno != null) {
      Provider.of<AlunoProvider>(context, listen: false).login(aluno);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal do Aluno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acesse utilizando seu e-mail institucional:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail (@unitins.br)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implementar lógica de esqueci a senha
              },
              child: const Text('Esqueci minha senha'),
            ),
            TextButton(
              onPressed: () {
                // Implementar ajuda
              },
              child: const Text('Preciso de Ajuda'),
            ),
            const SizedBox(height: 10),
            const Text(
              '📍 AVA (Turmas 2001-2008)',
              style: TextStyle(fontSize: 14),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _fazerLogin(context),
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
