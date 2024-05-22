import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{

  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado{
    if(pontuacao < 10){
      return 'Você é um Noob :(';
    } else if(pontuacao < 20){
      return 'Dá pra melhorar!';
    } else if(pontuacao < 60){
      return 'Esse é o caminho!';
    } else {
      return 'Você é um Nerd! :)';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 43, 37, 89),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(           
            child: Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 43, 37, 89),
                borderRadius: BorderRadius.circular(12
              ),
            ),
            onPressed: quandoReiniciarQuestionario,
          ),
        ],
      ),
    );
  }
}