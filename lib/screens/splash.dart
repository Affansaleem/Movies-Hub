import 'package:flutter/material.dart';
import 'package:movie_app/screens/home.dart';

class SplashScreen extends StatelessWidget {
  final Function toggleTheme;

  const SplashScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(toggleTheme: toggleTheme)));
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 300,
        ),
      ),
    );
  }
}
