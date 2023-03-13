import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'page_notifier.dart';

extension CurvedNotifier on PageNotifier {
  static var myStreamController = StreamController<double>();

  double maxExtent() {
    var result = 0.0;
    if (pageController != null) {
      if (pageController!.hasClients) {
        return pageController!.position.maxScrollExtent;
      }
    }
    return result;
  }

  double minExtent() {
    var result = 0.0;
    if (pageController != null) {
      if (pageController!.hasClients) {
        return pageController!.position.minScrollExtent;
      }
    }
    return result;
  }

  double normalise() {
    if (fakeController && fakeAnimation != null) {
      return fakeAnimation!.value;
    } else {
      return _normalise();
    }
  }

  double _normalise() {
    var result = 0.0;
    if (pageController != null) {
      if (pageController!.hasClients) {
        double max = pageController!.position.maxScrollExtent;

        double ratio = offset.abs() / max;

        return min(ratio, 1.0);
      }
    }
    if (result != 1.0) {
      showMaps = false;

      // notifyListeners();
    } else {
      print('triggering timer');
      Future.delayed(Duration(seconds: 2), () {
        showMaps = true;
        print('show maps is true');
        // notifyListeners();
      });
    }
    return result;
  }

  double parseVerticalGetRatio(int division,
      {int? maxLattice,
      specialConfig = false,
      double? numerator,
      double? denomitor,
      withHeight = true,
      bool useCurve = false}) {
    late double result;
    late double ratio;
    if (useCurve) {
      ratio = curvedRatio(customCurve: Curves.slowMiddle);
    } else {
      ratio = normalise();
    }
    if (specialConfig && numerator != null && denomitor != null) {
      result = ratio * numerator / denomitor;
    } else {
      result = ratio * division / (maxLattice ?? defaultMaxLattice);
    }

    return result;
  }

  double curvedRatio(
      {Curve customCurve = Curves.easeInOut, double? cutThreshhold}) {
    late double normalised;
    if (cutThreshhold != null) {
      if (normalise() < cutThreshhold) {
        return 0.0;
      }
      normalised =
          (normalise() - cutThreshhold) * (1 / (1 - cutThreshhold / 1));
      // print('normalised is -> $normalised');
    } else {
      normalised = normalise();
    }
    double result = 0.0;
    if (normalised == 0) {
      result = normalised;
    } else {
      result = customCurve.transform(normalised);
    }

    return result;
  }

  double cuttedCurvedRatio(double cut) {
    if (normalise() < cut) {
      return 0.0;
    }
    return curvedRatio();
  }

  double extentAfter() {
    var result = 0.0;
    if (pageController != null) {
      if (pageController!.hasClients) {
        return pageController!.position.extentAfter;
      }
    }
    return result;
  }

  double some() {
    var result = 0.0;
    if (pageController != null) {
      if (pageController!.hasClients) {
        return pageController!.position.pixels;
      }
    }
    return result;
  }

  double curvedOffset(double start, double end) {
    return lerpDouble(start, end, curvedRatio()) ??
        curvedRatio() * (start + end) / 2;
  }

  // double testingOffset(double start, double end) {
  //   return lerpDouble(start, end, normalise()) ??
  //       curvedRatio() * (start + end) / 2;
  // }

  // double delayedCurvedOffset2(double start, double end) {
  //   return lerpDouble(start, end, curvedRatio()) ??
  //       curvedRatio() * (start + end) / 2;
  // }

  // static double _lastDCL = 0.0;
  // double delayedCurvedOffset(double start, double end,
  //     [Duration duration = const Duration(milliseconds: 200)]) {
  //   Future.delayed(duration, () {
  //     _lastDCL = curvedOffset(start, end);
  //   });
  //   print('last dcl is -> ${_lastDCL}');
  //   return _lastDCL;
  // }
}
