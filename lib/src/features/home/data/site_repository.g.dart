// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$siteRepositoryHash() => r'db659c22878bd5c35a0878793b9c70ef8f2da7bf';

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
String _$addEmbySiteHash() => r'08e3f30c94fef520c70ac3d69c3a723dd9d79a06';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
