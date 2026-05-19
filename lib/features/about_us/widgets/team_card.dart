import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final String image;
  final String name;
  final String role;

  const TeamCard({
    super.key,
    required this.image,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.785398, // 45 degree
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Color(0xFFD3A14A), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD3A14A).withOpacity(0.4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Transform.rotate(
          angle: -0.785398,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 26, backgroundImage: AssetImage(image)),

                SizedBox(height: 10),

                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  role,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD3A14A),
                    fontSize: 10,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
