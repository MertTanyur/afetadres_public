// class PageZero extends HookConsumerWidget {
//   PageZero({super.key, required this.controller});
//   PageController controller;
//   void setVController(ScrollController vController, WidgetRef ref) {
//     if (vController.hasClients) {
//       // print('has listeners -> ${hasListeners.value}');
//       // hasListeners.value = true;
//       // hasListeners.value = true;
//       ref.read(vControllerProvider.notifier).setPageController(vController);
//     }
//   }

//   final ps = Stream.periodic(Duration(seconds: 1), (t) => t % 3).take(5);

//   // void updateMemoized(int i) {
//   //   final result = boxShadowBuilder(i);
//   //   print('result is $result');
//   //   // mShadow.addAll(result);
//   // }
//   final showImage = useState(false);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final mShadow = useMemoized(() => <BoxShadow>[]);
//     // final as = useStream(ps);
//     Size size = MediaQuery.of(context).size;
//     final double vAnimation = ref.watch(vAnimationProvider);
//     final colorScheme = Theme.of(context).colorScheme;
//     final vController = useScrollController();
//     // List<BoxShadow> boxShadowBuilder(
//     //   int i,
//     // ) {
//     //   List<BoxShadow> result = [];
//     //   double spreadRadius = 0;

//     //   for (int a = 0; a <= i % 3; a++) {
//     //     print('a $a, i $i');
//     //     result.add(BoxShadow(
//     //         color: Colors.white.withOpacity(.2 * a),
//     //         blurRadius: a.toDouble(),
//     //         spreadRadius: a.toDouble()));
//     //   }

//     //   return mShadow..addAll(result);
//     // }

//     var hasListeners = useState(false);
//     // final sP = ref.watch(sp);
//     vController.addListener(
//       () {
//         if (vController.hasClients) {
//           // _setController();
//           // print(
//           //     'max scroll extent is -> ${vController.position.maxScrollExtent}');
//           ref.read(vAnimationProvider.notifier).setValue(
//               vController.offset / vController.position.maxScrollExtent);
//         }
//       },
//     );
//     // var vListener = useValueNotifier(vAnimation);
//     Animation<double> vRealAnimation = Animation.fromValueListenable(
//       ValueNotifier<double>(vAnimation),
//       transformer: (p0) => Curves.easeInOut.transform(p0),
//     );

//     // var shadowCount = useState<int>(0);

//     // var shadowStream = useStream<int>(
//     //     Stream.periodic(Duration(microseconds: 500), (int i) {
//     //       if (shadowCount.value == 3) {
//     //         shadowCount.value = 0;
//     //       } else {
//     //         shadowCount.value++;
//     //       }
//     //       return shadowCount.value;
//     //     }),
//     //     initialData: 1);;
//     // useEffect(() {
//     //   Timer.periodic(Duration(seconds: 2), (timer) {
//     //     shadowCount.value = timer.tick % 3;
//     //     // print('shadow count is -> ${shadowCount.value}');
//     //   });
//     //   return null;
//     // });

//     // var countStream = useStream(Stream.periodic(Duration(seconds: 1), (t) {
//     //   shadowCount.value++;
//     //   print('shadowCount value is -> ${shadowCount.value}');
//     //   if (shadowCount.value > 10) {
//     //     print('bigger than 10');
//     //     print('t is $t');

//     //     return null;
//     //   }
//     //   return 1;
//     // }).take(2));
//     // final stream = useMemoized(
//     //   () => Stream<int>.periodic(const Duration(seconds: 1), (i) => i + 1)
//     //       .take(10),
//     // );
//     // final snapshot = useStream(stream, initialData: 0);
//     final geoLocator = ref.watch(geoLocatorProvider);
//     bool renderFlexibleSpace = true;
//     double renderOffset() {
//       var result = 0.0;

//       if (controller.hasClients) {
//         if (controller.page != null) {
//           result = controller.page!;
//         }
//       } else {
//         renderFlexibleSpace = true;
//       }
//       return result;
//     }

