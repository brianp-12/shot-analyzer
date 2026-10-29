import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PoseOverlay extends StatelessWidget {
  final List<dynamic>? detectionResults;
  final double imageWidth;
  final double imageHeight;

  const PoseOverlay({
    Key? key,
    required this.detectionResults,
    required this.imageWidth,
    required this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PosePainter(
        detectionResults: detectionResults,
        imageWidth: imageWidth,
        imageHeight: imageHeight,
      ),
    );
  }
}
class PosePainter extends CustomPainter {
  final List<dynamic>? detectionResults;
  final double imageWidth;
  final double imageHeight;
  @override
        bool shouldRepaint(covariant CustomPainter oldDelegate) {
          return true;
        }
  PosePainter({
    required this.detectionResults,
    required this.imageWidth,
    required this.imageHeight,
  });
    // indexs of keypoints in the output of the pose detection model
    static const connections = [
      [0, 1], [1, 2], [1, 3], [2, 4], 
      [5, 6], [5, 7], [7, 9], [6, 8], 
      [8, 10], [5, 11], [6, 12], 
      [11, 12], [11, 13], [13, 15], 
      [12, 14], [14, 16]
    ];
  @override
  // function to draw the keypoints and connections on the canvas
  void paint(Canvas canvas, Size size) {
    

    if (detectionResults == null || imageHeight <=0 || imageWidth <=0) return;

    final scaleX = size.width / imageWidth;
    final scaleY = size.height / imageHeight;
    final scale = scaleX < scaleY ? scaleX : scaleY;
    final dy = (size.height - imageHeight * scale) / 2;
    final dx = (size.width - imageWidth * scale) / 2;


    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
      
    final jointPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    for(final person in detectionResults!){
      if(person is! Map) continue;
        final rawPoints = person['coordinates'];
        if(rawPoints is! List) continue;
        final points = <Offset?>[];

        for (final point in rawPoints) {
          if(point !is Map || point['x'] is! num || point['y'] is! num) {
            points.add(null);
            continue;
          }
        
        final confidence = person['confidence'];
        if(confidence is! num || confidence < 0.3){
          points.add(null);
          continue;
        }
        final x = (point['x'] as num).toDouble();
        final y = (point['y'] as num).toDouble();
        points.add(
          Offset(
            dx + x * scale,
            dy + y * scale,
          )
        );
      }
      for(final connection in connections){
        final indexA = connection[0];
        final indexB = connection[1];
        
        if(indexA >= points.length || indexB >= points.length) {
          continue;
        }

        final a = points[indexA];
        final b = points[indexB];
        canvas.drawLine(
          ui.Offset(a?.dx ?? 0, a?.dy ?? 0),
          ui.Offset(b?.dx ?? 0, b?.dy ?? 0),
          
           linePaint
           );




      }
    }


  }
  

}


class DebugPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('Overlay canvas: $size');

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      50,
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(covariant DebugPainter oldDelegate) => false;
}
