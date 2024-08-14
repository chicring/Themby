// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchRepositoryHash() => r'915c00f4eb09c066b434a068b956b42f642c5fc5';

/// See also [searchRepository].
@ProviderFor(searchRepository)
final searchRepositoryProvider = AutoDisposeProvider<SearchRepository>.internal(
  searchRepository,
  name: r'searchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchRepositoryRef = AutoDisposeProviderRef<SearchRepository>;
String _$getSearchRecommendHash() =>
    r'a02293ab73385c25822f3d3febab4c79deac4069';

/// See also [getSearchRecommend].
@ProviderFor(getSearchRecommend)
final getSearchRecommendProvider =
    AutoDisposeFutureProvider<EmbyResponse>.internal(
  getSearchRecommend,
  name: r'getSearchRecommendProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSearchRecommendHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSearchRecommendRef = AutoDisposeFutureProviderRef<EmbyResponse>;
String _$embySearchHash() => r'e1a16244b556be9cc4a89dac0305cc5b6eb6529b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [embySearch].
@ProviderFor(embySearch)
const embySearchProvider = EmbySearchFamily();

/// See also [embySearch].
class EmbySearchFamily extends Family<AsyncValue<EmbyResponse>> {
  /// See also [embySearch].
  const EmbySearchFamily();

  /// See also [embySearch].
  EmbySearchProvider call(
    String query,
  ) {
    return EmbySearchProvider(
      query,
    );
  }

  @override
  EmbySearchProvider getProviderOverride(
    covariant EmbySearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'embySearchProvider';
}

/// See also [embySearch].
class EmbySearchProvider extends AutoDisposeFutureProvider<EmbyResponse> {
  /// See also [embySearch].
  EmbySearchProvider(
    String query,
  ) : this._internal(
          (ref) => embySearch(
            ref as EmbySearchRef,
            query,
          ),
          from: embySearchProvider,
          name: r'embySearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$embySearchHash,
          dependencies: EmbySearchFamily._dependencies,
          allTransitiveDependencies:
              EmbySearchFamily._allTransitiveDependencies,
          query: query,
        );

  EmbySearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<EmbyResponse> Function(EmbySearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EmbySearchProvider._internal(
        (ref) => create(ref as EmbySearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EmbyResponse> createElement() {
    return _EmbySearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EmbySearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EmbySearchRef on AutoDisposeFutureProviderRef<EmbyResponse> {
  /// The parameter `query` of this provider.
  String get query;
}

class _EmbySearchProviderElement
    extends AutoDisposeFutureProviderElement<EmbyResponse> with EmbySearchRef {
  _EmbySearchProviderElement(super.provider);

  @override
  String get query => (origin as EmbySearchProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
