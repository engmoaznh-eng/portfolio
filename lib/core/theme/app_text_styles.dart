import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized typography scale. Headings use Sora, body copy uses Inter.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _displayBase => GoogleFonts.sora(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
        height: 1.15,
      );

  static TextStyle get _bodyBase => GoogleFonts.inter(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  static TextStyle get displayXl => _displayBase.copyWith(fontSize: 56, letterSpacing: -1);
  static TextStyle get displayLg => _displayBase.copyWith(fontSize: 42, letterSpacing: -0.5);
  static TextStyle get displayMd => _displayBase.copyWith(fontSize: 32, letterSpacing: -0.5);
  static TextStyle get displaySm => _displayBase.copyWith(fontSize: 24);

  static TextStyle get headingLg =>
      _displayBase.copyWith(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static TextStyle get headingMd =>
      _displayBase.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary);

  static TextStyle get bodyLg => _bodyBase.copyWith(fontSize: 18);
  static TextStyle get bodyMd => _bodyBase.copyWith(fontSize: 16);
  static TextStyle get bodySm => _bodyBase.copyWith(fontSize: 14);

  static TextStyle get label => _bodyBase.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: AppColors.textPrimary,
      );

  static TextStyle get overline => _bodyBase.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
        color: AppColors.accentBlue,
      );
}
