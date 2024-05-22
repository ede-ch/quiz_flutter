import 'package:flutter/material.dart';

class Questoes extends StatelessWidget {
  final String texto;

  Questoes(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(62),
        child: FractionallySizedBox(
          widthFactor: 1.2,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 27,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
