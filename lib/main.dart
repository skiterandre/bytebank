import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia()
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final TextEditingController _controladorCampoNumeroConta = TextEditingController();
    final TextEditingController _controladorCampoValor= TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Criando Transferência"),),
      body: Column(
        children: <Widget>[
          Editor(_controladorCampoNumeroConta,"Número da Conta", "0000"),
          Editor(_controladorCampoValor,"Valor","0.00",icone:Icons.monetization_on),
          RaisedButton(
            onPressed: () =>_criarTransferencia(_controladorCampoNumeroConta, _controladorCampoValor),
            child: Text("Confirmar"),
          )
        ],
      ),
    );
  }

  void _criarTransferencia(TextEditingController _controladorCampoNumeroConta, TextEditingController _controladorCampoValor) {

    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint(transferenciaCriada.toString());
    }
  }
}

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


class ListaTransferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transferências")),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(325.00,12546454)),
          ItemTransferencia(Transferencia(550.00,22222)),
          ItemTransferencia(Transferencia(220.05,123545)),
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on,),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }

}

class Transferencia{
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return "Transferência( conta:$numeroConta valor: $valor)";
  }
}