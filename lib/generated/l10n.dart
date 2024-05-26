// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `mine`
  String get mine {
    return Intl.message(
      'mine',
      name: 'mine',
      desc: '',
      args: [],
    );
  }

  /// `VIP`
  String get vip {
    return Intl.message(
      'VIP',
      name: 'vip',
      desc: '',
      args: [],
    );
  }

  /// `appearance`
  String get appearance {
    return Intl.message(
      'appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `theme Color`
  String get themeColor {
    return Intl.message(
      'theme Color',
      name: 'themeColor',
      desc: '',
      args: [],
    );
  }

  /// `dynamic Color`
  String get dynamicColor {
    return Intl.message(
      'dynamic Color',
      name: 'dynamicColor',
      desc: '',
      args: [],
    );
  }

  /// `dynamic color selection of wallpaper`
  String get dynamicColorDescription {
    return Intl.message(
      'dynamic color selection of wallpaper',
      name: 'dynamicColorDescription',
      desc: '',
      args: [],
    );
  }

  /// `follow the system`
  String get followTheSystem {
    return Intl.message(
      'follow the system',
      name: 'followTheSystem',
      desc: '',
      args: [],
    );
  }

  /// `light Mode`
  String get lightMode {
    return Intl.message(
      'light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `dark Mode`
  String get darkMode {
    return Intl.message(
      'dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `appearance Setting`
  String get appearanceSetting {
    return Intl.message(
      'appearance Setting',
      name: 'appearanceSetting',
      desc: '',
      args: [],
    );
  }

  /// `Link`
  String get link {
    return Intl.message(
      'Link',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `Host Address`
  String get hostAddress {
    return Intl.message(
      'Host Address',
      name: 'hostAddress',
      desc: '',
      args: [],
    );
  }

  /// `eg: http://localhost.com`
  String get hostAddressEg {
    return Intl.message(
      'eg: http://localhost.com',
      name: 'hostAddressEg',
      desc: '',
      args: [],
    );
  }

  /// `Add Server`
  String get addServer {
    return Intl.message(
      'Add Server',
      name: 'addServer',
      desc: '',
      args: [],
    );
  }

  /// `port`
  String get port {
    return Intl.message(
      'port',
      name: 'port',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
