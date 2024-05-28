
class User{
  // User({
  //   this.serverId,
  //   this.id,
  //   this.name,
  //   this.accessToken,
  //   this.imageTag,
  // });

  String? id;
  String? name;
  String? serverId;
  String? accessToken;
  String? imageTag;

  // factory User.fromJson(Map<String, dynamic> json){
  //  return User(
  //       serverId: json['ServerId'] as String,
  //       id: json['User']['Id'] as String?,
  //       name: json['User']['Name'] as String?,
  //       accessToken: json['AccessToken'] as String,
  //       imageTag: json['User']['PrimaryImageTag'] as String?,
  //     );
  // }

}