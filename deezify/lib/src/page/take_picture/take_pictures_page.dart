import 'dart:io';

import 'package:camera/camera.dart';
import 'package:deezify/src/widget/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TakePicturePage extends StatefulWidget {

  static const routeName = '/takePicture';

  @override
  State<TakePicturePage> createState() => _TakePicturePage();
}

class _TakePicturePage extends State<TakePicturePage> {
  bool screenLoaded = false;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late CameraDescription camera;

  Future<CameraDescription> getCameraDescription() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    return cameras.first;
  }

  @override
  void initState() {
    super.initState();
    getCameraDescription().then((value) {
      camera = value;
      _controller = CameraController(
        camera,
        ResolutionPreset.max,
      );
      _initializeControllerFuture = _controller.initialize().then((value) {
        setState(() {
          screenLoaded = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        children: [
          Expanded(
            child: screenLoaded == true ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ) : const LoadingDialog(title: "Loading"),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              takePicture();
            },
          ),
        ],
      ),
    );
  }

  void takePicture() async {
    await _initializeControllerFuture;
    final image = await _controller.takePicture();
    final result = await Navigator.of(context).pushNamed(
      "/displayPicture", arguments : image.path
    );
    
    if (result != null) {
      Navigator.pop(context, result);
    }
  }

}