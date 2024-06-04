import 'package:flutter/material.dart';

class HomeAddServerState {

  final TextEditingController schemeController;
  final TextEditingController hostController;
  final TextEditingController portController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  bool isPasswordVisible;

  HomeAddServerState({
    required this.schemeController,
    required this.hostController,
    required this.portController,
    required this.usernameController,
    required this.passwordController,
    required this.isPasswordVisible,
  });

  HomeAddServerState.initial()
      : schemeController = TextEditingController(text: 'http'),
        hostController = TextEditingController(),
        portController = TextEditingController(),
        usernameController = TextEditingController(),
        passwordController = TextEditingController(),
        isPasswordVisible = false;
}