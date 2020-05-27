import 'package:fiap/screens/alunos_novo_screen.dart';
import 'package:fiap/screens/chamada_screen.dart';
import 'package:fiap/screens/chamadas_detalhes_screen.dart';
import 'package:fiap/screens/correcao_screen.dart';
import 'package:fiap/screens/home_screen.dart';
import 'package:fiap/screens/trabalhos_screen.dart';
import 'package:fiap/screens/turma_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/chamada': (context) => ChamadaScreen(),
        '/correcoes': (context) => CorrecaoScreen(),
        '/trabalhos': (context) => TrabalhosScreen(),
        '/turma': (context) => TurmaScreen(),
        '/novo': (context) => AlunosNovoScreen(),
        '/detalhes': (context) => ChamadaDetalhesScreen(),
      },
      title: 'FIAP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
