// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'65646891f2e9b9b97255dd96b0c50f0f4b15a638';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = Provider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = ProviderRef<Dio>;
String _$memCacheStoreHash() => r'a4373cadd03f75e92ce5a68335d602d47b54b289';

/// See also [memCacheStore].
@ProviderFor(memCacheStore)
final memCacheStoreProvider = AutoDisposeProvider<CacheStore>.internal(
  memCacheStore,
  name: r'memCacheStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$memCacheStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemCacheStoreRef = AutoDisposeProviderRef<CacheStore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
