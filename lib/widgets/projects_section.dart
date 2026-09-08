import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            '02 / PROJECTS',
            style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'My Projects',
            style: GoogleFonts.cormorantGaramond(fontSize: 48, color: Colors.black),
          ),
          Text(
            'Selected Works & Personal Endeavors',
            style: GoogleFonts.dmMono(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 48),
          
          _buildProjectItem(
            'Devora',
            'Productivity & Challenge Management App',
            'Flutter, Dart, Java, Spring Boot, REST APIs, Firebase, Git, GitHub',
            'Developed a mobile app for creating daily tasks and challenges, setting deadlines, sharing completion proof, and tracking points and streaks.',
            isMobile,
          ),
          const Divider(color: Color(0xFFE5E5E5), height: 64),
          _buildProjectItem(
            'Your Friendeey',
            'AI-Powered Mood Advice Web Application',
            'React, Django, Python, AI API',
            'Developed a web app that provides AI-based advice based on the user\'s mood, with React frontend, Django backend, and AI API integration.',
            isMobile,
          ),
          const Divider(color: Color(0xFFE5E5E5), height: 64),
          _buildProjectItem(
            'AZM QuickBite',
            'Food Ordering Web Application',
            'Django, Python, HTML, CSS, JavaScript, Bootstrap',
            'Developed a food ordering web app with user login, product management, cart, order processing, and an interactive QuickBite Assistant.',
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(String name, String type, String tech, String description, bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.cormorantGaramond(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            type,
            style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.grey.shade700, height: 1.6),
          ),
          const SizedBox(height: 24),
          Text(
            'Technologies:',
            style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech.split(', ').map((t) => _buildTechBadge(t)).toList(),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.cormorantGaramond(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                type,
                style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: GoogleFonts.inter(fontSize: 16, color: Colors.grey.shade700, height: 1.6),
              ),
              const SizedBox(height: 24),
              Text(
                'Technologies:',
                style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tech.split(', ').map((t) => _buildTechBadge(t)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechBadge(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        tech.trim(),
        style: GoogleFonts.dmMono(fontSize: 11, color: Colors.grey.shade800),
      ),
    );
  }
}
