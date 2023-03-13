import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'controller.dart';

// import 'controller.dart';
// part 'model.freezed.dart';
// part 'model.g.dart';

// @freezed
// class TopLevelResponse with _$TopLevelResponse {
//   const factory TopLevelResponse({
//     final List<MapDataModel>? results,
//     final int? count,
//   }) = _TopLevelResponse;

//   factory TopLevelResponse.fromJson(Map<String, dynamic> json) =>
//       _$TopLevelResponseFromJson(json);
//   // factory TopLevelResponse.toJson(Map<String, Object> json) =>
//   //     _$TopLevelResponseToJson(json);
// }

// @freezed
// class MapDataModel with _$MapDataModel {
//   const MapDataModel._();
//   const factory MapDataModel({
//     final int? id,
//     final List<double>? loc,
//     final int? entryId,
//     final int? epoch,
//     final String? reason,
//     final String? channel,
//     final bool? isLocationVerified,
//     final bool? isNeedVerified,
//     final String? geoHash,
//   }) = _MapDataModel;

//   double? get lat => loc?[0];
//   double? get lng => loc?[1];

//   Map<MarkerId, Marker> get markerMap {
//     Map<MarkerId, Marker> result = {};
//     if (lat != null && lng != null) {
//       final markerId =
//           MarkerId(id?.toString() ?? (lat.toString() + lng.toString()));
//       final marker = Marker(
//         markerId: markerId,
//         position: LatLng(lat!, lng!),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//         onTap: () {
//           print('do something with ${toJson()}');
//         },
//         infoWindow: InfoWindow(
//             title: Tag.fromReason(reason!)?.label, snippet: '$lat,$lng'),
//       );
//       Map<MarkerId, Marker> b = {};
//       b[markerId] = marker;
//       return b;
//     }
//     return result;
//   }

//   factory MapDataModel.fromJson(Map<String, dynamic> json) =>
//       _$MapDataModelFromJson(json);
// }

final scheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 105, 84, 114),
    background: Colors.black45);

enum Tag {
  enkaz(
    'Enkaz',
    'enkaz',
  ),
  giysi(
    'Giysi',
    'giysi',
  ),
  kurtarma('Kurtarma', 'kurtarma', 'assets/uposts/logo.png'),
  barinma('Barınma', 'barinma', 'assets/uposts/barinma.png'),
  su('Su', 'su'),
  genel(
    'Genel',
    'genel',
  ),
  erzak('Erzak', 'erzak', 'assets/uposts/yemek.png'),
  other('Diğer', 'diger');

  const Tag(this.label, this.endPoint, [this.assetImage]);
  final String label;
  final String endPoint;
  final String? assetImage;

  Color get tagColor {
    return Color.lerp(
        scheme.error, scheme.inversePrimary, index / values.length)!;
    // scheme.primary
    //     .withRed(((index / values.length) * 255).toInt())
    //     .withOpacity((index / values.length) / 2 + .5);
  }

  @override
  String toString() => label;

  bool validTag(String reason) {
    return reason == endPoint;
  }

  void add(WidgetRef ref) {
    print('tag adding');
    ref.read(tagNotifierProvider.notifier).addTag(this);
  }

  void remove(WidgetRef ref) {
    ref.read(tagNotifierProvider.notifier).removeTag(this);
  }

  static Tag? fromReason(String reason) {
    Tag result;
    switch (reason) {
      case 'enkaz':
        return Tag.enkaz;
      case 'su':
        return Tag.su;
      case 'kurtarma':
        return Tag.kurtarma;
      case 'barinma':
        return Tag.barinma;
      case 'erzak':
        return Tag.erzak;
      case 'giysi':
        return Tag.giysi;
      case 'genel':
        return Tag.genel;

      default:
        return Tag.other;
    }
  }

  static List<Tag> tagGroupFromReason(List<String> reasons) {
    return reasons.map((e) => Tag.fromReason(e)).whereType<Tag>().toList();
  }
}

// class ClusterPlace with ClusterItem {
//   ClusterPlace({
//     required this.mapDataModel,
//     required this.isClosed,
//   });
//   MapDataModel mapDataModel;
//   final bool isClosed;

//   @override
//   LatLng get location =>
//       LatLng(mapDataModel.lat ?? 0.0, mapDataModel.lng ?? 0.0);
// }



// var a = {channel: babala, entry_id: 550560, epoch: 1675966352, id: 14315, is_location_verified: false, is_need_verified: false, loc: [35.9683011, 36.17083179999999], reason: erzak}