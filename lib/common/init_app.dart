import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/common/global.dart';

import '../router/router.dart';


Future<void> intiApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  CustomNavigationHelper.instance;

  prefs = await SharedPreferences.getInstance();
}