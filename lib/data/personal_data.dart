/// All facts here are sourced directly from the user-supplied CV
/// (assets/cv/cv.pdf). Do not add anything not explicitly present there.
class PersonalData {
  PersonalData._();

  static const String name = 'Moaz Alnahas Alhomse';
  static const String title = 'Flutter Developer & Informatics Engineer';
  static const String initials = 'MA';

  static const String email = 'eng.moaznh@gmail.com';
  static const String phone = '+963 981 174 823';

  static const String heroIntro =
      'Informatics Engineering graduate specializing in Flutter. I build cross-platform '
      'applications with clean architecture, from offline-first apps to API-driven products.';

  static const String profileSummary =
      'Informatics Engineering graduate with a strong background in software development, '
      'especially using the Flutter framework. Experience in cross-platform application '
      'development, implementing software projects that rely on databases and web design, '
      'skilled in creating innovative solutions — demonstrated through projects like a Maze '
      'Game Algorithm and a sign language recognition system. Currently building and marketing '
      'a personal brand, and interested in modern technologies such as sign language recognition.';

  static const List<String> strengths = [
    'Leadership',
    'Problem Solving',
    'Creative Thinking',
    'Quality & Accuracy',
    'Communication Skills',
  ];

  /// Not present on the CV. Fill in the real profile URL, then update
  /// `widgets/navigation/nav_bar.dart` / hero / contact sections will pick
  /// it up automatically wherever `PersonalData.githubUrl` is referenced —
  /// no other file needs to change.
  static const String? githubUrl = null;

  /// Not present on the CV — see note above for `githubUrl`.
  static const String? linkedinUrl = null;
}
