// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playRepositoryHash() => r'62b3b5516a00107236f270ce406e6e4488134d9e';

/// See also [playRepository].
@ProviderFor(playRepository)
final playRepositoryProvider = AutoDisposeProvider<PlayRepository>.internal(
  playRepository,
  name: r'playRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlayRepositoryRef = AutoDisposeProviderRef<PlayRepository>;
String _$getPlaybackInfoHash() => r'0cf29b47c5bfd3e95690a0f14e1d1cc50c097f4b';

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

/// See also [getPlaybackInfo].
@ProviderFor(getPlaybackInfo)
const getPlaybackInfoProvider = GetPlaybackInfoFamily();

/// See also [getPlaybackInfo].
class GetPlaybackInfoFamily extends Family<AsyncValue<PlaybackInfo>> {
  /// See also [getPlaybackInfo].
  const GetPlaybackInfoFamily();

  /// See also [getPlaybackInfo].
  GetPlaybackInfoProvider call(
    String itemId,
  ) {
    return GetPlaybackInfoProvider(
      itemId,
    );
  }

  @override
  GetPlaybackInfoProvider getProviderOverride(
    covariant GetPlaybackInfoProvider provider,
  ) {
    return call(
      provider.itemId,
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
  String? get name => r'getPlaybackInfoProvider';
}

/// See also [getPlaybackInfo].
class GetPlaybackInfoProvider extends AutoDisposeFutureProvider<PlaybackInfo> {
  /// See also [getPlaybackInfo].
  GetPlaybackInfoProvider(
    String itemId,
  ) : this._internal(
          (ref) => getPlaybackInfo(
            ref as GetPlaybackInfoRef,
            itemId,
          ),
          from: getPlaybackInfoProvider,
          name: r'getPlaybackInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlaybackInfoHash,
          dependencies: GetPlaybackInfoFamily._dependencies,
          allTransitiveDependencies:
              GetPlaybackInfoFamily._allTransitiveDependencies,
          itemId: itemId,
        );

  GetPlaybackInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemId,
  }) : super.internal();

  final String itemId;

  @override
  Override overrideWith(
    FutureOr<PlaybackInfo> Function(GetPlaybackInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPlaybackInfoProvider._internal(
        (ref) => create(ref as GetPlaybackInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemId: itemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlaybackInfo> createElement() {
    return _GetPlaybackInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPlaybackInfoProvider && other.itemId == itemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPlaybackInfoRef on AutoDisposeFutureProviderRef<PlaybackInfo> {
  /// The parameter `itemId` of this provider.
  String get itemId;
}

class _GetPlaybackInfoProviderElement
    extends AutoDisposeFutureProviderElement<PlaybackInfo>
    with GetPlaybackInfoRef {
  _GetPlaybackInfoProviderElement(super.provider);

  @override
  String get itemId => (origin as GetPlaybackInfoProvider).itemId;
}

String _$getPlayerUrlHash() => r'78e0b81017636ab59d6d59e461a00d28ba1d213e';

/// See also [getPlayerUrl].
@ProviderFor(getPlayerUrl)
const getPlayerUrlProvider = GetPlayerUrlFamily();

/// See also [getPlayerUrl].
class GetPlayerUrlFamily extends Family<AsyncValue<String>> {
  /// See also [getPlayerUrl].
  const GetPlayerUrlFamily();

  /// See also [getPlayerUrl].
  GetPlayerUrlProvider call(
    String itemId,
  ) {
    return GetPlayerUrlProvider(
      itemId,
    );
  }

  @override
  GetPlayerUrlProvider getProviderOverride(
    covariant GetPlayerUrlProvider provider,
  ) {
    return call(
      provider.itemId,
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
  String? get name => r'getPlayerUrlProvider';
}

/// See also [getPlayerUrl].
class GetPlayerUrlProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getPlayerUrl].
  GetPlayerUrlProvider(
    String itemId,
  ) : this._internal(
          (ref) => getPlayerUrl(
            ref as GetPlayerUrlRef,
            itemId,
          ),
          from: getPlayerUrlProvider,
          name: r'getPlayerUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlayerUrlHash,
          dependencies: GetPlayerUrlFamily._dependencies,
          allTransitiveDependencies:
              GetPlayerUrlFamily._allTransitiveDependencies,
          itemId: itemId,
        );

  GetPlayerUrlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemId,
  }) : super.internal();

  final String itemId;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetPlayerUrlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPlayerUrlProvider._internal(
        (ref) => create(ref as GetPlayerUrlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemId: itemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetPlayerUrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPlayerUrlProvider && other.itemId == itemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPlayerUrlRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `itemId` of this provider.
  String get itemId;
}

class _GetPlayerUrlProviderElement
    extends AutoDisposeFutureProviderElement<String> with GetPlayerUrlRef {
  _GetPlayerUrlProviderElement(super.provider);

  @override
  String get itemId => (origin as GetPlayerUrlProvider).itemId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
