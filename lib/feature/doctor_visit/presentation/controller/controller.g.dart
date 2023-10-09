// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllDoctorVisitHash() =>
    r'402ca01e519ade141321d3452d43bdeb7c1fa548';

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

/// See also [fetchAllDoctorVisit].
@ProviderFor(fetchAllDoctorVisit)
const fetchAllDoctorVisitProvider = FetchAllDoctorVisitFamily();

/// See also [fetchAllDoctorVisit].
class FetchAllDoctorVisitFamily
    extends Family<AsyncValue<List<DoctorVisitModel>>> {
  /// See also [fetchAllDoctorVisit].
  const FetchAllDoctorVisitFamily();

  /// See also [fetchAllDoctorVisit].
  FetchAllDoctorVisitProvider call(
    String batchId,
  ) {
    return FetchAllDoctorVisitProvider(
      batchId,
    );
  }

  @override
  FetchAllDoctorVisitProvider getProviderOverride(
    covariant FetchAllDoctorVisitProvider provider,
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
  String? get name => r'fetchAllDoctorVisitProvider';
}

/// See also [fetchAllDoctorVisit].
class FetchAllDoctorVisitProvider
    extends AutoDisposeFutureProvider<List<DoctorVisitModel>> {
  /// See also [fetchAllDoctorVisit].
  FetchAllDoctorVisitProvider(
    String batchId,
  ) : this._internal(
          (ref) => fetchAllDoctorVisit(
            ref as FetchAllDoctorVisitRef,
            batchId,
          ),
          from: fetchAllDoctorVisitProvider,
          name: r'fetchAllDoctorVisitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllDoctorVisitHash,
          dependencies: FetchAllDoctorVisitFamily._dependencies,
          allTransitiveDependencies:
              FetchAllDoctorVisitFamily._allTransitiveDependencies,
          batchId: batchId,
        );

  FetchAllDoctorVisitProvider._internal(
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
    FutureOr<List<DoctorVisitModel>> Function(FetchAllDoctorVisitRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllDoctorVisitProvider._internal(
        (ref) => create(ref as FetchAllDoctorVisitRef),
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
  AutoDisposeFutureProviderElement<List<DoctorVisitModel>> createElement() {
    return _FetchAllDoctorVisitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllDoctorVisitProvider && other.batchId == batchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, batchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchAllDoctorVisitRef
    on AutoDisposeFutureProviderRef<List<DoctorVisitModel>> {
  /// The parameter `batchId` of this provider.
  String get batchId;
}

class _FetchAllDoctorVisitProviderElement
    extends AutoDisposeFutureProviderElement<List<DoctorVisitModel>>
    with FetchAllDoctorVisitRef {
  _FetchAllDoctorVisitProviderElement(super.provider);

  @override
  String get batchId => (origin as FetchAllDoctorVisitProvider).batchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
