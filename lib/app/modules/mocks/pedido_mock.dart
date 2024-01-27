import 'package:testot/app/modules/home/models/item_model.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';
import 'package:testot/app/modules/mocks/cliente_mock.dart';
import 'package:testot/app/modules/mocks/item_mock.dart';
import 'package:testot/app/modules/mocks/mensagem_mock.dart';

class PedidoMock {
  static List<Pedido> getMockPedidos() {
    final List<Item> mockItems = ItemMock.getMockItems();
    final cliente1 = ClienteMock.getMockClientes("Lauren");
    final cliente2 = ClienteMock.getMockClientes("Giuliana");
    final messages = MensagemMock.generateMessages();

    final pedido1 = Pedido(
        [mockItems[0], mockItems[1], mockItems[1]],
        StatusPedido.preparo,
        DateTime.now().add(const Duration(hours: 1)),
        cliente1,
        1,
        40.0,
        messages
    );

    final pedido2 = Pedido(
        [mockItems[2], mockItems[3]],
        StatusPedido.concluido,
        DateTime.now().subtract(const Duration(hours: 2)),
        cliente2,
        2,
        35.0,
        []
    );

    return [pedido1, pedido2];
  }

  static Pedido getMockPedido() {
    final List<Item> mockItems = ItemMock.getMockItems();
    final cliente = ClienteMock.getMockClientes("Lauren");
    final messages = MensagemMock.generateMessages();

    final pedido = Pedido(
        [mockItems[0], mockItems[1]],
        StatusPedido.preparo,
        DateTime.now().add(const Duration(hours: 4)),
        cliente,
        1,
        10.0,
        messages
    );


    return pedido;
  }
}
