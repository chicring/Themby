

import 'package:objectbox/objectbox.dart';

@Entity()
class CacheResponse{

  @Id()
  int id;

  String key;

  String content;

  CacheResponse({
    this.id = 0,
    required this.key,
    required this.content,
  });

}