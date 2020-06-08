import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:   ListaTransferencia(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando Transferência"),),
      body: Column(
        children: <Widget>[
          Editor(_controladorCampoNumeroConta,"Número da Conta", "0000"),
          Editor(_controladorCampoValor,"Valor","0.00",icone:Icons.monetization_on),
          RaisedButton(
            onPressed: () =>{
              _criarTransferencia(context),
            },
            child: Text("Confirmar"),
          )
        ],
      ),
    );
  }

  void _criarTransferencia(BuildContext _context) {

    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(_context,transferenciaCriada);
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

  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transferências")),
      body: ListView.builder(
          itemCount: _transferencias.length,
          itemBuilder: (context,indice ){
             final transferencia = _transferencias[indice];
             return ItemTransferencia(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add) ,
        onPressed: (){
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          }));
          future.then((transferenciaCriada) => {
            debugPrint("transferencia voltou para a lista"),
            debugPrint(transferenciaCriada.toString()),
            _transferencias.add(transferenciaCriada)
          });
        }),
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