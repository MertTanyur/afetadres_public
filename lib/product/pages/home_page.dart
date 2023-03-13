// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:medical_supplies_support/features/geolocation/controller.dart';
// import 'package:medical_supplies_support/product/pages/hospital_search.dart';
// import 'package:medical_supplies_support/product/pages/page0.dart';
// import 'package:medical_supplies_support/product/pages/page1.dart';

// import '../../core/utilities/page_notifier.dart';
// import '../widgets/animated_stack_icon.dart';
// import '../widgets/stacked_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final _controller = PageController();
//   late PageNotifier provider;
//   @override
//   void initState() {
//     // TODO: implement initState
//     // Future.delayed(Duration.zero, () {
//     //   context.read<PageNotifier>().setController(_controller);
//     // });
//     WidgetsBinding.instance.addTimingsCallback((timings) {
//       // _controller.
//       context.read<PageNotifier>().setController(_controller);
//       // context.read<PageNotifier>().setCustomController();
//     });

//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     print('ui updated');
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Positioned(left: 50, top: 50, child: _Header()),
//           StackedImage(),
//           // AnimationTrial(),f
//           PageView(
//             physics: context.watch<PageNotifier>().fakeController
//                 ? NeverScrollableScrollPhysics()
//                 : null,
//             controller: _controller,
//             children: [
//               Page0(),
//               BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
//                   child: CustomSearchScaffold(
//                     location: context.read<GeoLocatorController>().myLocation,
//                     radius: 3000,
//                   ))
//             ],
//           ),
//           // Builder(builder: ((context) => Logo()))
//           // AnimatedStackIcon(),
//         ],
//       ),
//     );
//   }
// }


import 'package:earthquake_emergency/features/pageview/controller.dart';
import 'package:earthquake_emergency/product/pages/page_zero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  HomePage();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addTimingsCallback((timings) {});
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    final mainController = ref.watch(mainControllerProvider.notifier);

    final PageController pageController = usePageController();
    // final b = useMemoized(() => Future.delayed(Duration(milliseconds: 1), () {
    //       if (pageController.hasClients) {
    //         print('has listeners -> ');
    //         // hasListeners.value = true;
    //         mainController.setPageController(pageController);
    //       } else {
    //         print('use memoized error');
    //       }
    //     }));
    // useFuture(b);
    final double mainAnimation = ref.watch(mainAnimationProvider);
    var hasListeners = useState(false);
    Future<void> _setController() async {
      if (!hasListeners.value) {
        print('set controller has been trigerred');
        if (pageController.hasClients) {
          print('has listeners -> ${hasListeners.value}');
          hasListeners.value = true;
          // hasListeners.value = true;
          ref
              .read(mainControllerProvider.notifier)
              .setPageController(pageController);
        } else {
          await Future.delayed(
              Duration(milliseconds: 200), () => _setController());
        }
      }
    }

    useEffect(() {
      _setController();

      return null;
    });

    pageController.addListener(
      () {
        if (pageController.hasClients) {
          // _setController();
          ref
              .read(mainAnimationProvider.notifier)
              .setValue(pageController.offset / w);
        }
      },
    );
    final vController = useScrollController();
    // final controller = usePageController()..addListener(() {});
    // // final mc = ref.watch(mainControllerProvider(pageController).notifier);
    // final pageController = ref.watch(mainControllerProvider(controller));
    // final animationValue = ref.watch(mainAnimationProvider(controller));
    // double val =
    //     ref.watch(mainControllerProvider.select((value) => value.offset));
    return Scaffold(

        // appBar: AppBar(
        //   title: Text('Deprem Acil'),
        // ),
        body: Stack(
      children: [
        PageZeros(
          controller: pageController,
          vController: vController,
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () async {
                  //     curve: Curves.easeInOut);
                  await ref.read(mainControllerProvider)?.animateToPage(0,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut);

                  await Future.delayed(Duration(milliseconds: 200));
                  // final vController = ref.read(vControllerProvider);
                  if (vController.hasClients) {
                    vController.animateTo(0,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Animate(
                    adapter:
                        ValueAdapter(Curves.easeInOut.transform(mainAnimation)),
                    effects: [
                      FadeEffect(),
                      TintEffect(color: Theme.of(context).colorScheme.primary)
                    ],
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      progress: Animation.fromValueListenable(
                          ValueNotifier(mainAnimation)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));

    //  PageView(

    //     physics: NeverScrollableScrollPhysics(),
    //     controller: pageController,
    //     children: [

    //   PageOne(),
    // ]));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
 // IgnorePointer(
        //   ignoring: true,
        //   child: Align(
        //       alignment: Alignment.topCenter,
        //       child: Animate(
        //         effects: [
        //           // SlideEffect(begin: Offset(0.5, 0), end: Offset(0, 0)),
        //           FadeEffect(begin: .3, end: .5),
        //           BlurEffect(),
        //           ScaleEffect(begin: Offset(1.2, 1.0), end: Offset(1.5, 1.5)),
        //           TintEffect(color: Colors.red)
        //         ],
        //         child: HugeAnimate(),
        //         adapter: ValueAdapter(mainAnimation),
        //       )),
        // ),