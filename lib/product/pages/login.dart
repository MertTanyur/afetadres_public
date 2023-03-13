// // // Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// // // for details. All rights reserved. Use of this source code is governed by a
// // // BSD-style license that can be found in the LICENSE file.

// // import 'package:firebase_auth/firebase_auth.dart'
// // hide PhoneAuthProvider, EmailAuthProvider;
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:animations/animations.dart';
// // import 'package:firebase_ui_auth/firebase_ui_auth.dart';

// // import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
// // import 'package:firebase_ui_oauth_twitter/firebase_ui_oauth_twitter.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:simple_shadow/simple_shadow.dart';
// import 'package:skelfie/product/pages/splash.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';

// import '../../core/config.dart';
// import 'decorations.dart';
// import 'home_page.dart';

// final mfaAction = AuthStateChangeAction<MFARequired>(
//   (context, state) async {
//     final nav = Navigator.of(context);

//     await startMFAVerification(
//       resolver: state.resolver,
//       context: context,
//     );

//     nav.pushReplacementNamed('/home_page');
//   },
// );
// Map<String, Widget Function(BuildContext)> loginRoutes = {
//   '/': (context) {
//     return WelcomePage();
//   },
//   '/sign_from_scratch': (context) {
//     return SignFromScratch();
//   },
//   '/verify-email': (context) {
//     return EmailVerificationScreen(
//       headerBuilder: headerIcon(Icons.verified),
//       sideBuilder: sideIcon(Icons.verified),
//       // actionCodeSettings: actionCodeSettings,
//       actions: [
//         EmailVerifiedAction(() {
//           Navigator.pushReplacementNamed(context, '/profile');
//         }),
//         AuthCancelledAction((context) {
//           FirebaseUIAuth.signOut(context: context);
//           Navigator.pushReplacementNamed(context, '/sign_from_scratch');
//         }),
//       ],
//     );
//   },
//   '/phone': (context) {
//     return PhoneInputScreen(
//       actions: [
//         SMSCodeRequestedAction((context, action, flowKey, phone) {
//           Navigator.of(context).pushReplacementNamed(
//             '/sms',
//             arguments: {
//               'action': action,
//               'flowKey': flowKey,
//               'phone': phone,
//             },
//           );
//         }),
//       ],
//       headerBuilder: headerIcon(Icons.phone),
//       sideBuilder: sideIcon(Icons.phone),
//     );
//   },
//   '/sms': (context) {
//     final arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

//     return SMSCodeInputScreen(
//       actions: [
//         AuthStateChangeAction<SignedIn>((context, state) {
//           Navigator.of(context).pushReplacementNamed('/profile');
//         })
//       ],
//       flowKey: arguments?['flowKey'],
//       action: arguments?['action'],
//       headerBuilder: headerIcon(Icons.sms_outlined),
//       sideBuilder: sideIcon(Icons.sms_outlined),
//     );
//   },
//   '/forgot-password': (context) {
//     final arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

//     return ForgotPasswordScreen(
//       email: arguments?['email'],
//       headerMaxExtent: 200,
//       headerBuilder: headerIcon(Icons.lock),
//       sideBuilder: sideIcon(Icons.lock),
//     );
//   },
//   '/email-link-sign-in': (context) {
//     return EmailLinkSignInScreen(
//       actions: [
//         AuthStateChangeAction<SignedIn>((context, state) {
//           Navigator.pushReplacementNamed(context, '/sign_from_scratch');
//         }),
//       ],
//       provider: emailLinkProviderConfig,
//       headerMaxExtent: 200,
//       headerBuilder: headerIcon(Icons.link),
//       sideBuilder: sideIcon(Icons.link),
//     );
//   },
//   '/profile': (context) {
//     final platform = Theme.of(context).platform;

//     return CustomProfile(platform: platform);
//   },
// };

// class CustomProfile extends StatefulWidget {
//   const CustomProfile({
//     Key? key,
//     required this.platform,
//   }) : super(key: key);

//   final TargetPlatform platform;

//   @override
//   State<CustomProfile> createState() => _CustomProfileState();
// }

