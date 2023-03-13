import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../core/utilities/page_notifier.dart';
// import '../../core/utilities/transform_utilities.dart';
// import '../../features/geolocation/controller.dart';

class AnimatedStackIcon extends StatefulWidget {
  const AnimatedStackIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedStackIcon> createState() => _AnimatedStackIconState();
}

class _AnimatedStackIconState extends State<AnimatedStackIcon> {
  Animation<double> animation = AlwaysStoppedAnimation(0.0);
  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   animation =
    //       AlwaysStoppedAnimation(context.read<PageNotifier>().normalise());
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 80,
      child: InnerAnimatedIcon(),
    );
  }
}

class InnerAnimatedIcon extends StatelessWidget {
  const InnerAnimatedIcon({
    Key? key,
  }) : super(key: key);

  // final Animation<double> na;

  @override
  Widget build(BuildContext context) {
    // var na = context.watch<PageNotifier>().normaliseAnimation();
    return Container();
    // return AnimatedBuilder(
    //   animation: ,
    //   builder: ((context, child) {
    //     return GestureDetector(
    //       onTap: () async {
    //         print('tapped');

    //         print('external area is tapped from body');
    //         // FocusManager.instance.primaryFocus?.unfocus();
    //         // context.read<GeoLocatorController>().unfocusField();
    //         // context.read<GeoLocatorController>().resetFieldTextController();
    //         await Future.delayed(Duration(milliseconds: 100));
    //         // await context.read<PageNotifier>().disableFakeController();

    //         // context.read<PageNotifier>().animateTo(0);
    //       },
    //       child: Transform.scale(
    //         scale: 1,
    //         // scale: 1 + na.value / 5,
    //         child: Opacity(
    //           opacity: 1,
    //           // opacity: na.value,
    //           child: AnimatedIcon(
    //             icon: AnimatedIcons.menu_arrow,
    //             progress:1,
    //             // AlwaysStoppedAnimation<double>(
    //             //     context.watch<PageNotifier>().normalise()),
    //           ),
    //         ),
    //       ),
    //     );
    //   }),
    // );
  }
}
