import '../models/project_model.dart';

/// The 10 real projects listed on the CV. To add a new project: append a
/// [Project] entry here and drop its images into
/// `assets/images/projects/<id>/` (cover.png + screenshot-1.png, -2.png, ...).
/// No other file needs to change.
///
/// "Historic Syria" is intentionally not included — it isn't on the CV and
/// no verified details exist for it yet. See PROJECT_ANALYSIS.md.
class ProjectsData {
  ProjectsData._();

  static const List<Project> projects = [
    Project(
      id: 'massar',
      name: 'Massar',
      period: 'Sep 2025 – Present',
      category: ProjectCategory.mobileApp,
      shortDescription: 'An online-only app relying entirely on API-driven data.',
      description:
          'An online-only app (no local storage) relying on API-driven data. Integrated network '
          'features using BLoC state management and followed a Clean Architecture / Use Case '
          'approach for maintainable, scalable code.',
      technologies: ['Flutter', 'Dart', 'BLoC', 'Clean Architecture', 'REST API'],
      screenshotCount: 3,
      hasLogo: true,
    ),
    Project(
      id: 'warraq',
      name: 'Warraq',
      period: 'Aug 2025 – Present',
      category: ProjectCategory.mobileApp,
      shortDescription: 'A gamified Islamic-studies app with lessons, levels, and quizzes.',
      description:
          'An Islamic-education app structured as level-based courses — Hadith, Fiqh, Tafsir, '
          'Aqeedah, and Seerah. Each level unlocks the next as the user progresses, with practice '
          'drills and multiple-choice quizzes to test understanding, and a profile screen tracking '
          'scores across subjects.',
      technologies: ['Flutter', 'Dart'],
      screenshotCount: 5,
      hasLogo: true,
    ),
    Project(
      id: 'quran',
      name: 'Holy Quran',
      period: 'Oct 2025',
      category: ProjectCategory.mobileApp,
      shortDescription: 'A fully offline Quran app with audio playback and prayer reminders.',
      description:
          'A fully offline Quran app featuring surah download on demand, audio playback with '
          'background mode, prayer time reminders, and an adhan/alarm system. Built with BLoC and '
          'structured using Clean Architecture / Clean Code principles.',
      technologies: ['Flutter', 'Dart', 'BLoC', 'Clean Architecture'],
      screenshotCount: 5,
      hasLogo: true,
    ),
    Project(
      id: 'sign_language',
      name: 'American Sign Language',
      period: 'Jul 2024',
      category: ProjectCategory.ai,
      shortDescription: 'An AI model to help individuals with hearing impairments communicate.',
      description:
          'Developed a model based on sign language to help individuals with hearing impairments '
          'communicate, using AI.',
      technologies: ['AI', 'Machine Learning'],
    ),
    Project(
      id: 'maze_game',
      name: 'Maze Game Algorithm',
      period: 'Feb 2023',
      category: ProjectCategory.algorithm,
      shortDescription: 'A pathfinding algorithm for solving mazes efficiently.',
      description:
          'Developed an algorithm for a computer to solve a maze using A* and BFS algorithms for '
          'the best and shortest path without issues.',
      technologies: ['A* Algorithm', 'BFS', 'Algorithms'],
    ),
    Project(
      id: 'bmi',
      name: 'BMI App',
      period: 'Jun 2023',
      category: ProjectCategory.mobileApp,
      shortDescription: 'An app to calculate BMI, with sign in and sign up.',
      description: 'Developed an application that can calculate BMI for users, with sign in and sign up.',
      technologies: [],
      hasLogo: true,
    ),
    Project(
      id: 'mrb_coin',
      name: 'MRB Coin App',
      period: 'Feb 2025',
      category: ProjectCategory.mobileApp,
      shortDescription: 'A digital wallet app for managing internal crypto transactions.',
      description:
          'A digital wallet app for managing internal crypto transactions. Used BLoC for state '
          'management, Formz for validation, and integrated REST APIs with Dio.',
      technologies: ['Flutter', 'Dart', 'BLoC', 'Formz', 'Dio', 'REST API'],
      screenshotCount: 5,
      hasLogo: true,
    ),
    Project(
      id: 'shisha',
      name: 'Shisha App',
      period: 'Mar 2025',
      category: ProjectCategory.mobileApp,
      shortDescription: 'An ordering app for shisha and drinks with dynamic pricing.',
      description:
          'An ordering app for shisha and drinks. Implemented item selection, dynamic pricing, and '
          'location handling with BLoC and SharedPreferences.',
      technologies: ['Flutter', 'Dart', 'BLoC', 'SharedPreferences'],
      screenshotCount: 5,
      hasLogo: true,
    ),
    Project(
      id: 'playstation_cafe',
      name: 'PlayStation Café App',
      period: 'Jul 2025',
      category: ProjectCategory.mobileApp,
      shortDescription: 'A booking system for PlayStation café sessions.',
      description:
          'A booking system for PlayStation café sessions. Used BLoC to manage session flow and '
          'user state, with location and map integration via Google Maps.',
      technologies: ['Flutter', 'Dart', 'BLoC', 'Google Maps'],
      screenshotCount: 3,
      hasLogo: true,
    ),
    Project(
      id: 'tammini',
      name: 'Tammini App',
      period: 'Jan 2025',
      category: ProjectCategory.mobileApp,
      shortDescription: 'A location-based safety alert app with geofencing.',
      description:
          'A location-based safety alert app. Built with GetX for real-time state updates, Google '
          'Maps integration, geofencing, and compass-based direction tracking.',
      technologies: ['Flutter', 'Dart', 'GetX', 'Google Maps', 'Geofencing'],
      screenshotCount: 4,
      hasLogo: true,
    ),
    Project(
      id: 'carpenters_account',
      name: "Carpenter's Account",
      period: 'Oct 2026',
      category: ProjectCategory.mobileApp,
      shortDescription: 'A wood-panel cutting calculator for carpentry workshops.',
      description:
          'A materials-planning app for carpenters. Users create a room/project, choose a base wood '
          'panel type (e.g. MDF 18mm), and add furniture pieces (wardrobes, beds, desks, drawer '
          'units) with precise dimensions, shelf/door/drawer counts, and panel-cutting rules; the '
          'app then calculates how many sheets of material the room requires.',
      technologies: ['Flutter', 'Dart'],
      screenshotCount: 5,
      hasLogo: true,
    ),
  ];
}
