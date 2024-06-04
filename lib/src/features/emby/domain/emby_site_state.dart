
import 'package:themby/src/common/domiani/site.dart';

class EmbySiteState{
  late Site? site;
  String token;

  EmbySiteState({
    this.site,
    required this.token,
  });

  factory EmbySiteState.initial(String token){
    return EmbySiteState(
      token: token,
    );
  }

  EmbySiteState copyWith({
    Site? site,
    String? token,
  }) {
    return EmbySiteState(
      site: site ?? this.site,
      token: token ?? this.token,
    );
  }
}