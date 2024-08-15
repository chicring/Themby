// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteRepositoryHash() =>
    r'499fb79c4e94780141540dda90edb80eebd1c367';

/// See also [favoriteRepository].
@ProviderFor(favoriteRepository)
final favoriteRepositoryProvider =
    AutoDisposeProvider<FavoriteRepository>.internal(
  favoriteRepository,
  name: r'favoriteRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteRepositoryRef = AutoDisposeProviderRef<FavoriteRepository>;
String _$toggleFavoriteHash() => r'cbd3835367aea11a1a0681116dd0fc281831e9b6';

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

/// See also [toggleFavorite].
@ProviderFor(toggleFavorite)
const toggleFavoriteProvider = ToggleFavoriteFamily();

/// See also [toggleFavorite].
class ToggleFavoriteFamily extends Family<AsyncValue<UserData>> {
  /// See also [toggleFavorite].
  const ToggleFavoriteFamily();

  /// See also [toggleFavorite].
  ToggleFavoriteProvider call(
    String id,
    bool favorite,
  ) {
    return ToggleFavoriteProvider(
      id,
      favorite,
    );
  }

  @override
  ToggleFavoriteProvider getProviderOverride(
    covariant ToggleFavoriteProvider provider,
  ) {
    return call(
      provider.id,
      provider.favorite,
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
  String? get name => r'toggleFavoriteProvider';
}

/// See also [toggleFavorite].
class ToggleFavoriteProvider extends AutoDisposeFutureProvider<UserData> {
  /// See also [toggleFavorite].
  ToggleFavoriteProvider(
    String id,
    bool favorite,
  ) : this._internal(
          (ref) => toggleFavorite(
            ref as ToggleFavoriteRef,
            id,
            favorite,
          ),
          from: toggleFavoriteProvider,
          name: r'toggleFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$toggleFavoriteHash,
          dependencies: ToggleFavoriteFamily._dependencies,
          allTransitiveDependencies:
              ToggleFavoriteFamily._allTransitiveDependencies,
          id: id,
          favorite: favorite,
        );

  ToggleFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.favorite,
  }) : super.internal();

  final String id;
  final bool favorite;

  @override
  Override overrideWith(
    FutureOr<UserData> Function(ToggleFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ToggleFavoriteProvider._internal(
        (ref) => create(ref as ToggleFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        favorite: favorite,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserData> createElement() {
    return _ToggleFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ToggleFavoriteProvider &&
        other.id == id &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, favorite.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ToggleFavoriteRef on AutoDisposeFutureProviderRef<UserData> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `favorite` of this provider.
  bool get favorite;
}

class _ToggleFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<UserData> with ToggleFavoriteRef {
  _ToggleFavoriteProviderElement(super.provider);

  @override
  String get id => (origin as ToggleFavoriteProvider).id;
  @override
  bool get favorite => (origin as ToggleFavoriteProvider).favorite;
}

String _$togglePlayedHash() => r'b70e524c09b72b0a626d62110a4c2fac5703a630';

/// See also [togglePlayed].
@ProviderFor(togglePlayed)
const togglePlayedProvider = TogglePlayedFamily();

/// See also [togglePlayed].
class TogglePlayedFamily extends Family<AsyncValue<UserData>> {
  /// See also [togglePlayed].
  const TogglePlayedFamily();

  /// See also [togglePlayed].
  TogglePlayedProvider call(
    String id,
    bool played,
  ) {
    return TogglePlayedProvider(
      id,
      played,
    );
  }

  @override
  TogglePlayedProvider getProviderOverride(
    covariant TogglePlayedProvider provider,
  ) {
    return call(
      provider.id,
      provider.played,
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
  String? get name => r'togglePlayedProvider';
}

/// See also [togglePlayed].
class TogglePlayedProvider extends AutoDisposeFutureProvider<UserData> {
  /// See also [togglePlayed].
  TogglePlayedProvider(
    String id,
    bool played,
  ) : this._internal(
          (ref) => togglePlayed(
            ref as TogglePlayedRef,
            id,
            played,
          ),
          from: togglePlayedProvider,
          name: r'togglePlayedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$togglePlayedHash,
          dependencies: TogglePlayedFamily._dependencies,
          allTransitiveDependencies:
              TogglePlayedFamily._allTransitiveDependencies,
          id: id,
          played: played,
        );

  TogglePlayedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.played,
  }) : super.internal();

  final String id;
  final bool played;

  @override
  Override overrideWith(
    FutureOr<UserData> Function(TogglePlayedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TogglePlayedProvider._internal(
        (ref) => create(ref as TogglePlayedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        played: played,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserData> createElement() {
    return _TogglePlayedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TogglePlayedProvider &&
        other.id == id &&
        other.played == played;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, played.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TogglePlayedRef on AutoDisposeFutureProviderRef<UserData> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `played` of this provider.
  bool get played;
}

class _TogglePlayedProviderElement
    extends AutoDisposeFutureProviderElement<UserData> with TogglePlayedRef {
  _TogglePlayedProviderElement(super.provider);

  @override
  String get id => (origin as TogglePlayedProvider).id;
  @override
  bool get played => (origin as TogglePlayedProvider).played;
}

String _$hideFromResumeHash() => r'763d41286ca6f0c8596b5812eee9e9bfe0d531fe';

/// See also [hideFromResume].
@ProviderFor(hideFromResume)
const hideFromResumeProvider = HideFromResumeFamily();

/// See also [hideFromResume].
class HideFromResumeFamily extends Family<AsyncValue<void>> {
  /// See also [hideFromResume].
  const HideFromResumeFamily();

  /// See also [hideFromResume].
  HideFromResumeProvider call(
    String id,
  ) {
    return HideFromResumeProvider(
      id,
    );
  }

  @override
  HideFromResumeProvider getProviderOverride(
    covariant HideFromResumeProvider provider,
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
  String? get name => r'hideFromResumeProvider';
}

/// See also [hideFromResume].
class HideFromResumeProvider extends AutoDisposeFutureProvider<void> {
  /// See also [hideFromResume].
  HideFromResumeProvider(
    String id,
  ) : this._internal(
          (ref) => hideFromResume(
            ref as HideFromResumeRef,
            id,
          ),
          from: hideFromResumeProvider,
          name: r'hideFromResumeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hideFromResumeHash,
          dependencies: HideFromResumeFamily._dependencies,
          allTransitiveDependencies:
              HideFromResumeFamily._allTransitiveDependencies,
          id: id,
        );

  HideFromResumeProvider._internal(
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
    FutureOr<void> Function(HideFromResumeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HideFromResumeProvider._internal(
        (ref) => create(ref as HideFromResumeRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _HideFromResumeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HideFromResumeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HideFromResumeRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _HideFromResumeProviderElement
    extends AutoDisposeFutureProviderElement<void> with HideFromResumeRef {
  _HideFromResumeProviderElement(super.provider);

  @override
  String get id => (origin as HideFromResumeProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
