import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onExperienceTap;
  final VoidCallback? onAcademicsTap;
  final VoidCallback? onContactTap;

  const Header({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onSkillsTap,
    this.onExperienceTap,
    this.onAcademicsTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 768;
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Azeem',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'DEV',
                  style: GoogleFonts.dmMono(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
          if (isDesktop)
            Row(
              children: [
                _navLink('Home', onHomeTap),
                _navLink('About', onAboutTap),
                _navLink('Skills', onSkillsTap),
                _navLink('Experience', onExperienceTap),
                _navLink('Academics', onAcademicsTap),
                _navLink('Contact', onContactTap),
              ],
            ),
          OutlinedButton(
            onPressed: () async {
              final Uri url = Uri.parse('resume.pdf');
              await launchUrl(url, webOnlyWindowName: '_blank');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Resume ', style: GoogleFonts.dmMono(fontSize: 12)),
                const Icon(Icons.arrow_downward, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navLink(String text, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.dmMono(
            fontSize: 12,
            color: Colors.grey.shade600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
