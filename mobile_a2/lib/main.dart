import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/boletim_screen.dart';
import 'screens/rematricula_screen.dart';
import 'screens/analise_curricular_screen.dart';
import 'screens/grade_curricular_screen.dart';
import 'screens/situacao_academica_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Acadêmico',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/boletim': (context) => BoletimScreen(),
        '/rematricula': (context) => RematriculaScreen(),
        '/analise_curricular': (context) => AnaliseCurricularScreen(),
        '/grade_curricular': (context) => GradeCurricularScreen(),
        '/situacao_academica': (context) => SituacaoAcademicaScreen(),
      },
    );
  }
}
