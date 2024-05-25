
class User{
  User({
    required this.serverId,
    this.id,
    this.name,
    required this.accessToken,
  });

  String? id;
  String? name;
  String serverId;
  String accessToken;

  factory User.fromJson(Map<String, dynamic> json){
   return User(
        serverId: json['ServerId'] as String,
        id: json['User']['Id'] as String?,
        name: json['User']['Name'] as String?,
        accessToken: json['AccessToken'] as String,
      );
  }

}