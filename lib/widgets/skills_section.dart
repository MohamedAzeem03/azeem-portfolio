import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_icons/simple_icons.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Continuous infinite loop for the arrows
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Calmer, professional speed
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '// 01 SKILLS',
                    style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'My Skills',
                    style: TextStyle(fontFamily: 'Cormorant Garamond', fontSize: 48, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(width: 24, height: 1, color: Colors.black),
                      const SizedBox(width: 16),
                      Text(
                        'Technologies I use to build modern, scalable\nand user-friendly applications.',
                        style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade600, height: 1.6),
                      ),
                    ],
                  ),
                ],
              ),
              if (!isMobile)
                Text(
                  'Clean code. Scalable systems.\nReal world impact.',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, color: Colors.grey.shade500, height: 1.6),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Container(width: 24, height: 1, color: Colors.black),
              const SizedBox(width: 16),
              Text(
                'Technology  ×  Problem Solving  ×  Better Solutions',
                style: TextStyle(fontFamily: 'DM Mono', fontSize: 10, color: Colors.grey.shade400, letterSpacing: 1.5),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(height: 1, color: Colors.grey.shade200),
                ),
              ),
              const SizedBox(width: 16),
              Container(width: 48, height: 1, color: Colors.grey.shade300),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================
  // DESKTOP LAYOUT (Fixed 1200x700)
  // ==========================================
  Widget _buildDesktopLayout() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: 1200,
        height: 700,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                // Paint the paths and arrows in the background
                CustomPaint(
                  size: const Size(1200, 700),
                  painter: _DesktopConnectionsPainter(progress: _controller.value),
                ),
                // Nodes
                Positioned(
                  left: 500,
                  top: 50,
                  width: 200,
                  height: 100,
                  child: const _CloudNode(title: 'AWS'),
                ),
                Positioned(
                  left: 0,
                  top: 250,
                  width: 280,
                  height: 180,
                  child: _SkillNode(
                    title: 'FRONTEND / MOBILE',
                    children: [
                      const _TechIcon(Icon(SimpleIcons.flutter), 'Flutter'),
                      const _TechIcon(Icon(SimpleIcons.dart), 'Dart'),
                      const _VerticalDivider(),
                      const _TechIcon(Icon(SimpleIcons.html5), 'HTML'),
                      const _TechIcon(FaIcon(FontAwesomeIcons.css3), 'CSS'),
                      const _TechIcon(Icon(SimpleIcons.javascript), 'JavaScript'),
                    ],
                  ),
                ),
                Positioned(
                  left: 310,
                  top: 250,
                  width: 270,
                  height: 180,
                  child: _SkillNode(
                    title: 'BACKEND',
                    children: [
                      _TechIcon(
                        Stack(
                          children: [
                            Positioned(left: 0.5, top: 0.5, child: FaIcon(FontAwesomeIcons.java)),
                            const FaIcon(FontAwesomeIcons.java),
                          ],
                        ),
                        'Java'
                      ),
                      const _TechIcon(FaIcon(FontAwesomeIcons.leaf), 'Spring Boot'),
                      const _TechIcon(FaIcon(FontAwesomeIcons.shieldHalved), 'Spring Security'),
                      const _TechIcon(FaIcon(FontAwesomeIcons.key), 'JWT'),
                    ],
                  ),
                ),
                Positioned(
                  left: 620,
                  top: 250,
                  width: 230,
                  height: 180,
                  child: const _SkillNode(
                    title: 'DATABASE',
                    children: [
                      _TechIcon(FaIcon(FontAwesomeIcons.database), 'PostgreSQL'),
                      _TechIcon(FaIcon(FontAwesomeIcons.server), 'SQL'),
                    ],
                  ),
                ),
                Positioned(
                  left: 890,
                  top: 250,
                  width: 310,
                  height: 180,
                  child: const _SkillNode(
                    title: 'AI & INTEGRATION',
                    children: [
                      _TechIcon(FaIcon(FontAwesomeIcons.brain), 'AI APIs / LLM\nIntegration'),
                      _TechIcon(FaIcon(FontAwesomeIcons.fire), 'Firebase'),
                    ],
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 500,
                  width: 900,
                  height: 180,
                  child: const _BottomWideNode(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ==========================================
  // MOBILE LAYOUT (Vertical flow)
  // ==========================================
  Widget _buildMobileLayout() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              height: 100,
              child: _CloudNode(title: 'AWS'),
            ),
            _VerticalConnector(progress: _controller.value),
            _SkillNode(
              title: 'FRONTEND / MOBILE',
              children: [
                const _TechIcon(Icon(SimpleIcons.flutter), 'Flutter'),
                const _TechIcon(Icon(SimpleIcons.dart), 'Dart'),
                const _VerticalDivider(),
                const _TechIcon(Icon(SimpleIcons.html5), 'HTML'),
                const _TechIcon(FaIcon(FontAwesomeIcons.css3), 'CSS'),
                const _TechIcon(Icon(SimpleIcons.javascript), 'JavaScript'),
              ],
            ),
            _VerticalConnector(progress: _controller.value),
            _SkillNode(
              title: 'BACKEND',
              children: [
                _TechIcon(
                  Stack(
                    children: [
                      Positioned(left: 0.5, top: 0.5, child: FaIcon(FontAwesomeIcons.java)),
                      const FaIcon(FontAwesomeIcons.java),
                    ],
                  ),
                  'Java'
                ),
                const _TechIcon(FaIcon(FontAwesomeIcons.leaf), 'Spring Boot'),
                const _TechIcon(FaIcon(FontAwesomeIcons.shieldHalved), 'Security'),
                const _TechIcon(FaIcon(FontAwesomeIcons.key), 'JWT'),
              ],
            ),
            _VerticalConnector(progress: _controller.value),
            const _SkillNode(
              title: 'DATABASE',
              children: [
                _TechIcon(FaIcon(FontAwesomeIcons.database), 'PostgreSQL'),
                _TechIcon(FaIcon(FontAwesomeIcons.server), 'SQL'),
              ],
            ),
            _VerticalConnector(progress: _controller.value),
            const _SkillNode(
              title: 'AI & INTEGRATION',
              children: [
                _TechIcon(FaIcon(FontAwesomeIcons.brain), 'AI APIs / LLM'),
                _TechIcon(FaIcon(FontAwesomeIcons.fire), 'Firebase'),
              ],
            ),
            _VerticalConnector(progress: _controller.value),
            const _SkillNode(
              title: 'DEVOPS & TOOLS',
              children: [
                _TechIcon(FaIcon(FontAwesomeIcons.gitAlt), 'Git'),
                _TechIcon(FaIcon(FontAwesomeIcons.github), 'GitHub'),
                _TechIcon(FaIcon(FontAwesomeIcons.docker), 'Docker'),
                _TechIcon(FaIcon(FontAwesomeIcons.toolbox), 'Maven'),
                _TechIcon(FaIcon(FontAwesomeIcons.rocket), 'Postman'),
              ],
            ),
            _VerticalConnector(progress: _controller.value),
            const _SkillNode(
              title: 'PROGRAMMING LANGUAGES',
              children: [
                _TechIcon(FaIcon(FontAwesomeIcons.python), 'Python'),
                _TechIcon(FaIcon(FontAwesomeIcons.c), 'C/C++'),
              ],
            ),
          ],
        );
      },
    );
  }
}

