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
String _$getViewsHash() => r'b8ce8727600d5c74931ee1fd41905d0c833cb90e';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
