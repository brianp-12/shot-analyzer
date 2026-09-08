import 'package:flutter/material.dart';
import 'package:shot_analyzer/widgets/button.dart';

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
        ],
      ),
    );
  }
}