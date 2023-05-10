import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math';

import 'package:ai_traning/services/camera.dart';
import 'package:ai_traning/services/render_data.dart';
import 'package:ai_traning/services/render_data_yoga.dart';
import 'package:ai_traning/services/render_data_arm_press.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class PushedPageA extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageA({required this.cameras, required this.title});
  @override
  _PushedPageAState createState() => _PushedPageAState();
}

class _PushedPageAState extends State<PushedPageA> {
  List<dynamic> _data = [];
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    print('Model Response: ' + res.toString());
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('AlignAI Arm Press'),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white.withOpacity(0.0),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Camera(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          RenderDataArmPress(
            data: _data,
            previewH: max(_imageHeight, _imageWidth),
            previewW: min(_imageHeight, _imageWidth),
            screenH: screen.height,
            screenW: screen.width,
          ),
        ],
      ),
    );
  }
}
