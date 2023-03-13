import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:earthquake_emergency/features/geolocation/controller.dart';
import 'package:earthquake_emergency/features/isolate_api_data/controller.dart';
import 'package:earthquake_emergency/features/isolate_api_data/model.dart';
import 'package:earthquake_emergency/features/isolate_api_data/model2.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
// import 'package:medical_supplies_support/features/splash/controller.dart';
// import 'package:medical_supplies_support/product/pages/login.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../core/repository_infa/map_data_worker.dart';
import 'home_page.dart';

class WelcomePage extends StatefulHookConsumerWidget {
  const WelcomePage();

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends ConsumerState<WelcomePage>
    with SingleTickerProviderStateMixin {
  bool _splashFetchCompleted = false;
  String get redirectFromSplash {
    // final auth = FirebaseAuth.instance;
    // if (config.isTestingLogin) return '/sign_from_scratch';
    // if (auth.currentUser == null || auth.currentUser!.isAnonymous) {
    //   return '/sign_from_scratch';
    // }

    // if (!auth.currentUser!.emailVerified && auth.currentUser!.email != null) {
    //   return '/verify-email';
    // }

    return '/home_page';
  }

  late AnimationController controller;
  List<Future> futures = [];
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(reverse: true);
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final sw = Stopwatch()..start();
      futures.add(ref.read(geoLocatorProvider.notifier).initialize());
      // final isar = await Isar.open(
      //     [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema]);

      final markerController = ref.read(markerControllerProvider);
      final clusterManager = ref.read(clusterManagerControllerProvider);
      final isarInstance = await ref.read(isarInstanceProvider.future);
      final isarAsync = ref.read(asyncIsarTrackerProvider);
      final filteredIsar = await ref.read(filteredIsarProvider.future);
      futures.add(Future.delayed(Duration(milliseconds: 2000), () async {
        print('pushing!!');
        pushFromSplash(context);
      }));
      MapDataWorker api = await ref.read(mapDataWorkerProvider.future);
      await api.fetch('genel');

      // await ref.read(mapUtilControllerProvider.notifier).fetchClusterItems();
      // print(
      //     'cluster items length -> ${ref.read(mapUtilControllerProvider).clusterItems?.length}');
      await Future.wait(futures).then((value) => print(
          'total initialization time elapsed :${sw.elapsed.inMilliseconds}'));
      // context.read<PageNotifier>().setCustomController();
      // await ref.read(mapDataControllerProvider.notifier).fetch_reason();

      // print(
      //     'mapdata macontroller provider are -> ${b.map((e) => '${e.reason} ${e.reason?.length}')}');
      // print(
      //     'tags are -> ${h.map((e) => '${e.endPoint} ${e.endPoint.length}')}');
      // print('last filtered markers are -> $c');
      // print('last selected markers are -> $sm');
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var _childs = <Widget>[_ProgressText(), _Info()];
  @override
  Widget build(BuildContext context) {
    // var w = context.watch<SplashController>();
    // var r = context.read<SplashController>();
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       // Navigator.pop(context);
          //       pushFromSplash(context);
          //       // _splashFetchCompleted = true;
          //       // setState(() {});
          //     },
          //     child: Text('press me to go login page')),
          _Header(),

          // _Animation(
          //   path: 'wave_loop.json',
          // ),

          // _Animation(path: 'wave_medium.json'),

          // Stack(
          //   children: [
          //     _OpenContainerWrapper(closedBuilder: ((p0, p1) {
          //       // r.setAction(p1);
          //       return _Animation(
          //         withEffect: false,
          //       );
          //     })),
          //   ],
          // ),
          // _OpenContainerWrapper(closedBuilder: ((p0, p1) {
          //   // r.setAction(p1);
          //   return _Animation(
          //     withEffect: false,
          //   );
          // })),
          _Animation(
            withEffect: false,
          ),
          // Transform.scale(scale: 0.8, child: HugeAnimate()),
          // _OpenContainerWrapper(
          //   closedBuilder: _Animation(
          //     withEffect: false,
          //   ),
          // ),
          // SizedBox(
          //   height: 300,
          //   width: 300,
          //   child: Image.asset('assets/images/sw.png'),
          // ),
          AnimatedSwitcher(
              switchInCurve: Curves.easeInSine,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeScaleTransition(animation: animation, child: child);
              },
              duration: Duration(milliseconds: 600),
              child:
                  // w.state == SplashState.initializing
                  true ? _ProgressText() : _Info()),
          SizedBox(
            height: 50,
            child: AnimatedSwitcher(
                switchInCurve: Curves.easeInSine,
                switchOutCurve: Curves.easeOut,
                duration: Duration(milliseconds: 600),
                child:
                    //  w.state == SplashState.initializing ||
                    true ? Container() : _Buttons()),
          ),
        ],
      ),
    );
  }

  Future<dynamic> pushFromSplash(BuildContext context) {
    bool goToLoginPage = redirectFromSplash == '/sign_from_scratch';
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: ((context, animation, secondaryAnimation) {
            // return goToLoginPage ? SignFromScratch() : HomePage();
            return HomePage();
          }),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              fillColor: Theme.of(context).cardColor,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: goToLoginPage
                  ? SharedAxisTransitionType.horizontal
                  : SharedAxisTransitionType.scaled,
              child: child,
            );
          }),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  _OpenContainerWrapper({
    Key? key,
    required this.closedBuilder,
  }) : super(key: key);
  Widget Function(BuildContext, void Function()) closedBuilder;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(seconds: 2),
      closedColor: Colors.transparent,
      closedElevation: 0,
      openColor: Colors.transparent,
      openElevation: 0,
      closedBuilder: closedBuilder,
      openBuilder: ((context, action) {
        return HomePage();
      }),
    );
  }
}

