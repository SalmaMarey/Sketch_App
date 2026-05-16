import 'package:flutter/material.dart';
import 'dart:ui';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    Navigator.pushReplacementNamed(context, '/layout');
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/on_boarding.png',
              fit: BoxFit.cover,
            ),
          ),
          // Get Started Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 29.0, left: 32, right: 32),
              child: GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTapCancel: _onTapCancel,
                child: AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 60,
                        width: 213,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color(0xFFD3A14A).withOpacity(0.30 * 0.78),
                              const Color(0xFF5B5B5B).withOpacity(0.78),
                            ],
                            stops: const [0.02, 1.0],
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Gradient Border
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => const SweepGradient(
                                center: Alignment.center,
                                startAngle: 0.0,
                                endAngle: 3.14 * 2,
                                colors: [
                                  Color(0x8FD3A14A),
                                  Color(0xFFFADDB3),
                                  Color(0x8FD3A14A),
                                  Color(0xFFFADDB3),
                                  Color(0x8FD3A14A),
                                ],
                                stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                              ).createShader(bounds),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            // Gradient Text
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => const SweepGradient(
                                center: Alignment.center,
                                colors: [
                                  Color(0xFFD3A14A),
                                  Color(0xFFFADDB3),
                                  Color(0xFFD3A14A),
                                ],
                              ).createShader(bounds),
                              child: const Text(
                                'GET STARTED',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
