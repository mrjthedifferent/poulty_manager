// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_http_request.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$makeAutoHttpRequestHash() =>
    r'044946de5f9aab622c71fc3dde9b696ef4f8bb2b';

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

/// See also [makeAutoHttpRequest].
@ProviderFor(makeAutoHttpRequest)
const makeAutoHttpRequestProvider = MakeAutoHttpRequestFamily();

/// See also [makeAutoHttpRequest].
class MakeAutoHttpRequestFamily
    extends Family<TaskEither<Exception, Response<dynamic>>> {
  /// See also [makeAutoHttpRequest].
  const MakeAutoHttpRequestFamily();

  /// See also [makeAutoHttpRequest].
  MakeAutoHttpRequestProvider call(
    RequestOptions options,
  ) {
    return MakeAutoHttpRequestProvider(
      options,
    );
  }

  @override
  MakeAutoHttpRequestProvider getProviderOverride(
    covariant MakeAutoHttpRequestProvider provider,
  ) {
    return call(
      provider.options,
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
  String? get name => r'makeAutoHttpRequestProvider';
}

/// See also [makeAutoHttpRequest].
class MakeAutoHttpRequestProvider
    extends AutoDisposeProvider<TaskEither<Exception, Response<dynamic>>> {
  /// See also [makeAutoHttpRequest].
  MakeAutoHttpRequestProvider(
    RequestOptions options,
  ) : this._internal(
          (ref) => makeAutoHttpRequest(
            ref as MakeAutoHttpRequestRef,
            options,
          ),
          from: makeAutoHttpRequestProvider,
          name: r'makeAutoHttpRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$makeAutoHttpRequestHash,
          dependencies: MakeAutoHttpRequestFamily._dependencies,
          allTransitiveDependencies:
              MakeAutoHttpRequestFamily._allTransitiveDependencies,
          options: options,
        );

  MakeAutoHttpRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.options,
  }) : super.internal();

  final RequestOptions options;

  @override
  Override overrideWith(
    TaskEither<Exception, Response<dynamic>> Function(
            MakeAutoHttpRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MakeAutoHttpRequestProvider._internal(
        (ref) => create(ref as MakeAutoHttpRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        options: options,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TaskEither<Exception, Response<dynamic>>>
      createElement() {
    return _MakeAutoHttpRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MakeAutoHttpRequestProvider && other.options == options;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, options.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MakeAutoHttpRequestRef
    on AutoDisposeProviderRef<TaskEither<Exception, Response<dynamic>>> {
  /// The parameter `options` of this provider.
  RequestOptions get options;
}

class _MakeAutoHttpRequestProviderElement
    extends AutoDisposeProviderElement<TaskEither<Exception, Response<dynamic>>>
    with MakeAutoHttpRequestRef {
  _MakeAutoHttpRequestProviderElement(super.provider);

  @override
  RequestOptions get options => (origin as MakeAutoHttpRequestProvider).options;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
