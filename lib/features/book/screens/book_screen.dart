import 'package:flutter/material.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                    stops: [0.53, 1.0],
                  ).createShader(bounds),

                  child: Text(
                    'BOOK NOW',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ),
              CustomDivider(),
              SizedBox(height: 15),
              Text(
                "Fill in your details and we'll get back to you\nwithin 24 hours to discuss your project.",
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
