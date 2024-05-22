import 'package:flutter/material.dart';
import './questoes.dart';
import './respostas.dart';


class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecinada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecinada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
  return perguntaSelecinada < perguntas.length;
}

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada 
    ? perguntas[perguntaSelecinada]['respostas'] as List<Map<String, Object>>
    : [];


    return Column(
      children: <Widget>[
        Questoes(perguntas[perguntaSelecinada]['texto'] as String),
        ...
        respostas
          .map((resp){
          return Respostas(
            resp['texto'] as String,
            () => quandoResponder(int.parse(resp['pontuacao'].toString()) ),
          );
        }).toList(),
      ],
    );
  }
}