import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/utils/color_token.dart';


final lightBlueTheme = MixThemeData(
  colors: {
    $token.color.primary: const Color(0xFF0093B9),
    $token.color.onPrimary: const Color(0xFFFAFAFA),
    $token.color.surface: const Color(0xFFFAFAFA),
    $token.color.onSurface: const Color(0xFF141C24),
    $token.color.onSurfaceVariant: const Color(0xFF405473),
     $token.color.cardBackgroundColor: const Color(0xFFebebeb),
  },
  textStyles: {
    $token.textStyle.headline1: GoogleFonts.plusJakartaSans(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    $token.textStyle.headline2: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    $token.textStyle.headline3: GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    $token.textStyle.body: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    $token.textStyle.callout: GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  },
  radii: {
    $token.radius.large: const Radius.circular(100),
    $token.radius.medium: const Radius.circular(12),
  },
  spaces: {
    $token.space.medium: 16,
    $token.space.large: 24,
  },
);
