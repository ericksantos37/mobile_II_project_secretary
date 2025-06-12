import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/aluno_provider.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/boletim_screen.dart';
import 'screens/rematricula_screen.dart';
import 'screens/analise_curricular_screen.dart';
import 'screens/grade_curricular_screen.dart';
import 'screens/situacao_academica_screen.dart';
import 'services/matriculaDisciplinaService.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlunoProvider()),
        ChangeNotifierProvider(create: (_) => MatriculaDisciplinaService()), // <-- Adicionado aqui
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Acadêmico',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/boletim': (context) => const BoletimScreen(),
        '/rematricula': (context) => const RematriculaScreen(),
        '/analise_curricular': (context) => const AnaliseCurricularScreen(),
        '/grade_curricular': (context) => const GradeCurricularScreen(),
        '/situacao_academica': (context) => const SituacaoAcademicaScreen(),
      },
    );
  }
}
