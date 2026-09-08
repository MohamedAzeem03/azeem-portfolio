import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/header.dart';
import 'widgets/hero_section.dart';
import 'widgets/marquee_ribbon.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/academics_section.dart';
import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _academicsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            onHomeTap: () => _scrollToSection(_homeKey),
            onAboutTap: () => _scrollToSection(_aboutKey),
            onSkillsTap: () => _scrollToSection(_skillsKey),
            onExperienceTap: () => _scrollToSection(_experienceKey),
            onAcademicsTap: () => _scrollToSection(_academicsKey),
            onContactTap: () => _scrollToSection(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(
                    key: _homeKey,
                    onViewProjectsTap: () => _scrollToSection(_projectsKey),
                    onGetInTouchTap: () => _scrollToSection(_contactKey),
                    onAboutMeTap: () => _scrollToSection(_aboutKey),
                  ),
                  const MarqueeRibbon(),
                  SkillsSection(key: _skillsKey),
                  ProjectsSection(key: _projectsKey),
                  ExperienceSection(key: _experienceKey),
                  AcademicsSection(key: _academicsKey),
                  AboutSection(key: _aboutKey),
                  ContactSection(key: _contactKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
