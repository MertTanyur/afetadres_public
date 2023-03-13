import 'package:flutter/services.dart';

Future<String> loadMapStyle() async {
  var result = await rootBundle.loadString('assets/map_style.txt');
  return result;
}
