import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int totalDePontos;
  final void Function() quandoReinicarQuestionario;

  Resultado(this.totalDePontos, this.quandoReinicarQuestionario);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            totalDePontos == 0 ? 'Tente outra vez.' : 'Parabéns!',
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Você fez ' + totalDePontos.toString() + ' pontos.',
            style: TextStyle(fontSize: 35),
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          child: Text('Reiniciar'),
          onPressed: quandoReinicarQuestionario,
        ),
      ],
    );
  }
}