// class _CustomProfileState extends State<CustomProfile>
//     with SingleTickerProviderStateMixin {
//   Animation? animation;
//   AnimationController? controller;
//   Future<dynamic> pushToHomePage() async {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//           transitionDuration: Duration(seconds: 2),
//           pageBuilder: ((context, animation, secondaryAnimation) {
//             return HomePage();
//           }),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return SharedAxisTransition(
//               fillColor: Theme.of(context).cardColor,
//               animation: animation,
//               secondaryAnimation: secondaryAnimation,
//               transitionType: SharedAxisTransitionType.scaled,
//               child: child,
//             );
//           }),
//     );
//   }

//   @override
//   void initState() {
//     controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     controller?.repeat(reverse: true);
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         ProfileScreen(
//           actions: [
//             SignedOutAction((context) {
//               Navigator.pushReplacementNamed(context, '/sign_from_scratch');
//             }),
//             mfaAction,
//           ],
//           actionCodeSettings: actionCodeSettings,
//           showMFATile: kIsWeb ||
//               widget.platform == TargetPlatform.iOS ||
//               widget.platform == TargetPlatform.android,
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: size.height / 8),
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: SizedBox(
//               width: size.width * .8,
//               child: AnimatedBuilder(
//                 animation: controller!,
//                 builder: ((context, child) {
//                   return SimpleShadow(
//                       sigma: 2 + controller!.value * 5, child: child!);
//                 }),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     pushToHomePage();
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.done),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5.0),
//                         child: Text('Start'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 40,
//           right: 40,
//           child: GestureDetector(
//               onTap: (() {
//                 pushToHomePage();
//               }),
//               child: Icon(Icons.done)),
//         )
//       ],
//     );
//   }
// }

// class SignFromScratch extends StatelessWidget {
//   const SignFromScratch({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SignInScreen(
//       actions: [
//         ForgotPasswordAction((context, email) {
//           Navigator.pushNamed(
//             context,
//             '/forgot-password',
//             arguments: {'email': email},
//           );
//         }),
//         VerifyPhoneAction((context, _) {
//           Navigator.pushNamed(context, '/phone');
//         }),
//         AuthStateChangeAction<SignedIn>((context, state) {
//           if (!state.user!.emailVerified) {
//             Navigator.pushNamed(context, '/verify-email');
//           } else {
//             Navigator.pushReplacementNamed(context, '/profile');
//           }
//         }),
//         AuthStateChangeAction<UserCreated>((context, state) {
//           if (!state.credential.user!.emailVerified) {
//             Navigator.pushNamed(context, '/verify-email');
//           } else {
//             Navigator.pushReplacementNamed(context, '/profile');
//           }
//         }),
//         AuthStateChangeAction<CredentialLinked>((context, state) {
//           if (!state.user.emailVerified) {
//             Navigator.pushNamed(context, '/verify-email');
//           } else {
//             Navigator.pushReplacementNamed(context, '/profile');
//           }
//         }),
//         mfaAction,
//         EmailLinkSignInAction((context) {
//           Navigator.pushReplacementNamed(context, '/email-link-sign-in');
//         }),
//       ],
//       styles: const {
//         EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
//       },
//       headerBuilder: headerImage('assets/images/blue_last.png'),
//       sideBuilder: sideImage('assets/images/blue_image.png'),
//       subtitleBuilder: (context, action) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 8),
//           child: Text(
//             action == AuthAction.signIn
//                 ? 'Welcome! Please sign in to continue.'
//                 : 'Welcome! Please create an account to continue',
//           ),
//         );
//       },
//       footerBuilder: (context, action) {
//         return Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: Text(
//               action == AuthAction.signIn
//                   ? 'By signing in, you agree to our terms and conditions.'
//                   : 'By registering, you agree to our terms and conditions.',
//               style: const TextStyle(color: Colors.grey),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



// // final actionCodeSettings = ActionCodeSettings(
// //   url: 'https://flutterfire-e2e-tests.firebaseapp.com',
// //   handleCodeInApp: true,
// //   androidMinimumVersion: '1',
// //   androidPackageName: 'io.flutter.plugins.firebase_ui.firebase_ui_example',
// //   iOSBundleId: 'io.flutter.plugins.fireabaseUiExample',
// // );
// // final emailLinkProviderConfig = EmailLinkAuthProvider(
// //   actionCodeSettings: actionCodeSettings,
// // );



