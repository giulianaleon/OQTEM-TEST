// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MensagemController on _MensagemController, Store {
  late final _$messagesAtom =
      Atom(name: '_MensagemController.messages', context: context);

  @override
  ObservableList<Mensagem> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Mensagem> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$listMessagesAtom =
      Atom(name: '_MensagemController.listMessages', context: context);

  @override
  List<Mensagem> get listMessages {
    _$listMessagesAtom.reportRead();
    return super.listMessages;
  }

  @override
  set listMessages(List<Mensagem> value) {
    _$listMessagesAtom.reportWrite(value, super.listMessages, () {
      super.listMessages = value;
    });
  }

  late final _$hasUnreadMessagesAtom =
      Atom(name: '_MensagemController.hasUnreadMessages', context: context);

  @override
  bool get hasUnreadMessages {
    _$hasUnreadMessagesAtom.reportRead();
    return super.hasUnreadMessages;
  }

  @override
  set hasUnreadMessages(bool value) {
    _$hasUnreadMessagesAtom.reportWrite(value, super.hasUnreadMessages, () {
      super.hasUnreadMessages = value;
    });
  }

  late final _$selectedPedidoAtom =
      Atom(name: '_MensagemController.selectedPedido', context: context);

  @override
  Pedido? get selectedPedido {
    _$selectedPedidoAtom.reportRead();
    return super.selectedPedido;
  }

  @override
  set selectedPedido(Pedido? value) {
    _$selectedPedidoAtom.reportWrite(value, super.selectedPedido, () {
      super.selectedPedido = value;
    });
  }

  late final _$selectedClientAtom =
      Atom(name: '_MensagemController.selectedClient', context: context);

  @override
  bool get selectedClient {
    _$selectedClientAtom.reportRead();
    return super.selectedClient;
  }

  @override
  set selectedClient(bool value) {
    _$selectedClientAtom.reportWrite(value, super.selectedClient, () {
      super.selectedClient = value;
    });
  }

  late final _$_MensagemControllerActionController =
      ActionController(name: '_MensagemController', context: context);

  @override
  void addMessage(Mensagem message) {
    final _$actionInfo = _$_MensagemControllerActionController.startAction(
        name: '_MensagemController.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_MensagemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnreadMessages(bool value) {
    final _$actionInfo = _$_MensagemControllerActionController.startAction(
        name: '_MensagemController.setUnreadMessages');
    try {
      return super.setUnreadMessages(value);
    } finally {
      _$_MensagemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPedido(Pedido? pedido) {
    final _$actionInfo = _$_MensagemControllerActionController.startAction(
        name: '_MensagemController.setSelectedPedido');
    try {
      return super.setSelectedPedido(pedido);
    } finally {
      _$_MensagemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
listMessages: ${listMessages},
hasUnreadMessages: ${hasUnreadMessages},
selectedPedido: ${selectedPedido},
selectedClient: ${selectedClient}
    ''';
  }
}
