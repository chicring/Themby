
import 'package:themby/src/features/emby/domain/emby/item.dart';

class EmbyResponse{
  List<Item> items;
  int totalRecordCount;

  EmbyResponse({
    required this.items,
    required this.totalRecordCount,
  });

  factory EmbyResponse.fromJson(Map<String, dynamic> json) {
    return EmbyResponse(
      items: List<Item>.from(json['Items'].map((item) => Item.fromJson(item))),
      totalRecordCount: json['TotalRecordCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Items': items.map((item) => item.toJson()).toList(),
      'TotalRecordCount': totalRecordCount,
    };
  }
}