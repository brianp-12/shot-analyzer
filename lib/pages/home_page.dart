import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shot_analyzer/widgets/navbar.dart';
import 'package:shot_analyzer/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      home: Scaffold(
        appBar: AppBar(
          title: 
          Align( 
            alignment: Alignment.topLeft,
            child: 
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  'Shot\nAnalyzer',
                ),
              ),
            )
            
           ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column (
            children: [
              Button(
                text: 'Analyze',
                color: Colors.orange,
                icon: Icons.home,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              Button(
                text: 'Profile',
                color: Colors.orange,
                icon: Icons.person,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              Button(
                text: 'Settings',
                color: Colors.orange,
                icon: Icons.settings,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              // Add other widgets here
            ],

          ),)
        ),
        bottomNavigationBar: const NavBar(),
      )
    );
  }
}