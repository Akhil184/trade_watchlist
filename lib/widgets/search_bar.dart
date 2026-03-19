import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03), // responsive padding
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01,
          vertical: screenHeight * 0.008,
        ),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
        ),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, size: screenWidth * 0.05), // responsive icon
            hintText: "Search for instruments",
            hintStyle: TextStyle(fontSize: 14 * textScale), // responsive text
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}