//     return NestedScrollView(
//         controller: vController,
//         physics: NeverScrollableScrollPhysics(),
//         // scrollBehavior: ScrollBehavior(),
//         // Setting floatHeaderSlivers to true is required in order to float
//         // the outer slivers over the inner scrollable.
//         floatHeaderSlivers: true,
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverOverlapAbsorber(
//               handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//               sliver: SliverAppBar(
//                 // snap: true,
//                 // floating: true,
//                 pinned: true,
//                 floating: true,
//                 // floating: true,
//                 // actions: [
//                 //   // Animate(
//                 //   //     adapter: ValueAdapter(renderOffset()),
//                 //   //     child: Icon(Icons.skip_previous)),
//                 // ],
//                 // floating: true,
//                 backgroundColor: colorScheme.background.withOpacity(0.3),
//                 // pinned: true,
//                 expandedHeight: size.height * 2 / 3 * (1 - renderOffset()),
//                 flexibleSpace: FlexibleSpaceBar(
//                     // titlePadding: EdgeInsets.only(bottom: 100),
//                     // centerTitle: false,
//                     title: Text('Afet Adres'),
//                     // stretchModes: [StretchMode.blurBackground],
//                     background: Animate(
//                         adapter: ValueAdapter(1 - renderOffset()),
//                         effects: [FadeEffect()],
//                         child: Image.asset('assets/images/afad_logo.png'))),
//                 forceElevated: innerBoxIsScrolled,
//               ),
//             ),
//             // SliverOverlapAbsorber(handle: vController)
//           ];
//         },
//         body: Builder(builder: (context) {
//           Size size = MediaQuery.of(context).size;
//           var appBarHeight = AppBar().preferredSize.height;
//           return CustomScrollView(
//             key: PageStorageKey<String>('a'),
//             slivers: [
//               SliverOverlapInjector(
//                 handle:
//                     NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.zero,
//                 sliver: SliverFixedExtentList(
//                   itemExtent: size.height,
//                   delegate: SliverChildListDelegate([
//                     PageView(
//                       physics: NeverScrollableScrollPhysics(),
//                       controller: controller,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(50 - vAnimation * 50)),
//                           child: Stack(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: colorScheme.surfaceVariant
//                                       .withOpacity(.3),
//                                 ),
//                                 child: GridView(
//                                   controller: ScrollController(),
//                                   physics: NeverScrollableScrollPhysics(),
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 2),
//                                   children: [
//                                     ImportantMenuItem(
//                                       'Yardım İste',
//                                       '',
//                                       false,
//                                       passController: (i) => print(i),
//                                       vController: vController,
//                                     ),
//                                     ImportantMenuItem(
//                                       'Kazazedelere ulaş',
//                                       '',
//                                       true,
//                                       passController: (i) => print(i),
//                                       vController: vController,
//                                     ),
//                                     MenuItem('Şehirler', ''),
//                                     MenuItem('Istatistikler', ''),
//                                     MenuItem('Linkler', ''),
//                                   ],
//                                 ),
//                               ),
//                               Positioned(
//                                 top: -30 + vAnimation * 100,
//                                 left: size.width / 2 - 50,
//                                 child: GestureDetector(
//                                   behavior: HitTestBehavior.translucent,
//                                   onTap: () {
//                                     print('on tapped');
//                                     if (!hasListeners.value) {
//                                       print('value is null');
//                                       hasListeners.value = true;
//                                     }
//                                     setVController(vController, ref);

