// // 1.
// import 'package:flutter/material.dart';
// import 'package:travelapp/pages/navpages/home_page.dart';
// import 'package:travelapp/pages/welcome_page.dart';

// class RouteGenerator {

// // 2.Pages

//   static const String homePage = '/';
//   static const String page2 = '/page2';
//   static const String page3 = '/page3';

// // 3.

//   RouteGenerator._();

// // 4.Mapping to pages

//   static Route<dynamic> generateRoute(RouteSettings settings) {

// //5.switch

//     switch (settings.name) {

//       case homePage:

//         return MaterialPageRoute(
//           builder: (_) => const WelcomePage(),
//         );

//       case page2:

//         return MaterialPageRoute(
//           builder: (_) => const HomePage(),
//         );

//       default:
//         throw const FormatException("Route not found");

//     }
//   }
// }

// // 5.
// class RouteException implements Exception {
//   final String message;
//   const RouteException(this.message);
// }
