
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String descricao;
  final String dica;
  final IconData icone;

  const Editor(this.controlador, this.descricao, this.dica,{this.icone}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
            icon:  icone != null ?Icon(icone): null,
            labelText: descricao,
            hintText: dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}