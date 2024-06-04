// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceInfoHash() => r'123a3595c00fd790c9dc6eef84a836faba6f7936';

/// See also [deviceInfo].
@ProviderFor(deviceInfo)
final deviceInfoProvider = AutoDisposeProvider<DeviceInfoPlugin>.internal(
  deviceInfo,
  name: r'deviceInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deviceInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceInfoRef = AutoDisposeProviderRef<DeviceInfoPlugin>;
String _$deviceNameHash() => r'555553dc1ddf1cd5de0c03846955da4710dd67b9';

/// See also [DeviceName].
@ProviderFor(DeviceName)
final deviceNameProvider = NotifierProvider<DeviceName, String>.internal(
  DeviceName.new,
  name: r'deviceNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deviceNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeviceName = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
