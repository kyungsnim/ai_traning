import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RenderDataArmPress extends StatefulWidget {
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  RenderDataArmPress(
      {required this.data,
        required this.previewH,
        required this.previewW,
        required this.screenH,
        required this.screenW});

  @override
  _RenderDataArmPressState createState() => _RenderDataArmPressState();
}

class _RenderDataArmPressState extends State<RenderDataArmPress> {
  late Map<String, List<double>> inputArr;

  String excercise = 'arm_press';

  // double upperRange = 300;
  // double lowerRange = 500;
  late bool midCount, isCorrectPosture;
  late int _counter;
  late Color correctColor;
  late double shoulderLY;
  late double shoulderRY;

  late double wristLX, wristLY, wristRX, wristRY, elbowLX, elbowRX;
  late double kneeRY;
  late double kneeLY;
  late bool squatUp;
  String whatToDo = 'Finding Posture';

  var leftEyePos = Vector(0, 0);
  var rightEyePos = Vector(0, 0);
  var nosePos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = new Map();
    midCount = false;
    isCorrectPosture = false;
    _counter = 0;
    correctColor = Colors.red;
    shoulderLY = 0;
    shoulderRY = 0;
    kneeRY = 0;
    kneeLY = 0;
    squatUp = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _getKeyPoints(k, x, y) {
      // if (k["part"] == 'leftEye') {
      //   leftEyePos.x = (x - 190) * 0.3;
      //   leftEyePos.y = ((y + 120) * 0.3) * 0.5;
      // }
      // if (k["part"] == 'nose') {
      //   nosePos.x = (x - 190) * 0.3;
      //   nosePos.y = ((y + 120) * 0.3) * 0.5;
      // }
      // if (k["part"] == 'rightEye') {
      //   rightEyePos.x = (x - 190) * 0.3;
      //   rightEyePos.y = ((y + 120) * 0.3) * 0.5;
      // }
      // if (k["part"] == 'leftShoulder') {
      //   leftShoulderPos.x = (x - 190) * 0.4;
      //   leftShoulderPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'rightShoulder') {
      //   rightShoulderPos.x = (x - 190) * 0.4;
      //   rightShoulderPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'leftElbow') {
      //   leftElbowPos.x = (x - 190) * 0.4;
      //   leftElbowPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'rightElbow') {
      //   rightElbowPos.x = (x - 190) * 0.4;
      //   rightElbowPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'leftWrist') {
      //   leftWristPos.x = (x - 190) * 0.4;
      //   leftWristPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'rightWrist') {
      //   rightWristPos.x = (x - 190) * 0.4;
      //   rightWristPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'leftHip') {
      //   leftHipPos.x = (x - 190) * 0.4;
      //   leftHipPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'rightHip') {
      //   rightHipPos.x = (x - 190) * 0.4;
      //   rightHipPos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'leftKnee') {
      //   leftKneePos.x = (x - 190) * 0.4;
      //   leftKneePos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'rightKnee') {
      //   rightKneePos.x = (x - 190) * 0.4;
      //   rightKneePos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'leftAnkle') {
      //   leftAnklePos.x = (x - 190) * 0.4;
      //   leftAnklePos.y = ((y + 120) * 0.3) * 0.6;
      // }
      // if (k["part"] == 'rightAnkle') {
      //   rightAnklePos.x = (x - 190) * 0.4;
      //   rightAnklePos.y = ((y + 120) * 0.3) * 0.6;
      // }

      if (k["part"] == 'leftEye') {
        leftEyePos.x = (x - 100) * 0.3;
        leftEyePos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'nose') {
        nosePos.x = (x - 100) * 0.3;
        nosePos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = (x - 100) * 0.3;
        rightEyePos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = (x - 150) * 0.3;
        leftShoulderPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = (x - 50) * 0.3;
        rightShoulderPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = (x - 150) * 0.3;
        leftElbowPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = (x - 50) * 0.3;
        rightElbowPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = (x - 150) * 0.3;
        leftWristPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = (x - 50) * 0.3;
        rightWristPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = (x - 150) * 0.3;
        leftHipPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = (x - 50) * 0.3;
        rightHipPos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = (x - 150) * 0.3;
        leftKneePos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = (x - 50) * 0.3;
        rightKneePos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = (x - 150) * 0.3;
        leftAnklePos.y = ((y + 320) * 0.3) * 0.5;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = (x - 50) * 0.3;
        rightAnklePos.y = ((y + 320) * 0.3) * 0.5;
      }

      // if (k["part"] == 'leftEye') {
      //   leftEyePos.x = x;
      //   leftEyePos.y = y;
      // }
      // if (k["part"] == 'nose') {
      //   nosePos.x = x;
      //   nosePos.y = y;
      // }
      // if (k["part"] == 'rightEye') {
      //   rightEyePos.x = x;
      //   rightEyePos.y = y;
      // }
      // if (k["part"] == 'leftShoulder') {
      //   leftShoulderPos.x = x;
      //   leftShoulderPos.y = y;
      // }
      // if (k["part"] == 'rightShoulder') {
      //   rightShoulderPos.x = x;
      //   rightShoulderPos.y = y;
      // }
      // if (k["part"] == 'leftElbow') {
      //   leftElbowPos.x = x;
      //   leftElbowPos.y = y;
      // }
      // if (k["part"] == 'rightElbow') {
      //   rightElbowPos.x = x;
      //   rightElbowPos.y = y;
      // }
      // if (k["part"] == 'leftWrist') {
      //   leftWristPos.x = x;
      //   leftWristPos.y = y;
      // }
      // if (k["part"] == 'rightWrist') {
      //   rightWristPos.x = x;
      //   rightWristPos.y = y;
      // }
      // if (k["part"] == 'leftHip') {
      //   leftHipPos.x = x;
      //   leftHipPos.y = y;
      // }
      // if (k["part"] == 'rightHip') {
      //   rightHipPos.x = x;
      //   rightHipPos.y = y;
      // }
      // if (k["part"] == 'leftKnee') {
      //   leftKneePos.x = x;
      //   leftKneePos.y = y;
      // }
      // if (k["part"] == 'rightKnee') {
      //   rightKneePos.x = x;
      //   rightKneePos.y = y;
      // }
      // if (k["part"] == 'leftAnkle') {
      //   leftAnklePos.x = x;
      //   leftAnklePos.y = y;
      // }
      // if (k["part"] == 'rightAnkle') {
      //   rightAnklePos.x = x;
      //   rightAnklePos.y = y;
      // }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.data.forEach((re) {
        if (re["keypoints"] != 'leftEye'
            && re["keypoints"] != 'rightEye'
            && re["keypoints"] != 'leftEar'
            && re["keypoints"] != 'rightEar'
            && re["keypoints"] != 'nose') {
          var list = re["keypoints"].values.map<Widget>((k) {
            var _x = k["x"];
            var _y = k["y"];
            var scaleW, scaleH, x, y;

            if (widget.screenH / widget.screenW >
                widget.previewH / widget.previewW) {
              scaleW = widget.screenH / widget.previewH * widget.previewW;
              scaleH = widget.screenH;
              var difW = (scaleW - widget.screenW) / scaleW;
              x = (_x - difW / 2) * scaleW;
              y = _y * scaleH;
            } else {
              scaleH = widget.screenW / widget.previewW * widget.previewH;
              scaleW = widget.screenW;
              var difH = (scaleH - widget.screenH) / scaleH;
              x = _x * scaleW;
              y = (_y - difH / 2) * scaleH;
            }
            inputArr[k['part']] = [x, y];
            //Mirroring
            if (x > 320) {
              var temp = x - 320;
              x = 320 - temp;
            } else {
              var temp = 320 - x;
              x = 320 + temp;
            }


            _getKeyPoints(k, x, y);

            // if (k["part"] == 'leftEye') {
            //   leftEyePos.x = (x - 190) * 0.4;
            //   leftEyePos.y = ((y + 120) * 0.3) * 0.6;
            // }
            // if (k['part'] == 'nose') {
            //   nosePos.x = (x - 190) * 0.4;
            //   nosePos.y = ((y + 120) * 0.3) * 0.6;
            // }
            // if (k["part"] == 'rightEye') {
            //   rightEyePos.x = (x - 190) * 0.4;
            //   rightEyePos.y = ((y + 120) * 0.3) * 0.6;
            // }
            return
              k['part'] == 'rightEye' ||
                  k['part'] == 'leftEye' ||
                  k['part'] == 'rightEar' ||
                  k['part'] == 'leftEar'
                  ? Positioned(
                left: (x - 300) * 0.4,
                top: ((y - 50) * 0.3) * 0.6,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blueAccent.withOpacity(0.4),
                      border: Border.all(color: Colors.white, width: 2)),
                  width: 0,
                  height: 0,
                ),
              ) :
              k['part'] == 'nose' ? Positioned(
                left: (x - 200) * 0.3,
                top: ((y + 120) * 0.3) * 0.5,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blueAccent.withOpacity(0.4),
                      border: Border.all(color: Colors.white, width: 2)),
                  width: 70,
                  height: 70,
                ),
              ) :
              Positioned(
                left: (x - 190) * 0.3,
                top: ((y + 120) * 0.3) * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent.withOpacity(0.4),
                      border: Border.all(color: Colors.white, width: 2)),
                  width: 12,
                  height: 12,
                ),
              );
          }).toList();

          inputArr.clear();

          lists..addAll(list);
        }
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Stack(
          children: [
            // CustomPaint(
            //   painter: TrianglePainter(bottom: nosePos),
            // ),
            CustomPaint(
              painter:
              MyPainter(left: leftShoulderPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftElbowPos, right: leftShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftWristPos, right: leftElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightElbowPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightWristPos, right: rightElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftShoulderPos, right: leftHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: leftKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftKneePos, right: leftAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightShoulderPos, right: rightHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightHipPos, right: rightKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightKneePos, right: rightAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: rightHipPos),
            ),
          ],
        ),
        Stack(children: _renderKeypoints()),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     height: 50,
        //     width: widget.screenW,
        //     decoration: BoxDecoration(
        //       color: correctColor,
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(25.0),
        //           topRight: Radius.circular(25)),
        //     ),
        //     child: Column(
        //       children: [
        //         Text(
        //           '$whatToDo\nArm Presses: ${_counter.toString()}',
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class Vector {
  double x, y;

  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;

  MyPainter({required this.left, required this.right});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  Vector bottom;

  TrianglePainter(
      {required this.bottom});

  @override
  void paint(Canvas canvas, Size size) {
    final p3 = Offset(bottom.x, bottom.y);
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4;
    // canvas.drawLine(p1, p2, paint);
    // canvas.drawLine(p2, p3, paint);
    canvas.drawLine(p3, p3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
