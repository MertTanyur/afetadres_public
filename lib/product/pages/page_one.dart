import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:earthquake_emergency/features/api_data/controller.dart';
import 'package:earthquake_emergency/features/geolocation/controller.dart';
import 'package:earthquake_emergency/features/isolate_api_data/model.dart';
import 'package:earthquake_emergency/product/widgets/map_widgets.dart';
import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

// import '../../features/isolate_api_data/controller.dart';
import '../../core/repository_infa/map_data_worker.dart';
import '../../features/api_data/model.dart';
import '../../features/isolate_api_data/controller.dart';
import '../../features/pageview/controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../widgets/clustered_map.dart';
import '../widgets/firegeo_map.dart';
import '../widgets/keys.dart';
// import 'package:rxdart/rxdart.dart';
// import '../widgets/clustered_map.dart';

// import '../widgets/map_widgets.dart';

// final geo = GeoFlutterFire();
// final _firestore = FirebaseFirestore.instance;

class PageOneS extends StatefulHookConsumerWidget {
  PageOneS({super.key, required this.vController});
  ScrollController vController;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageOneSState();
}

enum ExerciseFilter { walking, running, cycling, hiking }

class _PageOneSState extends ConsumerState<PageOneS> {
  // GeoFirePoint myGeoFirePoint(double lat, double lng) {
  //   return geo.point(latitude: lat, longitude: lng);
  // }

  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    // //   await Future.delayed(Duration(milliseconds: 600));
    // //   controller.animateTo(0,
    // //       duration: Duration(seconds: 1), curve: Curves.easeInOut);
    // // });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final double mainAnimation = ref.watch(mainAnimationProvider);
    // final geoLocator = ref.watch(geoLocatorProvider);
    // Position? a = geoLocator.myPosition!;
    final apiData = ref.watch(mapDataControllerProvider);
    Size size = MediaQuery.of(context).size;

