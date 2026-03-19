import 'package:flutter/material.dart';

class ResponsiveUtils {
  static late double screenWidth;
  static late double screenHeight;
  static late double textScale;

  static void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
    textScale = mq.textScaleFactor;
  }
}