// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllFirmHash() => r'6c02e0201d779ec107c6f6a865373afcef06beb5';

/// See also [fetchAllFirm].
@ProviderFor(fetchAllFirm)
final fetchAllFirmProvider =
    AutoDisposeFutureProvider<List<FirmModel>>.internal(
  fetchAllFirm,
  name: r'fetchAllFirmProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchAllFirmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAllFirmRef = AutoDisposeFutureProviderRef<List<FirmModel>>;
String _$fetchAllBatchByFirmHash() =>
    r'077e534e080d7460e9a483b179394465b5fa7dc3';

/// See also [fetchAllBatchByFirm].
@ProviderFor(fetchAllBatchByFirm)
final fetchAllBatchByFirmProvider =
    AutoDisposeFutureProvider<List<ModelBatch>>.internal(
  fetchAllBatchByFirm,
  name: r'fetchAllBatchByFirmProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllBatchByFirmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAllBatchByFirmRef = AutoDisposeFutureProviderRef<List<ModelBatch>>;
String _$fetchBatchByIdHash() => r'e5d19b46e6847b09ad973e43dfc1f11a1fb238ef';

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

/// See also [fetchBatchById].
@ProviderFor(fetchBatchById)
const fetchBatchByIdProvider = FetchBatchByIdFamily();

/// See also [fetchBatchById].
class FetchBatchByIdFamily extends Family<AsyncValue<ModelBatchDetails>> {
  /// See also [fetchBatchById].
  const FetchBatchByIdFamily();

  /// See also [fetchBatchById].
  FetchBatchByIdProvider call(
    String batchId,
  ) {
    return FetchBatchByIdProvider(
      batchId,
    );
  }

  @override
  FetchBatchByIdProvider getProviderOverride(
    covariant FetchBatchByIdProvider provider,
  ) {
    return call(
      provider.batchId,
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
  String? get name => r'fetchBatchByIdProvider';
}

/// See also [fetchBatchById].
class FetchBatchByIdProvider
    extends AutoDisposeFutureProvider<ModelBatchDetails> {
  /// See also [fetchBatchById].
  FetchBatchByIdProvider(
    String batchId,
  ) : this._internal(
          (ref) => fetchBatchById(
            ref as FetchBatchByIdRef,
            batchId,
          ),
          from: fetchBatchByIdProvider,
          name: r'fetchBatchByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBatchByIdHash,
          dependencies: FetchBatchByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchBatchByIdFamily._allTransitiveDependencies,
          batchId: batchId,
        );

  FetchBatchByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.batchId,
  }) : super.internal();

  final String batchId;

  @override
  Override overrideWith(
    FutureOr<ModelBatchDetails> Function(FetchBatchByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchBatchByIdProvider._internal(
        (ref) => create(ref as FetchBatchByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        batchId: batchId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ModelBatchDetails> createElement() {
    return _FetchBatchByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchBatchByIdProvider && other.batchId == batchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, batchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchBatchByIdRef on AutoDisposeFutureProviderRef<ModelBatchDetails> {
  /// The parameter `batchId` of this provider.
  String get batchId;
}

class _FetchBatchByIdProviderElement
    extends AutoDisposeFutureProviderElement<ModelBatchDetails>
    with FetchBatchByIdRef {
  _FetchBatchByIdProviderElement(super.provider);

  @override
  String get batchId => (origin as FetchBatchByIdProvider).batchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
