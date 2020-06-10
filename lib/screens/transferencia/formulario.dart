
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transferência";

const _dicaCampoValor ="0.00";
const _rotuloCampoValor = "Valor";

const _dicaCampoNumeroConta = "0000";
const _rotuloCampoNumeroConta = "Número da conta";

const _botaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor= TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_tituloAppBar),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(widget._controladorCampoNumeroConta,_rotuloCampoNumeroConta, _dicaCampoNumeroConta),
              Editor(widget._controladorCampoValor,_rotuloCampoValor,_dicaCampoValor,icone:Icons.monetization_on),
              RaisedButton(
                onPressed: () =>{
                  _criarTransferencia(context),
                },
                child: Text(_botaoConfirmar),
              )
            ],
          ),
        )
    );
  }

  void _criarTransferencia(BuildContext _context) {

    final int numeroConta = int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(_context,transferenciaCriada);
    }
  }

}