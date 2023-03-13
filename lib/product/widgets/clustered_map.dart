import 'dart:async';
import 'dart:ui';

import 'package:earthquake_emergency/features/geolocation/controller.dart';
import 'package:earthquake_emergency/features/geolocation/services.dart';
import 'package:earthquake_emergency/features/isolate_api_data/controller.dart';
import 'package:earthquake_emergency/features/isolate_api_data/model.dart';
import 'package:earthquake_emergency/product/widgets/keys.dart';
import 'package:earthquake_emergency/product/widgets/modals.dart';
import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_launcher/map_launcher.dart' as launcher;
// import 'mapslaun'
// import 'maps';

import '../../core/repository_infa/map_data_worker.dart';

// Clustering maps

class ClusteredMap extends StatefulHookConsumerWidget {
  const ClusteredMap({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ClusteredMapState();
}

class ClusteredMapState extends ConsumerState<ClusteredMap>
    with WidgetsBindingObserver {
  ClusterManager? _manager;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  final CameraPosition _parisCameraPosition =
      CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Place $i',
          latLng: LatLng(48.848200 + i * 0.001, 2.319124 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Restaurant $i',
          isClosed: i % 2 == 0,
          latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Bar $i',
          latLng: LatLng(48.858265 + i * 0.01, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Hotel $i',
          latLng: LatLng(48.858265 - i * 0.1, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test $i',
          latLng: LatLng(66.160507 + i * 0.1, -153.369141 + i * 0.1)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test2 $i',
          latLng: LatLng(-36.848461 + i * 1, 169.763336 + i * 1)),
  ];

  @override
  void initState() {
    _manager = ref.read(clusterManagerControllerProvider);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // print('util items was null');
    // }
    // _controller.future.then((value) => valu)
    // _manager = initClusterManager();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   MapDataWorker mapDataWorker =
    //       await ref.read(mapDataWorkerProvider.future);
    //   await mapDataWorker.fetch('genel');

    //   Future.delayed(Duration.zero, () async {
    //     final filtered = await ref.read(filteredIsarProvider.future);
    //     final filteredIsar = await ref.read(filteredIsarProvider.notifier);
    //     _manager =
    //         await filteredIsar.clusterManager(_updateMarkers, markerBuilder);
    //   });
    // });
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ClusterManager initClusterManager(items, updateMarkers) {
    return ClusterManager<ClusterPlace>(items, updateMarkers,
        markerBuilder: markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        Future.delayed(Duration.zero, () async {
          MapDataWorker api = await ref.read(mapDataWorkerProvider.future);
          await api.fetch('genel');
        });
        print('appLifeCycleState resumed');

        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState detached');
        break;
    }
  }

  void showSnack(String content,
      {LatLng? location,
      Set<String>? reasons,
      List<String>? needs,
      List<String>? needList}) {
    var content = 'Adres tarifi al';
    if (needList != null && needList.isNotEmpty) {
      content += ', yardımlara ulaş:\n\n${needList.join(", ")}';
    }
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 3000),
      content: Text(content),
      // backgroundColor:
      //     Theme.of(context).colorScheme.onBackground.withOpacity(),
      action: SnackBarAction(
        label: 'Aç',
        onPressed: () async {
          // final _launcher = launcher.MapLauncher();
          final availableMaps = await launcher.MapLauncher.installedMaps;
          print(
              availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

          await availableMaps.first.showMarker(
            coords: launcher.Coords(location!.latitude, location.longitude),
            title: "${reasons?.join(", ")}",
          );

          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final isarInstance = ref.watch(isarInstanceProvider.future);
    final isarAsync = ref.watch(asyncIsarTrackerProvider);
    // final isarStream = ref.watch(isarStreamProvider.);
    // final mapDataWorker = ref.watch(mapDataWorkerProvider.future);
    final TextTheme textTheme = Theme.of(context).textTheme;
    // final mapUtils = ref.watch(mapUtilControllerProvider);
    // final mapUtilsSelect = ref
    //     .watch(mapUtilControllerProvider.select((value) => value.clusterItems));
    final clusterManager = ref.watch(clusterManagerControllerProvider);
    final clusterManagerNotifier =
        ref.watch(clusterManagerControllerProvider.notifier);
    final geoLocation = ref.watch(geoLocatorProvider);
    final markerController = ref.watch(markerControllerProvider);
    final initialCamera = ref.watch(cameraPosProvider);
    // final selectedMarkers =
    return Scaffold(
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        // mapToolbarEnabled: false,
        myLocationEnabled: true,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        ].toSet(),
        // mapType: MapType,
        initialCameraPosition: initialCamera,
        //  geoLocation.myCameraPosition ??
        //     CameraPosition(target: LatLng(37.5753, 36.9228), zoom: 12),
        markers: markerController,
        onMapCreated: (GoogleMapController controller) async {
          print('map created!!!!!!!!!!!!!!!!!!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
          _controller.complete(controller);

          ref
              .read(clusterManagerControllerProvider.notifier)
              .setMapId(controller.mapId);
        },
        onCameraMove: clusterManager.onCameraMove,
        onCameraIdle: clusterManager.updateMap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ref.read(isarInstanceProvider.future).then(
          //     (value) => value.writeTxn(() => value.isarMapDatas.clear()));
          final controller = ref.read(geoLocatorProvider);
          final pos = controller.myCameraPosition;
          if (pos != null) {
            _controller.future.then((value) =>
                value.animateCamera(CameraUpdate.newCameraPosition(pos)));
          } else {
            print('determining position...');
            showPermissionDialog(context);
            // await determinePosition();
          }
        },
        child: Icon(Icons.gps_fixed_outlined),
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
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

  Future<Marker> Function(Cluster<ClusterPlace>) get markerBuilder =>
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
}

class Place with ClusterItem {
  final String name;
  final bool isClosed;
  final LatLng latLng;

  Place({required this.name, required this.latLng, this.isClosed = false});

  @override
  String toString() {
    return 'Place $name (closed : $isClosed)';
  }

  @override
  LatLng get location => latLng;
}

Future<Marker> Function(Cluster<Place>) get markerBuilder => (cluster) async {
      return Marker(
        markerId: MarkerId(cluster.getId()),
        position: cluster.location,
        onTap: () {
          print('---- $cluster');
          cluster.items.forEach((p) => print(p));
        },
        icon: await getMarkerBitmap(cluster.isMultiple ? 125 : 75,
            text: cluster.isMultiple ? cluster.count.toString() : null),
      );
    };

Future<BitmapDescriptor> getMarkerBitmap(int size, {String? text}) async {
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
