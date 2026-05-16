import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 394,
          width: 394,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x1AFFFFFF), Color(0xFFD3A14A), Color(0x1AFFFFFF)],
              stops: [0.0, 0.55, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD3A14A).withOpacity(0.18),
                blurRadius: 14,
                spreadRadius: 0.5,
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(2),

            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/home_1.png', fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 37,
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
              stops: [0.34, 1.0],
            ).createShader(bounds),
            child: const Text(
              'CONTEMPORARY\n'
              'LIVING SPACE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