    // final b = myGeoFirePoint(a.latitude, a.longitude);
    final isarInstance = ref.watch(isarInstanceProvider.future);
    final isarAsync = ref.watch(asyncIsarTrackerProvider);
    // final isarStream = ref.watch(isarStreamProvider.);
    // final mapDataWorker = ref.watch(mapDataWorkerProvider.future);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final clusterManager = ref.watch(clusterManagerControllerProvider);
    final tagController = ref.watch(tagNotifierProvider);
    final filtered = ref.watch(filteredIsarProvider.future);
    final filteredIsar = ref.watch(filteredIsarProvider);
    final markerController = ref.watch(markerControllerProvider);
    // final mapUtil = ref.watch(mapUtilControllerProvider);
    // final selectedMarkers = ref.watch(selectedMarkersProvider);
    return ListView(
      controller: controller,
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      primary: false,
      children: [
        Transform.translate(
          offset: Offset(0, -AppBar().preferredSize.height),
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                ElasticDrawer(
                  markPosition: 0.5,
                  markWidth: 1,
                  mainColor: Colors.transparent,
                  drawerColor:
                      colorScheme.background, // colorScheme.background,
                  drawerChild: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20 ?? AppBar().preferredSize.height),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ChipSection(
                              header: 'Enkaz - Kurtarma',
                              reasons: ['enkaz', 'kurtarma'],
                            ),
                            ChipSection(
                              header: 'Barınma',
                              reasons: ['barinma'],
                            ),
                            ChipSection(
                              header: 'Yemek Isınma',
                              reasons: ['erzak', 'su'],
                            ),
                            ChipSection(
                              header: 'Giysi',
                              reasons: ['giysi'],
                            ),
                            OutlinedButton.icon(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  ElasticDrawerKey.drawer.currentState
                                      ?.closeElasticDrawer(context);
                                  // ElasticDrawerKey.navigator.
                                },
                                label: Text('Kapat'))
                            // ChipSection(
                            //   header: 'Sağlık Hijyen',
                            //   reasons: ['barinma'],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // width: size.width,
                  // child: Column(children: [
                  //   ElevatedButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         'hi',
                  //       )),
                  // ]),

                  mainChild: Column(
                    children: [
                      // Text('main animation value, $mainAnimation'),
                      SizedBox(
                          height: size.height -
                              AppBar().preferredSize.height * 3 / 2,
                          child: AnimatedCrossFade(
                              crossFadeState: mainAnimation != 1.0
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: Duration(milliseconds: 1000),
                              firstChild: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: size.height -
                                    AppBar().preferredSize.height * 3 / 2 -
                                    size.height / 2 * (1 - mainAnimation),
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: colorScheme.secondary,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.elliptical(
                                            40 - mainAnimation * 40,
                                            40 - mainAnimation * 40))),
                              ),
                              secondChild: SizedBox(
                                  height: size.height -
                                      AppBar().preferredSize.height * 3 / 2,
                                  child: ClusteredMap(key: mapWidgetKey)))),
                      // SizedBox(height: 400, child: MapSample3()),
                      // MapSample(
                      //   model: geoLocator.myModel!,
                      // ),
                      // GeoHashMap(
                      //   myPosition: a,
                      //   myGeoFirePoint: b,
                      // ),
                      // Text('tag controller -> ${tagController}'),
                      // Text(
                      //     'cluster manager stats are not null\npoints:${clusterManager.items.map((e) => e.latLng).take(20)}'),

                      // Text(
                      //     'marker manager stats are\npoints:${markerController.length}'),
                      // filteredIsar.when(
                      //     data: (List<IsarMapData?> isarList) => Text(
                      //         'last state => total count ${isarList.length} not null doubles -> ${isarList.map((e) => e?.loc).where((e) => e != null).length.toString()}'),
                      //     error: (_, __) => Container(),
                      //     loading: () => CircularProgressIndicator()),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       // final vControllerP = ref.read(vControllerProvider);
                      //       // vControllerP?.animateTo(vControllerP.position.maxScrollExtent,
                      //       //     duration: Duration(milliseconds: 200),
                      //       //     curve: Curves.easeInOut);
                      //       await ref.read(mainControllerProvider)?.animateToPage(0,
                      //           duration: Duration(milliseconds: 600),
                      //           curve: Curves.easeInOut);

                      //       await Future.delayed(Duration(milliseconds: 200));
                      //       if (widget.vController.hasClients) {
                      //         widget.vController.animateTo(0,
                      //             duration: Duration(milliseconds: 600),
                      //             curve: Curves.easeInOut);
                      //       }
                      //     },
                      //     child: Text('go to main page')),
                      // // Expanded(
                      // //     child: MapSample(
                      // //   model: geoLocator.myModel!,
                      // // )),

                      // ElevatedButton(
                      //     onPressed: () async {
                      //       try {
                      //         var res = await ref
                      //             .read(mapDataControllerProvider.notifier)
                      //             .fetch_reason('erzak');
                      //         print(
                      //             'len of state is -> ${ref.read(mapDataControllerProvider).length}');
                      //       } catch (e) {
                      //         print(e);
                      //       }

                      //       // var a = geoLocator.myPosition!;

                      //       // var b = myGeoFirePoint(a.latitude, a.longitude);
                      //       // _firestore
                      //       //     .collection('locations')
                      //       //     .add({'name': 'random name', 'position': b.data});
                      //       // print('b is $b');
                      //     },
                      //     child: Text('try api data')),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       var a = geoLocator.myPosition!;

                      //       var b = myGeoFirePoint(a.latitude, a.longitude);
                      //       _firestore
                      //           .collection('locations')
                      //           .add({'name': 'random name', 'position': b.data});
                      //       print('b is $b');
                      //     },
                      //     child: Text('save loc')),

                      // ElevatedButton(
                      //     onPressed: () async {
                      //       print('testingg!!');
                      //       final isar = await isarInstance;
                      //       // isar
                      //       final imd = isar.collection<IsarMapData>();

                      //       await isar.writeTxn(() async {
                      //         int random = Random().nextInt(200);
                      //         final abidinFirst = IsarMapData()
                      //           ..name = 'abidin'
                      //           ..clusterPlace = ClusterPlace(
                      //               mapDataModel:
                      //                   MapDataModel(loc: [22, 23], id: 3));

                      //         await isar.isarMapDatas.put(abidinFirst);
                      //       });
                      //     },
                      //     child: Text('test isar')),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       MapDataWorker hehe =
                      //           await ref.read(mapDataWorkerProvider.future);
                      //       await hehe.fetch('genel');
                      //     },
                      //     child: Text('test background isolate')),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       // await ref
                      //       //     .read(mapUtilControllerProvider.notifier)
                      //       //     .fetchClusterItems();
                      //     },
                      //     child: Text(
                      //         'test map util controller length:${mapUtil.clusterItems?.length}')),
                      // isarAsync.when(
                      //     data: (dynamic val) => Text('data changed ${val}'),
                      //     error: (_, __) => Container(),
                      //     loading: () => CircularProgressIndicator()),
                      // // MapSample(model: model),
                      // // Spacer(),
                      // Text('0, , $mainAnimation'),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       // final isar =
                      //       //     Isar.open([IsarMapDataSchema, LastFetchedSchema]);
                      //       final isar = Isar.getInstance();
                      //       isar!.isarMapDatas.watchObject(266453)
                      //         ..listen((event) {
                      //           print('event printing');
                      //           print(event);
                      //         });
                      //       // final isar2 =  Isar.open();
                      //       // print('${isar?.isOpen}');
                      //       // final obj = isar?.directory;
                      //       // print('${obj}');
                      //       // print('${isar?.path}');
                      //       // print(
                      //       //     '${isar!.isarMapDatas.getSync(266453)!.clusterPlace!.mapDataModel!}');
                      //     },
                      //     child: Text('fetch from scratch '))
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Animate(
                    delay: 100.ms,
                    effects: [
                      SlideEffect(
                          curve: Curves.easeInOut,
                          begin: Offset(0, 0),
                          end: Offset(-.1, 0),
                          delay: 800.ms,
                          duration: 400.ms),
                      TintEffect(
                          color: colorScheme.error,
                          delay: 500.ms,
                          duration: 800.ms),
                      FadeEffect(
                          begin: 1, end: 0, delay: 500.ms, duration: 2000.ms)
                    ],
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.swipe_left,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container slidingSelect({String header = 'Abidin'}) {
    return Container(
      child: Text(
        header,
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
    );
  }
}

class FancyButton extends StatelessWidget {
  const FancyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        // blendMode: BlendMode.,
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Opacity(
            opacity: .4,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'hi',
                  style: TextStyle(color: Colors.white),
                ))));
  }
}

