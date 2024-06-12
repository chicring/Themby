import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

part 'emby_library_query_notifier.g.dart';

@riverpod
class EmbyLibraryQueryNotifier extends _$EmbyLibraryQueryNotifier{

  @override
  ItemQuery build(){
    return (
      page: 0,
      parentId: '',
      includeItemTypes: 'Series,Movie',
      sortBy: 'DateLastContentAdded,SortName',
      sortOrder: 'Descending',
    );
  }

}