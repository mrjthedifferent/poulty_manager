// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$batchInfoUpdateHash() => r'2cc5b78dd20db1156e85b841caa5e586c609a3f9';

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

/// See also [batchInfoUpdate].
@ProviderFor(batchInfoUpdate)
const batchInfoUpdateProvider = BatchInfoUpdateFamily();

/// See also [batchInfoUpdate].
class BatchInfoUpdateFamily extends Family<AsyncValue<FormSettings>> {
  /// See also [batchInfoUpdate].
  const BatchInfoUpdateFamily();

  /// See also [batchInfoUpdate].
  BatchInfoUpdateProvider call(
    String url,
  ) {
    return BatchInfoUpdateProvider(
      url,
    );
  }

  @override
  BatchInfoUpdateProvider getProviderOverride(
    covariant BatchInfoUpdateProvider provider,
  ) {
    return call(
      provider.url,
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
  String? get name => r'batchInfoUpdateProvider';
}

/// See also [batchInfoUpdate].
class BatchInfoUpdateProvider extends AutoDisposeFutureProvider<FormSettings> {
  /// See also [batchInfoUpdate].
  BatchInfoUpdateProvider(
    String url,
  ) : this._internal(
          (ref) => batchInfoUpdate(
            ref as BatchInfoUpdateRef,
            url,
          ),
          from: batchInfoUpdateProvider,
          name: r'batchInfoUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$batchInfoUpdateHash,
          dependencies: BatchInfoUpdateFamily._dependencies,
          allTransitiveDependencies:
              BatchInfoUpdateFamily._allTransitiveDependencies,
          url: url,
        );

  BatchInfoUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    FutureOr<FormSettings> Function(BatchInfoUpdateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BatchInfoUpdateProvider._internal(
        (ref) => create(ref as BatchInfoUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormSettings> createElement() {
    return _BatchInfoUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BatchInfoUpdateProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BatchInfoUpdateRef on AutoDisposeFutureProviderRef<FormSettings> {
  /// The parameter `url` of this provider.
  String get url;
}

class _BatchInfoUpdateProviderElement
    extends AutoDisposeFutureProviderElement<FormSettings>
    with BatchInfoUpdateRef {
  _BatchInfoUpdateProviderElement(super.provider);

  @override
  String get url => (origin as BatchInfoUpdateProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
