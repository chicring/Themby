import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/query/sort_type.dart';

part 'emby_library_query_notifier.g.dart';




@riverpod
class EmbyLibraryQueryNotifier extends _$EmbyLibraryQueryNotifier{

  @override
  ItemQuery build(){
    return (
      page: 0,
      parentId: '',
      includeItemTypes: 'Series,Movie',
      sortBy: sortType[0]['value']!,
      sortOrder: 'Descending',
      filters: '',
    );
  }

  void setItemQuery(ItemQuery itemQuery){
    state = itemQuery;
  }

  void setSortBy(int index){
    state = (
      page: 0,
      parentId: state.parentId,
      includeItemTypes: state.includeItemTypes,
      sortBy: sortType[index]['value']!,
      sortOrder: state.sortOrder,
      filters: state.filters,
    );
  }

  void toggleSortOrder(){
    if (state.sortOrder == "Descending"){
      state = (
        page: 0,
        parentId: state.parentId,
        includeItemTypes: state.includeItemTypes,
        sortBy: state.sortBy,
        sortOrder: "Ascending",
        filters: state.filters,
      );
    }else{
      state = (
      page: 0,
      parentId: state.parentId,
      includeItemTypes: state.includeItemTypes,
      sortBy: state.sortBy,
      sortOrder: "Descending",
      filters: state.filters,
      );
    }
  }

}