

import 'package:objectbox/objectbox.dart';

enum SiteType{
  emby,
  jellyfin,
  plex
}

@Entity()
class Site<T>{
  final int id = 0;
  final String? remake;
  final SiteType type;
  final String configId;

  Site({
    this.remake,
    required this.type,
    required this.configId
  });
}