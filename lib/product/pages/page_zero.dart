import 'dart:async';
import 'dart:ui';

import 'package:earthquake_emergency/features/geolocation/controller.dart';
import 'package:earthquake_emergency/product/pages/page_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../widgets/modals.dart';

import '../../features/pageview/controller.dart';

typedef void PassController(int i);

enum Cities {
  antep('gaziantep.jpeg', LatLng(37.0660, 37.3781), 'Gaziantep'),
  adana('adana.jpeg', LatLng(36.9914, 35.3308), 'Adana'),
  hatay('hatay1_medium.png', LatLng(36.2026, 36.1604), 'Hatay\nAntakya'),
  malatya('malatya.png', LatLng(38.3554, 38.3335), 'Malatya'),
  maras('maras.jpeg', LatLng(37.5753, 36.9228), 'Kahramanmaraş');

  const Cities(this.assetName, this.latLng, this.label);
  final LatLng latLng;
  final String label;
  final String assetName;
  String get assetPath => 'assets/cities/$assetName';
  CameraPosition get cameraPosition => CameraPosition(target: latLng, zoom: 12);
}

class PageZeros extends StatefulHookConsumerWidget {
  PageZeros({super.key, required this.controller, required this.vController});
  PageController controller;
  ScrollController vController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageZerosState();
}

