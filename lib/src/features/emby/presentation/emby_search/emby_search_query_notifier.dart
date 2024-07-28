import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part  'emby_search_query_notifier.g.dart';


@riverpod
class EmbySearchQueryNotifier extends _$EmbySearchQueryNotifier {
  Timer? _debounceTimer;

  @override
  String build(){
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    return '';
  }

  void setQuery(String query){
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = query;
    });
  }

}