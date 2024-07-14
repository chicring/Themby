import 'package:flutter/material.dart';

class HomeAddServerState {

  final TextEditingController hostController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  bool isPasswordVisible;

  HomeAddServerState({
    required this.hostController,
    required this.usernameController,
    required this.passwordController,
    required this.isPasswordVisible,
  });

  HomeAddServerState.initial()
      :
        hostController = TextEditingController(),
        usernameController = TextEditingController(),
        passwordController = TextEditingController(),
        isPasswordVisible = false;
}