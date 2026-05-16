import 'package:flutter/material.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xFFD3A14A),
                    size: 37,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),

            _buildDrawerItem('GALLERY'),
            CustomDivider(),
            _buildDrawerItem('ABOUT US'),
            CustomDivider(),
            _buildDrawerItem('DESIGNS'),
            CustomDivider(),
            _buildDrawerItem('SERVICES'),
            CustomDivider(),
            _buildDrawerItem('BOOKING'),
            CustomDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 0.0,
      ),
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFFFADDB3), Color(0xFFD3A14A)],
          stops: [0.53, 1.0],
        ).createShader(bounds),

        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
          ),
        ),
      ),
      onTap: () {
        // Navigation logic goes here
      },
    );
  }
}
