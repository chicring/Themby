// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_app_setting_handle.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openThemeModeDialogHash() =>
    r'9ee9baa763590f702b37120fb357af1475480217';

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

/// See also [openThemeModeDialog].
@ProviderFor(openThemeModeDialog)
const openThemeModeDialogProvider = OpenThemeModeDialogFamily();

/// See also [openThemeModeDialog].
class OpenThemeModeDialogFamily extends Family<AsyncValue<void>> {
  /// See also [openThemeModeDialog].
  const OpenThemeModeDialogFamily();

  /// See also [openThemeModeDialog].
  OpenThemeModeDialogProvider call({
    required int currentMode,
  }) {
    return OpenThemeModeDialogProvider(
      currentMode: currentMode,
    );
  }

  @override
  OpenThemeModeDialogProvider getProviderOverride(
    covariant OpenThemeModeDialogProvider provider,
  ) {
    return call(
      currentMode: provider.currentMode,
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
  String? get name => r'openThemeModeDialogProvider';
}

/// See also [openThemeModeDialog].
class OpenThemeModeDialogProvider extends AutoDisposeFutureProvider<void> {
  /// See also [openThemeModeDialog].
  OpenThemeModeDialogProvider({
    required int currentMode,
  }) : this._internal(
          (ref) => openThemeModeDialog(
            ref as OpenThemeModeDialogRef,
            currentMode: currentMode,
          ),
          from: openThemeModeDialogProvider,
          name: r'openThemeModeDialogProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$openThemeModeDialogHash,
          dependencies: OpenThemeModeDialogFamily._dependencies,
          allTransitiveDependencies:
              OpenThemeModeDialogFamily._allTransitiveDependencies,
          currentMode: currentMode,
        );

  OpenThemeModeDialogProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentMode,
  }) : super.internal();

  final int currentMode;

  @override
  Override overrideWith(
    FutureOr<void> Function(OpenThemeModeDialogRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpenThemeModeDialogProvider._internal(
        (ref) => create(ref as OpenThemeModeDialogRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentMode: currentMode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _OpenThemeModeDialogProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpenThemeModeDialogProvider &&
        other.currentMode == currentMode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentMode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OpenThemeModeDialogRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `currentMode` of this provider.
  int get currentMode;
}

class _OpenThemeModeDialogProviderElement
    extends AutoDisposeFutureProviderElement<void> with OpenThemeModeDialogRef {
  _OpenThemeModeDialogProviderElement(super.provider);

  @override
  int get currentMode => (origin as OpenThemeModeDialogProvider).currentMode;
}

String _$openThemeColorDialogHash() =>
    r'fd7c1eae5b383a413f0081a5d9c4b933b8eea1a0';

/// See also [openThemeColorDialog].
@ProviderFor(openThemeColorDialog)
const openThemeColorDialogProvider = OpenThemeColorDialogFamily();

/// See also [openThemeColorDialog].
class OpenThemeColorDialogFamily extends Family<AsyncValue<void>> {
  /// See also [openThemeColorDialog].
  const OpenThemeColorDialogFamily();

  /// See also [openThemeColorDialog].
  OpenThemeColorDialogProvider call({
    required int currentColor,
  }) {
    return OpenThemeColorDialogProvider(
      currentColor: currentColor,
    );
  }

  @override
  OpenThemeColorDialogProvider getProviderOverride(
    covariant OpenThemeColorDialogProvider provider,
  ) {
    return call(
      currentColor: provider.currentColor,
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
  String? get name => r'openThemeColorDialogProvider';
}

/// See also [openThemeColorDialog].
class OpenThemeColorDialogProvider extends AutoDisposeFutureProvider<void> {
  /// See also [openThemeColorDialog].
  OpenThemeColorDialogProvider({
    required int currentColor,
  }) : this._internal(
          (ref) => openThemeColorDialog(
            ref as OpenThemeColorDialogRef,
            currentColor: currentColor,
          ),
          from: openThemeColorDialogProvider,
          name: r'openThemeColorDialogProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$openThemeColorDialogHash,
          dependencies: OpenThemeColorDialogFamily._dependencies,
          allTransitiveDependencies:
              OpenThemeColorDialogFamily._allTransitiveDependencies,
          currentColor: currentColor,
        );

  OpenThemeColorDialogProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentColor,
  }) : super.internal();

  final int currentColor;

  @override
  Override overrideWith(
    FutureOr<void> Function(OpenThemeColorDialogRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpenThemeColorDialogProvider._internal(
        (ref) => create(ref as OpenThemeColorDialogRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentColor: currentColor,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _OpenThemeColorDialogProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpenThemeColorDialogProvider &&
        other.currentColor == currentColor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentColor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OpenThemeColorDialogRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `currentColor` of this provider.
  int get currentColor;
}

class _OpenThemeColorDialogProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with OpenThemeColorDialogRef {
  _OpenThemeColorDialogProviderElement(super.provider);

  @override
  int get currentColor => (origin as OpenThemeColorDialogProvider).currentColor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
