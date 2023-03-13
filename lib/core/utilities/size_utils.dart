import 'package:flutter/material.dart';
// import 'package:skelfie/main.dart';

// extension SizeUtil on BuildContext {
//   static Size? _size;
//   Size get size => _size ?? MediaQuery.of(context).size;
// }

// mixin SizeUtils extends BuildContext {
//   double get getHalvedHeight => MediaQuery.of(this).size.height / 2;
// }
abstract class ISizeUtils extends BuildContext {}

mixin SizeUtils on ISizeUtils {
  double get getHalvedHeight => MediaQuery.of(super).size.height / 2;
}

mixin SizeUtils2 on BuildContext {
  double get getHalvedHeight => MediaQuery.of(super).size.height / 2;
}
