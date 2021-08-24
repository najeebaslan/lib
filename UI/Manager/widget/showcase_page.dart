// import 'package:flutter/material.dart';
// import 'package:showcaseview/showcase.dart';

// class CustomShowcaseWidget extends StatelessWidget {
//   final Widget child;
//   final String description;
//   final GlobalKey globalKey;

//   const CustomShowcaseWidget({
//     required this.description,
//     required this.child,
//     required this.globalKey,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Showcase(
//       shapeBorder: const CircleBorder(),
//       key: globalKey,
//       overlayColor: Colors.transparent,
//       showcaseBackgroundColor: Colors.blue,
//       contentPadding:const EdgeInsets.all(12),
//       titleTextStyle:const TextStyle(color: Colors.white, fontSize: 32),
//       description: description,
//       textColor: Colors.red,
//       descTextStyle:const TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//       ),
//       overlayOpacity: 0.3,
//       child: child,
//     );
//   }
// }
