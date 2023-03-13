import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'services.dart';
import "package:google_maps_webservice/places.dart" as P;
import '../../core/config.dart' as config;
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  double? x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null || x1 == null || y0 == null || y1 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }
  }

  return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
}

class GeoLocatorModel {
  GeoLocatorModel();
  static Future<GeoLocatorModel> initialize(Position position) async {
    Stopwatch stopwatch = Stopwatch()..start();
    print('initializing a geolocator with position of ${position.toJson()}');
    var g = GeoLocatorModel();
    g.myPosition = position;
    // await g.fetchNearbyResults();
    List<Future> _futures = [];
    print('');
    // for (P.PlacesSearchResult placesSearchResult in g.nearbyResults!) {
    //   final _future_element = IndividualMap.initialize(
    //           myLatLng: LatLng(g.myPosition!.latitude, g.myPosition!.longitude),
    //           placesSearchResult: placesSearchResult)
    //       .then((value) => g.maps.add(value!));
    //   _futures.add(_future_element);
    //   // g.maps.add(i!);
    // }
    // await Future.wait(_futures);
    print(
        'geolocator initialization executed in ${stopwatch.elapsed.inMilliseconds} milliseconds');
    return g;
  }

  // double get myLat=> myLatLng.

  Position? myPosition;
  List<P.PlacesSearchResult>? nearbyResults;
  CameraPosition? get myCameraPosition {
    if (myPosition != null) {
      var myLatLng = LatLng(myPosition!.latitude, myPosition!.longitude);
      return CameraPosition(target: myLatLng);
    }
    return null;
  }

  Future<void> fetchNearbyResults() async {
    nearbyResults = await nearbyHospitals(
        pLocation(lat: myPosition!.latitude, lng: myPosition!.longitude));
  }

  List<IndividualMap> maps = [];

  // nearbyResults = await nearbyHospitals(
  //       pLocation(lat: myPosition!.latitude, lng: myPosition!.longitude));
}

class IndividualMap {
  IndividualMap({required this.myLatLng, required this.placesSearchResult});
  P.PlacesSearchResult placesSearchResult;
  LatLngBounds? latLngBounds;
  LatLng myLatLng;
  Future<void> goToApp() async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$targetLat,$targetLng";