class ChipSection extends StatefulHookConsumerWidget {
  ChipSection({super.key, required this.header, required this.reasons}) {
    tagOptions = Tag.tagGroupFromReason(reasons);
  }
  String header;
  List<Tag> tagOptions = [];
  List<String> reasons;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChipSectionState();
}

class _ChipSectionState extends ConsumerState<ChipSection> {
  bool favorite = false;
  final List<String> _filters = <String>[];
  @override
  Widget build(BuildContext context) {
    final tagController = ref.watch(tagNotifierProvider);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(widget.header, style: textTheme.labelMedium),
            )),
        const SizedBox(height: 5.0),
        // Text('tag notifier provider -> ${tagController}'),
        Wrap(
          spacing: 30,
          runSpacing: 20,
          children: widget.tagOptions.map((Tag tag) {
            return FilterChip(
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              label: Text(tag.name),
              selected: tagController.contains(tag),
              onSelected: (bool value) async {
                print('on selected is !!!!!!!!!!!!!!!!!!!-> $value');
                if (value) {
                  // ref
                  //     .read(mapDataWorkerProvider.future)
                  //     .then((value) => fetch_reason(tag.endPoint));
                  ref.read(tagNotifierProvider.notifier).addTag(tag);
                } else {
                  print('removeing ${tag.label}');
                  ref.read(tagNotifierProvider.notifier).removeTag(tag);
                  print('tag controller values are ${tagController}');
                }
                setState(() {});
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 30,
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 1),
              child: widget.reasons.any((element) =>
                      tagController.map((e) => e.endPoint).contains(element))
                  ? Text(
                      'Seçili: ${tagController.where((element) => widget.reasons.contains(element.endPoint)).map((e) => e.label).join(", ")}',
                      style: textTheme.labelSmall,
                    )
                  : null),
        ),
        SizedBox(
          height: 30,
          width: 100,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 1),
            child: widget.reasons.any((element) =>
                    tagController.map((e) => e.endPoint).contains(element))
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        for (Tag tag in tagController.where((element) =>
                            widget.reasons.contains(element.endPoint)))
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Center(
                              //   child: Text(
                              //     tag.label[0],
                              //     style: TextStyle(fontSize: 8),
                              //   ),
                              // ),
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: tag.tagColor),
                              ),
                            ],
                          )
                      ])
                : null,
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}

