import 'package:testot/app/modules/home/models/pedido_model.dart';

class Restaurante {
  List<Pedido> pedidos;
  int totalPedidos;
  String nome;
  String email;
  String senha;

  Restaurante(this.pedidos, this.totalPedidos, this.senha, this.nome, this.email);
}