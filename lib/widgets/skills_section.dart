import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '01 / SKILLS',
            style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'My Skills',
            style: GoogleFonts.cormorantGaramond(fontSize: 48, color: Colors.black),
          ),
          Text(
            'Technologies & Tools • Academic & Project Experience',
            style: GoogleFonts.dmMono(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF0a0a0a),
              borderRadius: BorderRadius.circular(16),
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildBannerContent(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildBannerContent(),
                  ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              runSpacing: 24,
            children: [
              _buildSkillCard('Frontend / Mobile', 'Platform', ['Flutter', 'Dart', 'Responsive UI/UX', 'Cross-Platform']),
              _buildSkillCard('Backend', 'Engine', ['Java', 'Spring Boot', 'REST APIs', 'Maven Build Tool']),
              _buildSkillCard('Database', 'Storage', ['PostgreSQL', 'SQL / Relational Queries', 'Database Schema Design', 'Data Normalization']),
              _buildSkillCard('Security & Auth', 'Integrity', ['Spring Security', 'JSON Web Tokens (JWT)', 'Role-Based Access (RBAC)', 'Password Encryption']),
              _buildSkillCard('Tools', 'Workflow', ['Git & GitHub', 'Postman', 'VS Code & IntelliJ IDEA', 'Android Studio']),
              _buildSkillCard('Cloud & DevOps', 'Infrastructure', ['Docker Basics', 'AWS Fundamentals', 'Linux Command Line', 'Cloud Infrastructure']),
              _buildSkillCard('AI & Protocols', 'Modern Protocols', ['JSON / HTTP / HTTPS', 'AI APIs & LLM Integrations', 'Firebase Essentials', 'Third-Party Webhooks']),
              _buildSkillCard('Languages', 'Foundations', ['C / C++', 'Python', 'HTML & CSS', 'JavaScript']),
            ],
          ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBannerContent() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PRIMARY CORE STACK',
            style: GoogleFonts.dmMono(fontSize: 10, color: Colors.grey.shade400, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'Java + Spring Boot + Flutter + Dart + REST APIs + PostgreSQL',
            style: GoogleFonts.cormorantGaramond(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Text(
          'Cross-Platform & Backend Engineering',
          style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade300),
        ),
      ),
    ];
  }

  Widget _buildSkillCard(String title, String subtitle, List<String> items) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle.toUpperCase(),
            style: GoogleFonts.dmMono(fontSize: 11, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.cormorantGaramond(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.circle)),
                const SizedBox(width: 8),
                Expanded(child: Text(item, style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade700))),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}

