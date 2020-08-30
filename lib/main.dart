import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(FlaApp());

class _FlaAppState extends State<FlaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 0},
        {'texto': 'Branco', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 2},
        {'texto': 'Urso', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 0},
        {'texto': 'Elefante', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Como você está se sentindo hoje de 1 à 5?',
      'respostas': [
        {'texto': '1', 'pontuacao': 1},
        {'texto': '2', 'pontuacao': 2},
        {'texto': '3', 'pontuacao': 3},
        {'texto': '4', 'pontuacao': 4},
        {'texto': '5', 'pontuacao': 5},
      ]
    },
    {
      'texto': 'Escolha com sabedoria:',
      'respostas': [
        {'texto': 'BÔNUS?', 'pontuacao': 0},
        {'texto': 'BÔNUS?', 'pontuacao': 50},
        {'texto': 'BÔNUS?', 'pontuacao': 0},
        {'texto': 'BÔNUS?', 'pontuacao': 0},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada += 1;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('FlaApp Questions'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class FlaApp extends StatefulWidget {
  _FlaAppState createState() {
    return _FlaAppState();
  }
}

class StateStatelessWidget {}
