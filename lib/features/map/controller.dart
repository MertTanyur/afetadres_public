// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:provider/provider.dart';

// typedef Action = void Function();

// class MapController extends ChangeNotifier {
//   String? mapStyle;

//   Future<void> loadMapStyle() async {
//     mapStyle = await rootBundle.loadString('assets/map_style.txt');
//   }

//   void Function()? openContainer;

//   void setAction(void Function() action) {
//     openContainer = action;
//   }

//   Map<int, Action> actionsMap = {};
//   void updateActionsMap(Action a, idx) {
//     actionsMap[idx] = a;
//   }

//   int? opening;
//   bool inProgress = false;

//   void goToMap(int i) {
//     opening = i;
//     inProgress = true;
//     actionsMap[i]!.call();
//   }

//   void resetAimAnimation() {
//     opening = null;
//     inProgress = false;
//   }
// }
