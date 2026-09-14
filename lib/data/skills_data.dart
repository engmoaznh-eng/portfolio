import 'package:flutter/material.dart';
import '../models/skill_category_model.dart';

/// Sourced from the CV's "Technical Skills" + "Courses & Certifications" lines.
/// No percentages — the CV gives none.
class SkillsData {
  SkillsData._();

  static const List<SkillCategory> categories = [
    SkillCategory(
      title: 'Mobile Development',
      icon: Icons.smartphone_rounded,
      skills: ['Flutter', 'Dart', 'BLoC', 'GetX'],
    ),
    SkillCategory(
      title: 'APIs & Backend Communication',
      icon: Icons.api_rounded,
      skills: ['REST APIs', 'GraphQL'],
    ),
    SkillCategory(
      title: 'Tools',
      icon: Icons.build_rounded,
      skills: ['Git', 'GitHub', 'GitLab', 'Postman', 'Figma'],
    ),
    SkillCategory(
      title: 'Other',
      icon: Icons.code_rounded,
      skills: ['PHP', 'SQL', 'C#', 'Web Design'],
    ),
  ];
}
