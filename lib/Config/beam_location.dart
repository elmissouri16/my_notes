// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:my_notes/Pages/home_page.dart';
// import 'package:my_notes/Pages/login_page.dart';

// class RouteLocationGenerator {
//   static const String homeRoute = '/';
//   static const String profileRoute = '/profile';
//   static const String settingsRoute = '/settings';
// }

// //OPTION A: SIMPLE LOCATION BUILDER
// bool isLoggedIn = false;

// class SimpleLocationGenerator {
//   static final simpleLocationBuilder = SimpleLocationBuilder(routes: {
//     '/': (context, state) => BeamPage(
//           key: const ValueKey('login'),
//           title: 'Login',
//           child: const LoginScreen(),
//           type: BeamPageType.material,
//         ),
//     '/home': (context, state) => BeamPage(
//           key: const ValueKey('home'),
//           title: 'Home',
//           child: const HomePage(),
//           type: BeamPageType.material,
//         ),
//   });
// }
