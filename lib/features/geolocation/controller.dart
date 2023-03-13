import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:google_maps_webservice/directions.dart" as D;
// import "package:google_maps_webservice/location";
import "package:google_maps_webservice/places.dart" as P;
// import '';
import "../../core/config.dart" as config;
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'controller.g.dart';

// @riverpod
// class GeoLocatorController extends _$GeoLocatorController {
//   @override
//   GeoLocatorModel? build() => null;

//   Position? get myPosition {
//     return state?.myPosition;
//   }

//   Future<void> initialize() async {
//     Position myPosition = await determinePosition();
//     state = await GeoLocatorModel.initialize(myPosition);
//   }

//   List<P.PlacesSearchResult>? nearbyResults;
// }

// var _kPlex = LatLng(37.42796133580664, -122.085749655962);

// @Riverpod(keepAlive: true)
// LatLng initialPosition(InitialPositionRef ref) {
//   return

@Riverpod(keepAlive: true)
class InitialPosition extends _$InitialPosition {
  @override
  LatLng build() => LatLng(37.5753, 36.9228);

  void set(LatLng latLng) {
    state = latLng;
  }

  // void setCamPos(CameraPosition pos){
  //   ref.read(cameraPositionProvider.)
  // }
}

@Riverpod(keepAlive: true)
class CameraPos extends _$CameraPos {
  @override
  CameraPosition build() {
    final initialPos = ref.watch(initialPositionProvider);
    return CameraPosition(target: initialPos, zoom: 12);
  }

  void set(CameraPosition cameraPosition) {
    state = cameraPosition;
  }

  // void setCamPos(CameraPosition pos){
  //   ref.read(cameraPositionProvider.)
  // }
}

final geoLocatorProvider = ChangeNotifierProvider<GeoLocatorController>((ref) {
  return GeoLocatorController();
});

class GeoLocatorController extends ChangeNotifier {
  // location
  GeoLocatorModel? myModel;

  Position? get myPosition => myModel?.myPosition;
  List<P.PlacesSearchResult>? nearbyResults;

  IndividualMap? individualMapFromIdx(int idx) {
    if (idx >= myModel!.maps.length) {
      return null;
    }
    var iMap = myModel!.maps[idx];
    return iMap;
  }

  Future<void> initialize() async {
    Position myPosition = await determinePosition();
    myModel = await GeoLocatorModel.initialize(myPosition);

    var runOnce = myCameraPosition;

    // _addMarker(
    //   myLatLng,
    //   "origin",
    //   BitmapDescriptor.defaultMarker,
    // );

    // Add destination marker

    // _addMarker(
    //   itu,
    //   "destination",
    //   BitmapDescriptor.defaultMarkerWithHue(90),
    // );
    // try {
    //   await _getPolyline();
    //   print('getted polylines');
    // } catch (e) {
    //   print('couldnt get polylines');
    // }
    notifyListeners();
  }

  LatLng? myLatLng;

  CameraPosition? get myCameraPosition {
    Position? p = myModel?.myPosition;
    if (p != null) {
      myLatLng = LatLng(p.latitude, p.longitude);
      return CameraPosition(target: myLatLng!, zoom: 12);
    }

    return null;
  }

  D.Location? get myLocation {
    return dLocation(latLng: myLatLng);
  }

  // lottie animation
  AnimationController? lottieAnimationController;

  void setLottieController(AnimationController controller) {
    lottieAnimationController = controller;
    notifyListeners();
  }

  GlobalKey<AppBarPlacesAutoCompleteTextFieldState>? textFieldKey;
  TextEditingController? fieldTextController;
  FocusNode? fieldFocus;

  void setFieldFocus(FocusNode focusNode) {
    fieldFocus = focusNode;
    notifyListeners();
  }

  void focusField() {
    fieldFocus?.requestFocus();
    notifyListeners();
  }

  void unfocusField() {
    fieldFocus?.unfocus();
    notifyListeners();
    // fieldFocus.dispose();
  }

  bool showMap = true;

  void resetFieldTextController() {
    fieldTextController?.clear();
    notifyListeners();
  }

  void setFieldTextController(TextEditingController controller) {
    fieldTextController = controller;
    print('textfield controller has ben setted!');
    fieldTextController!
      ..addListener(() {
        print('value changed!   ${fieldTextController?.text}');
        if (fieldTextController != null) {
          if (fieldTextController!.text.length == 0) {
            lottieAnimationController?.forward();
            showMap = true;
          } else {
            lottieAnimationController?.reverse();
            showMap = false;
          }
          notifyListeners();
        }
      });
    notifyListeners();
  }

  void setTextFieldKey(GlobalKey<AppBarPlacesAutoCompleteTextFieldState> key) {
    textFieldKey = key;

    notifyListeners();
  }

  void someAction() {
    // textFieldKey?.currentState?.deactivate();
    // textFieldKey!.currentState?.((element) {
    //   print('element type is -> ${element.runtimeType}');
    //   if (element.runtimeType == TextField) {
    //     var a = element as TextField;
    //     a.controller?.addListener(() {
    //       print('text value is -> ${a.controller?.value}');
    //     });
    //     // a
    //   }
    // });
    // textFieldKey!.currentState!.
    // textFieldKey!.currentState.
  }

  // Future<void> findDirections() async {
  //   var g1 = G.GoogleMapsGeocoding(apiKey: config.mapApiKey);
  //   var d = D.GoogleMapsDirections(apiKey: config.mapApiKey);
  //   var myGeoCode = G.Location(lat: myLatLng.latitude, lng: myLatLng.longitude);
  //   var targetGeoCode = G.Location(lat: config._kPlex.latitude, lng: config._kPlex.longitude);

  //   // D.Location(lat: )
  //   // g1.searchByLocation(myLatLgn!)
  //   var res = await d.directionsWithLocation(
  //       dLocation(latLng: myLatLng), dLocation(latLng: _kPlex));
  //   print(res);
  //   // d.directions(origin, destination)
  // }

  Map<PolylineId, Polyline> polyLines = {};
  Map<MarkerId, Marker> markers = {};
  // PolylinePoints polylinePoints = PolylinePoints();

  // Future<void> _getPolyline() async {
  //   List<LatLng> polylineCoordinates = [];

  //   // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //   //   config.mapApiKey,
  //   //   PointLatLng(parseLatLgn(myLatLng)[0], parseLatLgn(myLatLng)[1]),
  //   //   PointLatLng(itu.latitude, itu.longitude),
  //   //   travelMode: TravelMode.driving,
  //   // );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //     print('there are ${polylineCoordinates.length} points');
  //   } else {
  //     print("Error heheh hihihi ${result.errorMessage}");
  //   }
  //   _addPolyLine(polylineCoordinates);
  // }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
    notifyListeners();
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      endCap: Cap.roundCap,
      width: 5,
      color: Colors.white.withOpacity(0.7),
    );
    polyLines[id] = polyline;
    notifyListeners();
  }
}
