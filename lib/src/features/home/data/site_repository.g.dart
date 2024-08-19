// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$siteRepositoryHash() => r'6d416c8277778216e88f3123be1bf02a04871fe8';

/// See also [siteRepository].
@ProviderFor(siteRepository)
final siteRepositoryProvider = AutoDisposeProvider<SiteRepository>.internal(
  siteRepository,
  name: r'siteRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$siteRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SiteRepositoryRef = AutoDisposeProviderRef<SiteRepository>;
String _$getSitesHash() => r'e9957d6e565512b690f58aecfb2c0c8aa62fb428';

/// See also [getSites].
@ProviderFor(getSites)
final getSitesProvider = AutoDisposeFutureProvider<List<Site>>.internal(
  getSites,
  name: r'getSitesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSitesRef = AutoDisposeFutureProviderRef<List<Site>>;
String _$finaAllByTextHash() => r'f67f875e1dd4263e272492ac6e72d654d009a9e1';

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

/// See also [finaAllByText].
@ProviderFor(finaAllByText)
const finaAllByTextProvider = FinaAllByTextFamily();

/// See also [finaAllByText].
class FinaAllByTextFamily extends Family<AsyncValue<List<Site>>> {
  /// See also [finaAllByText].
  const FinaAllByTextFamily();

  /// See also [finaAllByText].
  FinaAllByTextProvider call({
    required String text,
  }) {
    return FinaAllByTextProvider(
      text: text,
    );
  }

  @override
  FinaAllByTextProvider getProviderOverride(
    covariant FinaAllByTextProvider provider,
  ) {
    return call(
      text: provider.text,
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
  String? get name => r'finaAllByTextProvider';
}

/// See also [finaAllByText].
class FinaAllByTextProvider extends AutoDisposeFutureProvider<List<Site>> {
  /// See also [finaAllByText].
  FinaAllByTextProvider({
    required String text,
  }) : this._internal(
          (ref) => finaAllByText(
            ref as FinaAllByTextRef,
            text: text,
          ),
          from: finaAllByTextProvider,
          name: r'finaAllByTextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$finaAllByTextHash,
          dependencies: FinaAllByTextFamily._dependencies,
          allTransitiveDependencies:
              FinaAllByTextFamily._allTransitiveDependencies,
          text: text,
        );

  FinaAllByTextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  Override overrideWith(
    FutureOr<List<Site>> Function(FinaAllByTextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinaAllByTextProvider._internal(
        (ref) => create(ref as FinaAllByTextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Site>> createElement() {
    return _FinaAllByTextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinaAllByTextProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FinaAllByTextRef on AutoDisposeFutureProviderRef<List<Site>> {
  /// The parameter `text` of this provider.
  String get text;
}

class _FinaAllByTextProviderElement
    extends AutoDisposeFutureProviderElement<List<Site>> with FinaAllByTextRef {
  _FinaAllByTextProviderElement(super.provider);

  @override
  String get text => (origin as FinaAllByTextProvider).text;
}

String _$addEmbySiteHash() => r'08e3f30c94fef520c70ac3d69c3a723dd9d79a06';

/// See also [addEmbySite].
@ProviderFor(addEmbySite)
const addEmbySiteProvider = AddEmbySiteFamily();

/// See also [addEmbySite].
class AddEmbySiteFamily extends Family<AsyncValue<void>> {
  /// See also [addEmbySite].
  const AddEmbySiteFamily();

  /// See also [addEmbySite].
  AddEmbySiteProvider call({
    required Site site,
  }) {
    return AddEmbySiteProvider(
      site: site,
    );
  }

  @override
  AddEmbySiteProvider getProviderOverride(
    covariant AddEmbySiteProvider provider,
  ) {
    return call(
      site: provider.site,
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
  String? get name => r'addEmbySiteProvider';
}

/// See also [addEmbySite].
class AddEmbySiteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addEmbySite].
  AddEmbySiteProvider({
    required Site site,
  }) : this._internal(
          (ref) => addEmbySite(
            ref as AddEmbySiteRef,
            site: site,
          ),
          from: addEmbySiteProvider,
          name: r'addEmbySiteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addEmbySiteHash,
          dependencies: AddEmbySiteFamily._dependencies,
          allTransitiveDependencies:
              AddEmbySiteFamily._allTransitiveDependencies,
          site: site,
        );

  AddEmbySiteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.site,
  }) : super.internal();

  final Site site;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddEmbySiteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddEmbySiteProvider._internal(
        (ref) => create(ref as AddEmbySiteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        site: site,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddEmbySiteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddEmbySiteProvider && other.site == site;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, site.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddEmbySiteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `site` of this provider.
  Site get site;
}

class _AddEmbySiteProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddEmbySiteRef {
  _AddEmbySiteProviderElement(super.provider);

  @override
  Site get site => (origin as AddEmbySiteProvider).site;
}

String _$removeEmbySiteHash() => r'5104b332c000085a6e19cee20d1576dd7909f190';

/// See also [removeEmbySite].
@ProviderFor(removeEmbySite)
const removeEmbySiteProvider = RemoveEmbySiteFamily();

/// See also [removeEmbySite].
class RemoveEmbySiteFamily extends Family<AsyncValue<void>> {
  /// See also [removeEmbySite].
  const RemoveEmbySiteFamily();

  /// See also [removeEmbySite].
  RemoveEmbySiteProvider call({
    required Site site,
  }) {
    return RemoveEmbySiteProvider(
      site: site,
    );
  }

  @override
  RemoveEmbySiteProvider getProviderOverride(
    covariant RemoveEmbySiteProvider provider,
  ) {
    return call(
      site: provider.site,
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
  String? get name => r'removeEmbySiteProvider';
}

/// See also [removeEmbySite].
class RemoveEmbySiteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeEmbySite].
  RemoveEmbySiteProvider({
    required Site site,
  }) : this._internal(
          (ref) => removeEmbySite(
            ref as RemoveEmbySiteRef,
            site: site,
          ),
          from: removeEmbySiteProvider,
          name: r'removeEmbySiteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeEmbySiteHash,
          dependencies: RemoveEmbySiteFamily._dependencies,
          allTransitiveDependencies:
              RemoveEmbySiteFamily._allTransitiveDependencies,
          site: site,
        );

  RemoveEmbySiteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.site,
  }) : super.internal();

  final Site site;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveEmbySiteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveEmbySiteProvider._internal(
        (ref) => create(ref as RemoveEmbySiteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        site: site,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveEmbySiteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveEmbySiteProvider && other.site == site;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, site.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveEmbySiteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `site` of this provider.
  Site get site;
}

class _RemoveEmbySiteProviderElement
    extends AutoDisposeFutureProviderElement<void> with RemoveEmbySiteRef {
  _RemoveEmbySiteProviderElement(super.provider);

  @override
  Site get site => (origin as RemoveEmbySiteProvider).site;
}

String _$updateEmbySiteHash() => r'bb98d37146370a63b471f6c55e36eaaa63ea75b1';

/// See also [updateEmbySite].
@ProviderFor(updateEmbySite)
const updateEmbySiteProvider = UpdateEmbySiteFamily();

/// See also [updateEmbySite].
class UpdateEmbySiteFamily extends Family<AsyncValue<void>> {
  /// See also [updateEmbySite].
  const UpdateEmbySiteFamily();

  /// See also [updateEmbySite].
  UpdateEmbySiteProvider call({
    required Site site,
  }) {
    return UpdateEmbySiteProvider(
      site: site,
    );
  }

  @override
  UpdateEmbySiteProvider getProviderOverride(
    covariant UpdateEmbySiteProvider provider,
  ) {
    return call(
      site: provider.site,
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
  String? get name => r'updateEmbySiteProvider';
}

/// See also [updateEmbySite].
class UpdateEmbySiteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateEmbySite].
  UpdateEmbySiteProvider({
    required Site site,
  }) : this._internal(
          (ref) => updateEmbySite(
            ref as UpdateEmbySiteRef,
            site: site,
          ),
          from: updateEmbySiteProvider,
          name: r'updateEmbySiteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateEmbySiteHash,
          dependencies: UpdateEmbySiteFamily._dependencies,
          allTransitiveDependencies:
              UpdateEmbySiteFamily._allTransitiveDependencies,
          site: site,
        );

  UpdateEmbySiteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.site,
  }) : super.internal();

  final Site site;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateEmbySiteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateEmbySiteProvider._internal(
        (ref) => create(ref as UpdateEmbySiteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        site: site,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateEmbySiteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateEmbySiteProvider && other.site == site;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, site.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateEmbySiteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `site` of this provider.
  Site get site;
}

class _UpdateEmbySiteProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateEmbySiteRef {
  _UpdateEmbySiteProviderElement(super.provider);

  @override
  Site get site => (origin as UpdateEmbySiteProvider).site;
}

String _$syncSiteHash() => r'289750f0774e5a301e635184ef04390416f183f9';

/// See also [syncSite].
@ProviderFor(syncSite)
final syncSiteProvider = AutoDisposeFutureProvider<bool>.internal(
  syncSite,
  name: r'syncSiteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$syncSiteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SyncSiteRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
