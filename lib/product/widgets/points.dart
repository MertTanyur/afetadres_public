// import 'dart:async';
// import 'dart:math';
// import 'dart:ui';
// import 'package:animations/animations.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:skelfie/features/geolocation/controller.dart';
// import 'package:skelfie/features/geolocation/model.dart';
// import 'package:vector_math/vector_math_64.dart' as Vect;

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:simple_shadow/simple_shadow.dart';
// import '../../core/utilities/page_notifier.dart';
// import '../../core/utilities/transform_utilities.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../features/map/controller.dart';
// import '../../features/map/view.dart';

// class Points extends StatefulWidget {
//   const Points({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   State<Points> createState() => _PointsState();
// }

// class _PointsState extends State<Points> with AutomaticKeepAliveClientMixin {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // print('points initialized');
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = widget.size;
//     return Point();
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => false;
// }

// class Point extends StatefulWidget {
//   const Point({
//     super.key,
//   });

//   @override
//   State<Point> createState() => _PointState();
// }

// class _PointState extends State<Point> with SingleTickerProviderStateMixin {
//   // late AnimationController controller;
//   // late Animation<double> animation;
//   bool animate = false;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});

//     // TODO: implement initState
//     // controller = AnimationController(
//     //   vsync: this,
//     //   duration: Duration(
//     //     milliseconds: 800,
//     //   ),
//     //   reverseDuration: Duration(milliseconds: 100),
//     // );
//     // animation = Tween<double>(begin: 0, end: 1)
//     //     .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
//     // WidgetsBinding.instance.addPostFrameCallback(
//     //   (timeStamp) {
//     //     Future.delayed(Duration(milliseconds: 800), () {
//     //       controller.forward();
//     //     });
//     //     animate = true;
//     //     setState(() {});
//     //   },
//     // );
//     // WidgetsBinding.instance.addPersistentFrameCallback(
//     //   (timeStamp) {
//     //     context.watch<PageNotifier>().delayedStream().listen((event) {
//     //       print(event);
//     //     });
//     //   },
//     // );
//     // print('point initialized');
//     // mapWidget = MapSample();
//     // print('a new map is created');
//     super.initState();
//   }

//   Widget? mapWidget;

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     // controller.reverse();
//     // controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var h = size.height;
//     //   return StreamBuilder<double>(
//     //       stream: context.watch<PageNotifier>().delayedStream,
//     //       builder: ((context, snapshot) {
//     //         if (snapshot != null && snapshot.hasData) {
//     //           return Center(child: Text(snapshot.data.toString()));
//     //         }
//     //         return Container();
//     //       }));
//     // return AnimatedBuilder(
//     //     child: Container(
//     //       decoration: BoxDecoration(
//     //           color: Theme.of(context).colorScheme.onSurface,
//     //           shape: BoxShape.circle),
//     //       height: 20,
//     //       width: 20,
//     //     ),
//     //     animation: controller,
//     //     builder: ((context, child) {
//     //       return Positioned(
//     //         bottom: size.height / 5,
//     //         left: animation.value * size.width / 3,
//     //         // value.curvedOffset(
//     //         //   size.width / 10,
//     //         //   size.width / 2,
//     //         // ),
//     //         child: Opacity(
//     //             opacity: max(0, min(1, animation.value * 4 / 5)), child: child),
//     //       );
//     //     }));
//     return SizedBox(
//       height: h,
//       width: size.width,
//       child: Stack(alignment: Alignment.center, children: [
//         for (int i = 0; i < context.read<PageNotifier>().defaultMinLattice; i++)
//           ElevatingPoint(
//             key: ValueKey(i),
//             idx: i,
//             size: size,
//             maxElevationRatio: i * 2 + 1,
//             color: Theme.of(context).colorScheme.background.withOpacity(0.3),
//           ),
//         for (int i = 0; i < context.read<PageNotifier>().defaultMinLattice; i++)
//           SlowMovingPoint(
//             size: size,
//             i: i,
//             reverse: i % 2 == 0,
//           ),

//         // ElevatingPoint(
//         //   size: size,
//         //   value: value,
//         //   maxElevationRatio: 3,
//         //   color: Colors.green,
//         // ),
//         // ElevatingPoint(
//         //   size: size,
//         //   value: value,
//         //   maxElevationRatio: 5,
//         //   color: Colors.purple,
//         // ),
//       ]),
//     );
//   }
// }

