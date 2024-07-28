

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'home_search_query_notifier.g.dart';

@riverpod
class HomeSearchQueryNotifier extends _$HomeSearchQueryNotifier {

  Timer? _debounceTimer;

  @override
  String build(){
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return '';
  }

  void setQuery(String query){
    // Cancel the timer if it is active
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // only update the state once the query has been debounced
      state = query;
    });
  }

}