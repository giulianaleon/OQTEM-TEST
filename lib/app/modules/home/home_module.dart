import 'package:flutter_modular/flutter_modular.dart';
import 'package:testot/app/modules/home/controllers/auth_controller.dart';
import 'package:testot/app/modules/home/controllers/mensagem_controller.dart';
import 'package:testot/app/modules/home/controllers/pedido_controller.dart';
import 'package:testot/app/modules/home/controllers/restaurante_controller.dart';
import 'package:testot/app/modules/home/controllers/senha_controller.dart';
import 'package:testot/app/modules/home/views/LoginPage.dart';
import 'package:testot/app/modules/home/views/PedidosPage.dart';


class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => PedidoController()),
    Bind.singleton((i) => RestauranteController()),
    Bind.singleton((i) => SenhaController()),
    Bind.singleton((i) => MensagemController()),
    Bind.singleton((i) => AuthController(i.get<PedidoController>(), i.get<RestauranteController>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/pedidos', child: (_, args) => PedidosPage()),
  ];

}

