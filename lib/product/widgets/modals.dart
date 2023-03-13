import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void showAlertDialog(BuildContext context) {
//   final colorScheme = Theme.of(context).colorScheme;
//   showCupertinoModalPopup<void>(
//     context: context,
//     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       title: Text(
//         '',
//         style: TextStyle(color: colorScheme.error, fontWeight: FontWeight.bold),
//       ),
//       content: RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(text: 'Lütfen ', children: [
//           TextSpan(
//             text: '\n"Yardımlar ve Bildiri Noktaları"',
//             style: TextStyle(
//                 fontWeight: FontWeight.w300, color: colorScheme.inverseSurface),
//           ),
//           TextSpan(
//             text: '\nbutonu ile ilerleyiniz.',
//           ),
//         ]),
//       ),
//       actions: <CupertinoDialogAction>[
//         // CupertinoDialogAction(
//         //   /// This parameter indicates this action is the default,
//         //   /// and turns the action's text to bold text.
//         //   isDefaultAction: true,
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         //   child: const Text('No'),
//         // ),
//         CupertinoDialogAction(
//           /// This parameter indicates the action would perform
//           /// a destructive action such as deletion, and turns
//           /// the action's text color to red.

//           isDefaultAction: true,
//           textStyle: TextStyle(
//             color: colorScheme.primary,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text(
//             'Anladım',
//             style: TextStyle(fontWeight: FontWeight.w100),
//           ),
//         ),
//       ],
//     ),
//   );
// }

void showPermissionDialog(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  showCupertinoModalPopup<void>(
    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(
        'Lokasyon Erişimi',
        style: TextStyle(color: colorScheme.error),
      ),
      content: const Text(
          'Lütfen bu özelliği kullanabilmek için sistem ayarlarından uygulamanın konum erişimine izin verip uygulamayı ya da sisteminizi yeniden başlatın'),
      actions: <CupertinoDialogAction>[
        // CupertinoDialogAction(
        //   /// This parameter indicates this action is the default,
        //   /// and turns the action's text to bold text.
        //   isDefaultAction: true,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Text('No'),
        // ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.

          isDefaultAction: true,
          textStyle: TextStyle(
            color: colorScheme.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Anladım'),
        ),
      ],
    ),
  );
}
