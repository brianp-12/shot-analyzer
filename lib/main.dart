import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shot Analyzer'),
        ),
        body: const Center(
          child: NavBar(),
        ),
      )
    );
  }
}
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Button(
            text: 'Home',
            color: Colors.orange,
            icon: Icons.home,
          ),
          Button(
            text: 'Profile',
            color: Colors.orange,
            icon: Icons.person,
          ),
          Button(
            text: 'Settings',
            color: Colors.orange,
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    }
  );
  final String text;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 70.0, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shot Analyzer'),
      ),
      body: const Center(

      ),
    );
  }
}