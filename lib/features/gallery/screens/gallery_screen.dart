import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sketch_app/features/gallery/widgets/drawer_bar.dart';
import 'package:sketch_app/features/gallery/widgets/portfolio_button.dart';
import 'package:sketch_app/features/gallery/widgets/projects_section.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showHero = true;

  void scrollToProjects() {
    _scrollController.animateTo(
      700,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    setState(() {
      showHero = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerBar(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/images/logo.png', height: 59, width: 59),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFFD3A14A),
                  size: 37,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            //sec1
            // if (showHero)
            Stack(
              children: [
                Image.asset(
                  'assets/images/home_1.png',
                  height: 800,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: 265,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFD3A14A), Color(0xFFFFEFD9)],
                          stops: [0.11, 0.94],
                        ).createShader(bounds),
                        child: const Text(
                          'SKETCH COMPANY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Where ideas come to life\n'
                        'Explore our work and start your\n'
                        'creative journey today.',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      PortfolioButton(onPressed: scrollToProjects),
                    ],
                  ),
                ),
              ],
            ),

            //sec2
            const ProjectsSection(),
          ],
        ),
      ),
    );
  }
}
