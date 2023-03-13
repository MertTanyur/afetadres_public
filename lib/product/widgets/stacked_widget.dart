// import 'dart:math';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../core/utilities/page_notifier.dart';
// import '../../core/utilities/transform_utilities.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:simple_shadow/simple_shadow.dart';

// class StackedImage extends StatelessWidget {
//   const StackedImage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Mr();
//   }
// }

// class Mr extends StatelessWidget {
//   const Mr({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final watch = context.watch<PageNotifier>();
//     return IgnorePointer(
//       child: Transform.translate(
//         offset: (watch.calculateSkeletonOffset(size)),
//         child: Transform.scale(
//           scale: -watch.currentPage / 10 + 1.3,
//           child: Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: size.width,
//               child: MrMachine(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MrMachine extends StatefulWidget {
//   const MrMachine({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MrMachine> createState() => _MrMachineState();
// }

// class _MrMachineState extends State<MrMachine> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PageNotifier>(builder: ((context, value, child) {
//       double curvedRatio = value.curvedRatio();
//       return Opacity(
//         opacity:
//             !value.fakeController ? min(1 - value.curvedRatio() + 0.2, 1) : 0.2,
//         child: NormalMr(
//           ratio: !value.fakeController ? curvedRatio : 1.0,
//         ),
//       );
//     }));
//   }
// }

// class GlowingMr extends StatelessWidget {
//   const GlowingMr({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SimpleShadow(
//       opacity: 0.5, // Default: 0.5
//       color: Colors.purpleAccent.shade200, // Default: Black
//       offset: Offset(0, 0), // Default: Offset(2, 2)
//       sigma: 15, // Default: 2
//       child: Image.asset(
//         'assets/images/mr.png',

//         // height: size.height / 2,
//       ),
//     );
//   }
// }

// class NormalMr extends StatefulWidget {
//   double ratio;
//   NormalMr({Key? key, this.ratio = 0.0}) : super(key: key);

//   @override
//   State<NormalMr> createState() => _NormalMrState();
// }

// class _NormalMrState extends State<NormalMr> {
//   @override
//   Widget build(BuildContext context) {
//     return SimpleShadow(
//       opacity: 0.5, // Default: 0.5
//       color: Color.lerp(
//               Colors.grey.shade200, Colors.purple.shade400, widget.ratio) ??
//           Colors.grey.shade200, // Default: Black
//       offset: Offset(0, 0), // Default: Offset(2, 2)
//       sigma: widget.ratio * 10 + 3, // Default: 2
//       child: Opacity(
//         opacity: 0.9,
//         child: Image.asset(
//           'assets/images/mr.png',
//           // height: size.height / 2,
//         ),
//       ),
//     );
//   }
// }

// class Logo extends StatelessWidget {
//   const Logo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final watch = context.watch<PageNotifier>();
//     return Positioned(
//       right: watch.offset,
//       child: Transform.translate(
//           offset: watch.calculateOffsett / 2,
//           child: FlutterLogo(
//             size: 100,
//           )),
//     );
//   }
// }

// class InterPageSkeleton extends StatelessWidget {
//   const InterPageSkeleton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final watch = context.watch<PageNotifier>();
//     return IgnorePointer(
//       child: Transform.translate(
//         offset: (watch.calculateSkeletonOffset(size) / 3),
//         child:
//             //  Image.asset(
//             //   'assets/images/blue_last.png',
//             //   colorBlendMode: BlendMode.clear,
//             //   height: size.height / 2,
//             // ),
//             SimpleShadow(
//           opacity: 0.5, // Default: 0.5
//           color: Colors.grey.shade200, // Default: Black
//           offset: Offset(0, 0), // Default: Offset(2, 2)
//           sigma: 10, // Default: 2
//           child: Image.asset(
//             'assets/images/blue_last.png',
//             height: size.height / 2,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class InterPageSkeleton2 extends StatelessWidget {
//   const InterPageSkeleton2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final watch = context.watch<PageNotifier>();
//     return IgnorePointer(
//       child: Transform.translate(
//           offset: (watch.calculateSkeletonOffset(size) / 3),
//           child: Image.asset(
//             'assets/images/blue_outer.png',
//             height: size.height / 2,
//           )),
//     );
//   }
// }

// // class SkeletonVector extends StatelessWidget {
// //   const SkeletonVector({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     final watch = context.watch<PageNotifier>();
// //     return IgnorePointer(
// //       child: Transform.translate(
// //         offset: (watch.calculateSkeletonOffset(size) / 3),
// //         child: SvgPicture.asset('assets/vectors/blue.svg',
// //             semanticsLabel: 'skeletonn'),
// //       ),
// //     );
// //   }
// // }
