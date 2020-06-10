
class Transferencia{
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta,);

  @override
  String toString() {
    return "Transferência( conta:$numeroConta valor: $valor)";
  }
}