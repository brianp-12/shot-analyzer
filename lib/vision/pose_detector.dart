  import 'package:ultralytics_yolo/ultralytics_yolo.dart';
  import 'package:flutter/material.dart';
  import 'package:image_picker/image_picker.dart';
  import 'dart:io';

  YOLOView yoloView = YOLOView(
    modelPath: 'assets/models/yolo11n-pose.mlpackage',
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
      final imageBytes = await selectedImage!.readAsBytes();
      if (selectedImage == null || yolo == null) return;
      setState(() {
        isLoading = true; 
      });
      final results = await yolo!.predict(imageBytes);
      print('$results');
      setState(() {
        detectionResults = results['detections'];
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
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectedImage != null)
                        Image.file(
                          selectedImage!,
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          ),
                        
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: pickImage,
                        child: const Text('Pick Image'),
                      ),
                      const SizedBox(height: 20),
                      if (detectionResults != null)
                        Text('Detected ${detectionResults!.length} objects'),
                    ],
                  ),
          ),
        ),
      );
    }
  }



