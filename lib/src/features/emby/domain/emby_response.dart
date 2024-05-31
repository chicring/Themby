
abstract class EmbyResponse<T> {
  List<T> get items;
  int get totalRecordCount;
}