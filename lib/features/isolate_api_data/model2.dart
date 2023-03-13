import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
part 'model2.g.dart';
part 'model2.freezed.dart';

@freezed
class TopLevelResponse2 with _$TopLevelResponse2 {
  const factory TopLevelResponse2({
    final List<MapDataModel2>? results,
    final int? count,
  }) = _TopLevelResponse2;

  factory TopLevelResponse2.fromJson(Map<String, dynamic> json) =>
      _$TopLevelResponse2FromJson(json);
  // factory TopLevelResponse.toJson(Map<String, Object> json) =>
  //     _$TopLevelResponseToJson(json);
}

@collection
class IsarMapData2 {
  ClusterPlace2? clusterPlace;
  Id? id2;
  int? id;
  String? name;

  IsarMapData2({this.clusterPlace, this.id, this.name});

  IsarMapData2.fromJson(Map<String, dynamic> json) {
    clusterPlace = json['clusterPlace'] != null
        ? new ClusterPlace2.fromJson(json['clusterPlace'])
        : null;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clusterPlace != null) {
      data['clusterPlace'] = this.clusterPlace!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

@embedded
class ClusterPlace2 {
  String? geohash;
  int? id;
  bool? isClosed;
  MapDataModel2? mapDataModel;

  ClusterPlace2({this.geohash, this.id, this.isClosed, this.mapDataModel});

  ClusterPlace2.fromJson(Map<String, dynamic> json) {
    geohash = json['geohash'];
    id = json['id'];
    isClosed = json['isClosed'];
    mapDataModel = json['mapDataModel'] != null
        ? new MapDataModel2.fromJson(json['mapDataModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geohash'] = this.geohash;
    data['id'] = this.id;
    data['isClosed'] = this.isClosed;
    if (this.mapDataModel != null) {
      data['mapDataModel'] = this.mapDataModel!.toJson();
    }
    return data;
  }
}

@embedded
class MapDataModel2 {
  double? lat;
  double? lng;
  String? reason;
  MapDataModel2({this.lat, this.lng, this.reason});

  MapDataModel2.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    reason = json.containsKey('reason') ? json['reason'] : 'genel';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
