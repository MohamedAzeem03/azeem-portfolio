import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azeem | Full-Stack Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF10B981),
          surface: Colors.white,
          onSurface: const Color(0xFF111111),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.cormorantGaramond(
            color: const Color(0xFF0a0a0a),
            fontWeight: FontWeight.w400,
            height: 0.95,
          ),
          displayMedium: GoogleFonts.cormorantGaramond(
            color: const Color(0xFF0a0a0a),
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.inter(
            color: const Color(0xFF111827),
          ),
          bodyMedium: GoogleFonts.inter(
            color: const Color(0xFF4b5563), // text-neutral-600
          ),
          labelSmall: GoogleFonts.dmMono(
            color: const Color(0xFF737373),
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