    final Uri uri = Uri.parse(Uri.encodeFull(googleMapslocationUrl));

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $uri');
      throw 'Could not launch $uri';
    }
  }

  Future<void> selectMap() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    await availableMaps.first.showMarker(
      coords: Coords(targetLat, targetLng),
      title: targetName,
    );
  }

  // double calculateDistance() {
  //   double totalDistance = 0;
  //   for (var i = 0; i < polylineCoordinates.length - 1; i++) {
  //     totalDistance += calculateDistance(
  //         polyLines[i].latitude,
  //         polylineCoordinates[i].longitude,
  //         polylineCoordinates[i + 1].latitude,
  //         polylineCoordinates[i + 1].longitude);
  //   }
  //   return totalDistance;
  // }

  static Future<IndividualMap?> initialize(
      {required LatLng myLatLng,
      required P.PlacesSearchResult placesSearchResult}) async {
    var m = IndividualMap(
        myLatLng: myLatLng, placesSearchResult: placesSearchResult);
    await m.prepare();

    return m;
  }

  P.Location get targetLocation => placesSearchResult.geometry!.location;
  String get targetName => placesSearchResult.name;

  List<String>? get targetImage {
    if (placesSearchResult.photos.length == 0) return null;
    return placesSearchResult.photos
        .map((e) => composeUrl(e.photoReference))
        .toList();
  }

  String composeUrl(String photoRef) {
    return '''https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoRef&key=${config.mapApiKey}''';
  }

  double get targetLng => targetLocation.lng;
  double get targetLat => targetLocation.lat;
  LatLng get targetLatLng => LatLng(targetLat, targetLng);
  double get myLat => myLatLng.latitude;
  double get myLng => myLatLng.longitude;
  String? get targetAdress => placesSearchResult.formattedAddress;
  String? get targetIcon => placesSearchResult.icon;
  // String get sliverAppBarBackground {
  //   if(targetImage.length !=0){

  //   }else{

  //   }
  // }
  Map<PolylineId, Polyline> polyLines = {};
  Map<MarkerId, Marker> markers = {};
  Map<MarkerId, Marker>? bigMapMarkers;
  Future<Map<MarkerId, Marker>> get markersWithMyLocation async {
    BitmapDescriptor bmd = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(40, 40),
        ),
        'assets/images/headshot1.png');
    MarkerId markerId = MarkerId('Me');
    Marker marker = Marker(markerId: markerId, icon: bmd, position: myLatLng);

    Map<MarkerId, Marker> copy = {...markers, markerId: marker};
    return copy;
  }

  // PolylinePoints polylinePoints = PolylinePoints();

  Future<void> prepare() async {
    _addMarker(targetLatLng, "Hospital: $targetName",
        BitmapDescriptor.defaultMarkerWithHue(90));

    try {
      // await _getPolyline();
      print('getted polylines for $targetName');
    } catch (e) {
      print('couldnt get polylines for $targetName');
    }
    List<LatLng> coordinates = [myLatLng, targetLatLng];
    latLngBounds = boundsFromLatLngList(coordinates);
    // bigMapMarkers = await markersWithMyLocation;
  }

  // Position? get myPosition => Position(latitude: myLat, longitude: myLng);

  double getBoundsZoomLevel(Size mapDimensions) {
    var worldDimension = Size(1024, 1024);

    double latRad(lat) {
      var sinValue = sin(lat * pi / 180);
      var radX2 = log((1 + sinValue) / (1 - sinValue)) / 2;
      return max(min(radX2, pi), -pi) / 2;
    }

    double zoom(mapPx, worldPx, fraction) {
      return (log(mapPx / worldPx / fraction) / ln2).floorToDouble();
    }

    var ne = latLngBounds!.northeast;
    var sw = latLngBounds!.southwest;

    var latFraction = (latRad(ne.latitude) - latRad(sw.latitude)) / pi;

    var lngDiff = ne.longitude - sw.longitude;
    var lngFraction = ((lngDiff < 0) ? (lngDiff + 360) : lngDiff) / 360;

    var latZoom =
        zoom(mapDimensions.height, worldDimension.height, latFraction);
    var lngZoom = zoom(mapDimensions.width, worldDimension.width, lngFraction);

    if (latZoom < 0) return lngZoom;
    if (lngZoom < 0) return latZoom;

    return min(latZoom, lngZoom);
  }

  String? get prettifyDistance {
    var a = ultimateTotalDistance.toString();
    var l = a.length;
    if (l > 4) {
      return a.substring(0, 5);
    }
    return a;
  }

  double? ultimateTotalDistance;
  // Future<void> _getPolyline() async {
  //   List<LatLng> polylineCoordinates = [];

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     config.mapApiKey,
  //     PointLatLng(myLatLng.latitude, myLatLng.longitude),
  //     PointLatLng(targetLat, targetLng),
  //     travelMode: TravelMode.driving,
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //     print('there are ${polylineCoordinates.length} points');
  //   } else {
  //     print("Error heheh hihihi ${result.errorMessage}");
  //   }

  //   double totalDistance = 0;
  //   for (var i = 0; i < polylineCoordinates.length - 1; i++) {
  //     totalDistance += calculateDistance(
  //         polylineCoordinates[i].latitude,
  //         polylineCoordinates[i].longitude,
  //         polylineCoordinates[i + 1].latitude,
  //         polylineCoordinates[i + 1].longitude);
  //   }
  //   ultimateTotalDistance = totalDistance;
  //   print('total distance is -> $totalDistance');

  //   _addPolyLine(polylineCoordinates);
  // }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
    // notifyListeners();
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
    // notifyListeners();
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
