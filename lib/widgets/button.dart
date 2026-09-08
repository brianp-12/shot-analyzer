import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.padding,
  });
  final String text;  
  final Color color;
  final IconData icon;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {


      return Padding(
        padding: padding,
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
        ),
      ));
  }
} 