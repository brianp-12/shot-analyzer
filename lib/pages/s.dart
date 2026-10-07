import 'package:flutter/material.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';
import 'package:shot_analyzer/analysis/shots.dart';

final yolo = YOLO(
  modelPath: 'assets/models/yolo11n-pose.mlpackage' 
  
  );



class AnalyzePage extends StatelessWidget {
  const AnalyzePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analyze Shots')),
      body: YOLOView(
        modelPath: 'assets/models/yolo11n-pose.mlpackage',
        onResult: (result) {
          // Handle the YOLO result here
          print('Detected objects: ${result.length} objects');
        },
      )
    );
  }
  double calculatePercentage() {
    int madeShots = 0;
    for (var shot in shots) {
      if (shot['made'] == true) {
        madeShots++;
      }
    }
    return (madeShots / shots.length) * 100;
  }
}
