import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

void main() {
  runApp(QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
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
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }

    print('Pergunta: $_perguntaSelecionada');
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  String _imprimePergunta(int pergunta, List perguntas) {
    if (_perguntaSelecionada < perguntas.length) {
      return perguntas[pergunta]['texto'].toString();
    } else {
      return perguntas[perguntas.length - 1]['texto'].toString();
    }
  }

  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    List widgets = temPerguntaSelecionada
        ? respostas.map((t) => Resposta(t, _responder)).toList()
        : null;

    // for (String textoResposta in respostas) {
    //   widgets.add(Resposta(textoResposta, _responder));
    // }

    return MaterialApp(
      title: 'Perguntas',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto']),
                  ...widgets,
                ],
              )
            : Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(fontSize: 50),
                ),
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
