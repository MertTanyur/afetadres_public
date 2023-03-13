import 'dart:async';
import 'dart:ui';

import 'package:earthquake_emergency/features/api_data/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/repository_infa/map_data_worker.dart';
// import 'package:flutter/services.dart';
// import 'dart:isolate';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import '../api_data/model.dart';
import 'model.dart';
import '../../product/widgets/markers.dart' as markers;
import 'model2.dart';
part 'controller.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(FutureProviderRef ref) {
  return Isar.open([IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema]);
}

@Riverpod(keepAlive: true)
Future<MapDataWorker> mapDataWorker(MapDataWorkerRef ref) async {
  // var dbPath = warmUp();
  return await MapDataWorker.open();
}

final isarStreamProvider = StreamProvider.family<void, Isar>((ref, isar) {
  return isar.isarMapDatas.watchLazy(fireImmediately: true);
});

@Riverpod(keepAlive: true)
class AsyncIsarTracker extends _$AsyncIsarTracker {
  @override
  Future<Isar> build() async {
    var isar = await ref.watch(isarInstanceProvider.future);
    ref.listen(isarStreamProvider(isar), (previous, next) {
      print('trigger refresh');
      state = const AsyncValue.loading();
      ref.invalidateSelf();
      // Future.delayed(Duration(seconds: 2))
      //     .then((value) => ref.invalidateSelf());
      // ref.invalidateSelf();
    });
    // state = const AsyncValue.loading();
    var count = await isar.isarMapDatas.count();
    print('count reevaluated $count');
    return isar;

    // isar.isarMapDatas.watchLazy().listen((event) {

    // })

    // final mapDataAsyncStream = isar.isarMapDatas.watchLazy().
    //   ..listen((event) {
    //     print('isar changed');
    //     // return await isar.isarMapDatas.count();
    //   });
    // return Future.delayed(Duration.zero, () => 1);
    // return mapDataAsyncStream.listen((event) { });
    // mapDataAsyncStream.
  }

  // Future<List<IsarMapData>> isarFilter() async {
  //   List<IsarMapData> result = [];
  //   // ref.watch()
  //   final tagController = ref.watch(tagNotifierProvider);
  //   final isar = state.value;
  //   if (isar != null) {
  //     final isarMapDatas = isar.isarMapDatas;
  //     return await isarMapDatas
  //         .filter()
  //         .anyOf(tagController.map((e) => e.endPoint).toList(),
  //             (q, String reason) => q.nameEqualTo(reason))
  //         .findAll();
  //   }

  //   // isar
  //   return result;
  // }
}

@Riverpod(keepAlive: true)
class FilteredIsar extends _$FilteredIsar {
  @override
  Future<List<IsarMapData>> build() async {
    print('rebuilding filtered isar l95');
    // ref.listen(tagNotifierProvider,())
    ref.listen(tagNotifierProvider, (previous, next) {
      print(
          'Tag notifier changed, \nprevious: $previous, next: $next .trigger isar query refresh.');
      state = const AsyncValue.loading();
      ref.invalidateSelf();
      // Future.delayed(Duration(seconds: 2))
      //     .then((value) => ref.invalidateSelf());
      // ref.invalidateSelf();
    });

    print('rebuilding filtered isar 107');
    List<IsarMapData> result = [];

    // ref.watch()
    final tagController = ref.watch(tagNotifierProvider);
    final isar = ref.watch(asyncIsarTrackerProvider).value;
    print('l113');
    if (isar != null && tagController.isNotEmpty) {
      print('isar is not null');
      print('filtering isar............. GENERAl');
      print('tag controller has ${tagController.length} items');
      final isarMapDatas = isar.isarMapDatas;
      print('according to last result }');
      result = await isarMapDatas.filter().anyOf(
          tagController.map((e) => e.endPoint).toList(), (q, String reason) {
        print(
            'tag controller values => ${tagController.map((e) => e.endPoint)}\nq name is => ${q.toString()}');
        // ref.read(clusterManagerControllerProvider.notifier)
        return q.nameContains(reason);
      }).findAll();
    } else if (isar != null) {
      print('filtering isar............. $tagController');
      // isar.isarMapDatas.inde
      try {
        await isar.txn(() async {
          final mapDatas = isar.isarMapDatas;
          result = await mapDatas.where().findAll();
          // notifyListeners();
        });
      } catch (e) {
        print('isar error $e');
      }

      // result = await isar.isarMapDatas.filter().nameIsNotEmpty().findAll();

      // print(
      //     'isar data is filtered with last elif condition in 127 and first data is ${result[500].clusterPlace?.location}');
    } else {
      print('isar is null');
    }
    // final allIndexes = await isar?.isarMapDatas
    //     .where()
    //     .findAll()
    //     .then((value) => value.map((e) => e.id).toList());
    // final first = await isar?.isarMapDatas.get(allIndexes![0]);
    // print(
    //     'isar data 2 is filtered with last elif condition in 127 and first data is ${first?.clusterPlace?.location}');
    // print(
    //     'before updating points\nnot null clusterPlaceData ${result.where((element) => element.clusterPlace?.mapDataModel?.lat != null).length}');
    if (true) {
      print('updating cluster markers');
      ref.read(clusterManagerControllerProvider.notifier).updatePoints(result
          .where((element) =>
              element.loc?[0] != null &&
              element.loc?[1] != null &&
              element.geoHash != null)
          .map((e) => CalculatedClusterPlace(
              latLng: LatLng(e.loc![0], e.loc![1]),
              geoHash: e.geoHash!,
              needs: e.needs,
              channel: e.channel,
              reason: e.name))
          .toList());
    }

    // isar
    return result;
  }

