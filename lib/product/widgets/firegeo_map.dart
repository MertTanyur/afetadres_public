// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:earthquake_emergency/features/api_data/controller.dart';
// import 'package:earthquake_emergency/features/isolate_api_data/controller.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../features/isolate_api_data/model.dart';
// import 'map_streams.dart';
// // import 'streambuilder_test.dart';

// //   const GeoHashMap({super.key});

// //   @override

// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }

// class GeoHashMap extends StatefulHookConsumerWidget {
//   GeoHashMap({required this.myPosition, required this.myGeoFirePoint});
//   Position myPosition;
//   GeoFirePoint myGeoFirePoint;
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _GeoHashMapState();
// }

// class _GeoHashMapState extends ConsumerState<GeoHashMap> {
//   GoogleMapController? _mapController;
//   late TextEditingController _latitudeController, _longitudeController;

//   // firestore init
//   final _firestore = FirebaseFirestore.instance;
//   late GeoFlutterFire geo;
//   late Stream<List<DocumentSnapshot>> stream;
//   final radius = BehaviorSubject<double>.seeded(1.0);
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

//   @override
//   void initState() {
//     super.initState();
//     _latitudeController = TextEditingController();
//     _longitudeController = TextEditingController();

//     geo = GeoFlutterFire();
//     GeoFirePoint center = geo.point(latitude: 12.960632, longitude: 77.641603);
//     stream = radius.switchMap((rad) {
//       var collectionReference = _firestore.collection('locations');
// //          .where('name', isEqualTo: 'darshan');
//       return geo.collection(collectionRef: collectionReference).within(
//           center: center, radius: rad, field: 'position', strictMode: true);

//       /*
//       ****Example to specify nested object****

//       var collectionReference = _firestore.collection('nestedLocations');
// //          .where('name', isEqualTo: 'darshan');
//       return geo.collection(collectionRef: collectionReference).within(
//           center: center, radius: rad, field: 'address.location.position');

//       */
//     });
//   }

//   @override
//   void dispose() {
//     _latitudeController.dispose();
//     _longitudeController.dispose();
//     radius.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     // final selectedMarkers = ref.watch(selectedMarkersProvider);
//     final asyncIsarTracker = ref.watch(asyncIsarTrackerProvider.notifier);
//     final selectedTags = ref.watch(tagNotifierProvider);
//     final filteredIsar = ref.watch(filteredIsarProvider);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Stack(
//           children: [
//             Center(
//               child: Card(
//                 elevation: 4,
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 child: SizedBox(
//                   width: mediaQuery.size.width,
//                   height: mediaQuery.size.height * (1 / 2),
//                   child: GoogleMap(
//                     gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
//                       Factory<OneSequenceGestureRecognizer>(
//                         () => EagerGestureRecognizer(),
//                       ),
//                     ].toSet(),
//                     myLocationEnabled: true,
//                     onMapCreated: _onMapCreated,
//                     initialCameraPosition: const CameraPosition(
//                       target: LatLng(12.960632, 77.641603),
//                       zoom: 15.0,
//                     ),
//                     markers: Set<Marker>.of(markers.values.take(100)),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               left: 20,
//               child: IconButton(
//                 color: Colors.black,
//                 onPressed: _mapController == null
//                     ? null
//                     : () {
//                         _showHome();
//                       },
//                 icon: Icon(Icons.home),
//               ),
//             ),
//             Positioned(
//                 bottom: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) {
//                       return StreamTestWidget(
//                           myGeoFirePoint: widget.myGeoFirePoint);
//                     }));
//                   },
//                   child: Icon(Icons.navigate_next),
//                 )),
//             Positioned(
//                 bottom: 100,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // _mapController
//                     //     ?.animateCamera(CameraUpdate.newCameraPosition(
//                     //   CameraPosition(
//                     //     target: selectedMarkers.values.toList()[0].position,
//                     //     zoom: 15.0,
//                     //   ),
//                     // ));
//                   },
//                   child: Icon(Icons.golf_course),
//                 ))
//           ],
//         ),
//         Text(
//             'filtered isar ${filteredIsar.value?.take(1)} \ncount ${filteredIsar.value?.length}'),
//         Text('selected tags: ${selectedTags}'),
//         filteredIsar.when(
//             data: (List<IsarMapData?> isarList) =>
//                 Text('last state => ${isarList.length}'),
//             error: (_, __) => Container(),
//             loading: () => CircularProgressIndicator())
//         // Text('selected markers: ${asyncIsarTracker.isarFilter().}'),

//         // Padding(
//         //   padding: const EdgeInsets.only(top: 8.0),
//         //   child: Slider(
//         //     min: 1,
//         //     max: 200,
//         //     divisions: 4,
//         //     value: _value,
//         //     label: _label,
//         //     activeColor: Colors.blue,
//         //     inactiveColor: Colors.blue.withOpacity(0.2),
//         //     onChanged: (double value) => changed(value),
//         //   ),
//         // ),
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //   children: <Widget>[
//         //     Container(
//         //       width: 100,
//         //       child: TextField(
//         //         controller: _latitudeController,
//         //         keyboardType: TextInputType.number,
//         //         textInputAction: TextInputAction.next,
//         //         decoration: InputDecoration(
//         //             labelText: 'lat',
//         //             border: OutlineInputBorder(
//         //               borderRadius: BorderRadius.circular(8),
//         //             )),
//         //       ),
//         //     ),
//         //     Container(
//         //       width: 100,
//         //       child: TextField(
//         //         controller: _longitudeController,
//         //         keyboardType: TextInputType.number,
//         //         decoration: InputDecoration(
//         //             labelText: 'lng',
//         //             border: OutlineInputBorder(
//         //               borderRadius: BorderRadius.circular(8),
//         //             )),
//         //       ),
//         //     ),
//         //     MaterialButton(
//         //       color: Colors.blue,
//         //       onPressed: () {
//         //         final lat = double.parse(_latitudeController.text);
//         //         final lng = double.parse(_longitudeController.text);
//         //         _addPoint(lat, lng);
//         //       },
//         //       child: const Text(
//         //         'ADD',
//         //         style: TextStyle(color: Colors.white),
//         //       ),
//         //     )
//         //   ],
//         // ),
//         // MaterialButton(
//         //   color: Colors.amber,
//         //   child: const Text(
//         //     'Add nested ',
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         //   onPressed: () {
//         //     final lat = double.parse(_latitudeController.text);
//         //     final lng = double.parse(_longitudeController.text);
//         //     _addNestedPoint(lat, lng);
//         //   },
//         // )
//       ],
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;
// //      _showHome();
//       //start listening after map is created
//       stream.listen((List<DocumentSnapshot> documentList) {
//         _updateMarkers(documentList);
//       });
//       controller
//           .animateCamera(CameraUpdate.newLatLng(LatLng(37.6956909, 37.860588)));
//     });
//   }

//   void _showHome() {
//     _mapController?.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//         target: LatLng(widget.myPosition.latitude, widget.myPosition.longitude),
//         zoom: 15.0,
//       ),
//     ));
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
//       ;
//       final GeoPoint point = snapData['position']['geopoint'];
//       _addMarker(point.latitude, point.longitude);
//     });
//   }

//   double _value = 20.0;
//   String _label = '';

//   changed(value) {
//     print('slider changed: $value');
//     setState(() {
//       _value = value;
//       _label = '${_value.toInt().toString()} kms';
//       markers.clear();
//     });
//     radius.add(value);
//   }
// }
