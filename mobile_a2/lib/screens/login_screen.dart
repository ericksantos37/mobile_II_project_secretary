import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              decoration: const InputDecoration(
                labelText: 'E-mail (@unitins.br)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: const Text('Esqueci minha senha'),
            ),
            TextButton(
              onPressed: () {
                // Handle help
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
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}