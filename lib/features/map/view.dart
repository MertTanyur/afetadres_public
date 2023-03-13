// import 'dart:async';

// import 'package:flutter/material.dart';
// // import 'package:flutter_html/flutter_html.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:skelfie/core/utilities/page_notifier.dart';
// import 'package:skelfie/features/geolocation/controller.dart';
// import 'package:skelfie/features/geolocation/model.dart';
// import 'package:skelfie/product/widgets/points.dart';
// import 'controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter_html/flutter_html.dart';

// class BigMapWidget extends StatefulWidget {
//   BigMapWidget({super.key, required this.individualMap});
//   IndividualMap individualMap;
//   @override
//   State<BigMapWidget> createState() => _BigMapWidgetState();
// }

// class _BigMapWidgetState extends State<BigMapWidget>
//     with SingleTickerProviderStateMixin {
//   late Animation<Color?> animation;
//   late AnimationController controller;
//   @override
//   void initState() {
//     controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 1));
//     animation = ColorTween(begin: Colors.red, end: Colors.yellow)
//         .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Future.delayed(Duration(milliseconds: 300), (() {
//         controller.forward();
//       }));
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var h = size.height;
//     return SafeArea(
//       child: Scaffold(
//           body: BigGMap(
//         controller: controller,
//         individualMap: widget.individualMap,
//       )),
//     );
//   }
// }

// class BigGMap extends StatefulWidget {
//   BigGMap({Key? key, required this.individualMap, required this.controller})
//       : super(key: key);
//   IndividualMap individualMap;
//   // VoidCallback mapCreated;
//   AnimationController controller;
//   @override
//   State<BigGMap> createState() => MapSampleState();
// }

// class MapSampleState extends State<BigGMap> {
//   bool _timePassed = true;
//   // ScrollController controller;
//   @override
//   void initState() {
//     // print('init frL?esh and current normalise value is -> ');
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       await Future.delayed(Duration(milliseconds: 1500), () {
//         _timePassed = true;
//         // var nm = context.read<PageNotifier>().normalise();
//         // print('time passed and current normalised value is ->$nm');
//         // setState(() {});
//       });
//     });
//   }

//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 2,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 2);
//   void Function()? openContainer;

//   IndividualMap get individualMap => widget.individualMap;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double w = size.width;
//     double h = size.height;
//     // print('setting map state');
//     return !_timePassed
//         ? Container()
//         : CustomScrollView(
//             // alignment: Alignment.center,
//             slivers: <Widget>[
//               SliverAppBar(
//                 pinned: individualMap.targetImage != null,
//                 expandedHeight: individualMap.targetImage != null ? h / 3 : 20,
//                 flexibleSpace: FlexibleSpaceBar(
//                   title: Text('${individualMap.targetName}'),
//                   background: SizedBox(
//                     child: individualMap.targetImage != null
//                         ? CarouselSlider.builder(
//                             options: CarouselOptions(
//                                 height: h / 3,
//                                 viewportFraction: 1.0,
//                                 enableInfiniteScroll: false),
//                             itemCount: individualMap.targetImage!.length,
//                             itemBuilder: (BuildContext context, int idx,
//                                 int pageViewIndex) {
//                               // return Text(
//                               //     '${individualMap.targetImage![idx]}');
//                               // if (individualMap.targetImage!.length == 0) {
//                               //   return Container();
//                               // }
//                               String imageUrl = individualMap.targetImage![idx];
//                               return Image.network(
//                                 imageUrl,
//                                 height: h / 3,
//                                 width: w,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: ((context, error, stackTrace) {
//                                   return Container();
//                                 }),
//                               );
//                             })
//                         : Container(),
//                   ),
//                 ),
//               ),
//               SliverList(
//                   delegate: SliverChildListDelegate([
//                 // expandedHeight: h * 2 / 5,
//                 SizedBox(
//                   height: h * 4 / 5,
//                   child: GoogleMap(
//                     polylines:
//                         Set<Polyline>.from(individualMap.polyLines.values),
//                     markers: Set<Marker>.from(individualMap.markers.values),
//                     mapToolbarEnabled: false,
//                     // liteModeEnabled: true,
//                     // mapType: MapType.hybrid,

//                     initialCameraPosition:
//                         context.read<GeoLocatorController>().myCameraPosition!,
//                     onMapCreated: (GoogleMapController controller) async {
//                       // print('ms is $ms');
//                       controller
//                           .setMapStyle(context.read<MapController>().mapStyle!);
//                       _controller.complete(controller);
//                       double zoom =
//                           individualMap.getBoundsZoomLevel(Size(w, h * 2 / 5));
//                       print('zoom level is -> $zoom !!!!!!!!!!');
//                       await Future.delayed(Duration(milliseconds: 400));
//                       controller
//                           .animateCamera(CameraUpdate.zoomTo(zoom * 1.05));
//                       // widget.mapCreated.call();
//                     },
//                   ),
//                 ),
//                 Opacity(
//                   opacity: 0.8,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         child: ElevatedButton(
//                           child: Text('go to location in nativa map app'),
//                           onPressed: () async {
//                             await individualMap.goToApp();
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         child: ElevatedButton(
//                           child: Text('Choose map to use'),
//                           onPressed: () async {
//                             await individualMap.selectMap();
//                           },
//                         ),
//                       ),
//                       ElevatedButton(
//                           onPressed: () async {
//                             context.read<PageNotifier>().dontShowWithTime();
//                             widget.controller.reverse();
//                             Navigator.pop(context);
//                           },
//                           child: Text('turn back')),
//                     ],
//                   ),
//                 ),
//               ])),
//               // Transform.translate(
//               //   offset: Offset(0, 0),
//               //   child: Opacity(
//               //     opacity: 0.6,
//               //     child: Image.asset(
//               //       'assets/images/headshot1.png',
//               //       height: 40,
//               //       width: 40,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // )
//               // ElevatedButton(
//               //     onPressed: () async {
//               //       print('going to lake');
//               //       await _goToTheLake();
//               //     },
//               //     child: Text('go to lake')),
//             ],
//           );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
