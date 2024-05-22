import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Respostas(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: FractionallySizedBox(
        widthFactor: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1.4,
        

        ),
        child: Padding( // Adicionado o widget Padding
          padding: EdgeInsets.all(10), // Preenchimento aplicado aqui
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 43, 37, 89),
              fontSize: 20,
            ),
          ),
        ),
        onPressed: quandoSelecionado,
      ),
    ),
    );
  }
}
