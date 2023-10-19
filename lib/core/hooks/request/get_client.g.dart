// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestHandlerHash() => r'd9610bf2dac877c6f2a22997723537f9d687ec5d';

/// See also [requestHandler].
@ProviderFor(requestHandler)
final requestHandlerProvider = AutoDisposeProvider<
    TaskEither<DioException, Response<dynamic>> Function(String,
        {Object? data, bool hasFile, String? method})>.internal(
  requestHandler,
  name: r'requestHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequestHandlerRef = AutoDisposeProviderRef<
    TaskEither<DioException, Response<dynamic>> Function(String,
        {Object? data, bool hasFile, String? method})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
