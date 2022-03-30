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

  String _imprimePergunta(int pergunta, List perguntas) {
    if (_perguntaSelecionada < perguntas.length) {
<<<<<<< HEAD
      return perguntas[pergunta]['texto'].toString();
=======
      return perguntas[_perguntaSelecionada]['texto'].toString();
>>>>>>> a968de650503636e9afcf31e9a21c0fd9c07bc98
    } else {
      return perguntas[perguntas.length - 1]['texto'].toString();
    }
  }

  Widget build(BuildContext context) {
    List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];
    List widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    // for (String textoResposta in respostas) {
    //   widgets.add(Resposta(textoResposta, _responder));
    // }

    return MaterialApp(
      title: 'Perguntas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: [
            Questao(_imprimePergunta(_perguntaSelecionada, perguntas)),
            ...widgets,
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
