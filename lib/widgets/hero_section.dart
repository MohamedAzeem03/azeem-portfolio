import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onViewProjectsTap;
  final VoidCallback? onGetInTouchTap;
  final VoidCallback? onAboutMeTap;

  const HeroSection({
    super.key,
    this.onViewProjectsTap,
    this.onGetInTouchTap,
    this.onAboutMeTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 7, child: _buildTextContent(context)),
                const SizedBox(width: 48),
                Expanded(flex: 5, child: _buildImage()),
              ],
            )
          : Column(
              children: [
                _buildTextContent(context),
                const SizedBox(height: 48),
                _buildImage(),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Full-Stack Developer • Building Digital Experiences',
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Hello I\'m',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 64,
            height: 1.1,
            color: Colors.black,
          ),
        ),
        Text(
          'Mohamed Azeem',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 64,
            height: 1.1,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        Text(
          'Full-Stack Developer',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 48,
            height: 1.1,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Passionate about building scalable, user-focused applications across mobile and backend platforms, with a focus on Flutter, Java, Spring Boot, and modern full-stack technologies.',
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.6,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: onViewProjectsTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Projects ',
                    style: GoogleFonts.dmMono(fontSize: 12),
                  ),
                  const Icon(Icons.arrow_outward, size: 14),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: onGetInTouchTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.grey.shade300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Get In Touch',
                style: GoogleFonts.dmMono(fontSize: 12),
              ),
            ),
            OutlinedButton(
              onPressed: onAboutMeTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.grey.shade300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('About Me', style: GoogleFonts.dmMono(fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Container(
          padding: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Text(
                'PROFILES:',
                style: GoogleFonts.dmMono(
                  fontSize: 10,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(width: 16),
              _socialLink('GitHub', FontAwesomeIcons.github, 'https://github.com/MohamedAzeem03'),
              _divider(),
              _socialLink('LinkedIn', FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/mohdazeem03/'),
              _divider(),
              _socialLink('Email', FontAwesomeIcons.solidEnvelope, 'mailto:mohdazm2005@gmail.com'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _socialLink(String text, dynamic icon, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 14, color: Colors.grey.shade600),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.dmMono(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text('•', style: TextStyle(color: Colors.grey.shade300)),
    );
  }

  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 580),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: ColorFiltered(
          colorFilter: const ColorFilter.matrix([
            0.2126,
            0.7152,
            0.0722,
            0,
            0,
            0.2126,
            0.7152,
            0.0722,
            0,
            0,
            0.2126,
            0.7152,
            0.0722,
            0,
            0,
            0,
            0,
            0,
            1,
            0,
          ]),
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
