
class EmbyConfig{

  EmbyConfig({
    required this.protocol,
    required this.host,
    required this.port,
  });

  String protocol; // "http" | "https";
  String host;
  int port;


  // factory EmbyConfig.fromJson(Map<String, dynamic> json){
  //   return EmbyConfig(
  //     protocol: json['protocol'] as String,
  //     host: json['host'] as String,
  //     port: json['port'] as int,
  //     path: json['path'] as String,
  //   );
  // }

}