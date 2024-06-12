
enum ItemType{
  Series,
  Episode,
  Movie
}

class ItemOptions{
  String? includeItemTypes;
  String? parentId;
  String? filters;
  int? page;
  String? sortBy;
  String? sortOrder;

  ItemOptions({
    this.includeItemTypes,
    this.parentId,
    this.filters,
    this.page,
    this.sortBy,
    this.sortOrder
  });


  ItemOptions copyWith({
    String? includeItemTypes,
    String? parentId,
    String? filters,
    int? page,
    String? sortBy,
    String? sortOrder
  }) {
    return ItemOptions(
      includeItemTypes: includeItemTypes ?? this.includeItemTypes,
        parentId: parentId ?? this.parentId,
      filters: filters ?? this.filters,
      page: page ?? this.page,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder
    );
  }

}