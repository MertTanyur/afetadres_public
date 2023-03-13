import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  HeroWidget({
    super.key,
    required this.child,
    required this.tag,
  });
  final Widget child;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Hero(
      child: child,
      tag: tag,
    );
  }
}

typedef Constructor = Widget Function(Animation<double> animation);
Future<void> pushToHeroPage<T>(BuildContext context, Constructor c) async {
  // Navigator.push(context, MaterialPageRoute(builder: ((context) => page)));
  // var route2 = MaterialPageRoute(builder: ((context) => builder()));
  var route = PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      reverseTransitionDuration: Duration(seconds: 2),
      pageBuilder: ((context, animation, secondaryAnimation) {
        print('primary animation: ${animation.value}');
        print('secondary animation: ${secondaryAnimation.value}');
        return c(animation);
      }));

  await Navigator.push(context, route);
}
