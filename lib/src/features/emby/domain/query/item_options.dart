
enum ItemType{
  Series,
  Episode,
  Movie
}

class ItemOptions{
  String? includeItemTypes;
  String? personIds;
  String? filters;
  int? page;
  ItemType? type;

  ItemOptions({
    this.includeItemTypes,
    this.personIds,
    this.filters,
    this.page,
    this.type
  });

  Map<String, dynamic> toJson() {
    return {
      'IncludeItemTypes': includeItemTypes,
      'PersonIds': personIds,
      'Filters': filters,
      'page': page,
      'type': type
    };
  }

  ItemOptions copyWith({
    String? includeItemTypes,
    String? personIds,
    String? filters,
    int? page,
    ItemType? type
  }) {
    return ItemOptions(
      includeItemTypes: includeItemTypes ?? this.includeItemTypes,
      personIds: personIds ?? this.personIds,
      filters: filters ?? this.filters,
      page: page ?? this.page,
      type: type ?? this.type
    );
  }

}