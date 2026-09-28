import 'dart:math';
import 'package:flutter/material.dart';
import '../models/case_study.dart';
import 'case_study_modal.dart';

// Complete project data extracted into a list
final List<CaseStudy> _projects = [
  const CaseStudy(
    projectName: 'DEVORA',
    projectType: 'PERSONAL PROJECT',
    description: 'Developed a mobile app for creating daily tasks and challenges, setting deadlines, sharing completion proof, and tracking points and streaks.',
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
      'Challenge creation & acceptance',
      'Deadline-based tracking',
      'Proof submission system',
      'Automated challenge verification',
      'Points and streaks engine',
      'Push notifications'
    ],
    technologies: ['Flutter', 'Dart', 'Java', 'Spring Boot', 'REST APIs', 'Firebase', 'Git', 'GitHub'],
  ),
  const CaseStudy(
    projectName: 'YOUR FRIENDEEY',
    projectType: 'INTERNSHIP PROJECT',
    description: 'Developed a web app that provides AI-based advice based on the user\'s mood, with React frontend, Django backend, and AI API integration.',
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
      'Mood detection & analysis',
      'AI advice generation',
      'User authentication',
      'Frontend & backend integration',
      'Database management'
    ],
    technologies: ['React', 'Django', 'Python', 'AI API'],
  ),
  const CaseStudy(
    projectName: 'AZM QUICKBITE',
    projectType: 'PERSONAL PROJECT',
    description: 'Developed a food ordering web app with user login, product management, cart, order processing, and an interactive QuickBite Assistant.',
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
      'Food ordering workflow',
      'User authentication & profiles',
      'Inventory management',
      'Real-time shopping cart',
      'Order processing engine',
      'AI chatbot integration'
    ],
    technologies: ['Django', 'Python', 'HTML', 'CSS', 'JavaScript', 'Bootstrap'],
  ),
];

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final GlobalKey _sectionKey = GlobalKey();
  ScrollPosition? _scrollPosition;
  double _globalTopOffset = 0.0;
  bool _isOffsetCalculated = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = Scrollable.of(context).position;
    _scrollPosition?.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!_isOffsetCalculated) {
      _calculateOffset();
    }
    setState(() {}); // Trigger rebuild to update transforms
  }

  void _calculateOffset() {
    if (_sectionKey.currentContext != null) {
      final RenderBox box = _sectionKey.currentContext!.findRenderObject() as RenderBox;
      final ScrollableState scrollable = Scrollable.of(context)!;
      final RenderBox scrollableBox = scrollable.context.findRenderObject() as RenderBox;
      final Offset offset = box.localToGlobal(Offset.zero, ancestor: scrollableBox);
      _globalTopOffset = offset.dy + _scrollPosition!.pixels;
      _isOffsetCalculated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isOffsetCalculated) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _calculateOffset());
    }

    bool isMobile = MediaQuery.of(context).size.width < 768;
    bool isTablet = MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 1024;
    
    // Card Dimensions
    double cardHeight = isMobile ? 800.0 : (isTablet ? 750.0 : 650.0);
    double scrollDistancePerCard = cardHeight + 50.0;
    
    // Total section height = Required height for cards to stack perfectly + headers
    double maxLocalScroll = (_projects.length - 1) * scrollDistancePerCard;
    double maxCardTranslate = maxLocalScroll + (_projects.length - 1) * 40.0;
    double requiredStackHeight = maxCardTranslate + cardHeight;
    double headerHeight = 200.0; 
    double totalHeight = requiredStackHeight + headerHeight;

    double currentScroll = _scrollPosition?.pixels ?? 0.0;
    
    // Pin offset dictates how far from the top of the viewport the stack will lock.
    double pinViewportOffset = isMobile ? 80.0 : 150.0; 
    
    // localScroll is how far we've scrolled PAST the pin activation point
    double localScroll = max(0.0, currentScroll - _globalTopOffset + pinViewportOffset);

    return Container(
      key: _sectionKey,
      height: totalHeight,
      padding: const EdgeInsets.only(top: 80, bottom: 40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
            child: Text(
              'SELECTED PROJECTS',
              style: TextStyle(
                fontFamily: 'Cormorant Garamond', 
                fontSize: isMobile ? 42 : 64, 
                fontWeight: FontWeight.w900, 
                color: Colors.black,
                letterSpacing: -1,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 24 : 48),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48),
              child: Stack(
                clipBehavior: Clip.none,
                children: List.generate(_projects.length, (i) {
                  double startScroll = i * scrollDistancePerCard;
                  double dyRelativeToPin = max(i * 40.0, startScroll - localScroll);
                  
                  // Math: Move down by localScroll to counteract parent scrolling (pinning),
                  // then add the relative Y offset to arrange the stack.
                  double localDy = localScroll + dyRelativeToPin;
                  
                  // Push back progress: 0.0 to 1.0 as the *next* card slides over this one
                  double pushBackProgress = 0.0;
                  if (localScroll > startScroll) {
                    pushBackProgress = min(1.0, (localScroll - startScroll) / scrollDistancePerCard);
                  }
                  
                  // Inactive cards scale down and dim slightly
                  double scale = 1.0 - (pushBackProgress * 0.03); 
                  double opacity = 1.0 - (pushBackProgress * 0.2);

                  return Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: cardHeight,
                    child: Transform.translate(
                      offset: Offset(0, localDy),
                      child: Transform.scale(
                        scale: scale,
                        alignment: Alignment.topCenter,
                        child: Opacity(
                          opacity: opacity,
                          child: _buildProjectCard(context, _projects[i], i, isMobile, isTablet),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, CaseStudy project, int index, bool isMobile, bool isTablet) {
    String projectNum = '0${index + 1}';
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: isMobile
          ? _buildMobileCard(context, project, projectNum)
          : _buildDesktopCard(context, project, projectNum, isTablet),
    );
  }

  Widget _buildDesktopCard(BuildContext context, CaseStudy project, String projectNum, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 32.0 : 48.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number
                SizedBox(
                  width: isTablet ? 70 : 100,
                  child: Text(
                    projectNum,
                    style: TextStyle(fontFamily: 'Inter', fontSize: isTablet ? 56 : 72, fontWeight: FontWeight.bold, color: Colors.grey.shade300, height: 1),
                  ),
                ),
                // Details
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.projectType.toUpperCase(), style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5)),
                      const SizedBox(height: 8),
                      Text(project.projectName.toUpperCase(), style: TextStyle(fontFamily: 'Inter', fontSize: 36, fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: -0.5)),
                      const SizedBox(height: 24),
                      Text(project.description, style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.grey.shade700, height: 1.6)),
                      const SizedBox(height: 32),
                      Text('Technologies:', style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500)),
                      const SizedBox(height: 12),
                      Wrap(spacing: 8, runSpacing: 8, children: project.technologies.map((t) => HoverTechBadge(tech: t)).toList()),
                      const Spacer(),
                      _buildCaseStudyButton(context, project),
                    ],
                  ),
                ),
                SizedBox(width: isTablet ? 24 : 48),
                // Image Placeholder
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: project.imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(project.imagePath!, fit: BoxFit.cover),
                          )
                        : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image_outlined, size: 48, color: Colors.grey.shade300),
                                const SizedBox(height: 16),
                                Text('Image\nPlaceholder', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'DM Mono', color: Colors.grey.shade400, fontSize: 12)),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: Color(0xFFEEEEEE)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 32.0 : 48.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('KEY WORK', style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.5)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 32,
                runSpacing: 12,
                children: project.keyOutcomes.map((k) => SizedBox(
                  width: isTablet ? 250 : 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontFamily: 'Inter', color: Colors.black, fontSize: 14)),
                      Expanded(child: Text(k, style: TextStyle(fontFamily: 'Inter', color: Colors.grey.shade700, fontSize: 14, height: 1.4))),
                    ],
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCard(BuildContext context, CaseStudy project, String projectNum) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(projectNum, style: TextStyle(fontFamily: 'Inter', fontSize: 56, fontWeight: FontWeight.bold, color: Colors.grey.shade300, height: 1)),
            const SizedBox(height: 16),
            Text(project.projectType.toUpperCase(), style: TextStyle(fontFamily: 'DM Mono', fontSize: 10, color: Colors.grey.shade500, letterSpacing: 1.5)),
            const SizedBox(height: 4),
            Text(project.projectName.toUpperCase(), style: TextStyle(fontFamily: 'Inter', fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black)),
            const SizedBox(height: 16),
            Text(project.description, style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Colors.grey.shade700, height: 1.6)),
            const SizedBox(height: 24),
            Wrap(spacing: 6, runSpacing: 6, children: project.technologies.map((t) => HoverTechBadge(tech: t)).toList()),
            const SizedBox(height: 32),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: project.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(project.imagePath!, fit: BoxFit.cover),
                    )
                  : Center(child: Icon(Icons.image_outlined, size: 32, color: Colors.grey.shade300)),
            ),
            const SizedBox(height: 32),
            _buildCaseStudyButton(context, project),
            const SizedBox(height: 32),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 24),
            const Text('KEY WORK', style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.5)),
            const SizedBox(height: 16),
            ...project.keyOutcomes.map((k) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontFamily: 'Inter', color: Colors.black, fontSize: 14)),
                  Expanded(child: Text(k, style: TextStyle(fontFamily: 'Inter', color: Colors.grey.shade700, fontSize: 14, height: 1.4))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCaseStudyButton(BuildContext context, CaseStudy caseStudy) {
    return _HoverButton(
      text: 'VIEW CASE STUDY',
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => CaseStudyModal(caseStudy: caseStudy),
        );
      },
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.circular(32),
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
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: _isHovered ? Colors.black : Colors.white,
                ),
                child: Text('${widget.text}  '),
              ),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: Colors.white,
                  end: _isHovered ? Colors.black : Colors.white,
                ),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutSine,
                builder: (context, color, child) {
                  return Icon(Icons.arrow_forward, size: 16, color: color);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
