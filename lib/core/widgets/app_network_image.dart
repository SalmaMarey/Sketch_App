import 'package:flutter/material.dart';
import 'package:sketch_app/core/theme/app_colors.dart';

/// A network image that keeps its parent card's constraints while it loads.
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        imageUrl,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: loadingProgress == null
                ? child
                : const _ImagePlaceholder(key: ValueKey('loading')),
          );
        },
        errorBuilder: (_, __, ___) => const _ImagePlaceholder(
          key: ValueKey('error'),
          icon: Icons.broken_image_outlined,
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({super.key, this.icon});

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.cardBackground,
      child: Center(
        child: icon == null
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primaryGold,
                ),
              )
            : Icon(icon, color: AppColors.white40),
      ),
    );
  }
}
