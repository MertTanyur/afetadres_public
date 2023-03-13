import 'package:flutter/material.dart' show WidgetsFlutterBinding;
// import 'firebase_init.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeFirebase();
  // await initHive();
}

Future<void> keepInMemory() async {}
