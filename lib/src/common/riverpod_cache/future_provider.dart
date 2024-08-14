import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/objectbox.g.dart';
import 'package:themby/src/common/domiani/cache_response.dart';

extension FutureProviderSwr<State> on FutureProviderRef<State> {
  /// Return the [future] first if error occurs, it will return the cached value
  ///
  /// [T] is the type that will be emitted
  /// [Encodable] is the type that can be converted to and from json, and must be encodable by [jsonEncode]
  Future<T> futureSWR<T, Encodable>({
    required String key,
    required Future<T> Function() future,
    required void Function() refresh,
    required Store store,
    required T Function(Encodable json) fromJson,
    required Encodable Function(T object) toJson,
  }) async {

    final box = store.box<CacheResponse>();

    Query<CacheResponse> query = box.query(
        CacheResponse_.key.equals(key)).build();
    final raw = query.findFirst();

    if (raw != null) {
      final json = jsonDecode(raw.content);

      if(raw.isUsed){
        Future(() async {
          final value = await future();
          final json = toJson(value);
          box.put(CacheResponse(key: key, content: jsonEncode(json), isUsed: false));
          refresh();
        });
      }

      return fromJson(json as Encodable);
    }else{
      final value = await future();
      final json = toJson(value);
      box.put(CacheResponse(key: key, content: jsonEncode(json), isUsed: true));
      return value;
    }
  }
}