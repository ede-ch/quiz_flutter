import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(MyApp());

class _MyAppState extends State<MyApp> {
  var _perguntaSelecinada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
      {
       'texto': 'O que é um requisito de software?',
       'respostas': [
         {'texto': 'Descreve como um sistema funcionará', 'pontuacao':0},
         {'texto': 'Descreve o que um sistema fará', 'pontuacao':10}, 
         {'texto': 'Descrição de uma função ou restrição', 'pontuacao':0},
         {'texto': 'Descrição de um problema a ser resolvido', 'pontuacao':0},
       ],
       
      },
      {
       'texto': 'Quais são os principais princípios da programação orientada a objetos?',
        'respostas': [
          {'texto': 'Abstração, encapsulamento, herança e polimorfismo', 'pontuacao': 10},
          {'texto': 'Abstração, encapsulamento, herança e composição', 'pontuacao': 0},
          {'texto': 'Abstração, encapsulamento, herança e delegação', 'pontuacao': 0},
          {'texto': 'Abstração, encapsulamento, herança e sobrecarga', 'pontuacao': 0},
        ],
      },
      {
       'texto': 'O que é refatoração de código?',
        'respostas': [
          {'texto': 'Reescrever o código para melhorar eficiência', 'pontuacao': 0},
          {'texto': 'Reescrever o código para corrigir bugs', 'pontuacao': 0},
          {'texto': 'Reestruturar o código para adicionar novos recursos', 'pontuacao': 0},
          {'texto': 'Reestruturação do código sem alterar seu comportamento', 'pontuacao': 10},
        ],
      },
      {
       'texto': 'O que é um ambiente de integração contínua?',
        'respostas': [
           {'texto': 'Integram código semanalmente', 'pontuacao': 0},
           {'texto': 'Integram código mensalmente', 'pontuacao': 0},
           {'texto': 'Integram código frequentemente', 'pontuacao': 10},
           {'texto': 'Integram código anualmente', 'pontuacao': 0},
          ],
      },
      {
       'texto': 'O que é um protótipo de software?',
        'respostas': [
          {'texto': 'Modelo inicial para testar ideias', 'pontuacao' : 10},
          {'texto': 'Modelo final para testar ideias', 'pontuacao' : 0},
          {'texto': 'Modelo inicial para testar usabilidade', 'pontuacao' : 0},
          {'texto': 'Modelo final para testar usabilidade', 'pontuacao' : 0},
        ],
      },
      {
       'texto': 'O que é um bug de software?',
        'respostas': [
          {'texto': 'Erro que causa comportamento incorreto', 'pontuacao' : 0},
          {'texto': 'Erro que causa comportamento esperado', 'pontuacao' : 0},
          {'texto': 'Erro que causa comportamento inesperado', 'pontuacao' : 10},
          {'texto': 'Erro que causa comportamento correto', 'pontuacao' : 0},
        ],
      },
      {
       'texto': 'O que é um backlog de produto?',
        'respostas': [
          {'texto': 'Lista de funcionalidades que não serão feitas', 'pontuacao' : 0},
          {'texto': 'Lista de funcionalidades a serem feitas', 'pontuacao' : 10},
          {'texto': 'Lista de funcionalidades já feitas', 'pontuacao' : 0},
          {'texto': 'Lista de funcionalidades que serão feitas', 'pontuacao' : 0},
        ],
      },
      {
       'texto': 'O que é uma ferramenta de controle de versão?',
        'respostas': [
          {'texto' : 'Registra alterações em arquivos ao longo do tempo', 'pontuacao' : 10},
          {'texto' : 'Registra alterações em arquivos em determinado momento', 'pontuacao' : 0},
          {'texto' : 'Registra alterações em arquivos em determinado período', 'pontuacao' : 0},
          {'texto' : 'Registra alterações em arquivos em determinado ciclo', 'pontuacao' : 0},
        ],
      },
      {
       'texto': 'Qual é a complexidade de tempo (tempo de execução) do algoritmo QuickSort no pior caso?',
        'respostas': [
          {'texto': 'O(n log n) pela divisão do array em partes iguais', 'pontuacao':0},
          {'texto': 'O(n^2) devido a partições desequilibradas', 'pontuacao':10},
          {'texto': 'O(n log n) pelo pivô escolhido no meio do array', 'pontuacao':0},
          {'texto': 'O(n) pela estratégia eficiente de pivôs aleatórios', 'pontuacao':0},
        ],
      },
      {
       'texto': 'Como funcionam as Redes Neurais Convolucionais (CNNs)?',
       'respostas': [
         {'texto': 'CNNs usam convolução e pooling para extrair características', 'pontuacao': 0},
         {'texto': 'CNNs aplicam filtros para detectar padrões', 'pontuacao': 0},
         {'texto': 'CNNs reduzem dimensionalidade usando camadas de pooling', 'pontuacao': 0},
         {'texto': 'CNNs classificam e interpretam características com camadas totalmente conectadas', 'pontuacao': 10},
        ],
      },

  ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada){
     setState(() {
      _perguntaSelecinada++;
      _pontuacaoTotal += pontuacao;
     });

    }
  }

  void _reiniciarQuestionario() {
  setState(() {
    _perguntaSelecinada = 0;
    _pontuacaoTotal = 0;
  });
}


  bool get temPerguntaSelecionada {
    return _perguntaSelecinada < _perguntas.length;
  }
 
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'VarelaRound'
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),        
            backgroundColor: Color.fromARGB(255, 43, 37, 89),
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            centerTitle: true, // Centraliza o título da AppBar
          ),
          body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecinada: _perguntaSelecinada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ) 
    );
  }
}



class MyApp extends StatefulWidget {
  _MyAppState createState() {
    return _MyAppState();
  }
}
