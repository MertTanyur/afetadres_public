// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncIsarTrackerHash() => r'2123280c0afed83e7d19afb8526d9a87489fad3e';

/// See also [AsyncIsarTracker].
@ProviderFor(AsyncIsarTracker)
final asyncIsarTrackerProvider =
    AsyncNotifierProvider<AsyncIsarTracker, Isar>.internal(
  AsyncIsarTracker.new,
  name: r'asyncIsarTrackerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncIsarTrackerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncIsarTracker = AsyncNotifier<Isar>;
String _$filteredIsarHash() => r'74ae790a9df305dd989c18dff521ec61ddfcc3e3';

/// See also [FilteredIsar].
@ProviderFor(FilteredIsar)
final filteredIsarProvider =
    AsyncNotifierProvider<FilteredIsar, List<IsarMapData>>.internal(
  FilteredIsar.new,
  name: r'filteredIsarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filteredIsarHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilteredIsar = AsyncNotifier<List<IsarMapData>>;
String _$markerControllerHash() => r'16d37acada0c6d5d9e1cb02e05ecf9854f89abe7';

/// See also [MarkerController].
@ProviderFor(MarkerController)
final markerControllerProvider =
    NotifierProvider<MarkerController, Set<Marker>>.internal(
  MarkerController.new,
  name: r'markerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$markerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MarkerController = Notifier<Set<Marker>>;
String _$clusterManagerControllerHash() =>
    r'369c3a41c974786b5eceb32a914327fdf6813dd2';

/// See also [ClusterManagerController].
@ProviderFor(ClusterManagerController)
final clusterManagerControllerProvider = NotifierProvider<
    ClusterManagerController, ClusterManager<CalculatedClusterPlace>>.internal(
  ClusterManagerController.new,
  name: r'clusterManagerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clusterManagerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClusterManagerController
    = Notifier<ClusterManager<CalculatedClusterPlace>>;
String _$isarInstanceHash() => r'f9350b94f7ea143b252d8f3ff8a73489cffd633c';

/// See also [isarInstance].
@ProviderFor(isarInstance)
final isarInstanceProvider = FutureProvider<Isar>.internal(
  isarInstance,
  name: r'isarInstanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarInstanceRef = FutureProviderRef<Isar>;
String _$mapDataWorkerHash() => r'1c3d7449bae9343b3a1af7f0b6f4756852a9ba10';

/// See also [mapDataWorker].
@ProviderFor(mapDataWorker)
final mapDataWorkerProvider = FutureProvider<MapDataWorker>.internal(
  mapDataWorker,
  name: r'mapDataWorkerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapDataWorkerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapDataWorkerRef = FutureProviderRef<MapDataWorker>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
