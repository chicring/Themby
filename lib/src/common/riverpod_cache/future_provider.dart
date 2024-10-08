import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/objectbox.g.dart';
import 'package:themby/src/common/domiani/cache_response.dart';

extension FutureProviderSwr<State> on FutureProviderRef<State> {

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
          await box.putAsync(raw.copyWith(content: jsonEncode(json), isUsed: false), mode: PutMode.update);
          refresh();
        });
      }else{
        box.put(raw.copyWith(isUsed: true),mode: PutMode.update);
      }

      return fromJson(json as Encodable);
    }else{
      final value = await future();
      final json = toJson(value);
      box.put(CacheResponse(key: key, content: jsonEncode(json), isUsed: true));
      return value;
    }
  }

  Future<List<T>> futureListSWR<T, Encodable>({
    required String key,
    required Future<List<T>> Function() future,
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
      final jsonList = jsonDecode(raw.content) as List;

      if(raw.isUsed){
        Future(() async {
          final value = await future();
          final jsonList = value.map((item) => toJson(item)).toList();
          await box.putAsync(raw.copyWith(content: jsonEncode(jsonList), isUsed: false), mode: PutMode.update);
          refresh();
        });
      }else{
        box.put(raw.copyWith(isUsed: true),mode: PutMode.update);
      }
      return jsonList.map((json) => fromJson(json as Encodable)).toList();
    }else{
      final value = await future();
      final jsonList = value.map((item) => toJson(item)).toList();
      box.put(CacheResponse(key: key, content: jsonEncode(jsonList), isUsed: true));
      return value;
    }
  }
}