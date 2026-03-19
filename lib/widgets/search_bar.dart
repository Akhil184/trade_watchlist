import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ResponsiveUtils.screenWidth * 0.03),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.screenWidth * 0.01,
          vertical: ResponsiveUtils.screenHeight * 0.008,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.screenWidth * 0.025,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.screenWidth * 0.025,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              size: ResponsiveUtils.screenWidth * 0.05,
            ),
            hintText: "Search for instruments",
            hintStyle: TextStyle(
              fontSize: 14 * ResponsiveUtils.textScale,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}