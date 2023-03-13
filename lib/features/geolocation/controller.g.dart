// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initialPositionHash() => r'c84bc39182416410a1cd79aedc1f0c42edab6b8f';

/// See also [InitialPosition].
@ProviderFor(InitialPosition)
final initialPositionProvider =
    NotifierProvider<InitialPosition, LatLng>.internal(
  InitialPosition.new,
  name: r'initialPositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$initialPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InitialPosition = Notifier<LatLng>;
String _$cameraPosHash() => r'ac1d55039f9088adbde40b04c9abe105b322a165';

/// See also [CameraPos].
@ProviderFor(CameraPos)
final cameraPosProvider = NotifierProvider<CameraPos, CameraPosition>.internal(
  CameraPos.new,
  name: r'cameraPosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cameraPosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraPos = Notifier<CameraPosition>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
