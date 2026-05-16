import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Gallery Screen',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
