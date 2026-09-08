import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '03 / EXPERIENCE',
            style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'My Experience',
            style: GoogleFonts.cormorantGaramond(fontSize: 48, color: Colors.black),
          ),
          Text(
            'Professional Journey • 2023 — Present',
            style: GoogleFonts.dmMono(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 48),
          _buildExperienceItem(
            '2026', 'Internship',
            'Python Full Stack Intern', 'Alric/Altrik Infotech Pvt. Ltd., Trivandrum',
            'Practical engagement in Python full-stack web development, implementing backend logic, connecting endpoints, and developing modular dynamic web applications.'
          ),
          const Divider(color: Color(0xFFE5E5E5), height: 64),
          _buildExperienceItem(
            '2025', 'Internship',
            'Networking & Security Intern', 'PROMPT INFOTECH',
            'Gained essential foundational knowledge in computer networking, TCP/IP protocols, network hardware configurations, and core digital security practices.'
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(String year, String type, String role, String company, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text.rich(
            TextSpan(
              text: "$year • ",
              style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500),
              children: [
                TextSpan(
                  text: type,
                  style: GoogleFonts.dmMono(fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                ),
              ]
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role,
                style: GoogleFonts.cormorantGaramond(fontSize: 24, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                company,
                style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            description,
            style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600, height: 1.6),
          ),
        ),
      ],
    );
  }
}

