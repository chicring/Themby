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
String _$getViewsHash() => r'4c93ea39fd1ef9a19a92d67aebbe98bcd91af5de';

/// See also [getViews].
@ProviderFor(getViews)
final getViewsProvider = AutoDisposeFutureProvider<View>.internal(
  getViews,
  name: r'getViewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getViewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetViewsRef = AutoDisposeFutureProviderRef<View>;
String _$getLastMediaHash() => r'dbfdabe5823afd37ca08e0e5bcde5d2aa8610b4b';

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

/// See also [getLastMedia].
@ProviderFor(getLastMedia)
const getLastMediaProvider = GetLastMediaFamily();

/// See also [getLastMedia].
class GetLastMediaFamily extends Family<AsyncValue<List<Media>>> {
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
class GetLastMediaProvider extends AutoDisposeFutureProvider<List<Media>> {
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
    FutureOr<List<Media>> Function(GetLastMediaRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Media>> createElement() {
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

mixin GetLastMediaRef on AutoDisposeFutureProviderRef<List<Media>> {
  /// The parameter `parentId` of this provider.
  String get parentId;
}

class _GetLastMediaProviderElement
    extends AutoDisposeFutureProviderElement<List<Media>> with GetLastMediaRef {
  _GetLastMediaProviderElement(super.provider);

  @override
  String get parentId => (origin as GetLastMediaProvider).parentId;
}

String _$getResumeMediaHash() => r'9c5793fe0378776b84a97a1a0f8732c935489f8e';

/// See also [getResumeMedia].
@ProviderFor(getResumeMedia)
const getResumeMediaProvider = GetResumeMediaFamily();

/// See also [getResumeMedia].
class GetResumeMediaFamily extends Family<AsyncValue<List<Media>>> {
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
class GetResumeMediaProvider extends AutoDisposeFutureProvider<List<Media>> {
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
    FutureOr<List<Media>> Function(GetResumeMediaRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Media>> createElement() {
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

mixin GetResumeMediaRef on AutoDisposeFutureProviderRef<List<Media>> {
  /// The parameter `parentId` of this provider.
  String? get parentId;
}

class _GetResumeMediaProviderElement
    extends AutoDisposeFutureProviderElement<List<Media>>
    with GetResumeMediaRef {
  _GetResumeMediaProviderElement(super.provider);

  @override
  String? get parentId => (origin as GetResumeMediaProvider).parentId;
}

String _$getRecommendationsHash() =>
    r'742807af605c09e2ca9ffc0177c4f95acf05579f';

/// See also [getRecommendations].
@ProviderFor(getRecommendations)
final getRecommendationsProvider =
    AutoDisposeFutureProvider<List<Media>>.internal(
  getRecommendations,
  name: r'getRecommendationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getRecommendationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetRecommendationsRef = AutoDisposeFutureProviderRef<List<Media>>;
String _$getSuggestionsHash() => r'e17f2534108740ed3210f90d81f3e058c7139699';

/// See also [getSuggestions].
@ProviderFor(getSuggestions)
final getSuggestionsProvider = AutoDisposeFutureProvider<List<Media>>.internal(
  getSuggestions,
  name: r'getSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSuggestionsRef = AutoDisposeFutureProviderRef<List<Media>>;
String _$getSeasonsHash() => r'bcb6e98b01b9be89e237253fec8afc3a2ea73bcc';

/// See also [getSeasons].
@ProviderFor(getSeasons)
const getSeasonsProvider = GetSeasonsFamily();

/// See also [getSeasons].
class GetSeasonsFamily extends Family<AsyncValue<List<Season>>> {
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
class GetSeasonsProvider extends AutoDisposeFutureProvider<List<Season>> {
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
    FutureOr<List<Season>> Function(GetSeasonsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Season>> createElement() {
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

mixin GetSeasonsRef on AutoDisposeFutureProviderRef<List<Season>> {
  /// The parameter `seriesId` of this provider.
  String get seriesId;
}

class _GetSeasonsProviderElement
    extends AutoDisposeFutureProviderElement<List<Season>> with GetSeasonsRef {
  _GetSeasonsProviderElement(super.provider);

  @override
  String get seriesId => (origin as GetSeasonsProvider).seriesId;
}

String _$getEpisodesHash() => r'186ad57451761b45069ae343d2d8c1830d39088c';

/// See also [getEpisodes].
@ProviderFor(getEpisodes)
const getEpisodesProvider = GetEpisodesFamily();

/// See also [getEpisodes].
class GetEpisodesFamily extends Family<AsyncValue<List<Episode>>> {
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
class GetEpisodesProvider extends AutoDisposeFutureProvider<List<Episode>> {
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
    FutureOr<List<Episode>> Function(GetEpisodesRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Episode>> createElement() {
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

mixin GetEpisodesRef on AutoDisposeFutureProviderRef<List<Episode>> {
  /// The parameter `sid` of this provider.
  String get sid;

  /// The parameter `vid` of this provider.
  String get vid;
}

class _GetEpisodesProviderElement
    extends AutoDisposeFutureProviderElement<List<Episode>>
    with GetEpisodesRef {
  _GetEpisodesProviderElement(super.provider);

  @override
  String get sid => (origin as GetEpisodesProvider).sid;
  @override
  String get vid => (origin as GetEpisodesProvider).vid;
}

String _$getItemHash() => r'38c464b0c6317e90a8bf4a05e14bbf2d64f3a551';

/// See also [getItem].
@ProviderFor(getItem)
const getItemProvider = GetItemFamily();

/// See also [getItem].
class GetItemFamily extends Family<AsyncValue<EmbyResponse<Media>>> {
  /// See also [getItem].
  const GetItemFamily();

  /// See also [getItem].
  GetItemProvider call({
    required ({
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
class GetItemProvider extends AutoDisposeFutureProvider<EmbyResponse<Media>> {
  /// See also [getItem].
  GetItemProvider({
    required ({
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
    String includeItemTypes,
    int page,
    String parentId,
    String sortBy,
    String sortOrder
  }) itemQuery;

  @override
  Override overrideWith(
    FutureOr<EmbyResponse<Media>> Function(GetItemRef provider) create,
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
  AutoDisposeFutureProviderElement<EmbyResponse<Media>> createElement() {
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

mixin GetItemRef on AutoDisposeFutureProviderRef<EmbyResponse<Media>> {
  /// The parameter `itemQuery` of this provider.
  ({
    String includeItemTypes,
    int page,
    String parentId,
    String sortBy,
    String sortOrder
  }) get itemQuery;
}

class _GetItemProviderElement
    extends AutoDisposeFutureProviderElement<EmbyResponse<Media>>
    with GetItemRef {
  _GetItemProviderElement(super.provider);

  @override
  ({
    String includeItemTypes,
    int page,
    String parentId,
    String sortBy,
    String sortOrder
  }) get itemQuery => (origin as GetItemProvider).itemQuery;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
