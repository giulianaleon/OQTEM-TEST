import 'package:mobx/mobx.dart';
import 'package:testot/app/modules/home/models/cliente_model.dart';
import 'package:testot/app/modules/home/models/item_model.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';

part 'pedido_controller.g.dart';

class PedidoController = _PedidoControllerBase with _$PedidoController;

abstract class _PedidoControllerBase with Store {
  @observable
  late Pedido pedido;

  @observable
  ObservableList<Pedido> pedidos = ObservableList<Pedido>();

  @observable
  bool statusPedido = false;

  _PedidoControllerBase() {
    pedido = Pedido([], StatusPedido.recebido, DateTime.now(), Cliente('', '', 0), 0, 0.0, []);
  }

  @action
  void setPedidos(List<Pedido> novosPedidos) {
    pedidos.clear();
    pedidos.addAll(novosPedidos);
  }

  @action
  void setStatusPedidos() {
    statusPedido = !statusPedido;
  }

  @action
  void adicionarItem(Item item) {
    pedido.items.add(item);
  }

  @action
  void removerItem(Item item) {
    pedido.items.remove(item);
  }

  @action
  void atualizarStatusPedido(Pedido pedido, StatusPedido newStatus) {
    final updatedPedido = Pedido(
      pedido.items,
      newStatus,
      pedido.entregaHora,
      pedido.cliente,
      pedido.id,
      pedido.valor,
      pedido.mensagens
    );

    final index = pedidos.indexOf(pedido);
    if (index != -1) {
      pedidos[index] = updatedPedido;
    }
  }

  @action
  void limparPedido() {
    pedido = Pedido([], StatusPedido.recusado, DateTime.now(), Cliente('', '', 0), 0, 0.0, []);
  }
}
