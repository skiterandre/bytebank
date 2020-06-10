import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget{

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }

}

class ListaTransferenciaState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context,indice ){
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add) ,
          onPressed: (){
            final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
              return FormularioTransferencia();
            }));
            future.then((transferenciaCriada) => _atualiza(transferenciaCriada));
          }),
    );
  }

  void _atualiza(Transferencia transferenciaCriada) {
    if(transferenciaCriada != null){
              setState((){
                widget._transferencias.add(transferenciaCriada);
              });
     }

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