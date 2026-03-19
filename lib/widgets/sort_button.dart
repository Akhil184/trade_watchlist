import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.04,   // 🔽 reduced left space
        right: screenWidth * 0.05,  // keep or adjust as needed
        top: screenHeight * 0.008,
        bottom: screenHeight * 0.008,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.035,
            vertical: screenHeight * 0.012,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.sort, size: screenWidth * 0.045), // responsive icon
              SizedBox(width: screenWidth * 0.015),         // responsive spacing
              Text(
                "Sort by",
                style: TextStyle(fontSize: 14 * textScale), // responsive text
              ),
            ],
          ),
        ),
      ),
    );
  }
}