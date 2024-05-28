import 'package:themby/common/models/emby_site.dart';

import '../../common/models/emby_view.dart';

class EmbyState {
  final EmbySite? site;

  final List<EmbyView>? views;

  EmbyState({this.site, this.views});

  EmbyState.inital()
    : site = null,
      views= null;

  EmbyState copyWith({
    EmbySite? site,
    List<EmbyView>? views,
  }) {
    return EmbyState(
      site: site ?? this.site,
      views: views ?? this.views
    );
  }
  
}
