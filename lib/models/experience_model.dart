class Experience {
  const Experience({
    required this.title,
    required this.period,
    required this.description,
    this.company,
    this.technologies = const [],
  });

  final String title;

  /// Optional — omitted entirely from the UI when the CV doesn't name one.
  final String? company;
  final String period;
  final String description;
  final List<String> technologies;
}
