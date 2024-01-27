// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurante_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RestauranteController on _RestauranteControllerBase, Store {
  late final _$restauranteAtom =
      Atom(name: '_RestauranteControllerBase.restaurante', context: context);

  @override
  Restaurante? get restaurante {
    _$restauranteAtom.reportRead();
    return super.restaurante;
  }

  @override
  set restaurante(Restaurante? value) {
    _$restauranteAtom.reportWrite(value, super.restaurante, () {
      super.restaurante = value;
    });
  }

  late final _$_RestauranteControllerBaseActionController =
      ActionController(name: '_RestauranteControllerBase', context: context);

  @override
  void setRestaurante(Restaurante novoRestaurante) {
    final _$actionInfo = _$_RestauranteControllerBaseActionController
        .startAction(name: '_RestauranteControllerBase.setRestaurante');
    try {
      return super.setRestaurante(novoRestaurante);
    } finally {
      _$_RestauranteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
restaurante: ${restaurante}
    ''';
  }
}
