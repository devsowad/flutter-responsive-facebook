import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);
  static const Color facebookLightBlue = Color(0xFF82B1FF);

  static const Color whiteColor = Colors.white;

  static const Color blackColor = Colors.black;

  static const Color lightGreyColor = Color(0xFFEEEEEE);
  static const Color darkGreyColor = Color(0xFF757575);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
