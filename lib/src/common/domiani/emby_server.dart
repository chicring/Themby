

class EmbyServer {
  final String scheme;
  final String host;
  final String port;
  final String username;
  final String? password;

  EmbyServer({
    required this.scheme,
    required this.host,
    required this.port,
    required this.username,
    this.password,
  });

  EmbyServer copyWith({
    String? scheme,
    String? host,
    String? port,
    String? username,
    String? password,
  }) {
    return EmbyServer(
      scheme: scheme ?? this.scheme,
      host: host ?? this.host,
      port: port ?? this.port,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}