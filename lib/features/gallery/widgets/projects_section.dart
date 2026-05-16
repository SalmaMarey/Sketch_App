import 'package:flutter/material.dart';
import 'package:sketch_app/features/gallery/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.scrollController,
    required this.onScrollNotification,
  });

  final ScrollController scrollController;
  final NotificationListenerCallback<ScrollNotification> onScrollNotification;

  static const int _projectCount = 2;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: ListView.separated(
            controller: scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
            itemCount: _projectCount + 1,
            separatorBuilder: (_, __) => const SizedBox(height: 26),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
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
                );
              }

              return const ProjectCard();
            },
          ),
        ),
      ),
    );
  }
}
