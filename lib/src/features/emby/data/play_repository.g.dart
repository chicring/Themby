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

String _$positionStartHash() => r'3f8fabedd6f184c712e7d4a3e503bebf30dcc6d2';

/// See also [positionStart].
@ProviderFor(positionStart)
const positionStartProvider = PositionStartFamily();

/// See also [positionStart].
class PositionStartFamily extends Family<AsyncValue<void>> {
  /// See also [positionStart].
  const PositionStartFamily();

  /// See also [positionStart].
  PositionStartProvider call(
    String iId,
    int position,
    String pId,
    String mId,
  ) {
    return PositionStartProvider(
      iId,
      position,
      pId,
      mId,
    );
  }

  @override
  PositionStartProvider getProviderOverride(
    covariant PositionStartProvider provider,
  ) {
    return call(
      provider.iId,
      provider.position,
      provider.pId,
      provider.mId,
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
  String? get name => r'positionStartProvider';
}

/// See also [positionStart].
class PositionStartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [positionStart].
  PositionStartProvider(
    String iId,
    int position,
    String pId,
    String mId,
  ) : this._internal(
          (ref) => positionStart(
            ref as PositionStartRef,
            iId,
            position,
            pId,
            mId,
          ),
          from: positionStartProvider,
          name: r'positionStartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$positionStartHash,
          dependencies: PositionStartFamily._dependencies,
          allTransitiveDependencies:
              PositionStartFamily._allTransitiveDependencies,
          iId: iId,
          position: position,
          pId: pId,
          mId: mId,
        );

  PositionStartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.iId,
    required this.position,
    required this.pId,
    required this.mId,
  }) : super.internal();

  final String iId;
  final int position;
  final String pId;
  final String mId;

  @override
  Override overrideWith(
    FutureOr<void> Function(PositionStartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PositionStartProvider._internal(
        (ref) => create(ref as PositionStartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        iId: iId,
        position: position,
        pId: pId,
        mId: mId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PositionStartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PositionStartProvider &&
        other.iId == iId &&
        other.position == position &&
        other.pId == pId &&
        other.mId == mId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, iId.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);
    hash = _SystemHash.combine(hash, pId.hashCode);
    hash = _SystemHash.combine(hash, mId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PositionStartRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `iId` of this provider.
  String get iId;

  /// The parameter `position` of this provider.
  int get position;

  /// The parameter `pId` of this provider.
  String get pId;

  /// The parameter `mId` of this provider.
  String get mId;
}

class _PositionStartProviderElement
    extends AutoDisposeFutureProviderElement<void> with PositionStartRef {
  _PositionStartProviderElement(super.provider);

  @override
  String get iId => (origin as PositionStartProvider).iId;
  @override
  int get position => (origin as PositionStartProvider).position;
  @override
  String get pId => (origin as PositionStartProvider).pId;
  @override
  String get mId => (origin as PositionStartProvider).mId;
}

String _$positionBackHash() => r'9ba38b91482576991b0d8645082fc5545ff355ec';

/// See also [positionBack].
@ProviderFor(positionBack)
const positionBackProvider = PositionBackFamily();

/// See also [positionBack].
class PositionBackFamily extends Family<AsyncValue<void>> {
  /// See also [positionBack].
  const PositionBackFamily();

  /// See also [positionBack].
  PositionBackProvider call(
    String iId,
    int position,
    String pId,
    String mId,
  ) {
    return PositionBackProvider(
      iId,
      position,
      pId,
      mId,
    );
  }

  @override
  PositionBackProvider getProviderOverride(
    covariant PositionBackProvider provider,
  ) {
    return call(
      provider.iId,
      provider.position,
      provider.pId,
      provider.mId,
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
  String? get name => r'positionBackProvider';
}

/// See also [positionBack].
class PositionBackProvider extends AutoDisposeFutureProvider<void> {
  /// See also [positionBack].
  PositionBackProvider(
    String iId,
    int position,
    String pId,
    String mId,
  ) : this._internal(
          (ref) => positionBack(
            ref as PositionBackRef,
            iId,
            position,
            pId,
            mId,
          ),
          from: positionBackProvider,
          name: r'positionBackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$positionBackHash,
          dependencies: PositionBackFamily._dependencies,
          allTransitiveDependencies:
              PositionBackFamily._allTransitiveDependencies,
          iId: iId,
          position: position,
          pId: pId,
          mId: mId,
        );

  PositionBackProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.iId,
    required this.position,
    required this.pId,
    required this.mId,
  }) : super.internal();

  final String iId;
  final int position;
  final String pId;
  final String mId;

  @override
  Override overrideWith(
    FutureOr<void> Function(PositionBackRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PositionBackProvider._internal(
        (ref) => create(ref as PositionBackRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        iId: iId,
        position: position,
        pId: pId,
        mId: mId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PositionBackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PositionBackProvider &&
        other.iId == iId &&
        other.position == position &&
        other.pId == pId &&
        other.mId == mId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, iId.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);
    hash = _SystemHash.combine(hash, pId.hashCode);
    hash = _SystemHash.combine(hash, mId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PositionBackRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `iId` of this provider.
  String get iId;

  /// The parameter `position` of this provider.
  int get position;

  /// The parameter `pId` of this provider.
  String get pId;

  /// The parameter `mId` of this provider.
  String get mId;
}

class _PositionBackProviderElement
    extends AutoDisposeFutureProviderElement<void> with PositionBackRef {
  _PositionBackProviderElement(super.provider);

  @override
  String get iId => (origin as PositionBackProvider).iId;
  @override
  int get position => (origin as PositionBackProvider).position;
  @override
  String get pId => (origin as PositionBackProvider).pId;
  @override
  String get mId => (origin as PositionBackProvider).mId;
}

String _$positionStopHash() => r'2651971bae0f53c485ef3990a032856fc9f30fd9';

/// See also [positionStop].
@ProviderFor(positionStop)
const positionStopProvider = PositionStopFamily();

/// See also [positionStop].
class PositionStopFamily extends Family<AsyncValue<void>> {
  /// See also [positionStop].
  const PositionStopFamily();

  /// See also [positionStop].
  PositionStopProvider call(
    String iId,
    int position,
    String pId,
    String mId,
  ) {
    return PositionStopProvider(
      iId,
      position,
      pId,
      mId,
    );
  }

  @override
  PositionStopProvider getProviderOverride(
    covariant PositionStopProvider provider,
  ) {
    return call(
      provider.iId,
      provider.position,
      provider.pId,
      provider.mId,
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
  String? get name => r'positionStopProvider';
}

/// See also [positionStop].
class PositionStopProvider extends AutoDisposeFutureProvider<void> {
  /// See also [positionStop].
  PositionStopProvider(
    String iId,
    int position,
    String pId,
    String mId,
  ) : this._internal(
          (ref) => positionStop(
            ref as PositionStopRef,
            iId,
            position,
            pId,
            mId,
          ),
          from: positionStopProvider,
          name: r'positionStopProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$positionStopHash,
          dependencies: PositionStopFamily._dependencies,
          allTransitiveDependencies:
              PositionStopFamily._allTransitiveDependencies,
          iId: iId,
          position: position,
          pId: pId,
          mId: mId,
        );

  PositionStopProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.iId,
    required this.position,
    required this.pId,
    required this.mId,
  }) : super.internal();

  final String iId;
  final int position;
  final String pId;
  final String mId;

  @override
  Override overrideWith(
    FutureOr<void> Function(PositionStopRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PositionStopProvider._internal(
        (ref) => create(ref as PositionStopRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        iId: iId,
        position: position,
        pId: pId,
        mId: mId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PositionStopProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PositionStopProvider &&
        other.iId == iId &&
        other.position == position &&
        other.pId == pId &&
        other.mId == mId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, iId.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);
    hash = _SystemHash.combine(hash, pId.hashCode);
    hash = _SystemHash.combine(hash, mId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PositionStopRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `iId` of this provider.
  String get iId;

  /// The parameter `position` of this provider.
  int get position;

  /// The parameter `pId` of this provider.
  String get pId;

  /// The parameter `mId` of this provider.
  String get mId;
}

class _PositionStopProviderElement
    extends AutoDisposeFutureProviderElement<void> with PositionStopRef {
  _PositionStopProviderElement(super.provider);

  @override
  String get iId => (origin as PositionStopProvider).iId;
  @override
  int get position => (origin as PositionStopProvider).position;
  @override
  String get pId => (origin as PositionStopProvider).pId;
  @override
  String get mId => (origin as PositionStopProvider).mId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
