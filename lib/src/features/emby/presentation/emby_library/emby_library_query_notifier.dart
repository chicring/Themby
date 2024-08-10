import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/query/sort_type.dart';
import 'package:themby/src/helper/prefs_provider.dart';

part 'emby_library_query_notifier.g.dart';




@riverpod
class EmbyLibraryQueryNotifier extends _$EmbyLibraryQueryNotifier{
  static const sortTypeKey = 'sortType';
  static const sortOrderKey = 'sortOrder';

  @override
  ItemQuery build(){
    final prefs = ref.watch(sharedPreferencesProvider);

    return (
      page: 0,
      parentId: '',
      includeItemTypes: 'Series,Movie',
      sortBy: sortType[prefs.getInt(sortTypeKey) ?? 11]['value']!,
      sortOrder: prefs.getString(sortOrderKey) ?? 'Descending',
      filters: '',
    );
  }

  void setItemQuery(ItemQuery itemQuery){
    state = itemQuery;
  }

  void setSortBy(int index){
    if (sortType[index]['value'] == state.sortBy){
      toggleSortOrder();
      return;
    }
    state = (
      page: 0,
      parentId: state.parentId,
      includeItemTypes: state.includeItemTypes,
      sortBy: sortType[index]['value']!,
      sortOrder: state.sortOrder,
      filters: state.filters,
    );
    final prefs = ref.watch(sharedPreferencesProvider);
    prefs.setInt(sortTypeKey, index);
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
    final prefs = ref.watch(sharedPreferencesProvider);
    prefs.setString(sortOrderKey, state.sortOrder);
  }

}