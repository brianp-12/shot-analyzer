import 'package:ultralytics_yolo/ultralytics_yolo.dart';

YOLOView yoloView = YOLOView(
  modelPath: 'assets/models/yolo11n-pose.mlpackage',
  onResult: (result) {
    // Handle the YOLO result here
    print('Detected objects: ${result.length} objects');
    
  },
);