// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senha_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SenhaController on _SenhaController, Store {
  late final _$obscureTextAtom =
      Atom(name: '_SenhaController.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$_SenhaControllerActionController =
      ActionController(name: '_SenhaController', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_SenhaControllerActionController.startAction(
        name: '_SenhaController.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_SenhaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscureText: ${obscureText}
    ''';
  }
}
