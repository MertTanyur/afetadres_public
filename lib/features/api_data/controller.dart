import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import 'model.dart';
import '../isolate_api_data/model.dart';
part 'controller.g.dart';

// final tagProvider  = StateNotifierProvider<List<String>>((ref) {

// });
// enum Tag {
//   enkaz('Enkaz', 'enkaz'),
//   giysi('Giysi', 'giysi'),
//   kurtarma('Kurtarma', 'kurtarma'),
//   barinma('Barınma', 'barinma'),
//   su('Su', 'su');

//   const Tag(this.label, this.endPoint);
//   final String label;
//   final String endPoint;

//   @override
//   String toString() => label;

//   bool validTag(String reason) {
//     return reason == endPoint;
//   }

//   void add(Ref ref) {
//     ref.read(tagNotifierProvider.notifier).addTag(this);
//   }

//   void remove(Ref ref) {
//     ref.read(tagNotifierProvider.notifier).removeTag(this);
//   }

//   static fromReason(String reason) {
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
//       default:
//         return Tag.giysi;
//     }
//   }
// }

class TagNotifier extends StateNotifier<List<Tag>> {
  TagNotifier() : super([]);
  void addTag(Tag tag) {
    if (!tagIncluded(tag: tag)) {
      print('adding tag to the notifier');

      state = [...state, tag];
    } else {
      print('already exists');
    }
  }

  void removeTag(Tag tag) {
    print('removing $tag');
    state = state.where((element) => element != tag).toList();
  }

  bool tagIncluded({Tag? tag, String? reason}) {
    Tag? tag;
    if (reason != null) {
      tag = Tag.fromReason(reason);
    } else {
      tag = tag;
    }
    return state.any((element) => tag?.label == element.label);
  }

  // bool reasonList(List<String> reasonList){

  // }

  void toggle(Tag tag) {
    if (tagIncluded(tag: tag)) {
      removeTag(tag);
    } else {
      addTag(tag);
    }
  }
}

//  final id = MarkerId(lat.toString() + lng.toString());
// final filteredMarkers = Provider<List<MapDataModel>>((ref) {
//   final filter = ref.watch(tagNotifierProvider);
//   final mapData = ref.watch(mapDataControllerProvider);
//   List<MapDataModel> result = [];
//   for (var i in filter) {
//     for (var x in mapData) {
//       if (i.endPoint == x.reason) {
//         // print('i endpoint is -> ${i.endPoint}, x reason is -> ${x.reason}');
//         result.add(x);
//       }
//     }
//   }
//   return result;
// });

@riverpod
Map<MarkerId, Marker> selectedMarkers(SelectedMarkersRef ref) {
  var result = <MarkerId, Marker>{};
  final tagss = ref.watch(tagNotifierProvider);
  // tagss.forEach((element) {
  //   print('printing tags');
  //   print(element.label);
  // });
  final tags = ref.watch(tagNotifierProvider.notifier);
  // ref.watch(mapDataControllerProvider).forEach((element) {
  //   print('data element reason is ->');
  //   print(element.reason);
  // });
  ref
      .watch(mapDataControllerProvider)
      .where((element) {
        var br = tagss.any((e) {
          var br2 = e.endPoint == element.reason;
          print('${e.endPoint}, ${element.reason} adding to state');
          return br2;
        });

        return br;
      })
      .map((e) => e.markerMap)
      .forEach((element) {
        result.addAll(element);
      });
  return result;
}

final tagNotifierProvider =
    StateNotifierProvider<TagNotifier, List<Tag>>((ref) => TagNotifier());

final mapDataControllerProvider =
    StateNotifierProvider<MapDataNotifier, List<MapDataModel>>(
        (ref) => MapDataNotifier());

class MapDataNotifier extends StateNotifier<List<MapDataModel>> {
  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://apigo.afetharita.com/feeds/areas',
    queryParameters: {
      'ne_lat': '40.18726672309203',
      'ne_lng': '38.67187500000001',
      'sv_lat': '34.32529192442733',
      'sv_lng': '31.311035156250004',
      'time_stamp': 'undefined',
    },
  ));

  MapDataNotifier() : super([]);
  // List<MapDataModel> build() => [];
  void addMapData(MapDataModel mapData) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = [...state, mapData];
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }

  Future<void> fetch_reason([String reason = 'enkaz']) async {
    dio.options.queryParameters['reason'] = reason;
    print('34');
    print('reason is ${dio.options.queryParameters}');
    Response result = await dio.get('/');
    var a = TopLevelResponse.fromJson(result.data);
    // print(a);
    for (var i in a.results!.toList()) {
      addMapData(i);
    }
    print('map data fetched');
    print('total count is -> ${state.length}\n');
  }

  //  void removeMapData(MapDataModel mapData) {
  //   // Again, our state is immutable. So we're making a new list instead of
  //   // changing the existing list.
  //   state = [
  //     for (final todo in state)
  //       if (todo.id != todoId) todo,
  //   ];
  // }
}
