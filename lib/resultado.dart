import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao <= 0) return 'Você não fez pontos... Que triste.';
    if (pontuacao <= 5) return 'Você pontuou em algum momento...';
    if (pontuacao <= 10)
      return 'Você acertou mais que a metade... Pontuou bem...';
    if (pontuacao <= 15) return 'Pegou todas as pontuações altas que incrível!';
    return 'Parece que você acertou o BÔNUS!Parabéns!...';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 28)),
        ),
        FlatButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar questionário?'),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
