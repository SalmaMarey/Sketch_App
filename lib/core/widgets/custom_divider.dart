import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xFFFFFFFF).withOpacity(0.10),
            const Color(0xFFD3A14A),
            const Color(0xFFFFFFFF).withOpacity(0.10),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