// ==========================================
// VERTICAL CONNECTOR FOR MOBILE
// ==========================================
class _VerticalConnector extends StatelessWidget {
  final double progress;

  const _VerticalConnector({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: _MobileVerticalPainter(progress: progress),
      ),
    );
  }
}

class _MobileVerticalPainter extends CustomPainter {
  final double progress;
  _MobileVerticalPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height);

    _drawDashedLineAndArrow(canvas, path, progress);
  }

  @override
  bool shouldRepaint(covariant _MobileVerticalPainter oldDelegate) => oldDelegate.progress != progress;
}

// ==========================================
// DESKTOP PATH PAINTER
// ==========================================
class _DesktopConnectionsPainter extends CustomPainter {
  final double progress;

  _DesktopConnectionsPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. AWS to Backend
    Path awsToBackend = Path();
    awsToBackend.moveTo(600, 150);
    awsToBackend.lineTo(600, 200);
    awsToBackend.lineTo(445, 200);
    awsToBackend.lineTo(445, 250);

    // 2. AWS to Database
    Path awsToDatabase = Path();
    awsToDatabase.moveTo(600, 150);
    awsToDatabase.lineTo(600, 200);
    awsToDatabase.lineTo(735, 200);
    awsToDatabase.lineTo(735, 250);

