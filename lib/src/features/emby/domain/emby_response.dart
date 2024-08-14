
class EmbyResponse<T>{
  List<T> items;
  int totalRecordCount;

  EmbyResponse({
    required this.items,
    required this.totalRecordCount,
  });

  factory EmbyResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return EmbyResponse<T>(
      items: List<T>.from(json['Items'].map((item) => fromJson(item))),
      totalRecordCount: json['TotalRecordCount'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    return {
      'Items': items.map((item) => toJson(item)).toList(),
      'TotalRecordCount': totalRecordCount,
    };
  }
}