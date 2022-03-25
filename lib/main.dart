import 'package:flutter/material.dart';
import './questao.dart';

void main() {
  runApp(QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;

  List<String> perguntas = [
    'Qual sua cor favorita?',
    'Qual seu filme favorito?',
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print('Pergunta: $_perguntaSelecionada');
  }

  String _imprimePergunta() {
    if (_perguntaSelecionada < perguntas.length) {
      return perguntas[_perguntaSelecionada];
    } else {
      return perguntas[perguntas.length - 1];
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
            Questao(_imprimePergunta()),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
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
