class CaseStudy {
  final String projectName;
  final String projectType;
  final String challenge;
  final String solution;
  final String description;
  final String? imagePath;
  final List<String> myRole;
  final List<String> keyOutcomes;
  final List<String> technologies;
  final String? githubLink;
  final String? liveDemoLink;

  const CaseStudy({
    required this.projectName,
    required this.projectType,
    required this.challenge,
    required this.solution,
    required this.description,
    this.imagePath,
    required this.myRole,
    required this.keyOutcomes,
    required this.technologies,
    this.githubLink,
    this.liveDemoLink,
  });
}