//                                     ref
//                                         .read(vControllerProvider.notifier)
//                                         .state
//                                         ?.animateTo(
//                                             vController
//                                                 .position.maxScrollExtent,
//                                             duration: Duration(seconds: 1),
//                                             curve: Curves.easeInOut);
//                                   },
//                                   child: Padding(
//                                     padding: EdgeInsets.all(30),
//                                     child: Animate(
//                                       adapter: ValueAdapter(vAnimation),
//                                       effects: [
//                                         BoxShadowEffect(
//                                           begin: BoxShadow(
//                                               offset: Offset.zero,
//                                               blurRadius: 3,
//                                               spreadRadius: 1,
//                                               color: colorScheme.background),
//                                           end: BoxShadow(
//                                               offset: Offset.zero,
//                                               blurRadius: 0,
//                                               color: colorScheme.surface),
//                                           borderRadius: BorderRadius.vertical(
//                                               top: Radius.elliptical(
//                                                   40 * vAnimation,
//                                                   20 * vAnimation),
//                                               bottom:
//                                                   Radius.elliptical(40, 40)),
//                                         ),
//                                         FadeEffect(
//                                             delay: 300.ms,
//                                             begin: 1.0,
//                                             end: 0.0,
//                                             curve: Curves.easeInOut)
//                                       ],
//                                       child: Animate(
//                                         adapter: ValueAdapter(vAnimation),
//                                         effects: [
//                                           ScaleEffect(
//                                               begin: Offset(1.1, 1),
//                                               end: Offset(1, 1)),
//                                         ],
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               // shape: BoxShape.circle,
//                                               borderRadius:
//                                                   BorderRadius.vertical(
//                                                       top: Radius.elliptical(
//                                                           40 * vAnimation,
//                                                           20 * vAnimation),
//                                                       bottom: Radius.elliptical(
//                                                           40, 40)),
//                                               color: colorScheme.surface),
//                                           child: Padding(
//                                             padding: EdgeInsets.all(
//                                                 10 + vAnimation * 5),
//                                             child: AnimatedIcon(
//                                               progress:
//                                                   Animation.fromValueListenable(
//                                                 ValueNotifier(vAnimation),
//                                                 transformer: (p0) => Curves
//                                                     .easeInOut
//                                                     .transform(p0),
//                                               ),
//                                               icon: AnimatedIcons.list_view,
//                                               size: 20,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         PageOne(
//                           vController: vController,
//                         )
//                       ],
//                     ),
//                   ]),
//                 ),
//               )
//             ],
//           );
//         }));
//   }
// }


// class PageOne extends HookConsumerWidget {
//   PageOne({super.key, required this.vController});
//   GeoFirePoint myGeoFirePoint(double lat, double lng) {
//     return geo.point(latitude: lat, longitude: lng);
//   }

//   ScrollController vController;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final double mainAnimation = ref.watch(mainAnimationProvider);
//     final geoLocator = ref.watch(geoLocatorProvider);
//     final a = geoLocator.myPosition!;
//     final apiData = ref.watch(mapDataControllerProvider);
//     Size size = MediaQuery.of(context).size;

//     final b = myGeoFirePoint(a.latitude, a.longitude);
//     return Column(
//       children: [
//         ElevatedButton(
//             onPressed: () async {
//               // final vControllerP = ref.read(vControllerProvider);
//               // vControllerP?.animateTo(vControllerP.position.maxScrollExtent,
//               //     duration: Duration(milliseconds: 200),
//               //     curve: Curves.easeInOut);
//               await ref.read(mainControllerProvider.notifier).animateToPage(0);
//               if (vController.hasClients) {
//                 vController.animateTo(0,
//                     duration: Duration(milliseconds: 600),
//                     curve: Curves.easeInOut);
//               }
//             },
//             child: Text('go to main page')),
//         // Expanded(
//         //     child: MapSample(
//         //   model: geoLocator.myModel!,
//         // )),
//         GeoHashMap(
//           myPosition: a,
//           myGeoFirePoint: b,
//         ),
//         ElevatedButton(
//             onPressed: () async {
//               try {
//                 var res = await ref
//                     .read(mapDataControllerProvider.notifier)
//                     .fetch_reason('erzak');
//                 print(
//                     'len of state is -> ${ref.read(mapDataControllerProvider).length}');
//               } catch (e) {
//                 print(e);
//               }

//               // var a = geoLocator.myPosition!;

//               // var b = myGeoFirePoint(a.latitude, a.longitude);
//               // _firestore
//               //     .collection('locations')
//               //     .add({'name': 'random name', 'position': b.data});
//               // print('b is $b');
//             },
//             child: Text('try api data')),
//         ElevatedButton(
//             onPressed: () {
//               var a = geoLocator.myPosition!;

//               var b = myGeoFirePoint(a.latitude, a.longitude);
//               _firestore
//                   .collection('locations')
//                   .add({'name': 'random name', 'position': b.data});
//               print('b is $b');
//             },
//             child: Text('save loc')),
//         // MapSample(model: model),
//         Spacer(),
//         Text('0, , ${mainAnimation}'),
//       ],
//     );
//   }
// }