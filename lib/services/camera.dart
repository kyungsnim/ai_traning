import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../providers/app_state.dart';

typedef void Callback(List<dynamic> list, int h, int w);

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Callback setRecognitions;

  Camera({required this.cameras, required this.setRecognitions});

  @override
  _CameraState createState() => new _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  bool isDetecting = false;

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

        controller.startImageStream((CameraImage img) {
          if (!isDetecting) {
            isDetecting = true;

            int startTime = new DateTime.now().millisecondsSinceEpoch;

            Tflite.runPoseNetOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              imageHeight: img.height,
              imageWidth: img.width,
              //numResults: 2,
              numResults: 1,
              rotation: 0,
              // rotation: -90,
              threshold: 0.5,
              nmsRadius: 10,
            ).then((recognitions) {
              int endTime = new DateTime.now().millisecondsSinceEpoch;
              // print("Detection took ${endTime - startTime}");

              widget.setRecognitions(recognitions!, img.height, img.width);

              isDetecting = false;
            });
          }
        });
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
    final props = Provider.of<AppState>(context);
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }

    Size? tmp = MediaQuery.of(context).size;
    var screenH = math.max(tmp.height, tmp.width);
    var screenW = math.min(tmp.height, tmp.width);
    tmp = controller.value.previewSize;
    var previewH = math.max(tmp!.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    var screenRatio = screenH / screenW;
    var previewRatio = previewH / previewW;

    // return OverflowBox(
    //   maxHeight:
    //       screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
    //   maxWidth:
    //       screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
    //   child: CameraPreview(controller),
    // );
    return InkWell(
      onTap: () => props.changeCameraMode(),
      child: OverflowBox(
          maxHeight:
              screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
          maxWidth:
              screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
        child: props.isCameraOn ? CameraPreview(controller) : Container(
          width: 100.w,
          height: 130.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.grey.withOpacity(0.4),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