// class WebMap extends StatefulWidget {
//   WebMap({Key? key, required this.center}) : super(key: key);
//   GeoFirePoint center;
//   @override
//   State<WebMap> createState() => WebMapState();
// }

// class WebMapState extends State<WebMap> {
//   dynamic get center =>  widget.center;
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

//   BehaviorSubject<double> radius = BehaviorSubject.seeded(100);
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   // Stream<List<DocumentSnapshot>>? query;
//   StreamSubscription? subscription;
//   late Stream<List<DocumentSnapshot>> stream;

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   void initState() {
//     stream = radius.switchMap((rad) {
//       var collectionReference = _firestore.collection('locations');
// //          .where('name', isEqualTo: 'darshan');
//       return geo.collection(collectionRef: collectionReference).within(
//           center:center, radius: rad, field: 'position', strictMode: true);

//       /*
//       ****Example to specify nested object****

//       var collectionReference = _firestore.collection('nestedLocations');
// //          .where('name', isEqualTo: 'darshan');
//       return geo.collection(collectionRef: collectionReference).within(
//           center: center, radius: rad, field: 'address.location.position');

//       */
//     });
//     super.initState();
//   }
//     // TODO: implement initState
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GoogleMap(
//           mapType: MapType.hybrid,
//           initialCameraPosition: _kGooglePlex,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },

//           // floatingActionButton: FloatingActionButton.extended(
//           //   onPressed: _goToTheLake,
//           //   label: const Text('To the lake!'),
//           //   icon: const Icon(Icons.directions_boat),
//           // ),
//         ),
//         Positioned(
//           top: 20,
//           right: 20,
//           child: Slider(
//             value: radius.value,
//             label: 'Zoom slider',
//             onChanged: (value) {},
//           ),
//         ),
//       ],
//     );
//   }

//   void _addPoint(double lat, double lng) {
//     GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
//     _firestore
//         .collection('locations')
//         .add({'name': 'random name', 'position': geoFirePoint.data}).then((_) {
//       print('added ${geoFirePoint.hash} successfully');
//     });
//   }

//   //example to add geoFirePoint inside nested object
//   void _addNestedPoint(double lat, double lng) {
//     GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
//     _firestore.collection('nestedLocations').add({
//       'name': 'random name',
//       'address': {
//         'location': {'position': geoFirePoint.data}
//       }
//     }).then((_) {
//       print('added ${geoFirePoint.hash} successfully');
//     });
//   }

//   void _addMarker(double lat, double lng) {
//     final id = MarkerId(lat.toString() + lng.toString());
//     final _marker = Marker(
//       markerId: id,
//       position: LatLng(lat, lng),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//       infoWindow: InfoWindow(title: 'latLng', snippet: '$lat,$lng'),
//     );
//     setState(() {
//       markers[id] = _marker;
//     });
//   }

//   void _updateMarkers(List<DocumentSnapshot> documentList) {
//     documentList.forEach((DocumentSnapshot document) {
//       Map<String, dynamic> snapData = document.data() as Map<String, dynamic>;
//       final GeoPoint point = snapData['position']['geopoint'];
//       _addMarker(point.latitude, point.longitude);
//     });
//   }

//   double _value = 20.0;
//   String _label = '';

//   changed(value) {
//     setState(() {
//       _value = value;
//       _label = '${_value.toInt().toString()} kms';
//       markers.clear();
//     });
//     radius.add(value);
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

class MapSample3 extends StatefulWidget {
  const MapSample3({Key? key}) : super(key: key);

  @override
  State<MapSample3> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample3> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
