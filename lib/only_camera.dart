import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';

import '../main.dart';

typedef void Callback(List<dynamic> list, int h, int w);

class OnlyCamera extends StatefulWidget {
  final List<CameraDescription> cameras;

  OnlyCamera({required this.cameras});

  @override
  _OnlyCameraState createState() => new _OnlyCameraState();
}

class _OnlyCameraState extends State<OnlyCamera> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();

    if (widget.cameras == null || widget.cameras.length < 1) {
      print('No camera is found');
    } else {
      controller = new CameraController(
        widget.cameras[1],
        ResolutionPreset.max,
      );
      // controller.setZoomLevel(0.3);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});

        controller.startImageStream((CameraImage img) {});
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }

    // return OverflowBox(
    //   maxHeight: 200,
    //   maxWidth: 250,
    //   child: CameraPreview(controller),
    return Positioned(
      bottom: 20,
      right: 10,
      child: Container(
          width: 250,
          height: 150,
          child: CameraPreview(controller)),
    );
    // final mediaSize = MediaQuery.of(context).size;
    // final scale = 5 / (controller.value.aspectRatio * mediaSize.aspectRatio);
    // // print('>>>>>>>> scale : $scale');
    // return ClipRect(
    //   clipper: _MediaSizeClipper(mediaSize),
    //   child: Transform.scale(
    //     scale: scale,
    //     alignment: Alignment.center,
    //     child: CameraPreview(controller),
    //   ),
    // );
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