  Future<ClusterManager> clusterManager(_updateMarkers, _markerBuilder) async {
    print('cluster manager initializing!');
    Iterable<ClusterPlace?>? items = state.value
        ?.map((e) => e?.clusterPlace)
        .where((element) => element != null);
    List<ClusterPlace> itemList = items!.whereType<ClusterPlace>().toList();
    return ClusterManager<ClusterPlace>(itemList, _updateMarkers,
        markerBuilder: _markerBuilder);
    // if (items != null &&
    //     items.isNotEmpty &&
    //     items.whereType<ClusterPlace>().isNotEmpty) {

    // }
  }
}

@Riverpod(keepAlive: true)
class MarkerController extends _$MarkerController {
  @override
  Set<Marker> build() {
    return Set<Marker>();
  }

  void updateMarkers(Set<Marker> markers) {
    state = markers;
  }
}

@Riverpod(keepAlive: true)
class ClusterManagerController extends _$ClusterManagerController {
  @override
  ClusterManager<CalculatedClusterPlace> build() {
    final markerUpdate =
        ref.watch(markerControllerProvider.notifier).updateMarkers;
    return ClusterManager<CalculatedClusterPlace>(
        Iterable<CalculatedClusterPlace>.generate(0), markerUpdate,
        markerBuilder: markers.markerBuilder);
  }

  Future<void> initialize() async {
    // state.value.s
  }

  void updatePoints(List<CalculatedClusterPlace> items) {
    state.setItems(items);
  }

  setMapId(val) {
    state.setMapId(val);
  }
}

// @Riverpod(keepAlive: true)
// class MapUtilController extends _$MapUtilController {
//   @override
//   Future<MapUtils> build() {
//     return MapUtils();
//   }

//   Future<void> fetchClusterItems() async {
//     try {
//       print('fetching cluster items 165');
//       // MapDataWorker hehe = await ref.read(mapDataWorkerProvider.future);
//       // await hehe.fetch('genel');
//       final isarInstance = ref.read(isarInstanceProvider.future);
//       final isarAsync = ref.read(asyncIsarTrackerProvider);
//       // final isarStream = ref.read(isarStreamProvider);

//       final filtered = await ref.read(filteredIsarProvider.future);
//       final items = await ref.read(filteredIsarProvider.future);
//       var parsedItems = items.map((e) => e?.clusterPlace).toList();
//       List<ClusterPlace> itemList =
//           parsedItems.whereType<ClusterPlace>().toList();
//       state.clusterItems = itemList;

//       print(
//           'fetching cluster items 165, total cluster item count is -> ${itemList.length}');
//       print('state cluster items -> ${state.clusterItems?.length}');
//     } catch (e) {
//       print('cluster items couldnt be fetched because of -> $e');
//     }
//   }

//   // var clusterManager =
//   //     await filteredIsar.clusterManager(updateMarkers, markerBuilder);
// }

Future<Marker> Function(Cluster<CalculatedClusterPlace>) get markerBuilder =>
    (cluster) async {
      return Marker(
        markerId: MarkerId(cluster.getId()),
        position: cluster.location,
        onTap: () {
          print('---- $cluster');
          cluster.items.forEach((p) => print(p));
        },
        icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
            text: cluster.isMultiple ? cluster.count.toString() : null),
      );
    };
Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
  if (kIsWeb) size = (size / 2).floor();

  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = Colors.orange;
  final Paint paint2 = Paint()..color = Colors.white;

  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

  if (text != null) {
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text,
      style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );
  }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}
// @Riverpod(keepAlive: true)
// class ClusterController extends _$ClusterController {
//   @override
//   build(filteredIsarProvider.notifier not){
//     not
//   }
// }

Future<String> warmUp() async {
  await Future.delayed(Duration(seconds: 1));
  // Write the value to [SharedPreferences] which will get read on the
  // [SimpleDatabase]'s isolate. For this example the value is always true
  // just for demonstration purposes.
  final Future<void> sharedPreferencesSet = SharedPreferences.getInstance()
      .then((sharedPreferences) => sharedPreferences.setBool('isDebug', true));
  final Future<Directory> tempDirFuture = path_provider.getTemporaryDirectory();

  // Wait until the [SharedPreferences] value is set and the temporary
  // directory is received before opening the database. If
  // [sharedPreferencesSet] does not happen before opening the
  // [SimpleDatabase] there has to be a way to refresh
  // [_SimpleDatabaseServer]'s [SharedPreferences] cached values.
  String? dbPath;
  Future.wait([sharedPreferencesSet, tempDirFuture])
      .then((List<Object?> values) {
    final Directory? tempDir = values[1] as Directory?;
    dbPath = path.join(tempDir!.path, 'database.db');
  });
  print('temporary dir ${dbPath}');
  // if (dbPath == null) {
  //   warmUp();
  // }
  return dbPath ?? 'database.db';
}







// class WorkerNotifier extends AsyncStateNotifierProvider<MapDataWorker> {
//   WorkerNotifier() : super(MapDataWorker.open(path););
// }

// final workerProvider = StateNotifierProvider<WorkerNotifier, MapDataWorker>(
//     (ref) => WorkerNotifier());

// @Riverpod(keepAlive: true)
// MapDataWorker mapDataWorker(MapDataWorkerRef ref, MapDataWorker worker) {
//   return worker;
// }