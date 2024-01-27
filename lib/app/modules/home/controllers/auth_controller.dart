import 'package:mobx/mobx.dart';
import 'package:testot/app/modules/home/controllers/pedido_controller.dart';
import 'package:testot/app/modules/home/controllers/restaurante_controller.dart';
import 'package:testot/app/modules/home/models/restaurante_model.dart';
import 'package:testot/app/modules/mocks/restaurante_mock.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  bool isAuthenticated = false;

  final PedidoController pedidoController;
  final RestauranteController restauranteController;

  _AuthControllerBase(this.pedidoController, this.restauranteController);

  @action
  Future<void> authenticate(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 2));
    Restaurante? restaurante;

    try {
      restaurante = RestauranteMock.getMockRestaurantes().firstWhere(
            (restaurante) => restaurante.email == email,
      );
    } catch (e) {
      print('Erro ao buscar o restaurante: $e');
    }

    if (restaurante != null && restaurante.senha == senha) {
      isAuthenticated = true;
      pedidoController.setPedidos(restaurante.pedidos);
      restauranteController.setRestaurante(restaurante);
    } else {
      isAuthenticated = false;
    }
  }

  @action
  void logout() {
    isAuthenticated = false;
    pedidoController.limparPedido();
  }
}
