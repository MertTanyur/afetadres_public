import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'transform_utilities.dart';

class PageNotifier extends ChangeNotifier {
  AnimationController? fakeAnimationController;
  Animation<double>? fakeAnimation;

  void setFakeAnimationsAndControllers(
      AnimationController controller, Animation<double> animation) {
    fakeAnimation = animation;
    fakeAnimationController = controller;
    notifyListeners();
  }

  bool stillDontShow = false;

  bool fakeController = false;

  double fakeAnimationValue() {
    if (fakeAnimation != null) {
      return fakeAnimation!.value;
    } else {
      return 1.0;
    }
  }

  PageController get fakePageController => PageController(initialPage: 1);
  Future<void> enableFakeController() async {
    disableMapVisiblity();
    await Future.delayed(Duration(milliseconds: 300), () {});
    // notifyListeners();
    // fakeAnimationController
    //   ?..addListener(() {
    //     notifyListeners();
    //   });
    // fakeAnimationController?.forward(from: 0.3);
    fakeAnimationController?.clearListeners();
    fakeController = true;

    await Future.delayed(Duration(milliseconds: 500), () {});

    notifyListeners();
  }

  Future<void> disableFakeController() async {
    fakeAnimationController?.reverse();
    await Future.delayed(Duration(milliseconds: 500), () {});
    showMaps = true;
    fakeController = false;
  }

  // void toggleFakeController() {
  //   if (!fakeController) {
  //     enableFakeController();
  //     pageController?.animateToPage(0,
  //         duration: Duration(seconds: 1), curve: Curves.easeIn);
  //   }
  // }

  void toggleDontShow([bool? val]) {
    if (val != null) {
      stillDontShow = val;
      notifyListeners();
      return;
    }
    stillDontShow = !stillDontShow;
    notifyListeners();
  }

  Future<void> dontShowWithTime() async {
    await Future.delayed(Duration(milliseconds: 600));
    toggleDontShow();
  }

  Animation<double> cAnimation = AlwaysStoppedAnimation<double>(0.0);
  void setCustomController() {
    cAnimation = AlwaysStoppedAnimation(normalise());
    notifyListeners();
  }

  Future<void> lightAnimation() async {
    pageController!.animateTo(pageController!.offset - 50,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  // void getController(){
  //   pageController.
  // }
  Animation<double> normaliseAnimation() {
    return AlwaysStoppedAnimation(normalise());
  }

  int defaultMinLattice = 4;
  int defaultMaxLattice = 12;
  bool showMaps = false;
  void setLattice({int? min, int? max}) {
    defaultMinLattice = min ?? defaultMinLattice;
    defaultMaxLattice = max ?? defaultMaxLattice;
    notifyListeners();
  }

  bool hasFuture = false;

  Future<void> enableMapVisibility() async {
    if (!showMaps) {
      if (!hasFuture) {
        // print('enabling visibility....');
        await Future.delayed(Duration(milliseconds: 300));
        // print('1 seconds passed');
        showMaps = true;
        notifyListeners();
      }

      hasFuture = true;
    }
  }

  void disableMapVisiblity() {
    showMaps = false;
    hasFuture = false;
    // print('visibility disabled');
    notifyListeners();
  }

  PageController? pageController;
  double get currentPage => pageController?.page ?? 0.0;
  double get offset => pageController?.offset ?? 0;
  Offset get calculateOffsett => Offset(offset, 0);
  Offset calculateSkeletonOffset(Size size) {
    final x = size.width * 6.8 / 10;
    return Offset(x, 0) - calculateOffsett * 3 / 5;
  }

  PageNotifier() {
    print('page notifier initialized');
  }
  // late StreamController<double> streamController;
  // late Stream stream;
  // Stream<double> get stream async* {
  //   streamController.stream.listen((event) async* {
  //     print(event);
  //     yield event;
  //   });
  // }
  // void handleData(double val, EventSink<double> eventSink) {
  //   Future.delayed(Duration(seconds: 1), () {
  //     eventSink.add(val);
  //   });
  // }

  // Stream<double> delayedStream() {
  //   var t =
  //       StreamTransformer<double, double>.fromHandlers(handleData: handleData);
  //   return stream.transform(t);
  // }
  // Stream<T> StreamDelayer<T>(Stream<T> inputStream, Duration delay) async* {
  //   await for (final val in inputStream) {
  //     await Future.delayed(delay);
  //     notifyListeners();
  //     print('val is yielded $val');
  //     yield val;
  //   }
  // }

  // late StreamController<double> streamController;

  // Stream<double>  stream = streamController.stream;
  // double get delayedOffset => toComplete.isEmpty ? 0.0 : toComplete.last;
  // List<double> toComplete = [];
  // int changed = 0;
  // int addToCompleteCalled = 0;
  // void addToComplete(double val) {
  //   addToCompleteCalled++;
  //   Future.delayed(Duration(milliseconds: 300)).then((value) {
  //     if (toComplete.length < 100) {
  //       toComplete.add(val);
  //     } else {
  //       List<double> newList = [];
  //       for (var i = 1; i < 100; i++) {
  //         newList.add(toComplete[i]);
  //       }
  //       newList.add(val);
  //       toComplete = newList;
  //       changed++;
  //     }
  //   });
  //   // print('adding $val');
  // }

  void setController(PageController controller) {
    // streamController = StreamController<double>.broadcast()
    //   ..stream.listen((event) {
    //     print('event is $event');
    //   });
    // Stream<double> stream = streamController.stream;
    // delayedStream = StreamDelayer<double>(stream, Duration(seconds: 1));
    // ..listen((event) {
    //   print('stream event is $event');
    // });

    pageController = controller
      ..addListener(() {
        // Future.delayed(Duration(seconds: 1), (() {
        // streamController.add(offset);
        // }));
        // addt
        // addToComplete(controller.offset);
        // if(pageController.page )
        if (pageController != null &&
            pageController!.hasClients &&
            pageController!.page == 1) {
          // print('page is 1');
          if (!showMaps) {
            enableMapVisibility();
          }
        } else {
          disableMapVisiblity();
        }
        notifyListeners();
        // print(
        //     'offset is -> ${pageController!.position.activity!.velocity.abs()}');
      });

    notifyListeners();
  }

  void animateTo(int i) {
    if (pageController != null) {
      pageController!.animateToPage(i,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      notifyListeners();
    }
  }
}



// mr machine
// height 11
// width 28
// mid point 9


