// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PedidoController on _PedidoControllerBase, Store {
  late final _$pedidoAtom =
      Atom(name: '_PedidoControllerBase.pedido', context: context);

  @override
  Pedido get pedido {
    _$pedidoAtom.reportRead();
    return super.pedido;
  }

  bool _pedidoIsInitialized = false;

  @override
  set pedido(Pedido value) {
    _$pedidoAtom.reportWrite(value, _pedidoIsInitialized ? super.pedido : null,
        () {
      super.pedido = value;
      _pedidoIsInitialized = true;
    });
  }

  late final _$pedidosAtom =
      Atom(name: '_PedidoControllerBase.pedidos', context: context);

  @override
  ObservableList<Pedido> get pedidos {
    _$pedidosAtom.reportRead();
    return super.pedidos;
  }

  @override
  set pedidos(ObservableList<Pedido> value) {
    _$pedidosAtom.reportWrite(value, super.pedidos, () {
      super.pedidos = value;
    });
  }

  late final _$statusPedidoAtom =
      Atom(name: '_PedidoControllerBase.statusPedido', context: context);

  @override
  bool get statusPedido {
    _$statusPedidoAtom.reportRead();
    return super.statusPedido;
  }

  @override
  set statusPedido(bool value) {
    _$statusPedidoAtom.reportWrite(value, super.statusPedido, () {
      super.statusPedido = value;
    });
  }

  late final _$_PedidoControllerBaseActionController =
      ActionController(name: '_PedidoControllerBase', context: context);

  @override
  void setPedidos(List<Pedido> novosPedidos) {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.setPedidos');
    try {
      return super.setPedidos(novosPedidos);
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusPedidos() {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.setStatusPedidos');
    try {
      return super.setStatusPedidos();
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarItem(Item item) {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.adicionarItem');
    try {
      return super.adicionarItem(item);
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerItem(Item item) {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.removerItem');
    try {
      return super.removerItem(item);
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizarStatusPedido(Pedido pedido, StatusPedido newStatus) {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.atualizarStatusPedido');
    try {
      return super.atualizarStatusPedido(pedido, newStatus);
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparPedido() {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.limparPedido');
    try {
      return super.limparPedido();
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pedido: ${pedido},
pedidos: ${pedidos},
statusPedido: ${statusPedido}
    ''';
  }
}