// class SlowMovingPoint extends StatefulWidget {
//   SlowMovingPoint({
//     Key? key,
//     required this.size,
//     required this.i,
//     this.reverse = false,
//   }) : super(key: key);
//   final Size size;
//   bool reverse;
//   int i;

//   @override
//   State<SlowMovingPoint> createState() => _SlowMovingPointState();
// }

// class _SlowMovingPointState extends State<SlowMovingPoint> {
//   bool _resize = false;
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var v = context.watch<PageNotifier>();
//     var r = context.read<PageNotifier>();
//     var bottomTarget =
//         ((widget.i * 2 + 1) * h / r.defaultMaxLattice) + (h / 15);
//     var opacityFactor = sqrt(((widget.i + 1) / (r.defaultMinLattice + 1)));
//     return AnimatedPositioned(
//       curve: Curves.easeInOut,
//       duration: Duration(milliseconds: (200 * (opacityFactor)).toInt()),
//       bottom: bottomTarget,
//       left: widget.reverse
//           ?
//           // ? widget.value.

//           -context.watch<PageNotifier>().curvedOffset(
//                     widget.size.width / 10,
//                     widget.size.width / 2,
//                   ) +
//               widget.size.width -
//               20
//           : context.watch<PageNotifier>().curvedOffset(
//                     widget.size.width / 10,
//                     widget.size.width / 2,
//                   ) -
//               20,
//       child: Opacity(
//         opacity: context.watch<PageNotifier>().curvedRatio(cutThreshhold: 0.8),
//         child: SimpleShadow(
//           opacity: 0.5,
//           sigma: 10,
//           color: Colors.black,
//           offset: Offset(0, 0),
//           child: AnimatedSwitcher(
//             switchInCurve: Curves.easeInOut,
//             switchOutCurve: Curves.fastOutSlowIn,
//             duration: Duration(seconds: 2),
//             reverseDuration: Duration(milliseconds: 50),
//             child: context.watch<MapController>().inProgress &&
//                     context.read<MapController>().opening == widget.i
//                 ? Container()
//                 : Image.asset(
//                     'assets/images/hs.png',
//                     alignment: Alignment.center,
//                     color: Theme.of(context)
//                         .colorScheme
//                         .primary
//                         .withOpacity(0.8)
//                         .withBlue(250),
//                     // colorBlendMode: BlendMode.srcATop,
//                     height: 40,
//                     width: 40,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ElevatingPoint extends StatefulWidget {
//   ElevatingPoint(
//       {Key? key,
//       required this.size,
//       required this.idx,
//       // required this.value,
//       required this.maxElevationRatio,
//       this.color = Colors.red})
//       : super(key: key);
//   // PageNotifier value;
//   final Size size;
//   int maxElevationRatio;
//   Color? color;
//   final int idx;
//   @override
//   State<ElevatingPoint> createState() => _ElevatingPointState();
// }

// class _ElevatingPointState extends State<ElevatingPoint> {
//   bool _resize = false;
//   Widget? map;
//   IndividualMap? individualMap;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // map = MapSample();
//     print('a new elevating point initialized');
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       individualMap =
//           context.read<GeoLocatorController>().individualMapFromIdx(widget.idx);
//       setState(() {});
//       // print('map generating function trigerred!');
//       // incontext
//       //                                 .read<GeoLocatorController>()
//       //                                 .myModel!
//       //                                 .myPosition!)
//       // map = MapSample(
//       //   mapCreated: toggleMapStatus,
//       // );
//       // Future.delayed(Duration(milliseconds: 200),);
//       timePassed = true;

//       // setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     timePassed = false;
//     // TODO: implement dispose
//     super.dispose();
//   }

//   bool timePassed = false;

//   void toggleMapStatus() {
//     isMapCreated = true;
//     // print('heyy map is created lets toggle status');
//   }

