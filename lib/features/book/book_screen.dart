import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Book Screen',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
