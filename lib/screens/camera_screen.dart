import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatelessWidget {
  final CameraDescription camera;
  const CameraScreen({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      body: Center(child: Text("Camera functionality here")),
    );
  }
}