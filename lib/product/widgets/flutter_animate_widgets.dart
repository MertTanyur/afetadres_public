import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HugeAnimate extends StatelessWidget {
  const HugeAnimate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Shimmer.fromColors(
          period: Duration(seconds: 4),
          baseColor: Colors.transparent,
          highlightColor: colorScheme.onSurface,
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  colorScheme.onBackground.withOpacity(0.3),
                  colorScheme.surfaceTint.withOpacity(0.1),
                ]),
                // color:
              ),
              child: Animate(
                effects: [
                  // FadeEffect(
                  //     curve: Curves.easeInOut, duration: 700.ms, begin: 1, end: .8),
                  ScaleEffect(
                      curve: Curves.easeInOut,
                      begin: Offset(1, 1),
                      end: Offset(1.05, 1.05),
                      duration: 700.ms),
                  BlurEffect(
                      duration: 700.ms, begin: Offset(1, 1), end: Offset(5, 5))
                ],
                onPlay: (controller) => controller.repeat(reverse: true),
                child: Stack(
                  children: [
                    Animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                      effects: [
                        TintEffect(
                          duration: 500.ms,
                          color: colorScheme.inverseSurface,
                        )
                      ],
                      child: Opacity(
                        opacity: 0.1,
                        child: _Animation(
                          path: 'wave_loop.json',
                        ),
                      ),
                    ),
                    SimpleShadow(
                      offset: Offset(0, 0),
                      sigma: 0.8,
                      color: Colors.black.withOpacity(0.8),
                      child: ClipRect(
                        child: BackdropFilter(
                          // blendMode: BlendMode.multiply,
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: SizedBox(
                              // color: Colors.white.withOpacity(0.1),
                              height: 300,
                              width: double.infinity,
                              child: SvgPicture.asset(
                                'assets/vectors/sw2.svg',
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //     left: 10,
        //     top: 10,
        //     child: Image.asset(
        //       'assets/images/afad_logo.png',
        //       color: Colors.black.withOpacity(0.6),
        //       height: 50,
        //       width: 50,
        //     )),
      ],
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

class _Animation extends StatelessWidget {
  _Animation({
    Key? key,
    this.withEffect = false,
    this.path = 'assets/animations/heartbeat_lottie_animation.json',
  }) : super(key: key);
  String path;
  bool withEffect;
  String get _path {
    if (path.contains('assets/')) {
      return path;
    } else {
      return 'assets/animations/' + path;
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
