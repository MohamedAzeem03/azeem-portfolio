import 'package:flutter/material.dart';
import '../models/case_study.dart';
import 'case_study_modal.dart';

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
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          const Text(
            'My Projects',
            style: TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 48, color: Colors.black),
          ),
          Text(
            'Selected Works & Personal Endeavors',
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 48),
          
          _buildProjectItem(
            context,
            isMobile,
            const CaseStudy(
              projectName: 'Devora',
              projectType: 'Productivity & Challenge Management App',
              challenge: 'Developers need a structured way to create, participate in, and verify challenges while tracking their progress.',
              solution: 'Built a mobile application where users can create challenges, set deadlines, accept challenges, submit solutions with proof, and verify completed challenges.',
              myRole: [
                'Designed and developed the mobile application',
                'Implemented the challenge creation and participation workflow',
                'Developed frontend-backend communication',
                'Worked on the solution and proof submission flow',
                'Implemented challenge verification and progress tracking',
                'Worked on notifications'
              ],
              keyOutcomes: [
                'Challenge creation and acceptance workflow',
                'Deadline-based challenge management',
                'Solution and proof submission',
                'Challenge verification',
                'Points and streak tracking',
                'User notifications'
              ],
              technologies: ['Flutter', 'Dart', 'Java', 'Spring Boot', 'REST APIs', 'Firebase', 'Git', 'GitHub'],
            ),
            'Developed a mobile app for creating daily tasks and challenges, setting deadlines, sharing completion proof, and tracking points and streaks.',
          ),
          const Divider(color: Color(0xFFE5E5E5), height: 64),
          _buildProjectItem(
            context,
            isMobile,
            const CaseStudy(
              projectName: 'Your Friendeey',
              projectType: 'AI-Powered Mood Advice Web Application',
              challenge: 'Users may need simple guidance based on their current mood but may not know where to find personalized advice.',
              solution: 'Built an AI-powered web application that provides advice based on the user\'s selected mood.',
              myRole: [
                'Developed the React frontend',
                'Built backend functionality using Django',
                'Integrated the AI API',
                'Connected frontend and backend',
                'Designed the user interaction flow'
              ],
              keyOutcomes: [
                'Mood-based interaction',
                'AI-generated advice',
                'Frontend-backend integration',
                'AI API integration',
                'Personalized mood-based responses'
              ],
              technologies: ['React', 'Django', 'Python', 'AI API'],
            ),
            'Developed a web app that provides AI-based advice based on the user\'s mood, with React frontend, Django backend, and AI API integration.',
          ),
          const Divider(color: Color(0xFFE5E5E5), height: 64),
          _buildProjectItem(
            context,
            isMobile,
            const CaseStudy(
              projectName: 'AZM QuickBite',
              projectType: 'Food Ordering Web Application',
              challenge: 'Users need a simple way to browse food items, manage their cart, and place orders through a single application.',
              solution: 'Built a food ordering web application with user authentication, product management, cart functionality, order processing, and an AI-powered QuickBite Assistant.',
              myRole: [
                'Developed the web application',
                'Implemented user login and authentication',
                'Built product management functionality',
                'Implemented cart functionality',
                'Implemented order processing',
                'Integrated the QuickBite Assistant'
              ],
              keyOutcomes: [
                'Complete food ordering workflow',
                'User authentication',
                'Product management',
                'Shopping cart',
                'Order processing',
                'AI chatbot integration'
              ],
              technologies: ['Django', 'Python', 'HTML', 'CSS', 'JavaScript', 'Bootstrap'],
            ),
            'Developed a food ordering web app with user login, product management, cart, order processing, and an interactive QuickBite Assistant.',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(BuildContext context, bool isMobile, CaseStudy caseStudy, String description) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caseStudy.projectName,
            style: const TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            caseStudy.projectType,
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.grey.shade700, height: 1.6),
          ),
          const SizedBox(height: 24),
          Text(
            'Technologies:',
            style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: caseStudy.technologies.map((t) => HoverTechBadge(tech: t)).toList(),
          ),
          const SizedBox(height: 24),
          _buildCaseStudyButton(context, caseStudy),
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
                caseStudy.projectName,
                style: const TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                caseStudy.projectType,
                style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
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
                style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.grey.shade700, height: 1.6),
              ),
              const SizedBox(height: 24),
              Text(
                'Technologies:',
                style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: caseStudy.technologies.map((t) => HoverTechBadge(tech: t)).toList(),
              ),
              const SizedBox(height: 24),
              _buildCaseStudyButton(context, caseStudy),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaseStudyButton(BuildContext context, CaseStudy caseStudy) {
    return Align(
      alignment: Alignment.centerRight,
      child: _HoverButton(
        text: 'View Case Study',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CaseStudyModal(caseStudy: caseStudy),
          );
        },
      ),
    );
  }
}

class _HoverButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const _HoverButton({required this.onPressed, required this.text});

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOutSine,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _isHovered ? Colors.grey.shade400 : Colors.black,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutSine,
                style: TextStyle(
                  fontFamily: 'DM Mono',
                  fontSize: 12,
                  color: _isHovered ? Colors.black : Colors.white,
                ),
                child: Text('${widget.text} '),
              ),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: Colors.white,
                  end: _isHovered ? Colors.black : Colors.white,
                ),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutSine,
                builder: (context, color, child) {
                  return Icon(Icons.arrow_forward, size: 14, color: color);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
