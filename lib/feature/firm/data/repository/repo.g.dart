// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firmRepositoryHash() => r'2b18c8235d259396f99268d89f984791cb542b90';

/// See also [firmRepository].
@ProviderFor(firmRepository)
final firmRepositoryProvider = Provider<FirmRepository>.internal(
  firmRepository,
  name: r'firmRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firmRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirmRepositoryRef = ProviderRef<FirmRepository>;
String _$currentSelectFirmHash() => r'b5279500dddad55b902345acddd84a72dca5829f';

/// See also [CurrentSelectFirm].
@ProviderFor(CurrentSelectFirm)
final currentSelectFirmProvider =
    AutoDisposeNotifierProvider<CurrentSelectFirm, FirmModel?>.internal(
  CurrentSelectFirm.new,
  name: r'currentSelectFirmProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSelectFirmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSelectFirm = AutoDisposeNotifier<FirmModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