class _PageZerosState extends ConsumerState<PageZeros> {
  void setVController(ScrollController vController, WidgetRef ref) {
    if (vController.hasClients) {
      // print('has listeners -> ${hasListeners.value}');
      // hasListeners.value = true;
      // hasListeners.value = true;
      ref.read(vControllerProvider.notifier).setPageController(vController);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print('!!!!!!!!!!!!initstate called');

    super.initState();
  }

  List<Widget> textChilds = [Text('Harita'), Text('Ulaş')];

  @override
  Widget build(BuildContext context) {
    // final mShadow = useMemoized(() => <BoxShadow>[]);
    // final as = useStream(ps);
    Size size = MediaQuery.of(context).size;
    final double vAnimation = ref.watch(vAnimationProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final vController = widget.vController;
    bool renderFlexibleSpace = true;
    final showFlexibleBar = ref.watch(showFlexibleSpaceProvider);
    var hasListeners = useState(false);
    final mainAnimation = ref.watch(mainAnimationProvider);
    vController.addListener(
      () {
        if (vController.hasClients) {
          // _setController();
          // print(
          //     'max scroll extent is -> ${vController.position.maxScrollExtent}');
          ref.read(vAnimationProvider.notifier).setValue(
              vController.offset / vController.position.maxScrollExtent);
        }
        // if (widget.controller.hasClients) {
        //   if (widget.controller.page != null) {
        //     if (widget.controller.page == 1) {
        //       renderFlexibleSpace = false;
        //       print('dont render this space!');
        //       setState(() {});
        //     } else {
        //       renderFlexibleSpace = true;
        //       if (widget.controller.page == 0) {
        //         setState(() {});
        //       }
        //     }
        //   }
        // } else {
        //   renderFlexibleSpace = true;
        // }
      },
    );
    Animation<double> vRealAnimation = Animation.fromValueListenable(
      ValueNotifier<double>(vAnimation),
      transformer: (p0) => Curves.easeInOut.transform(p0),
    );

    final geoLocator = ref.watch(geoLocatorProvider);
    double renderOffset() {
      var result = 0.0;

      if (widget.controller.hasClients) {
        if (widget.controller.page != null) {
          result = widget.controller.page!;
          if (widget.controller.page == 1) {
            renderFlexibleSpace = false;
            print('dont render this spa');
            setState(() {});
          } else {
            renderFlexibleSpace = true;
            if (widget.controller.page == 0) {
              setState(() {});
            }
          }
        }
      } else {
        renderFlexibleSpace = true;
      }
      return result;
    }

    return NestedScrollView(
        controller: vController,
        physics: NeverScrollableScrollPhysics(),
        // scrollBehavior: ScrollBehavior(),
        // Setting floatHeaderSlivers to true is required in order to float
        // the outer slivers over the inner scrollable.
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          final ma = ref.watch(mainAnimationProvider);

          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                forceMaterialTransparency: true,
                // bottom: PreferredSize(
                //     child: Container(
                //       color: Colors.red,
                //       child: Text('abidin'),
                //     ),
                //     preferredSize: Size(100, 100)),
                // collapsedHeight: 100,
                snap: true,
                floating: true,
                pinned: true,
                // floating: false,
                // floating: true,
                // actions: [
                //   // Animate(
                //   //     adapter: ValueAdapter(renderOffset()),
                //   //     child: Icon(Icons.skip_previous)),
                // ],
                // floating: true,
                backgroundColor: colorScheme.background.withOpacity(0.2),
                // pinned: true,
                expandedHeight: showFlexibleBar ? size.height * 2 / 3 : 0,
                // * (1 - renderOffset()),
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    // titlePadding: EdgeInsets.only(bottom: 100),
                    // centerTitle: false,
                    title: mainAnimation > .5 ? textChilds[0] : textChilds[1],

                    // stretchModes: [StretchMode.blurBackground],
                    background: Opacity(
                        opacity: .8,
                        child: Image.asset(
                          'assets/images/logo3.png',
                          colorBlendMode: BlendMode.colorBurn,
                          color: colorScheme.background.withOpacity(.5),
                        ))),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
            // SliverOverlapAbsorber(handle: vController)
          ];
        },
        body: Builder(builder: (context) {
          Size size = MediaQuery.of(context).size;
          var appBarHeight = AppBar().preferredSize.height;
          return CustomScrollView(
            key: PageStorageKey<String>('a'),
            slivers: [
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: EdgeInsets.zero,
                sliver: SliverFillRemaining(
                  // itemExtent: size.height,
                  // delegate: SliverChildListDelegate([
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: widget.controller,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50 - vAnimation * 50)),
                        child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    colorScheme.surfaceVariant.withOpacity(.3),
                              ),
                              child: GridView(
                                controller: ScrollController(),
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                children: [
                                  ImportantMenuItem(
                                    'Yakınımdaki noktalar',
                                    '',
                                    false,
                                    passController: (i) => print(i),
                                    vController: vController,
                                  ),
                                  ImportantMenuItem(
                                    'Yardımlar,\n Bildiri noktaları',
                                    '',
                                    true,
                                    passController: (i) => print(i),
                                    vController: vController,
                                  ),
                                  for (Cities city in Cities.values)
                                    MenuItem(
                                      'Şehirler',
                                      '',
                                      vController: vController,
                                      city: city,
                                    ),
                                  // MenuItem('Istatistikler', ''),
                                  // MenuItem('Linkler', ''),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -30 + vAnimation * 100,
                              left: size.width / 2 - 50,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  print('on tapped');
                                  if (!hasListeners.value) {
                                    print('value is null');
                                    hasListeners.value = true;
                                  }
                                  setVController(vController, ref);

                                  ref
                                      .read(vControllerProvider.notifier)
                                      .state
                                      ?.animateTo(
                                          vController.position.maxScrollExtent,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeInOut);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Animate(
                                    adapter: ValueAdapter(vAnimation),
                                    effects: [
                                      BoxShadowEffect(
                                        begin: BoxShadow(
                                            offset: Offset.zero,
                                            blurRadius: 3,
                                            spreadRadius: 1,
                                            color: colorScheme.background),
                                        end: BoxShadow(
                                            offset: Offset.zero,
                                            blurRadius: 0,
                                            color: colorScheme.surface),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.elliptical(
                                                40 * vAnimation,
                                                20 * vAnimation),
                                            bottom: Radius.elliptical(40, 40)),
                                      ),
                                      FadeEffect(
                                          delay: 300.ms,
                                          begin: 1.0,
                                          end: 0.0,
                                          curve: Curves.easeInOut)
                                    ],
                                    child: Animate(
                                      adapter: ValueAdapter(vAnimation),
                                      effects: [
                                        ScaleEffect(
                                            begin: Offset(1.1, 1),
                                            end: Offset(1, 1)),
                                      ],
                                      child: Container(
                                        decoration: BoxDecoration(
                                            // shape: BoxShape.circle,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.elliptical(
                                                    40 * vAnimation,
                                                    20 * vAnimation),
                                                bottom:
                                                    Radius.elliptical(40, 40)),
                                            color: colorScheme.surface),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              10 + vAnimation * 5),
                                          child: AnimatedIcon(
                                            progress:
                                                Animation.fromValueListenable(
                                              ValueNotifier(vAnimation),
                                              transformer: (p0) => Curves
                                                  .easeInOut
                                                  .transform(p0),
                                            ),
                                            icon: AnimatedIcons.list_view,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      PageOneS(
                        vController: vController,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => true;
}

class MenuItem extends HookConsumerWidget {
  MenuItem(this.name, this.assetName,
      {super.key,
      required this.vController,
      this.controller,
      this.padding = true,
      this.city});
  final String name;
  final String assetName;
  final bool padding;
  final PageController? controller;
  final ScrollController vController;
  final Cities? city;

  void setCity(WidgetRef ref) {
    final cameraPos = ref.read(initialPositionProvider.notifier);
    cameraPos.set(city!.latLng);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorsScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;
    final pageViewController = ref.watch(mainControllerProvider);
    final vA = Curves.easeInOut.transform(ref.watch(vAnimationProvider));
    return InkWell(
      onTap: () async {
        setCity(ref);
        if (true) {
          print('on tap');
          // widget.passController.call(1);

          await Future.delayed(Duration(milliseconds: 300));
          ref.read(vControllerProvider.notifier).setPageController(vController);
          // widget.vController.

          await vController.animateTo(vController.position.maxScrollExtent,
              duration: Duration(milliseconds: 600), curve: Curves.easeInOut);

          //     .attach(ScrollPosition(physics: NeverScrollableScrollPhysics(),context: ScrollContext., ));
          await pageViewController?.animateToPage(1,
              duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
          // ref.read(showFlexibleSpaceProvider.notifier).toggleWithVal(false);
          // widget.vController

          // if (controller != null) {
          //   print('page controller is not null');
          //   controller?.animateToPage(1,
          //       duration: Duration(milliseconds: 300),
          //       curve: Curves.easeInOut);
          //   return;
          // } else {
          //   print('page controller is null');
          // }
          if (true) {
            print('trying to animate');
            final a = ref.read(mainControllerProvider.notifier);
            // print('page controller in river pod ${a.state?.hasClients}');
            // final vCont¬roller
            a.animateToPage(1);
            // await ref.read(mainControllerProvider.notifier).state?.animateToPage(
            //     1,
            //     duration: Duration(milliseconds: 300),
            //     curve: Curves.easeInOut);
          }
        }
        // showAlertDialog(context);
      },
      child: Padding(
        padding: padding ? const EdgeInsets.all(8.0) : EdgeInsets.all(0.5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius:
                  padding ? BorderRadius.circular(20) : BorderRadius.zero,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      padding ? BorderRadius.circular(20) : BorderRadius.zero,
                  color: colorsScheme.primary.withOpacity(.5),
                ),
                height: h / 3,
                width: w / 5,
                child: Opacity(
                  opacity: .8,
                  child: Animate(
                    effects: [
                      BlurEffect(
                        delay: 1000.ms,
                        begin: Offset(0, 0),
                        end: Offset(3, 3),
                      ),
                      ScaleEffect(begin: Offset(1, 1), end: Offset(1.2, 1.2))
                    ],
                    adapter: ValueAdapter(vA),
                    child: Image.asset(
                      city!.assetPath,
                      alignment: Alignment(vA, .5),
                      // width: w / 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Stack(
                //   // fit: StackFit.passthrough,
                //   // mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       city!.assetPath,
                //       width: w,
                //       fit: BoxFit.fitHeight,
                //     ),
                //     Center(
                //       child: Text('${city?.name}'),
                //     ),
                //   ],
                // ),
              ),
            ),
            Center(
              child: Animate(
                adapter: ValueAdapter(vA),
                effects: [
                  FadeEffect(begin: 0.0, end: 1.0),
                  TintEffect(color: colorsScheme.primary),
                  ScaleEffect()
                  // ShimmerEffect(color: colorsScheme.primary),
                  // ScaleEffect(),
                  // BlurEffect()
                ],
                child: Text(
                  city!.label,
                  style: TextStyle(
                    fontFamily: 'Genos',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImportantMenuItem extends StatefulHookConsumerWidget {
  ImportantMenuItem(this.name, this.assetName, this.right,
      {this.padding = true,
      this.controller,
      required this.passController,
      required this.vController});
  final String name;
  final String assetName;
  final bool padding;
  final bool right;
  final PageController? controller;
  final ScrollController vController;
  final PassController passController;
  @override
  ImportantMenuItemState createState() => ImportantMenuItemState();
}

class ImportantMenuItemState extends ConsumerState<ImportantMenuItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        print('timer is -> ${timer.tick}');
        _counter = timer.tick;
        if (timer.tick > 6) {
          timer.cancel();
          if (mounted) {
            setState(() {});
          }
        }
      });
    });
  }

  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    final pageViewController = ref.watch(mainControllerProvider);
    final vController = ref.read(vControllerProvider);
    final ma = ref.watch(mainAnimationProvider);
    // final c = useState(0);
    // final m = useMemoized(
    //     () => Stream.periodic(Duration(seconds: 1), (t) => t++).take(6)
    //       ..listen((event) {
    //         if (ma == 0) {
    //           print('value is $event');
    //           if (event > 4) {
    //             c.value = 1;
    //           }
    //         }
    //       }));
    // final s = useStream(m, initialData: 0);

    final double vAnimation = ref.watch(vAnimationProvider);
    final double cvAnimation = ref.watch(vAnimationProvider.notifier).curved;
    final colorsScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;
    bool setCityToMyLocation(WidgetRef ref) {
      final cameraPos = ref.read(initialPositionProvider.notifier);
      final myLocation = ref.read(geoLocatorProvider.notifier).myCameraPosition;
      if (myLocation?.target != null) {
        cameraPos.set(myLocation!.target);
        return true;
      } else {
        showPermissionDialog(context);
        return false;
      }
    }

    return Padding(
      padding: EdgeInsets.all(8.0 * vAnimation + 0.1),
      child: Animate(
        onPlay: (controller) => (vAnimation > .2 || _counter > 4)
            ? controller.reverse()
            : controller.repeat(reverse: true),
        // target: vAnimation,
        effects: [
          BoxShadowEffect(
            duration: 1000.ms,
            begin: BoxShadow(color: Colors.transparent),
            end: BoxShadow(
                color: widget.right
                    ? colorsScheme.primary.withOpacity(.6)
                    : Colors.red.withOpacity(.8),
                blurRadius: 1,
                spreadRadius: 1),
            borderRadius: widget.right
                ? BorderRadius.horizontal(
                    left: Radius.circular(
                      20 * vAnimation,
                    ),
                    right: Radius.elliptical(
                        40 - 20 * vAnimation, 40 - 20 * vAnimation))
                : BorderRadius.horizontal(
                    left: Radius.elliptical(
                        40 - 20 * vAnimation, 40 - 20 * vAnimation),
                    right: Radius.circular(
                      20 * vAnimation,
                    )),
          )
        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: widget.right
                ? BorderRadius.horizontal(
                    left: Radius.circular(
                      20 * vAnimation,
                    ),
                    right: Radius.elliptical(
                        40 - 20 * vAnimation, 40 - 20 * vAnimation))
                : BorderRadius.horizontal(
                    left: Radius.elliptical(
                        40 - 20 * vAnimation, 40 - 20 * vAnimation),
                    right: Radius.circular(
                      20 * vAnimation,
                    )),
            color: colorsScheme.primary.withOpacity(.5),
          ),
          height: h / 3,
          width: w / 5,
          child: InkWell(
            splashColor: !widget.right ? Colors.red : colorsScheme.primary,
            hoverColor: !widget.right ? Colors.red : null,
            focusColor: !widget.right ? Colors.red : null,
            highlightColor: !widget.right ? Colors.red : null,
            borderRadius: BorderRadius.circular(20),
            onTap: () async {
              bool locationServicesEnabled = false;
              if (!widget.right) {
                locationServicesEnabled = setCityToMyLocation(ref);
              } else {
                ref.read(cameraPosProvider.notifier).set(CameraPosition(
                    target: LatLng(39.925533, 32.866287), zoom: 5));
              }

              if (locationServicesEnabled || widget.right) {
                print('on tap');
                widget.passController.call(1);

                await Future.delayed(Duration(milliseconds: 300));
                ref
                    .read(vControllerProvider.notifier)
                    .setPageController(widget.vController);
                // widget.vController.

                await widget.vController.animateTo(
                    widget.vController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInOut);

                //     .attach(ScrollPosition(physics: NeverScrollableScrollPhysics(),context: ScrollContext., ));
                await pageViewController?.animateToPage(1,
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOut);
                // ref.read(showFlexibleSpaceProvider.notifier).toggleWithVal(false);
                // widget.vController

                // if (controller != null) {
                //   print('page controller is not null');
                //   controller?.animateToPage(1,
                //       duration: Duration(milliseconds: 300),
                //       curve: Curves.easeInOut);
                //   return;
                // } else {
                //   print('page controller is null');
                // }
                if (locationServicesEnabled || widget.right) {
                  print('trying to animate');
                  final a = ref.read(mainControllerProvider.notifier);
                  // print('page controller in river pod ${a.state?.hasClients}');
                  // final vCont¬roller
                  a.animateToPage(1);
                  // await ref.read(mainControllerProvider.notifier).state?.animateToPage(
                  //     1,
                  //     duration: Duration(milliseconds: 300),
                  //     curve: Curves.easeInOut);
                }
              } else {
                // showAlertDialog(context);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '${widget.name} ',
                    textAlign: TextAlign.center,
                    // style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImportantMenuItem2 extends HookConsumerWidget {
  ImportantMenuItem2(this.name, this.assetName,
      {super.key, this.padding = true});
  final String name;
  final String assetName;
  final bool padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double vAnimation = ref.watch(vAnimationProvider);
    final colorsScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;

    return Padding(
      padding: EdgeInsets.all(8.0 * vAnimation + 0.1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: padding ? BorderRadius.circular(20) : BorderRadius.zero,
          color: colorsScheme.primary.withOpacity(.5),
        ),
        height: h / 3,
        width: w / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(name),
            )
          ],
        ),
      ),
    );
  }
}