//   bool isMapCreated = false;
//   // Widget? map;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var h = size.height;
//     var w = size.width;
//     var v = context.watch<PageNotifier>();
//     return individualMap == null
//         ? Container()
//         : Positioned(
//             bottom: v.parseVerticalGetRatio(widget.maxElevationRatio,
//                     useCurve: true) *
//                 h,
//             // value.curvedOffset(
//             //   size.height / 4,
//             //   size.height / maxElevationRatio,
//             // ),
//             // left: v.curvedOffset(
//             //   size.width / 10,
//             //   size.width / 2,
//             // ),
//             // skewX(1 - (v.normalise()))
//             child: _OpenContainerWrapper(
//               individualMap: individualMap!,
//               idx: widget.idx,
//               child: Transform.scale(
//                 scale: 0.8,
//                 child: Transform(
//                   transform: Matrix4.skewX(1 - v.normalise()),
//                   child: ClipRect(
//                     // borderRadius: BorderRadius.circular(30),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//                       child: Opacity(
//                         opacity: v.curvedRatio(cutThreshhold: 0.3) * 2 / 5,
//                         child: GestureDetector(
//                           onTap: () async {
//                             context.read<PageNotifier>().toggleDontShow();
//                             context.read<MapController>().goToMap(widget.idx);
//                             print('on tapped on ${widget.idx}');
//                           },
//                           child: AnimatedContainer(
//                             duration: Duration(milliseconds: 500),
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               // boxShadow: [BoxShadow(color: Colors.red, blurRadius: 20)],
//                               color: widget.color,
//                               borderRadius: BorderRadius.circular(20),
//                               //  Theme.of(context).colorScheme.onSurface,
//                             ),
//                             height: h / 6,
//                             width: w * .9,
//                             child:
//                                 // Text('naber'),
//                                 AnimatedCrossFade(
//                               sizeCurve: Curves.easeInOut,
//                               firstCurve: Curves.elasticInOut,
//                               duration: Duration(milliseconds: 300),
//                               reverseDuration: Duration.zero,
//                               crossFadeState:
//                                   !context.watch<PageNotifier>().showMaps
//                                       ? CrossFadeState.showFirst
//                                       : CrossFadeState.showSecond,
//                               firstChild: FractionallySizedBox(
//                                 widthFactor: .8,
//                                 child: Container(
//                                   height: 20,
//                                   width: 20,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white.withOpacity(0.3),
//                                   ),
//                                 ),
//                               ),
//                               secondChild:
//                                   // MapSample(),
//                                   InnerCard(
//                                 childWidget: MapSample(
//                                     individualMap: individualMap,
//                                     idx: widget.idx,
//                                     position: context
//                                         .read<GeoLocatorController>()
//                                         .myModel!
//                                         .myPosition!),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ));
//   }
// }

