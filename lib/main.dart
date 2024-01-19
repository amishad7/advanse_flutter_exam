import 'package:flutter/material.dart';
import 'package:practical_exam/app/views/detailscreen/view/datailpage.dart';
import 'package:practical_exam/app/views/homescreen/view/homescreen.dart';
import 'package:practical_exam/app/views/splashscreen/view/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        'home': (context) => const HomePage(),
        'detail': (context) => detailview(),
      },
    ),
  );
}
