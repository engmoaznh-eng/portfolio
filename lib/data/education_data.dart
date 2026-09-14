import '../models/education_model.dart';

/// Sourced from the CV's "Education" section.
class EducationData {
  EducationData._();

  static const List<Education> education = [
    Education(
      degree: 'Bachelor of Information Technology',
      institution: 'Information Technology for Science & Technology — Daraa',
      period: '2018 – 2024',
      description: 'Software Engineering, Networks and Artificial Intelligence.',
    ),
    Education(
      degree: 'High School Diploma',
      institution: 'Primary, Preparatory & Secondary Education',
      period: '2005 – 2017',
    ),
  ];
}
