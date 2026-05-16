import 'package:flutter/material.dart';
import 'package:sketch_app/features/gallery/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
                  stops: [0.53, 1.0],
                ).createShader(bounds),
                child: const Text(
                  'Featured Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.7,
                  ),
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFD3A14A), Color(0xFFA78873)],
                  stops: [0.34, 1.0],
                ).createShader(bounds),
                child: const Text(
                  'view all',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          ProjectCard(),
          const SizedBox(height: 26),
          ProjectCard(),
        ],
      ),
    );
  }
}
