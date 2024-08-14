

import 'package:objectbox/objectbox.dart';

@Entity()
class CacheResponse{

  @Id()
  int id;

  String key;

  String content;

  bool isUsed;

  CacheResponse({
    this.id = 0,
    required this.key,
    required this.content,
    required this.isUsed
  });

  CacheResponse copyWith({
    int? id,
    String? key,
    String? content,
    bool? isUsed,
  }) {
    return CacheResponse(
      id: id ?? this.id,
      key: key ?? this.key,
      content: content ?? this.content,
      isUsed: isUsed ?? this.isUsed,
    );
  }

}