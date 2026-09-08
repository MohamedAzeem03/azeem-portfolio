import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarqueeRibbon extends StatefulWidget {
  const MarqueeRibbon({super.key});

  @override
  State<MarqueeRibbon> createState() => _MarqueeRibbonState();
}

class _MarqueeRibbonState extends State<MarqueeRibbon> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  final List<Map<String, dynamic>> skills = [
    {'name': 'Java', 'icon': FontAwesomeIcons.java},
    {'name': 'Spring Boot', 'icon': FontAwesomeIcons.leaf},
    {'name': 'Flutter', 'icon': FontAwesomeIcons.flutter},
    {'name': 'Dart', 'icon': FontAwesomeIcons.code},
    {'name': 'REST APIs', 'icon': FontAwesomeIcons.server},
    {'name': 'PostgreSQL', 'icon': FontAwesomeIcons.database},
    {'name': 'Docker', 'icon': FontAwesomeIcons.docker},
    {'name': 'AWS', 'icon': FontAwesomeIcons.aws},
    {'name': 'Spring Security', 'icon': FontAwesomeIcons.shieldHalved},
    {'name': 'JWT', 'icon': FontAwesomeIcons.key},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        final currentOffset = _scrollController.offset;
        _scrollController.jumpTo(currentOffset + 1.5);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: IgnorePointer( // Ignore pointer to prevent manual scrolling interfering
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final skill = skills[index % skills.length];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  FaIcon(
                    skill['icon'],
                    size: 14,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    skill['name'].toString().toUpperCase(),
                    style: GoogleFonts.dmMono(
                      fontSize: 11,
                      letterSpacing: 2.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    '•',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
