// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_key_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewKeyHash() => r'4d44ca827ddb782848bd4ea9af290be4255cbc4d';

/// See also [viewKey].
@ProviderFor(viewKey)
final viewKeyProvider = AutoDisposeProvider<String>.internal(
  viewKey,
  name: r'viewKeyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$viewKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ViewKeyRef = AutoDisposeProviderRef<String>;
String _$resumeKeyHash() => r'cddcde19058def8324234c1052abe7b2aee94518';

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

/// See also [resumeKey].
@ProviderFor(resumeKey)
const resumeKeyProvider = ResumeKeyFamily();

/// See also [resumeKey].
class ResumeKeyFamily extends Family<String> {
  /// See also [resumeKey].
  const ResumeKeyFamily();

  /// See also [resumeKey].
  ResumeKeyProvider call({
    String? parentId,
  }) {
    return ResumeKeyProvider(
      parentId: parentId,
    );
  }

  @override
  ResumeKeyProvider getProviderOverride(
    covariant ResumeKeyProvider provider,
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
  String? get name => r'resumeKeyProvider';
}

/// See also [resumeKey].
class ResumeKeyProvider extends AutoDisposeProvider<String> {
  /// See also [resumeKey].
  ResumeKeyProvider({
    String? parentId,
  }) : this._internal(
          (ref) => resumeKey(
            ref as ResumeKeyRef,
            parentId: parentId,
          ),
          from: resumeKeyProvider,
          name: r'resumeKeyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resumeKeyHash,
          dependencies: ResumeKeyFamily._dependencies,
          allTransitiveDependencies: ResumeKeyFamily._allTransitiveDependencies,
          parentId: parentId,
        );

  ResumeKeyProvider._internal(
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
    String Function(ResumeKeyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResumeKeyProvider._internal(
        (ref) => create(ref as ResumeKeyRef),
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
  AutoDisposeProviderElement<String> createElement() {
    return _ResumeKeyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResumeKeyProvider && other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResumeKeyRef on AutoDisposeProviderRef<String> {
  /// The parameter `parentId` of this provider.
  String? get parentId;
}

class _ResumeKeyProviderElement extends AutoDisposeProviderElement<String>
    with ResumeKeyRef {
  _ResumeKeyProviderElement(super.provider);

  @override
  String? get parentId => (origin as ResumeKeyProvider).parentId;
}

String _$suggestionKeyHash() => r'7b64aca461da221c73024db723a215921cd529db';

/// See also [suggestionKey].
@ProviderFor(suggestionKey)
final suggestionKeyProvider = AutoDisposeProvider<String>.internal(
  suggestionKey,
  name: r'suggestionKeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$suggestionKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SuggestionKeyRef = AutoDisposeProviderRef<String>;
String _$lastMediaKeyHash() => r'6e56e776f74c26246e7e3a1cfda39bd427169189';

/// See also [lastMediaKey].
@ProviderFor(lastMediaKey)
const lastMediaKeyProvider = LastMediaKeyFamily();

/// See also [lastMediaKey].
class LastMediaKeyFamily extends Family<String> {
  /// See also [lastMediaKey].
  const LastMediaKeyFamily();

  /// See also [lastMediaKey].
  LastMediaKeyProvider call(
    String parentId,
  ) {
    return LastMediaKeyProvider(
      parentId,
    );
  }

  @override
  LastMediaKeyProvider getProviderOverride(
    covariant LastMediaKeyProvider provider,
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
  String? get name => r'lastMediaKeyProvider';
}

/// See also [lastMediaKey].
class LastMediaKeyProvider extends AutoDisposeProvider<String> {
  /// See also [lastMediaKey].
  LastMediaKeyProvider(
    String parentId,
  ) : this._internal(
          (ref) => lastMediaKey(
            ref as LastMediaKeyRef,
            parentId,
          ),
          from: lastMediaKeyProvider,
          name: r'lastMediaKeyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastMediaKeyHash,
          dependencies: LastMediaKeyFamily._dependencies,
          allTransitiveDependencies:
              LastMediaKeyFamily._allTransitiveDependencies,
          parentId: parentId,
        );

  LastMediaKeyProvider._internal(
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
    String Function(LastMediaKeyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastMediaKeyProvider._internal(
        (ref) => create(ref as LastMediaKeyRef),
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
  AutoDisposeProviderElement<String> createElement() {
    return _LastMediaKeyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastMediaKeyProvider && other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LastMediaKeyRef on AutoDisposeProviderRef<String> {
  /// The parameter `parentId` of this provider.
  String get parentId;
}

class _LastMediaKeyProviderElement extends AutoDisposeProviderElement<String>
    with LastMediaKeyRef {
  _LastMediaKeyProviderElement(super.provider);

  @override
  String get parentId => (origin as LastMediaKeyProvider).parentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
