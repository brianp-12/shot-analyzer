import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shot_analyzer/pages/home_page.dart';
import 'package:shot_analyzer/pages/analyze.dart';


    
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  
  @override
  State<MainApp> createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shot Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}