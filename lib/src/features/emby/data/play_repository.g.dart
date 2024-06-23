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

String _$playUrlHash() => r'96a1034d0b6e72e982089f1bdd24a12bb318b8e7';

/// See also [playUrl].
@ProviderFor(playUrl)
const playUrlProvider = PlayUrlFamily();

/// See also [playUrl].
class PlayUrlFamily extends Family<AsyncValue<String>> {
  /// See also [playUrl].
  const PlayUrlFamily();

  /// See also [playUrl].
  PlayUrlProvider call(
    List<MediaSource> sources,
  ) {
    return PlayUrlProvider(
      sources,
    );
  }

  @override
  PlayUrlProvider getProviderOverride(
    covariant PlayUrlProvider provider,
  ) {
    return call(
      provider.sources,
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
  String? get name => r'playUrlProvider';
}

/// See also [playUrl].
class PlayUrlProvider extends AutoDisposeFutureProvider<String> {
  /// See also [playUrl].
  PlayUrlProvider(
    List<MediaSource> sources,
  ) : this._internal(
          (ref) => playUrl(
            ref as PlayUrlRef,
            sources,
          ),
          from: playUrlProvider,
          name: r'playUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playUrlHash,
          dependencies: PlayUrlFamily._dependencies,
          allTransitiveDependencies: PlayUrlFamily._allTransitiveDependencies,
          sources: sources,
        );

  PlayUrlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sources,
  }) : super.internal();

  final List<MediaSource> sources;

  @override
  Override overrideWith(
    FutureOr<String> Function(PlayUrlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayUrlProvider._internal(
        (ref) => create(ref as PlayUrlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sources: sources,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _PlayUrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayUrlProvider && other.sources == sources;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sources.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayUrlRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `sources` of this provider.
  List<MediaSource> get sources;
}

class _PlayUrlProviderElement extends AutoDisposeFutureProviderElement<String>
    with PlayUrlRef {
  _PlayUrlProviderElement(super.provider);

  @override
  List<MediaSource> get sources => (origin as PlayUrlProvider).sources;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
