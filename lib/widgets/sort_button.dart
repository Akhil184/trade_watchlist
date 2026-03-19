import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ResponsiveUtils.screenWidth * 0.04,
        right: ResponsiveUtils.screenWidth * 0.05,
        top: ResponsiveUtils.screenHeight * 0.008,
        bottom: ResponsiveUtils.screenHeight * 0.008,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils.screenWidth * 0.035,
            vertical: ResponsiveUtils.screenHeight * 0.012,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(
              ResponsiveUtils.screenWidth * 0.025,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sort,
                size: ResponsiveUtils.screenWidth * 0.045,
              ),
              SizedBox(width: ResponsiveUtils.screenWidth * 0.015),
              Text(
                "Sort by",
                style: TextStyle(
                  fontSize: 14 * ResponsiveUtils.textScale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}