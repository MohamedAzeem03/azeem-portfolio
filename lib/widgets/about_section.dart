import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDesktop 
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileColumn(),
                  const SizedBox(width: 64), // Exactly 64px gap
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildAboutMeColumn()),
                        const SizedBox(width: 48),
                        Expanded(child: _buildWhatIDoColumn()),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileColumn(),
                  const SizedBox(height: 48),
                  _buildAboutMeColumn(),
                  const SizedBox(height: 48),
                  _buildWhatIDoColumn(),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildProfileColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 180,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0,      0,      0,      1, 0,
              ]),
              child: Image.asset(
                'assets/images/profile.png', 
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('05 / PROFILE', style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5)),
        Text('Mohamed Azeem', style: GoogleFonts.cormorantGaramond(fontSize: 32, color: Colors.black)),
        Text('Full-Stack Application Developer', style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildAboutMeColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Me', style: GoogleFonts.cormorantGaramond(fontSize: 28, color: Colors.black)),
        const SizedBox(height: 16),
        Text(
          'I am an MCA student at Francis Xavier Engineering College with a strong drive for software engineering. My work focuses on building robust cross-platform applications and secure, performant backends.',
          style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600, height: 1.6),
        ),
        const SizedBox(height: 16),
        Text(
          'I believe in clean architecture, type-safety, and writing maintainable code that scales smoothly from development to production.',
          style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildWhatIDoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What I Do', style: GoogleFonts.cormorantGaramond(fontSize: 28, color: Colors.black)),
        const SizedBox(height: 16),
        Text(
          'Crafting cohesive digital systems using Flutter for unified client interfaces and Java with Spring Boot for enterprise-ready APIs.',
          style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600, height: 1.6),
        ),
        const SizedBox(height: 16),
        Text(
          'Designing relational databases with PostgreSQL, implementing authentication layers with JWT and Spring Security, and exploring cloud-native paradigms.',
          style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600, height: 1.6),
        ),
      ],
    );
  }
}
