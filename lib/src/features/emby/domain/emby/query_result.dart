

class QueryResult<T>{
  List<T> items;
  int totalRecordCount;

  QueryResult({
    required this.items,
    required this.totalRecordCount,
  });

  factory QueryResult.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return QueryResult<T>(
      items: List<T>.from(json['Items'].map((item) => fromJson(item))),
      totalRecordCount: json['TotalRecordCount'],
    );
  }
}