import 'package:flutter/material.dart';

class SplashAnimation2View extends StatefulWidget {
  const SplashAnimation2View({super.key});

  @override
  State<SplashAnimation2View> createState() => _SplashScreenFigmaState();
}

class _SplashScreenFigmaState extends State<SplashAnimation2View>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -screenH * 0.4,
            left: -screenW * 0.3,
            child: Container(
              width: screenW * 2,
              height: screenH * 1.4,
              decoration: BoxDecoration(
                color: const Color(0xFF1564BF),
                borderRadius: BorderRadius.circular(screenW),
              ),
            ),
          ),

          Center(
            child: Image.asset(
              "assets/images/Rafiq_logo_white.png",

              width: MediaQuery.of(context).size.width * 1.2,
              height: MediaQuery.of(context).size.height * 0.55,

              fit: BoxFit.contain,
            ),
          ),


          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final whiteHeight = screenH * 0.30;

              return Positioned(
                bottom: -whiteHeight * (1 - _animation.value),
                child: Container(
                  width: screenW,
                  height: whiteHeight,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              );
            },
          ),


        ],
      ),
    );
  }
}
