import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palette.dart';

final themeData = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Palette.facebookBlue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Palette.scaffold,
  textTheme: GoogleFonts.robotoTextTheme(),
);
