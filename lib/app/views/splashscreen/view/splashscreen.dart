import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // begin: Alignment.bottomLeft,
            colors: [
              Colors.black,
              // Colors.white70,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h / 4,
              width: w / 2,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/3c/07/40/3c0740017fa1c2ca4b529179ef1ffb08.jpg'),
                ),
                borderRadius: BorderRadius.circular(34),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 23,
                    offset: const Offset(23, 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: 34),
            Text(
              "Zoom News",
              style: GoogleFonts.adamina(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
