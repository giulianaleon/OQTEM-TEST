import 'package:mobx/mobx.dart';
import 'package:testot/app/modules/home/models/mensagem_model.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';

part 'mensagem_controller.g.dart';

class MensagemController = _MensagemController with _$MensagemController;

abstract class _MensagemController with Store {
  @observable
  ObservableList<Mensagem> messages = ObservableList<Mensagem>();

  @observable
  List<Mensagem> listMessages = [];

  @observable
  bool hasUnreadMessages = true;

  @observable
  Pedido? selectedPedido;

  @observable
  bool selectedClient = false;

  @action
  void addMessage(Mensagem message) {
    messages.add(message);
  }

  @action
  void setUnreadMessages(bool value) {
    hasUnreadMessages = value;
  }

  @action
  void setSelectedPedido(Pedido? pedido) {
    selectedClient = true;
    selectedPedido = pedido;
    listMessages = selectedPedido!.mensagens;
  }
}