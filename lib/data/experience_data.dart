import '../models/experience_model.dart';

/// Sourced from the CV's "Work Experience" section. Company names are
/// omitted where the CV doesn't name one — not invented.
class ExperienceData {
  ExperienceData._();

  static const List<Experience> experiences = [
    Experience(
      title: 'Flutter Frontend Development',
      period: '2023',
      description:
          'Experience in designing and developing cross-platform applications using state '
          'management with BLoC and GetX.',
      technologies: ['Flutter', 'BLoC', 'GetX'],
    ),
    Experience(
      title: 'Personal Brand Creation & Marketing',
      period: '2022 – 2023',
      description:
          'Founded a personal brand and currently manage its marketing strategy, including '
          'digital campaigns and content creation to increase brand awareness.',
      technologies: [],
    ),
  ];

  /// From the CV's "Courses & Certifications | 2023" entry — kept distinct
  /// from work experience since the CV itself separates them.
  static const String certificationsPeriod = '2023';
  static const List<String> certifications = ['PHP', 'SQL', 'Web Design', 'C#', 'Flutter'];
}