class _ProgressText extends StatelessWidget {
  const _ProgressText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    var h = size.height;
    var w = size.width;
    return Opacity(
      opacity: 0.7,
      child: SizedBox(
        height: 50,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline4!.copyWith(
            // fontSize: 35,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: scheme.secondary,
                //  scheme.surfaceVariant,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            onFinished: () {
              // context.read<SplashController>().toggleState();
            },
            totalRepeatCount: 3,
            pause: Duration(milliseconds: 300),
            animatedTexts: [
              FlickerAnimatedText(
                'Yardım bildirilerini görün',
              ),
              FlickerAnimatedText(
                "Kazazedeleri takip edin ",
              ),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}

class _Animation extends StatelessWidget {
  _Animation({
    Key? key,
    this.withEffect = true,
    this.path = 'assets/animations/heartbeat_lottie_animation.json',
  }) : super(key: key);
  String? path;
  bool withEffect;
  String get _path {
    if (path != null && path!.contains('assets/')) {
      return path!;
    } else {
      return 'assets/animations/' + path!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return withEffect
        ? ColorFiltered(
            colorFilter:
                ColorFilter.mode(colorScheme.primary, BlendMode.srcATop),
            child: Lottie.asset(
              _path,
              options: LottieOptions(),
            ),
          )
        : Lottie.asset(
            _path,
            options: LottieOptions(),
          );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scheme = Theme.of(context).colorScheme;
    return ClipRect(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Opacity(
            opacity: 0.6,
            child: Hero(
              tag: 'headerTag',
              child: Text(
                'Afet \n Adres',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    shadows: [
                      BoxShadow(color: scheme.onInverseSurface, blurRadius: 20)
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Info extends StatefulWidget {
  const _Info({
    Key? key,
  }) : super(key: key);

  @override
  State<_Info> createState() => _InfoState();
}

class _InfoState extends State<_Info> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // await Future.delayed(Duration(seconds: 1));
      // context.read<SplashController>().openContainer!.call();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final auth = FirebaseAuth.instance;
    // User? user = auth.currentUser;
    // String? name = Auth
    return SizedBox(
        height: 50,
        child: Text(
          'Welcome !',
          style: Theme.of(context).textTheme.headline6,
        ));
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Agne',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Discipline is the best tool'),
            TypewriterAnimatedText('Design first, then code'),
            TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
            TypewriterAnimatedText('Do not test bugs out, design them out'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var r = context.read<SplashController>();
    return Center(
      child: ElevatedButton(
        child: Text('Let\'s begin!'),
        onPressed: () {
          // r.openContainer!.call();
        },
      ),
    );
  }
}