    // 3. Frontend to Backend
    Path frontToBack = Path();
    frontToBack.moveTo(280, 340);
    frontToBack.lineTo(310, 340);

    // 4. Backend to Database
    Path backToDb = Path();
    backToDb.moveTo(580, 340);
    backToDb.lineTo(620, 340);

    // 5. Database to AI
    Path dbToAi = Path();
    dbToAi.moveTo(850, 340);
    dbToAi.lineTo(890, 340);

    // 6. Backend to DevOps (bottom row)
    Path backToDevops = Path();
    backToDevops.moveTo(445, 430);
    backToDevops.lineTo(445, 500);

    // Draw all paths and arrows
    _drawDashedLineAndArrow(canvas, awsToBackend, progress);
    _drawDashedLineAndArrow(canvas, awsToDatabase, progress);
    _drawDashedLineAndArrow(canvas, frontToBack, progress);
    _drawDashedLineAndArrow(canvas, backToDb, progress);
    _drawDashedLineAndArrow(canvas, dbToAi, progress);
    _drawDashedLineAndArrow(canvas, backToDevops, progress);
  }

  @override
  bool shouldRepaint(covariant _DesktopConnectionsPainter oldDelegate) => oldDelegate.progress != progress;
}

// ==========================================
// UTILITY: DRAW DASHED LINE & CONTINUOUS ARROWS
// ==========================================
void _drawDashedLineAndArrow(Canvas canvas, Path path, double progress) {
  // 1. Draw Dashed Line
  Paint dashPaint = Paint()
    ..color = Colors.grey.shade400
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  PathDashPainter(dashPaint, path, dashLength: 4, dashSpace: 4).draw(canvas);

  // 2. Draw Moving Arrow (One per line, constant speed, smooth fade in/out)
  for (PathMetric metric in path.computeMetrics()) {
    // 400 pixels per cycle over 5 seconds = 80 pixels/second (very smooth, professional)
    double distance = (progress * 400) % metric.length;
    
    Tangent? tangent = metric.getTangentForOffset(distance);
    if (tangent != null) {
      canvas.save();
      canvas.translate(tangent.position.dx, tangent.position.dy);
      canvas.rotate(math.atan2(tangent.vector.dy, tangent.vector.dx));

      // Fade in and out at the start and end of the path to prevent snapping
      double opacity = 1.0;
      if (distance < 15) opacity = distance / 15;
      if (distance > metric.length - 15) opacity = (metric.length - distance) / 15;

      Path arrowPath = Path();
      arrowPath.moveTo(5, 0);
      arrowPath.lineTo(-3, 3);
      arrowPath.lineTo(-1, 0);
      arrowPath.lineTo(-3, -3);
      arrowPath.close();

      Paint arrowPaint = Paint()
        ..color = Colors.black.withAlpha((opacity * 255).toInt())
        ..style = PaintingStyle.fill;

      canvas.drawPath(arrowPath, arrowPaint);
      canvas.restore();
    }
  }
}

class PathDashPainter {
  final Paint linePaint;
  final Path path;
  final double dashLength;
  final double dashSpace;

