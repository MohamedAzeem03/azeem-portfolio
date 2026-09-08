import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _sendMessage() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mohdazm2005@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Portfolio Contact from ${_nameController.text}',
        'body': 'Name: ${_nameController.text}\nEmail: ${_emailController.text}\n\nMessage:\n${_messageController.text}',
      }),
    );
    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '06 / CONTACT',
            style: GoogleFonts.dmMono(fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'Get In Touch',
            style: GoogleFonts.cormorantGaramond(fontSize: 48, color: Colors.white),
          ),
          Text(
            'Feel free to reach out for collaborations or just a friendly hello.',
            style: GoogleFonts.dmMono(fontSize: 14, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 48),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(),
                    const SizedBox(height: 48),
                    _buildContactForm(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: _buildContactInfo()),
                    const SizedBox(width: 64),
                    Expanded(flex: 8, child: _buildContactForm()),
                  ],
                ),
          const SizedBox(height: 120),
          Center(
            child: Text(
              '© 2026 Mohamed Azeem. All rights reserved.',
              style: GoogleFonts.dmMono(fontSize: 10, color: Colors.grey.shade700),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoItem(FontAwesomeIcons.solidEnvelope, 'Email', 'mohdazm2005@gmail.com', 'mailto:mohdazm2005@gmail.com'),
        const SizedBox(height: 32),
        _infoItem(FontAwesomeIcons.phone, 'Phone', '+91 9080760466', 'tel:+919080760466'),
        const SizedBox(height: 32),
        _infoItem(FontAwesomeIcons.linkedin, 'LinkedIn', 'linkedin.com/in/mohdazeem03', 'https://www.linkedin.com/in/mohdazeem03/'),
        const SizedBox(height: 32),
        _infoItem(FontAwesomeIcons.github, 'GitHub', 'github.com/MohamedAzeem03', 'https://github.com/MohamedAzeem03'),
      ],
    );
  }

  Widget _infoItem(dynamic icon, String title, String value, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade800),
            ),
            child: FaIcon(icon, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: GoogleFonts.dmMono(fontSize: 10, color: Colors.grey.shade500, letterSpacing: 1.5),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.inter(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: _buildTextField('Name', _nameController)),
            const SizedBox(width: 16),
            Expanded(child: _buildTextField('Email', _emailController)),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextField('Message', _messageController, maxLines: 5),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _sendMessage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Send Message ', style: GoogleFonts.dmMono(fontSize: 12, fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_outward, size: 14),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade600),
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: const Color(0xFF111111),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade900),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade900),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
