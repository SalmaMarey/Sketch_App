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
  final PageController _pageController = PageController();
  final ScrollController _projectsScrollController = ScrollController();

  int _currentPage = 0;
  bool _isAnimatingPage = false;

  Future<void> scrollToProjects() async {
    if (_isAnimatingPage || _currentPage == 1) {
      return;
    }

    _isAnimatingPage = true;
    await _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    _isAnimatingPage = false;
  }

  Future<void> _scrollToHero() async {
    if (_isAnimatingPage || _currentPage == 0) {
      return;
    }

    _isAnimatingPage = true;
    await _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
    _isAnimatingPage = false;
  }

  bool _handleProjectsScrollNotification(ScrollNotification notification) {
    if (_currentPage != 1 || _isAnimatingPage) {
      return false;
    }

    final metrics = notification.metrics;
    final isAtTop = metrics.pixels <= metrics.minScrollExtent;

    if (notification is OverscrollNotification &&
        isAtTop &&
        notification.overscroll < 0) {
      _scrollToHero();
    }

    if (notification is ScrollUpdateNotification &&
        isAtTop &&
        (notification.scrollDelta ?? 0) < 0) {
      _scrollToHero();
    }

    return false;
  }

  @override
  void dispose() {
    _pageController.dispose();
    _projectsScrollController.dispose();
    super.dispose();
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
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: _currentPage == 0
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          _HeroSection(onPortfolioPressed: scrollToProjects),
          ProjectsSection(
            scrollController: _projectsScrollController,
            onScrollNotification: _handleProjectsScrollNotification,
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.onPortfolioPressed});

  final VoidCallback onPortfolioPressed;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home_1.png', fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                20,
                20,
                mediaQuery.padding.bottom + 41,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      const Text(
                        'Where ideas come to life\n'
                        'Explore our work and start your\n'
                        'creative journey today.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      PortfolioButton(onPressed: onPortfolioPressed),
                    ],
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
