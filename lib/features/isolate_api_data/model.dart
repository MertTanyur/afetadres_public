import 'dart:math';

import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isar/isar.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
// import '../api_data/controller.dart' show tagNotifierProvider;
import '../api_data/model.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@collection
class LastFetched {
  Id? id;
  String? name;

  DateTime? snapshot;
}

@collection
class IsarMapData {
  Id get id {
    return clusterPlace?.id ??
        clusterPlace?.mapDataModel?.id ??
        Isar.autoIncrement;
  }

  late String name;
  List<double>? loc;
  String? geoHash;
  ClusterPlace? clusterPlace;
  String? channel;
  String? needs;
  @override
  String toString() {
    return "IsarMapData(name: $name, geohash: $geoHash, loc: $loc)";
  }
}

class ClusterPlaceWrapper extends ClusterPlace {
  ClusterPlaceWrapper({super.mapDataModel, super.isClosed});
  @override
  LatLng get location =>
      LatLng(mapDataModel?.lat ?? 1.0, mapDataModel?.lng ?? 0.0);
  factory ClusterPlaceWrapper.fromChild(ClusterPlace clusterPlace) {
    return ClusterPlaceWrapper(
        mapDataModel: clusterPlace.mapDataModel,
        isClosed: clusterPlace.isClosed);
  }
}

class CalculatedClusterPlace with ClusterItem {
  CalculatedClusterPlace(
      {required this.latLng,
      required this.geoHash,
      this.needs,
      this.channel,
      this.reason});
  String geoHash;
  LatLng latLng;
  String? needs;
  String? channel;
  String? reason;

  @override
  // TODO: implement geohash
  String get geohash => geoHash;

  @override
  // TODO: implement location
  LatLng get location => latLng;
}

@Embedded(ignore: {'location'})
class ClusterPlace with ClusterItem {
  ClusterPlace({
    this.mapDataModel,
    this.isClosed,
  });

  int get id {
    return mapDataModel?.id ?? 1;
  }

  MapDataModel? mapDataModel;

  // MapDataModel get mapDataModel {
  //   return MapDataModel.fromJson(mapDataModelMap);
  // }

  bool? isClosed;

  @override
  LatLng get location =>
      LatLng(mapDataModel?.lat ?? 1.0, mapDataModel?.lng ?? 0.0);
}
// import 'controller.dart';

// import 'controller.dart';

@freezed
class TopLevelResponse with _$TopLevelResponse {
  const factory TopLevelResponse({
    final List<MapDataModel>? results,
    final int? count,
  }) = _TopLevelResponse;

  factory TopLevelResponse.fromJson(Map<String, dynamic> json) =>
      _$TopLevelResponseFromJson(json);
  // factory TopLevelResponse.toJson(Map<String, Object> json) =>
  //     _$TopLevelResponseToJson(json);
}

@Embedded(ignore: {'markerMap'}, inheritance: false)
@freezed
class MapDataModel with _$MapDataModel {
  const MapDataModel._();
  const factory MapDataModel({
    final int? id,
    final List<double>? loc,
    final int? entryId,
    final int? epoch,
    final String? reason,
    final String? channel,
    final bool? isLocationVerified,
    final bool? isNeedVerified,
    final List<Map<String, dynamic>>? needs,
    final String? geoHash,
  }) = _MapDataModel;

  double? get lat => loc?[0];
  double? get lng => loc?[1];

  Map<MarkerId, Marker> get markerMap {
    Map<MarkerId, Marker> result = {};
    if (lat != null && lng != null) {
      final markerId =
          MarkerId(id?.toString() ?? (lat.toString() + lng.toString()));
      final marker = Marker(
        markerId: markerId,
        position: LatLng(lat!, lng!),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        onTap: () {
          print('do something with ${toJson()}');
        },
        infoWindow: InfoWindow(
            title: Tag.fromReason(reason!)?.label, snippet: '$lat,$lng'),
      );
      Map<MarkerId, Marker> b = {};
      b[markerId] = marker;
      return b;
    }
    return result;
  }

  factory MapDataModel.fromJson(Map<String, dynamic> json) =>
      _$MapDataModelFromJson(json);
}

// enum Tag {
//   enkaz('Enkaz', 'enkaz'),
//   giysi('Giysi', 'giysi'),
//   kurtarma('Kurtarma', 'kurtarma'),
//   barinma('Barınma', 'barinma'),
//   su('Su', 'su'),
//   erzak('Erzak', 'erzak');

//   const Tag(this.label, this.endPoint);
//   final String label;
//   final String endPoint;

//   @override
//   String toString() => label;

//   bool validTag(String reason) {
//     return reason == endPoint;
//   }

//   // void add(Ref ref) {
//   //   ref.read(tagNotifierProvider.notifier).addTag(this as M.Tag);
//   // }

//   // void remove(Ref ref) {
//   //   ref.read(tagNotifierProvider.notifier).removeTag(this as M.Tag);
//   // }

//   static Tag? fromReason(String reason) {
//     Tag result;
//     switch (reason) {
//       case 'enkaz':
//         return Tag.enkaz;
//       case 'su':
//         return Tag.su;
//       case 'kurtarma':
//         return Tag.kurtarma;
//       case 'barinma':
//         return Tag.barinma;
//       case 'erzak':
//         return Tag.erzak;
//       case 'giysi':
//         return Tag.giysi;

//       default:
//         return null;
//     }
//   }

//   static List<Tag> tagGroupFromReason(List<String> reasons) {
//     return reasons.map((e) => Tag.fromReason(e)).whereType<Tag>().toList();
//   }
// }






// var a = {channel: babala, entry_id: 550560, epoch: 1675966352, id: 14315, is_location_verified: false, is_need_verified: false, loc: [35.9683011, 36.17083179999999], reason: erzak}