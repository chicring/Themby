
import 'package:objectbox/objectbox.dart';

enum SiteType {
  emby,
  jellyfin,
  plex,
}

@Entity()
class Site{
  Site({
    this.id = 0,
    this.remake,
    this.type,
    this.serverId,
    this.serverName,
    this.version,
    this.scheme,
    this.host,
    this.port,
    this.userId,
    this.username,
    this.password,
    this.imageTag,
    this.accessToken
  });

  @Id()
  int id;
  final String? remake;
  final String? type;

  final String? serverId;
  final String? serverName;
  final String? version;
  final String? scheme;
  final String? host;
  final int? port;

  final String? userId;
  final String? username;
  final String? password;
  final String? imageTag;

  final String? accessToken;

  Site copyWith({
    int? id,
    String? remake,
    String? type,
    String? serverId,
    String? serverName,
    String? version,
    String? scheme,
    String? host,
    int? port,
    String? userId,
    String? username,
    String? password,
    String? imageTag,
    String? accessToken
  }) {
    return Site(
      id: id ?? this.id,
      remake: remake ?? this.remake,
      type: type ?? this.type,
      serverId: serverId ?? this.serverId,
      serverName: serverName ?? this.serverName,
      version: version ?? this.version,
      scheme: scheme ?? this.scheme,
      host: host ?? this.host,
      port: port ?? this.port,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      password: password ?? this.password,
      imageTag: imageTag ?? this.imageTag,
      accessToken: accessToken ?? this.accessToken
    );
  }


}