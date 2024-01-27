import 'package:testot/app/modules/home/models/cliente_model.dart';
import 'package:testot/app/modules/home/models/mensagem_model.dart';

import 'item_model.dart';

enum StatusPedido {
  recebido,
  preparo,
  concluido,
  recusado,
}

class Pedido {
  int id;
  double valor;
  List<Item> items;
  StatusPedido status;
  DateTime entregaHora;
  Cliente cliente;
  List<Mensagem> mensagens;

  Pedido(this.items, this.status, this.entregaHora, this.cliente, this.id, this.valor, this.mensagens);
}
