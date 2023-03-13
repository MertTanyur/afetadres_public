import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:earthquake_emergency/product/pages/splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/init/initialize.dart';
import 'core/constants/color_schemes.dart';
// import 'features/map/controller.dart';
import 'product/pages/home_page.dart';

// import 'features/geolocation/controller.dart';

Future<void> main() async {
  await initialize();
  runApp(
    ProviderScope(
      child: MyApp(
        key: ValueKey('a'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earthquake Emergency',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 105, 84, 114),
            background: Colors.black45),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme
          // ColorScheme.fromSeed(
          //     seedColor: const Color.fromARGB(255, 105, 84, 114),

          //     surface: Colors.black,

          //     background: Colors.black

          //     )

          ),
      routes: {
        '/': ((context) => WelcomePage()),
        '/home_page': ((context) => HomePage()),
        // ...loginRoutes
      },
      initialRoute: '/',
    );
  }
}



// class AnimationTrial extends StatefulWidget {
//   const AnimationTrial({super.key});

//   @override
//   State<AnimationTrial> createState() => _AnimationTrialState();
// }

// class _AnimationTrialState extends State<AnimationTrial>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;
//   @override
//   void initState() {
//     controller = AnimationController(vsync: this);
//     animation = Tween<double>(begin: 0, end: 100).animate(controller);
//     // TODO: implement initState
//     super.initState();
//   }

//   String valueFetcher(PageNotifier value) {
//     return value.offset.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PageNotifier>(builder: ((context, value, child) {
//       // Curves.ease.t
//       return Padding(
//         padding: const EdgeInsets.all(100.0),
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               children: [
//                 Text('normalised Ratio is -> ${value.normalise()}'),
//                 Text('is normalised 1? ${value.normalise() == 1} '),
//                 Text('max is -> ${value.maxExtent()}'),
//                 // some comment
//                 Text('min  qis -> ${value.minExtent()}'),
//                 Text('some  is -> ${value.some()}'),
//                 Text('width is -> ${MediaQuery.of(context).size.width}'),
//                 Text('Curved Ratio is -> ${value.curvedRatio()}'),
//                 Text('extent after  is -> ${value.extentAfter()}'),
//                 Text('value is -> ${valueFetcher(value)}'),
//               ],
//             )),
//       );
//     }));
//   }
// }

// class _Header extends StatelessWidget {
//   const _Header({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var scheme = Theme.of(context).colorScheme;
//     return ClipRect(
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//           child: Opacity(
//             opacity: 0.9,
//             child: Text(
//               'RadMatic',
//               style: Theme.of(context).textTheme.headline1!.copyWith(shadows: [
//                 BoxShadow(color: scheme.onInverseSurface, blurRadius: 20)
//               ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
