import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shot_analyzer/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Shot Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.light().textTheme
        ).apply(
          fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w700).fontFamily,
          displayColor: Colors.black,
        )
      ),
      home :const HomePage(),
    );

  }
}
