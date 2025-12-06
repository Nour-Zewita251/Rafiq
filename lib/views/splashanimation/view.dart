import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/SplashAnimation2/view.dart';

class SplashAnimationView extends StatefulWidget {
  const SplashAnimationView({super.key});

  @override
  State<SplashAnimationView> createState() => _SplashAnimationViewState();
}

class _SplashAnimationViewState extends State<SplashAnimationView> {
  final int splashDurationSeconds = 2;

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(); // 2. Call the navigation function on initialization
  }

  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: splashDurationSeconds), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashAnimation2View()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1564BF),
      body: Center(
        child: BackInDown(
          // Keep the duration for the visual animation
          duration: Duration(seconds: splashDurationSeconds),
          child: Image.asset(
            "assets/images/Rafiq_logo_white.png",
            height: 400,
            width: 400,
          ),
        ),
      ),
    );
  }
}