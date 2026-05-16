import 'package:flutter/material.dart';

class DesignsScreen extends StatelessWidget {
  const DesignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Designs Screen',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
