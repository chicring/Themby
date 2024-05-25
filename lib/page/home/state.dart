import '../../common/models/emby_site.dart';
import 'package:flutter/material.dart';

class HomeState{
  final List<EmbySite> sites;

  final TextEditingController hostController;
  final TextEditingController portController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  HomeState({
    required this.sites,
    required this.hostController,
    required this.portController,
    required this.usernameController,
    required this.passwordController,
  });

  HomeState.initial()
    : sites = [],
      hostController = TextEditingController(),
      portController = TextEditingController(),
      usernameController = TextEditingController(),
      passwordController = TextEditingController();
}