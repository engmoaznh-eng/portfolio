import 'package:flutter/material.dart';

class SkillCategory {
  const SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });

  final String title;
  final IconData icon;
  final List<String> skills;
}
