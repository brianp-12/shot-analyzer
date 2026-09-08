import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shot_analyzer/widgets/navbar.dart';
import 'package:shot_analyzer/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :const HomePage(),
    );
  }
}

