
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:earthquake_emergency/features/geolocation/controller.dart';
// import 'package:earthquake_emergency/product/pages/hospital_search.dart';
// import '../pages/hospital_search.dart';

class Page1 extends StatefulWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  @override
  void initState() {
    print('page 1 initialized');
    // TODO: implement initState
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    offsetAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 10))
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.forward();
    super.initState();
  }

  Animation? iconAnimation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child:
              // context.watch<PageNotifier>().fakeController
              false
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text('Hospitals near me',
                              style: Theme.of(context).textTheme.headline4)),
                    ),
        ),
        // ElevatedButton(
        //     onPressed: () async {
        //       var res = await http.get(Uri.parse('https://www.google.com'));
        //       print(res.statusCode);
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: ((context) => CustomSearchScaffold())));
        //     },
        //     child: Text('press me to go places')),
        // Points(size: size),
        // Align(
        //     alignment: Alignment.bottomCenter,
        //     child: ElevatedButton(
        //         onPressed: () async {
        //           await context.read<GeoLocatorController>().initialize();
        //         },
        //         child: Text('press me to trigger directions api '))),
        // ClipRect(
        //   child: CustomSearchScaffold(),
        //   clipBehavior: Clip.antiAlias,
        // ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => false;
}
