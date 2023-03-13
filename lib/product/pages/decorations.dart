// // Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// // for details. All rights reserved. Use of this source code is governed by a
// // BSD-style license that can be found in the LICENSE file.

// import 'package:flutter/material.dart';
// // import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:lottie/lottie.dart';

// // HeaderBuilder headerImage(String assetName) {
// //   return (context, constraints, _) {
// //     Size size = MediaQuery.of(context).size;
// //     double h = size.height;
// //     return Padding(
// //         padding: const EdgeInsets.all(20),
// //         child: Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Transform.translate(
// //                 offset: Offset(0, h / 20),
// //                 child: Lottie.asset('assets/animations/splash2.json')),
// //             Transform.translate(
// //               offset: Offset(0, -h / 25),
// //               child: Hero(
// //                 tag: 'headerTag',
// //                 child: Text(
// //                   'Radmatic',
// //                   textAlign: TextAlign.start,
// //                   style: Theme.of(context).textTheme.headline3!.copyWith(
// //                     shadows: [
// //                       BoxShadow(
// //                           color: Theme.of(context).colorScheme.onInverseSurface,
// //                           blurRadius: 50)
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             )
//           ],
//         )
//         // Image.asset(assetName),
//         );
//   };
// }

// HeaderBuilder headerIcon(IconData icon) {
//   return (context, constraints, shrinkOffset) {
//     return Padding(
//       padding: const EdgeInsets.all(20).copyWith(top: 40),
//       child: Icon(
//         icon,
//         color: Colors.blue,
//         size: constraints.maxWidth / 4 * (1 - shrinkOffset),
//       ),
//     );
//   };
// }

// SideBuilder sideImage(String assetName) {
//   return (context, constraints) {
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.all(constraints.maxWidth / 4),
//         child: Image.asset(assetName),
//       ),
//     );
//   };
// }

// SideBuilder sideIcon(IconData icon) {
//   return (context, constraints) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Icon(
//         icon,
//         color: Colors.blue,
//         size: constraints.maxWidth / 3,
//       ),
//     );
//   };
// }
