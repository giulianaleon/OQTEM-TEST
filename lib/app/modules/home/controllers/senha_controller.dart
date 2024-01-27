import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'senha_controller.g.dart';

class SenhaController = _SenhaController with _$SenhaController;

abstract class _SenhaController with Store {
  final senhaController = TextEditingController();

  @observable
  bool obscureText = true;

  @action
  void togglePasswordVisibility() {
    obscureText = !obscureText;
  }
}