// class InnerCard extends StatelessWidget {
//   InnerCard({Key? key, this.childWidget}) : super(key: key);
//   Widget? childWidget;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500,
//       // width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Padding(
//           //   padding: EdgeInsets.all(10),
//           //   child: Text(
//           //     'Location: ',
//           //     style: Theme.of(context).textTheme.headline6,
//           //   ),
//           // ),
//           Expanded(
//             child: FractionallySizedBox(
//               widthFactor: 1.0,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   child: childWidget,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MapSample extends StatefulWidget {
//   MapSample({
//     Key? key,
//     this.position,
//     required this.idx,
//     this.individualMap,
//   }) : super(key: key);
//   IndividualMap? individualMap;
//   Position? position;
//   int idx;
//   // VoidCallback mapCreated;
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   bool _timePassed = false;
//   IndividualMap? individualMap;
//   @override
//   void initState() {
//     // print('init frL?esh and current normalise value is -> ');
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       if (widget.individualMap == null) {
//         individualMap = context
//             .read<GeoLocatorController>()
//             .individualMapFromIdx(widget.idx + 3);
//       } else {
//         individualMap = widget.individualMap;
//       }

//       print('individual map hospital name is -> ${individualMap?.targetName}');
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
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double w = size.width;
//     double h = size.height;
//     // print('setting map state');
//     return !_timePassed || individualMap == null
//         ? Container()
//         : Stack(
//             alignment: Alignment.center,
//             children: [
//               AbsorbPointer(
//                   absorbing: true,
//                   child: GoogleMap(
//                     zoomGesturesEnabled: true,
//                     // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
//                     //     northeast: individualMap!.myLatLng,
//                     //     southwest: individualMap!.targetLatLng)),
//                     // minMaxZoomPreference: MinMaxZoomPreference(8, 12),
//                     polylines:
//                         Set<Polyline>.from(individualMap!.polyLines.values),
//                     markers: Set<Marker>.from(individualMap!.markers.values),
//                     mapToolbarEnabled: false,
//                     // liteModeEnabled: true,
//                     // mapType: MapType.hybrid,
//                     initialCameraPosition:
//                         context.read<GeoLocatorController>().myCameraPosition ??
//                             _kGooglePlex,
//                     onMapCreated: (GoogleMapController controller) async {
//                       // print('ms is $ms');
//                       controller
//                           .setMapStyle(context.read<MapController>().mapStyle!);
//                       _controller.complete(controller);
//                       print('going to my position');
//                       double zoom = individualMap!
//                           .getBoundsZoomLevel(Size(w * .8, h / 6));
//                       print('zoom level is -> $zoom !!!!!!!!!!');
//                       controller
//                           .animateCamera(CameraUpdate.zoomTo(zoom * 1.05));
//                       // var update = () async {
//                       //   var region = await controller.getVisibleRegion();
//                       //   // check visible region
//                       //   if (region.southwest.latitude == 0.0) {
//                       //     return false;
//                       //   }
//                       //   CameraUpdate update = CameraUpdate.newLatLngBounds(
//                       //       individualMap!.latLngBounds!, 0);
//                       //   controller.moveCamera(update);
//                       //   return true;
//                       // };
//                       // // Can set timer or do some error checking here to make sure it doesnt go on forever
//                       // while (await update() == false) {
//                       //   update();
//                       // }
//                       // ;
//                       // controller.
//                       // await _goToMyPosition();
//                       // widget.mapCreated.call();
//                     },
//                   )),
//               // ElevatedButton(
//               //     onPressed: () async {
//               //       print('going to lake');
//               //       await _goToTheLake();
//               //     },
//               //     child: Text('go to lake')),
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: Opacity(
//                   opacity: 0.8,
//                   child:
//                       Text('Distance: ${individualMap?.prettifyDistance} Km'),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 left: 10,
//                 child: SizedBox(
//                   width: w / 2,
//                   child: Opacity(
//                     opacity: 0.8,
//                     child: Text(
//                       '${individualMap!.targetName}',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//   }

//   void check(CameraUpdate u, GoogleMapController c) async {
//     c.animateCamera(u);
//     // c.animateCamera(u);
//     LatLngBounds l1 = await c.getVisibleRegion();
//     // LatLngBounds l2=await c.getVisibleRegion();
//     print(l1.toString());
//     // print(l2.toString());
//     if (l1.southwest.latitude == -90 || l1.southwest.latitude == -90)
//       check(u, c);
//   }

//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
//   Future<void> _goToMyPosition() async {
//     if (widget.position != null) {
//       final GoogleMapController controller = await _controller.future;
//       var p = widget.position!;
//       var myLatLgn = LatLng(p.latitude, p.longitude);
//       var a = CameraPosition(target: myLatLgn, zoom: 15);
//       controller.animateCamera(CameraUpdate.newCameraPosition(a));
//     }
//   }
// }

// /// please provide child or closed builder 1
// class _OpenContainerWrapper extends StatelessWidget {
//   /// please provide child or closed builder 2
//   _OpenContainerWrapper(
//       {Key? key,
//       this.closedBuilder,
//       this.child,
//       this.idx,
//       required this.individualMap})
//       : super(key: key);
//   IndividualMap individualMap;
//   int? idx;
//   Widget Function(BuildContext, void Function())? closedBuilder;
//   Widget? child;
//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//       onClosed: ((data) {
//         print('on closed');
//         context.read<MapController>().resetAimAnimation();
//       }),
//       transitionDuration: Duration(seconds: 1),
//       closedColor: Colors.transparent,
//       openColor: Colors.transparent,
//       openElevation: 0,
//       closedBuilder: child != null
//           ? ((context, action) {
//               context.read<MapController>().updateActionsMap(action, idx);
//               return child!;
//             })
//           : closedBuilder!,
//       openBuilder: ((context, action) {
//         return BigMapWidget(
//           individualMap: individualMap,
//         );
//       }),
//     );
//   }
// }
