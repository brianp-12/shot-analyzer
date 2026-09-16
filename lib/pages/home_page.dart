import 'package:flutter/material.dart';
import 'package:shot_analyzer/widgets/navbar.dart';
import 'package:shot_analyzer/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Button(
                  text: 'Analyze Shot',
                  color: Colors.orange,
                  icon: Icons.analytics,
                  padding: EdgeInsets.all(16.0),
                ),
              ],
            ),

          
        ),
        bottomNavigationBar: const NavBar(),
      
      
    );
  }
}