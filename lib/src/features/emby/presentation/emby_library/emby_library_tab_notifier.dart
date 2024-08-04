

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emby_library_tab_notifier.g.dart';


class LibraryTabState{

}

@riverpod
class EmbyLibraryNotifier extends _$EmbyLibraryNotifier {

  @override
  LibraryTabState build(){
    return LibraryTabState();
  }

  // Future<void> loadMore(int page) async {
  //   state = state.copyWith(page: page);
  //   ref.watch(getItemProvider(state));
  // }
  //
  // Future<void> setParentId(String parentId) async {
  //   state = state.copyWith(parentId: parentId);
  // }



}