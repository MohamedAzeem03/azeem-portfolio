import 'package:flutter/material.dart';


class AcademicsSection extends StatelessWidget {
  const AcademicsSection({super.key});

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
            '04 / ACADEMICS',
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            'Education',
            style: TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 48, color: Colors.black),
          ),
          Text(
            'Academic Background • 2022 — 2027',
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 48),
          _buildAcademicsItem(
            '2025 – 2027', 'Postgraduate',
            'Master of Computer Applications (MCA)', 'Francis Xavier Engineering College',
            'CGPA: 10/10 (upto 1st semester)',
            isMobile
          ),
          const Divider(color: Color(0xFFE5E5E5), height: 64),
          _buildAcademicsItem(
            '2022 – 2025', 'Undergraduate',
            'Bachelor of Science (B.Sc.) in Computer Science', 'Sri Ram Nallamani Yadava College of Arts & Science',
            'CGPA: 8.6/10',
            isMobile
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicsItem(String year, String type, String degree, String college, String details, bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: "$year • ",
              style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
              children: [
                TextSpan(
                  text: type,
                  style: TextStyle(fontFamily: 'DM Mono', fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                ),
              ]
            ),
          ),
          const SizedBox(height: 12),
          Text(
            degree,
            style: TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 24, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            college,
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 12),
          Text(
            details,
            style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Colors.grey.shade600, height: 1.6),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text.rich(
            TextSpan(
              text: "$year • ",
              style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
              children: [
                TextSpan(
                  text: type,
                  style: TextStyle(fontFamily: 'DM Mono', fontWeight: FontWeight.bold, color: Colors.grey.shade800),
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
                degree,
                style: TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 24, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                college,
                style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Colors.grey.shade600, height: 1.6),
          ),
        ),
      ],
    );
  }
}
