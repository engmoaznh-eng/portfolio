class Education {
  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    this.description,
  });

  final String degree;
  final String institution;
  final String period;
  final String? description;
}
