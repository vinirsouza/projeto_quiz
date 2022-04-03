import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function(int) quandoSelecionado;
  final int pontuacao;

  Resposta(this.texto, this.quandoSelecionado, this.pontuacao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        child: Text(
          texto,
          style: TextStyle(fontSize: 23),
        ),
        textColor: Colors.white,
        color: Colors.deepPurple,
        onPressed: () => quandoSelecionado(pontuacao),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}
