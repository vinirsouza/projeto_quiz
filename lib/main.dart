import 'package:flutter/material.dart';
import './resposta.dart';
import './resultado.dart';
import './questionario.dart';

void main() {
  runApp(QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual o valor de pi?',
      'respostas': [
        {'texto': '2.1415', 'pontuacao': 0},
        {'texto': '2.1514', 'pontuacao': 0},
        {'texto': '3.1618', 'pontuacao': 0},
        {'texto': '3.1415', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'No desenho "Bob Esponja", o personagem Patrick é qual animal?',
      'respostas': [
        {'texto': 'Um tubarão', 'pontuacao': 0},
        {'texto': 'Uma lula', 'pontuacao': 0},
        {'texto': 'Uma estrela do mar', 'pontuacao': 10},
        {'texto': 'Uma água-viva', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o nome do personagem principal do filme "Matrix"?',
      'respostas': [
        {'texto': 'Thomas Anderson', 'pontuacao': 10},
        {'texto': 'Thomas Jeferson', 'pontuacao': 0},
        {'texto': 'Bryan Anderson', 'pontuacao': 0},
        {'texto': 'Jonas Jeferson', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  // String _imprimePergunta(int pergunta, List perguntas) {
  //   if (_perguntaSelecionada < perguntas.length) {
  //     return perguntas[pergunta]['texto'].toString();
  //   } else {
  //     return perguntas[perguntas.length - 1]['texto'].toString();
  //   }
  // }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    List widgets = temPerguntaSelecionada
        ? respostas
            .map((resp) =>
                Resposta(resp['texto'], _responder, resp['pontuacao']))
            .toList()
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
          backgroundColor: Colors.deepPurple,
        ),
        body: temPerguntaSelecionada
            ? Questionario(_perguntas[_perguntaSelecionada]['texto'], widgets)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
