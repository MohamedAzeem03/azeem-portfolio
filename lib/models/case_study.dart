class CaseStudy {
  final String projectName;
  final String projectType;
  final String challenge;
  final String solution;
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
    required this.myRole,
    required this.keyOutcomes,
    required this.technologies,
    this.githubLink,
    this.liveDemoLink,
  });
}
