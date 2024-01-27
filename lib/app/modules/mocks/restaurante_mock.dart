import 'package:testot/app/modules/home/models/restaurante_model.dart';
import 'package:testot/app/modules/mocks/pedido_mock.dart';

class RestauranteMock {
  static List<Restaurante> getMockRestaurantes() {
    return [
      Restaurante(
        PedidoMock.getMockPedidos(),
        2,
        "123",
        "Restaurante da Maria",
        "maria",
      ),
      Restaurante(
        PedidoMock.getMockPedidos(),
        1,
        "12345",
        "X-CUBO",
        "cubo@gmail.com",
      ),
    ];
  }
}
