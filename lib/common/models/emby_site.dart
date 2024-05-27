import 'package:isar/isar.dart';

part 'emby_site.g.dart';

@collection
class EmbySite{

  EmbySite({
    this.name,
    this.type,
    this.userId,
    this.username,
    this.password,
    this.imageTag,
    this.accessToken,
    this.serverName,
    this.serverId,
    this.host,
    this.port,
    this.version,
  });

  late int id;

  String? name;
  String? type;

  String? userId;
  String? username;
  String? password;
  String? imageTag;
  String? accessToken;

  String? serverName;
  String? serverId;
  String? host;
  int? port;
  String? version;

  factory EmbySite.fromJson(Map<String, dynamic> json){
    return EmbySite(
      serverId: json['ServerId'] as String,
      userId: json['User']['Id'] as String?,
      name: json['User']['Name'] as String?,
      accessToken: json['AccessToken'] as String,
      imageTag: json['User']['PrimaryImageTag'] as String?,
      type: json['type'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      serverName: json['serverName'] as String,
      host: json['host'] as String,
      port: json['port'] as int,
    );
  }
  
  EmbySite copyWith({
    String? name,
    String? type,
    String? userId,
    String? username,
    String? password,
    String? imageTag,
    String? accessToken,
    String? serverName,
    String? serverId,
    String? host,
    int? port,
    String? version,
  }) {
    return EmbySite(
      name: name ?? this.name,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      password: password ?? this.password,
      imageTag: imageTag ?? this.imageTag,
      accessToken: accessToken ?? this.accessToken,
      serverName: serverName ?? this.serverName,
      serverId: serverId ?? this.serverId,
      host: host ?? this.host,
      port: port ?? this.port,
      version: version ?? this.version,
    );
  }

}