

import 'package:themby/common/models/user.dart';

import 'emby_config.dart';

class EmbySite{

  EmbySite({
    required this.id,
    this.name,
    required this.user,
    required this.server,
  });

  String id;
  String? name;
  User user;
  EmbyConfig server;
}