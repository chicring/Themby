

class People {
  final String name;
  final String role;
  final String id;
  final String? primaryImageTag;

  People({
    required this.name,
    required this.role,
    required this.id,
    this.primaryImageTag,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      name: json['Name'],
      role: json['Role'],
      id: json['Id'],
      primaryImageTag: json['PrimaryImageTag'],
    );
  }
}