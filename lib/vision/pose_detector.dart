    import 'package:ultralytics_yolo/ultralytics_yolo.dart';
    import 'package:flutter/material.dart';
    import 'package:image_picker/image_picker.dart';
    import 'pose_overlay.dart';
    import 'dart:io';

    YOLOView yoloView = YOLOView(
      modelPath: 'assets/models/yolo11n-pose.mlpackage',
      task: YOLOTask.pose,
      onResult: (result) {
        // Handle the YOLO result here
        
      },
    );

    class PoseDetector extends StatefulWidget {
      const PoseDetector({super.key});

      @override
      _PoseDetectorState createState() => _PoseDetectorState();
    }
    class _PoseDetectorState extends State<PoseDetector> {
      @override
      YOLO? yolo;
      File? selectedImage;
      List<dynamic>? detectionResults;
      bool isLoading = false;
      void initState(){
        super.initState();
        loadYOLO();
      }
      Future<void> loadYOLO() async {
        setState(() {
          isLoading = true;
        });
        yolo = YOLO(
        modelPath: 'assets/models/yolo11n-pose.tflite',
        );
        await yolo!.loadModel();
        print('YOLO model loaded successfully');
        setState(() {
          isLoading = false;
        });
      }
      Future<void> pickImage() async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            selectedImage = File(pickedFile.path);
          });
        }
        await runPrediction();
      }
      Future<void> runPrediction() async {
        if (selectedImage == null || yolo == null) return;
        final imageBytes = await selectedImage!.readAsBytes();
        final results = await yolo!.predict(imageBytes);

debugPrint('Result keys: ${results.keys}');

final poses = results['detections'] as List? ?? [];

debugPrint('Pose count: ${poses.length}');

        if (poses.isNotEmpty) {
            debugPrint('First pose: ${poses.first}');
            if (poses.first is Map) {
              debugPrint('Keypoints: ${poses.first['keypoints']}');
          }
        }

        setState(() {
          detectionResults = poses;
          isLoading = false;
          });



      }
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Pose Detector'),
            ),
           
      body: Center(
      child: isLoading
      ? const CircularProgressIndicator()
      : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
             if (selectedImage != null)
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    selectedImage!,
                  fit: BoxFit.contain,
                  ),
        CustomPaint(
          painter: DebugPainter(),
        ),
      ],
    ),
  ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 20),
                if (detectionResults != null)
                  Text(
                  ' Detected ${detectionResults!.length} objects',
                  ),
             ],
            ),
          ),
        ),

      ),
    );
  }
}



