import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:earthquake_emergency/features/geolocation/controller.dart';
// import 'package:earthquake_emergency/features/map/controller.dart';

class Page0 extends StatelessWidget {
  const Page0({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          // blendMode: BlendMode.saturation,
          child: Opacity(
            opacity: 0.5,
            child: FractionallySizedBox(
              widthFactor: .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(''),
                  Card(
                    child: ListTile(
                      title: Text('My coordinates:'),
                      // subtitle: Text(
                      //   "${context.read<GeoLocatorController>().myModel?.myPosition?.toString()}",
                      // ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Saved Hospitals:'),
                      subtitle: Text('Under construction'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('My appointments'),
                      subtitle: Text(
                        "Under construction",
                      ),
                    ),
                  ),
                  // MapSample(),
                  Opacity(
                    opacity: 0.4,
                    child: ElevatedButton(
                        onPressed: () {
                          // context.read<PageNotifier>().animateTo(1);
                        },
                        child: Text('page0')),
                  ),
                  // Opacity(
                  //   opacity: 0.4,
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text('turn back')),
                  // ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
