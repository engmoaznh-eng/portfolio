enum ProjectCategory { mobileApp, ai, algorithm }

extension ProjectCategoryLabel on ProjectCategory {
  String get label {
    switch (this) {
      case ProjectCategory.mobileApp:
        return 'Mobile App';
      case ProjectCategory.ai:
        return 'AI';
      case ProjectCategory.algorithm:
        return 'Algorithm';
    }
  }
}

class Project {
  const Project({
    required this.id,
    required this.name,
    required this.period,
    required this.shortDescription,
    required this.description,
    required this.category,
    this.technologies = const [],
    this.screenshotCount = 3,
    this.githubUrl,
    this.liveUrl,
  });

  /// Folder name under `assets/images/projects/<id>/`
  final String id;
  final String name;
  final String period;
  final String shortDescription;
  final String description;
  final ProjectCategory category;
  final List<String> technologies;

  /// Number of screenshot-N.png files expected in the project's asset folder.
  final int screenshotCount;

  final String? githubUrl;
  final String? liveUrl;

  String get coverImage => 'assets/images/projects/$id/cover.png';

  List<String> get screenshots => List.generate(
        screenshotCount,
        (i) => 'assets/images/projects/$id/screenshot-${i + 1}.png',
      );
}
