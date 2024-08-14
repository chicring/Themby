// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewRepositoryHash() => r'5190bb059739b6f70d38c0c7ff7df9071a970480';

/// See also [viewRepository].
@ProviderFor(viewRepository)
final viewRepositoryProvider = AutoDisposeProvider<ViewRepository>.internal(
  viewRepository,
  name: r'viewRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ViewRepositoryRef = AutoDisposeProviderRef<ViewRepository>;
String _$getViewsHash() => r'8e508953fef4b4d86c35a38ee2b0cb501cc2bdf6';

/// See also [getViews].
@ProviderFor(getViews)
final getViewsProvider = AutoDisposeFutureProvider<EmbyResponse>.internal(
  getViews,
  name: r'getViewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getViewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetViewsRef = AutoDisposeFutureProviderRef<EmbyResponse>;
String _$getMediaHash() => r'c206477930949a1edf94377cf352764540e3373d';

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

/// See also [getMedia].
@ProviderFor(getMedia)
const getMediaProvider = GetMediaFamily();

/// See also [getMedia].
class GetMediaFamily extends Family<AsyncValue<Item>> {
  /// See also [getMedia].
  const GetMediaFamily();

  /// See also [getMedia].
  GetMediaProvider call(
    String id,
  ) {
    return GetMediaProvider(
      id,
    );
  }

  @override
  GetMediaProvider getProviderOverride(
    covariant GetMediaProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getMediaProvider';
}

/// See also [getMedia].
class GetMediaProvider extends AutoDisposeFutureProvider<Item> {
  /// See also [getMedia].
  GetMediaProvider(
    String id,
  ) : this._internal(
          (ref) => getMedia(
            ref as GetMediaRef,
            id,
          ),
          from: getMediaProvider,
          name: r'getMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaHash,
          dependencies: GetMediaFamily._dependencies,
          allTransitiveDependencies: GetMediaFamily._allTransitiveDependencies,
          id: id,
        );

  GetMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Item> Function(GetMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaProvider._internal(
        (ref) => create(ref as GetMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Item> createElement() {
    return _GetMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaRef on AutoDisposeFutureProviderRef<Item> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetMediaProviderElement extends AutoDisposeFutureProviderElement<Item>
    with GetMediaRef {
  _GetMediaProviderElement(super.provider);

  @override
  String get id => (origin as GetMediaProvider).id;
}

String _$getLastMediaHash() => r'fa9446d7ecc2a5d25eae04f35d90a3b6e6f96396';

/// See also [getLastMedia].
@ProviderFor(getLastMedia)
const getLastMediaProvider = GetLastMediaFamily();

/// See also [getLastMedia].
class GetLastMediaFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [getLastMedia].
  const GetLastMediaFamily();

  /// See also [getLastMedia].
  GetLastMediaProvider call(
    String parentId,
  ) {
    return GetLastMediaProvider(
      parentId,
    );
  }

  @override
  GetLastMediaProvider getProviderOverride(
    covariant GetLastMediaProvider provider,
  ) {
    return call(
      provider.parentId,
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
  String? get name => r'getLastMediaProvider';
}

/// See also [getLastMedia].
class GetLastMediaProvider extends AutoDisposeFutureProvider<List<Item>> {
  /// See also [getLastMedia].
  GetLastMediaProvider(
    String parentId,
  ) : this._internal(
          (ref) => getLastMedia(
            ref as GetLastMediaRef,
            parentId,
          ),
          from: getLastMediaProvider,
          name: r'getLastMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLastMediaHash,
          dependencies: GetLastMediaFamily._dependencies,
          allTransitiveDependencies:
              GetLastMediaFamily._allTransitiveDependencies,
          parentId: parentId,
        );

  GetLastMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentId,
  }) : super.internal();

  final String parentId;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(GetLastMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLastMediaProvider._internal(
        (ref) => create(ref as GetLastMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentId: parentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Item>> createElement() {
    return _GetLastMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLastMediaProvider && other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLastMediaRef on AutoDisposeFutureProviderRef<List<Item>> {
  /// The parameter `parentId` of this provider.
  String get parentId;
}

class _GetLastMediaProviderElement
    extends AutoDisposeFutureProviderElement<List<Item>> with GetLastMediaRef {
  _GetLastMediaProviderElement(super.provider);

  @override
  String get parentId => (origin as GetLastMediaProvider).parentId;
}

String _$getResumeMediaHash() => r'41f2cb7921b0812361243165c1955e0eb186638f';

/// See also [getResumeMedia].
@ProviderFor(getResumeMedia)
const getResumeMediaProvider = GetResumeMediaFamily();

/// See also [getResumeMedia].
class GetResumeMediaFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [getResumeMedia].
  const GetResumeMediaFamily();

  /// See also [getResumeMedia].
  GetResumeMediaProvider call({
    String? parentId,
  }) {
    return GetResumeMediaProvider(
      parentId: parentId,
    );
  }

  @override
  GetResumeMediaProvider getProviderOverride(
    covariant GetResumeMediaProvider provider,
  ) {
    return call(
      parentId: provider.parentId,
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
  String? get name => r'getResumeMediaProvider';
}

/// See also [getResumeMedia].
class GetResumeMediaProvider extends AutoDisposeFutureProvider<List<Item>> {
  /// See also [getResumeMedia].
  GetResumeMediaProvider({
    String? parentId,
  }) : this._internal(
          (ref) => getResumeMedia(
            ref as GetResumeMediaRef,
            parentId: parentId,
          ),
          from: getResumeMediaProvider,
          name: r'getResumeMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getResumeMediaHash,
          dependencies: GetResumeMediaFamily._dependencies,
          allTransitiveDependencies:
              GetResumeMediaFamily._allTransitiveDependencies,
          parentId: parentId,
        );

  GetResumeMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentId,
  }) : super.internal();

  final String? parentId;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(GetResumeMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetResumeMediaProvider._internal(
        (ref) => create(ref as GetResumeMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentId: parentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Item>> createElement() {
    return _GetResumeMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetResumeMediaProvider && other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetResumeMediaRef on AutoDisposeFutureProviderRef<List<Item>> {
  /// The parameter `parentId` of this provider.
  String? get parentId;
}

class _GetResumeMediaProviderElement
    extends AutoDisposeFutureProviderElement<List<Item>>
    with GetResumeMediaRef {
  _GetResumeMediaProviderElement(super.provider);

  @override
  String? get parentId => (origin as GetResumeMediaProvider).parentId;
}

String _$getRecommendationsHash() =>
    r'7aba0b93cd10fd00e58f6bc299a5cd4a5ff71da8';

/// See also [getRecommendations].
@ProviderFor(getRecommendations)
final getRecommendationsProvider =
    AutoDisposeFutureProvider<List<Item>>.internal(
  getRecommendations,
  name: r'getRecommendationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getRecommendationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetRecommendationsRef = AutoDisposeFutureProviderRef<List<Item>>;
String _$getSuggestionsHash() => r'7681be0364e79478205eed74f0c1f29aa77d4376';

/// See also [getSuggestions].
@ProviderFor(getSuggestions)
final getSuggestionsProvider = AutoDisposeFutureProvider<List<Item>>.internal(
  getSuggestions,
  name: r'getSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSuggestionsRef = AutoDisposeFutureProviderRef<List<Item>>;
String _$getSeasonsHash() => r'4c04c152471c5b9b3fa645320d9da3682f9494f8';

/// See also [getSeasons].
@ProviderFor(getSeasons)
const getSeasonsProvider = GetSeasonsFamily();

/// See also [getSeasons].
class GetSeasonsFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [getSeasons].
  const GetSeasonsFamily();

  /// See also [getSeasons].
  GetSeasonsProvider call(
    String seriesId,
  ) {
    return GetSeasonsProvider(
      seriesId,
    );
  }

  @override
  GetSeasonsProvider getProviderOverride(
    covariant GetSeasonsProvider provider,
  ) {
    return call(
      provider.seriesId,
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
  String? get name => r'getSeasonsProvider';
}

/// See also [getSeasons].
class GetSeasonsProvider extends AutoDisposeFutureProvider<List<Item>> {
  /// See also [getSeasons].
  GetSeasonsProvider(
    String seriesId,
  ) : this._internal(
          (ref) => getSeasons(
            ref as GetSeasonsRef,
            seriesId,
          ),
          from: getSeasonsProvider,
          name: r'getSeasonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSeasonsHash,
          dependencies: GetSeasonsFamily._dependencies,
          allTransitiveDependencies:
              GetSeasonsFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  GetSeasonsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final String seriesId;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(GetSeasonsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSeasonsProvider._internal(
        (ref) => create(ref as GetSeasonsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Item>> createElement() {
    return _GetSeasonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSeasonsProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSeasonsRef on AutoDisposeFutureProviderRef<List<Item>> {
  /// The parameter `seriesId` of this provider.
  String get seriesId;
}

class _GetSeasonsProviderElement
    extends AutoDisposeFutureProviderElement<List<Item>> with GetSeasonsRef {
  _GetSeasonsProviderElement(super.provider);

  @override
  String get seriesId => (origin as GetSeasonsProvider).seriesId;
}

String _$getEpisodesHash() => r'a3f90821004a34a0ebf503feb122cf07498cc446';

/// See also [getEpisodes].
@ProviderFor(getEpisodes)
const getEpisodesProvider = GetEpisodesFamily();

/// See also [getEpisodes].
class GetEpisodesFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [getEpisodes].
  const GetEpisodesFamily();

  /// See also [getEpisodes].
  GetEpisodesProvider call(
    String sid,
    String vid,
  ) {
    return GetEpisodesProvider(
      sid,
      vid,
    );
  }

  @override
  GetEpisodesProvider getProviderOverride(
    covariant GetEpisodesProvider provider,
  ) {
    return call(
      provider.sid,
      provider.vid,
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
  String? get name => r'getEpisodesProvider';
}

/// See also [getEpisodes].
class GetEpisodesProvider extends AutoDisposeFutureProvider<List<Item>> {
  /// See also [getEpisodes].
  GetEpisodesProvider(
    String sid,
    String vid,
  ) : this._internal(
          (ref) => getEpisodes(
            ref as GetEpisodesRef,
            sid,
            vid,
          ),
          from: getEpisodesProvider,
          name: r'getEpisodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getEpisodesHash,
          dependencies: GetEpisodesFamily._dependencies,
          allTransitiveDependencies:
              GetEpisodesFamily._allTransitiveDependencies,
          sid: sid,
          vid: vid,
        );

  GetEpisodesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sid,
    required this.vid,
  }) : super.internal();

  final String sid;
  final String vid;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(GetEpisodesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetEpisodesProvider._internal(
        (ref) => create(ref as GetEpisodesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sid: sid,
        vid: vid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Item>> createElement() {
    return _GetEpisodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEpisodesProvider && other.sid == sid && other.vid == vid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sid.hashCode);
    hash = _SystemHash.combine(hash, vid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetEpisodesRef on AutoDisposeFutureProviderRef<List<Item>> {
  /// The parameter `sid` of this provider.
  String get sid;

  /// The parameter `vid` of this provider.
  String get vid;
}

class _GetEpisodesProviderElement
    extends AutoDisposeFutureProviderElement<List<Item>> with GetEpisodesRef {
  _GetEpisodesProviderElement(super.provider);

  @override
  String get sid => (origin as GetEpisodesProvider).sid;
  @override
  String get vid => (origin as GetEpisodesProvider).vid;
}

String _$getItemHash() => r'8a49a12d3377bc642e5ac89a895c0e94ca327eae';

/// See also [getItem].
@ProviderFor(getItem)
const getItemProvider = GetItemFamily();

/// See also [getItem].
class GetItemFamily extends Family<AsyncValue<EmbyResponse>> {
  /// See also [getItem].
  const GetItemFamily();

  /// See also [getItem].
  GetItemProvider call({
    required ({
      String filters,
      String genreIds,
      String includeItemTypes,
      int page,
      String parentId,
      String sortBy,
      String sortOrder
    }) itemQuery,
  }) {
    return GetItemProvider(
      itemQuery: itemQuery,
    );
  }

  @override
  GetItemProvider getProviderOverride(
    covariant GetItemProvider provider,
  ) {
    return call(
      itemQuery: provider.itemQuery,
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
  String? get name => r'getItemProvider';
}

/// See also [getItem].
class GetItemProvider extends AutoDisposeFutureProvider<EmbyResponse> {
  /// See also [getItem].
  GetItemProvider({
    required ({
      String filters,
      String genreIds,
      String includeItemTypes,
      int page,
      String parentId,
      String sortBy,
      String sortOrder
    }) itemQuery,
  }) : this._internal(
          (ref) => getItem(
            ref as GetItemRef,
            itemQuery: itemQuery,
          ),
          from: getItemProvider,
          name: r'getItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getItemHash,
          dependencies: GetItemFamily._dependencies,
          allTransitiveDependencies: GetItemFamily._allTransitiveDependencies,
          itemQuery: itemQuery,
        );

  GetItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemQuery,
  }) : super.internal();

  final ({
    String filters,
    String genreIds,
    String includeItemTypes,
    int page,
    String parentId,
    String sortBy,
    String sortOrder
  }) itemQuery;

  @override
  Override overrideWith(
    FutureOr<EmbyResponse> Function(GetItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetItemProvider._internal(
        (ref) => create(ref as GetItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemQuery: itemQuery,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EmbyResponse> createElement() {
    return _GetItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetItemProvider && other.itemQuery == itemQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetItemRef on AutoDisposeFutureProviderRef<EmbyResponse> {
  /// The parameter `itemQuery` of this provider.
  ({
    String filters,
    String genreIds,
    String includeItemTypes,
    int page,
    String parentId,
    String sortBy,
    String sortOrder
  }) get itemQuery;
}

class _GetItemProviderElement
    extends AutoDisposeFutureProviderElement<EmbyResponse> with GetItemRef {
  _GetItemProviderElement(super.provider);

  @override
  ({
    String filters,
    String genreIds,
    String includeItemTypes,
    int page,
    String parentId,
    String sortBy,
    String sortOrder
  }) get itemQuery => (origin as GetItemProvider).itemQuery;
}

String _$getSimilarHash() => r'49e3407afc6c10e8e31abedd153dfef830708d77';

/// See also [getSimilar].
@ProviderFor(getSimilar)
const getSimilarProvider = GetSimilarFamily();

/// See also [getSimilar].
class GetSimilarFamily extends Family<AsyncValue<EmbyResponse>> {
  /// See also [getSimilar].
  const GetSimilarFamily();

  /// See also [getSimilar].
  GetSimilarProvider call(
    String id,
  ) {
    return GetSimilarProvider(
      id,
    );
  }

  @override
  GetSimilarProvider getProviderOverride(
    covariant GetSimilarProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getSimilarProvider';
}

/// See also [getSimilar].
class GetSimilarProvider extends AutoDisposeFutureProvider<EmbyResponse> {
  /// See also [getSimilar].
  GetSimilarProvider(
    String id,
  ) : this._internal(
          (ref) => getSimilar(
            ref as GetSimilarRef,
            id,
          ),
          from: getSimilarProvider,
          name: r'getSimilarProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSimilarHash,
          dependencies: GetSimilarFamily._dependencies,
          allTransitiveDependencies:
              GetSimilarFamily._allTransitiveDependencies,
          id: id,
        );

  GetSimilarProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<EmbyResponse> Function(GetSimilarRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSimilarProvider._internal(
        (ref) => create(ref as GetSimilarRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EmbyResponse> createElement() {
    return _GetSimilarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSimilarProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSimilarRef on AutoDisposeFutureProviderRef<EmbyResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetSimilarProviderElement
    extends AutoDisposeFutureProviderElement<EmbyResponse> with GetSimilarRef {
  _GetSimilarProviderElement(super.provider);

  @override
  String get id => (origin as GetSimilarProvider).id;
}

String _$getNextUpHash() => r'a27173d38523f182e26593992363c67afec94a56';

/// See also [getNextUp].
@ProviderFor(getNextUp)
const getNextUpProvider = GetNextUpFamily();

/// See also [getNextUp].
class GetNextUpFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [getNextUp].
  const GetNextUpFamily();

  /// See also [getNextUp].
  GetNextUpProvider call(
    String seriesId,
  ) {
    return GetNextUpProvider(
      seriesId,
    );
  }

  @override
  GetNextUpProvider getProviderOverride(
    covariant GetNextUpProvider provider,
  ) {
    return call(
      provider.seriesId,
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
  String? get name => r'getNextUpProvider';
}

/// See also [getNextUp].
class GetNextUpProvider extends AutoDisposeFutureProvider<List<Item>> {
  /// See also [getNextUp].
  GetNextUpProvider(
    String seriesId,
  ) : this._internal(
          (ref) => getNextUp(
            ref as GetNextUpRef,
            seriesId,
          ),
          from: getNextUpProvider,
          name: r'getNextUpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNextUpHash,
          dependencies: GetNextUpFamily._dependencies,
          allTransitiveDependencies: GetNextUpFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  GetNextUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final String seriesId;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(GetNextUpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNextUpProvider._internal(
        (ref) => create(ref as GetNextUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Item>> createElement() {
    return _GetNextUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNextUpProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNextUpRef on AutoDisposeFutureProviderRef<List<Item>> {
  /// The parameter `seriesId` of this provider.
  String get seriesId;
}

class _GetNextUpProviderElement
    extends AutoDisposeFutureProviderElement<List<Item>> with GetNextUpRef {
  _GetNextUpProviderElement(super.provider);

  @override
  String get seriesId => (origin as GetNextUpProvider).seriesId;
}

String _$getGenresHash() => r'9b9a2c2bf70cea3b8505360ab2adef2e16ee35ea';

/// See also [getGenres].
@ProviderFor(getGenres)
const getGenresProvider = GetGenresFamily();

/// See also [getGenres].
class GetGenresFamily extends Family<AsyncValue<EmbyResponse>> {
  /// See also [getGenres].
  const GetGenresFamily();

  /// See also [getGenres].
  GetGenresProvider call(
    String id,
  ) {
    return GetGenresProvider(
      id,
    );
  }

  @override
  GetGenresProvider getProviderOverride(
    covariant GetGenresProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getGenresProvider';
}

/// See also [getGenres].
class GetGenresProvider extends AutoDisposeFutureProvider<EmbyResponse> {
  /// See also [getGenres].
  GetGenresProvider(
    String id,
  ) : this._internal(
          (ref) => getGenres(
            ref as GetGenresRef,
            id,
          ),
          from: getGenresProvider,
          name: r'getGenresProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGenresHash,
          dependencies: GetGenresFamily._dependencies,
          allTransitiveDependencies: GetGenresFamily._allTransitiveDependencies,
          id: id,
        );

  GetGenresProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<EmbyResponse> Function(GetGenresRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGenresProvider._internal(
        (ref) => create(ref as GetGenresRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EmbyResponse> createElement() {
    return _GetGenresProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGenresProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetGenresRef on AutoDisposeFutureProviderRef<EmbyResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetGenresProviderElement
    extends AutoDisposeFutureProviderElement<EmbyResponse> with GetGenresRef {
  _GetGenresProviderElement(super.provider);

  @override
  String get id => (origin as GetGenresProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
