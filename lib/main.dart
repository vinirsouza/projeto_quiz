import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

void main() {
  runApp(QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;

  final perguntas = [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Azul', 'Verde', 'Amarelo', 'Vermelho'],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['Macaco', 'Elefante', 'Leão', 'Tartaruga'],
    },
    {
      'texto': 'Qual é seu filme favorito?',
      'respostas': ['Matrix', 'Inception', 'Interestelar', 'Jumanji'],
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print('Pergunta: $_perguntaSelecionada');
  }

  String _imprimePergunta() {
    if (_perguntaSelecionada < perguntas.length) {
      return perguntas[_perguntaSelecionada]['texto'].toString();
    } else {
      return perguntas[perguntas.length - 1]['texto'].toString();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perguntas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
