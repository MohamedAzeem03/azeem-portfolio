import 'package:flutter/material.dart';
import '../models/case_study.dart';

class CaseStudyModal extends StatelessWidget {
  final CaseStudy caseStudy;

  const CaseStudyModal({super.key, required this.caseStudy});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: isMobile ? double.infinity : 1000, // Widened modal for split view
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 24, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          caseStudy.projectName,
                          style: const TextStyle(
                            fontFamily: 'Cormorant Garamond',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          caseStudy.projectType,
                          style: TextStyle(
                            fontFamily: 'DM Mono',
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Colors.black54),
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            const Divider(height: 48, color: Color(0xFFE5E5E5)),
            // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isMobile) ...[
                      _buildSection('Challenge', caseStudy.challenge),
                      _buildSection('Solution', caseStudy.solution),
                    ] else
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildSection('Challenge', caseStudy.challenge)),
                            const VerticalDivider(width: 48, thickness: 1, color: Color(0xFFE5E5E5)),
                            Expanded(child: _buildSection('Solution', caseStudy.solution)),
                          ],
                        ),
                      ),
                    
                    if (isMobile) ...[
                      _buildListSection('My Role', caseStudy.myRole),
                      _buildListSection('Key Outcomes', caseStudy.keyOutcomes),
                    ] else
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildListSection('My Role', caseStudy.myRole)),
                            const VerticalDivider(width: 48, thickness: 1, color: Color(0xFFE5E5E5)),
                            Expanded(child: _buildListSection('Key Outcomes', caseStudy.keyOutcomes)),
                          ],
                        ),
                      ),
                    
                    const SizedBox(height: 16),
                    const Text(
                      'Technologies',
                      style: TextStyle(
                        fontFamily: 'Cormorant Garamond',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: caseStudy.technologies.map((t) => HoverTechBadge(tech: t)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cormorant Garamond',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cormorant Garamond',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Colors.grey.shade500,
                        height: 1.6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class HoverTechBadge extends StatefulWidget {
  final String tech;
  const HoverTechBadge({super.key, required this.tech});

  @override
  State<HoverTechBadge> createState() => _HoverTechBadgeState();
}

class _HoverTechBadgeState extends State<HoverTechBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.black : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _isHovered ? Colors.black : Colors.grey.shade200),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontFamily: 'DM Mono',
            fontSize: 11,
            color: _isHovered ? Colors.white : Colors.grey.shade800,
          ),
          child: Text(widget.tech.trim()),
        ),
      ),
    );
  }
}
