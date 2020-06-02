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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: "Número da Conta",
                hintText: "0000"
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Valor",
                hintText: "0.00"
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              debugPrint("clicou");
              if(numeroConta != null && valor != null){
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint(transferenciaCriada.toString());
              }
            },
            child: Text("Confirmar"),
          )
        ],
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