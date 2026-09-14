import 'package:flutter/material.dart';

/// Centralized color palette. Never hardcode a color in a widget — add it
/// here first.
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF0A0E14);
  static const Color surface = Color(0xFF0F1420);
  static const Color surfaceElevated = Color(0xFF141B2B);

  // Borders / dividers
  static const Color border = Color(0xFF1F2633);
  static const Color borderSubtle = Color(0xFF161C28);

  // Text
  static const Color textPrimary = Color(0xFFE7E9EE);
  static const Color textSecondary = Color(0xFF9AA3B2);
  static const Color textMuted = Color(0xFF6B7280);

  // Accents
  static const Color accentBlue = Color(0xFF5B8DEF);
  static const Color accentPurple = Color(0xFF8B5CF6);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentBlue, accentPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const RadialGradient heroGlow = RadialGradient(
    colors: [Color(0x335B8DEF), Color(0x008B5CF6), Color(0x00000000)],
    stops: [0.0, 0.5, 1.0],
    center: Alignment.topRight,
    radius: 1.2,
  );
}

