import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/widgets/gold_back_button.dart';

class DesignsScreen extends StatelessWidget {
  const DesignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Align(
            alignment: Alignment.topLeft,
            child: GoldBackButton(
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
        ),
      ),
    );
  }
}
