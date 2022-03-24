import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizAppState extends State<QuizApp> {
  var perguntaSelecionada = 0;

  List<String> perguntas = [
    'Qual sua cor favorita?',
    'Qual seu filme favorito?',
  ];

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print('Pergunta: $perguntaSelecionada');
  }

  String imprimePergunta() {
    if (perguntaSelecionada < perguntas.length) {
      return perguntas[perguntaSelecionada];
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
            Text(imprimePergunta()),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  QuizAppState createState() {
    return QuizAppState();
  }
}