  PathDashPainter(this.linePaint, this.path, {this.dashLength = 5, this.dashSpace = 5});

  void draw(Canvas canvas) {
    for (PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        Path extractPath = metric.extractPath(distance, distance + dashLength);
        canvas.drawPath(extractPath, linePaint);
        distance += dashLength + dashSpace;
      }
    }
  }
}

// ==========================================
// NODE WIDGETS
// ==========================================
class _CloudNode extends StatefulWidget {
  final String title;
  const _CloudNode({required this.title});

  @override
  State<_CloudNode> createState() => _CloudNodeState();
}

class _CloudNodeState extends State<_CloudNode> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: _isHovered ? 0 : 5, bottom: _isHovered ? 5 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: _isHovered ? Colors.black : Colors.grey.shade300, width: _isHovered ? 2 : 1),
          boxShadow: [
            if (_isHovered)
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 10))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.aws, size: 40, color: Colors.grey.shade900),
            const SizedBox(height: 4),
            Text(
              widget.title,
              style: TextStyle(fontFamily: 'DM Mono', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillNode extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const _SkillNode({required this.title, required this.children});

  @override
  State<_SkillNode> createState() => _SkillNodeState();
}

class _SkillNodeState extends State<_SkillNode> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        margin: EdgeInsets.only(top: _isHovered ? 0 : 5, bottom: _isHovered ? 5 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _isHovered ? Colors.black54 : Colors.grey.shade300),
          boxShadow: [
            if (_isHovered)
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontFamily: 'DM Mono', fontSize: 11, color: Colors.grey.shade500, letterSpacing: 1.5),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children.map((child) => Expanded(child: child)).toList(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _BottomWideNode extends StatefulWidget {
  const _BottomWideNode();

  @override
  State<_BottomWideNode> createState() => _BottomWideNodeState();
}

class _BottomWideNodeState extends State<_BottomWideNode> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(32),
        margin: EdgeInsets.only(top: _isHovered ? 0 : 5, bottom: _isHovered ? 5 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _isHovered ? Colors.black54 : Colors.grey.shade300),
          boxShadow: [
            if (_isHovered)
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DEVOPS & TOOLS',
                    style: TextStyle(fontFamily: 'DM Mono', fontSize: 11, color: Colors.grey.shade500, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Build  •  Deploy  •  Manage',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: Colors.grey.shade400),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _TechIcon(FaIcon(FontAwesomeIcons.gitAlt), 'Git'),
                      _TechIcon(FaIcon(FontAwesomeIcons.github), 'GitHub'),
                      _TechIcon(FaIcon(FontAwesomeIcons.docker), 'Docker'),
                      _TechIcon(FaIcon(FontAwesomeIcons.toolbox), 'Maven'),
                      _TechIcon(FaIcon(FontAwesomeIcons.rocket), 'Postman'),
                    ].map((w) => Expanded(child: w)).toList(),
                  ),
                ],
              ),
            ),
            Container(width: 1, color: Colors.grey.shade200, margin: const EdgeInsets.symmetric(horizontal: 32)),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PROGRAMMING LANGUAGES',
                    style: TextStyle(fontFamily: 'DM Mono', fontSize: 11, color: Colors.grey.shade500, letterSpacing: 1.5),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _TechIcon(FaIcon(FontAwesomeIcons.python), 'Python'),
                      _TechIcon(FaIcon(FontAwesomeIcons.c), 'C/C++'),
                    ].map((w) => Expanded(child: w)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechIcon extends StatelessWidget {
  final Widget icon;
  final String label;
  const _TechIcon(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 32,
          child: Center(
            child: IconTheme(
              data: IconThemeData(color: Colors.grey.shade900, size: 28),
              child: icon,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Inter', fontSize: 11, color: Colors.grey.shade800),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1,
        height: 48,
        color: Colors.grey.shade300,
      ),
    );
  }
}
