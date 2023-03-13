import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'controller.g.dart';

@riverpod
class MainController extends _$MainController {
  @override
  PageController? build() => null;

  void setPageController(PageController val) {
    state = val
      ..addListener(() {
        if (state?.page != null) {
          if (state!.page! > 0.4) {
            final vController = ref.read(vControllerProvider);
            if (vController != null &&
                vController.hasClients &&
                vController.offset / vController.position.maxScrollExtent >
                    0.1) {
              vController.animateTo(0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            }
          }
        }
      });
    print('pagecontroller has ben setted with: ${state?.hasClients} clients');
    print('pageviewcontroller has ${state?.keepPage}');
  }

  Future<void> animateToPage(int i) async {
    print('state inside riverpod is $state');
    await state?.animateToPage(i,
        duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
  }
}

@riverpod
class MainAnimation extends _$MainAnimation {
  @override
  double build() => 0.0;

  void setValue(double val) {
    state = val;
  }
}

@riverpod
class VController extends _$VController {
  @override
  ScrollController? build() => null;

  void setPageController(ScrollController val) {
    print('vController has been setted !!!!!');
    state = val;
    // ..addListener(() {
    //   print(
    //       'pagecontroller offset -> ${state?.offset}\nmax: ${state?.position.maxScrollExtent}');
    // });
    print('pagecontroller has ben setted');
  }
}

// StreamProvider<int> sp = StreamProvider<int>((ref) async* {
//   int count = 0;
//   Timer.periodic(Duration(seconds: 1), (t) {
//     print('ticker is -> $t');
//     count++;
//     if (t.tick == 3) {
//       t.cancel();
//     }
//   });
//   yield count;

// });

final showFlexibleSpaceProvider =
    StateNotifierProvider<ShowFlexibleBarNotifier, bool>(
        (ref) => ShowFlexibleBarNotifier());

class ShowFlexibleBarNotifier extends StateNotifier<bool> {
  ShowFlexibleBarNotifier() : super(true);
  void toggleWithVal(bool val) {
    state = val;
  }
}

@riverpod
class VAnimation extends _$VAnimation {
  @override
  double build() => 0.0;

  void setValue(double val) {
    state = val;
  }

  double get curved => Curves.easeInOut.transform(state);
}




// final Provider = StreamProvider<double>((ref) async* {
//   double a = ref.watch(vAnimationProvider.select((value) => null));
//   yield 2;
// });
// @riverpod
// double mainAnimation(MainAnimationRef ref, double val) {
//   return val;
// }
// @riverpod
// class MainAnimation extends _$MainAnimation {
//   @override
//   double? build() => 0.0;

//   void setPageController(PageController val) {
//     state = val;
//   }
// }

// @riverpod
// double mainAnimation(MainAnimationRef ref, MainControllerProvider provider) {
//   return ref.watch(provider.select((value) => value.offset));
// }

// @riverpod
// PageController ma

// final pageState = StateNotifierProvider<PageController>((ref, ) => usePageController());
// final myScrollControllerProvider =
//     ChangeNotifierProvider((ref) => ScrollController());
// @riverpod
// double mainAnimation(MainAnimationRef ref) {
//   PageController a = ref.watch(mainControllerProvider);
//   if (a.hasClients) {
//     return ref.watch(mainControllerProvider.select((value) => value.offset));
//   } else {
//     return 0.0;
//   }

//   // if (ma.hasClients) {
//   //   return ma.offset;
//   // } else {
//   //   return 0.0;
//   // }
// }

// @riverpod
// class PageAnimation extends _$PageAnimation {
//   PageController build() => PageController();

//   double calculateSize(BuildContext context) {
//     double result = state.offset / MediaQuery.of(context).size.width;
//     print('result is -> ${result}');
//     return result;
//   }

//   Widget pageViewWidget(List<Widget> children) {
//     return PageView(
//       controller: state,
//       children: children,
//     );
//   }
// }

// // @riverpod
// // double pAnimation(PAnimationRef ref) {
// //   PageController? pp = ref.watch(pageControllerProvider);
// //   return pp?.offset ?? 0.0;
// // }
