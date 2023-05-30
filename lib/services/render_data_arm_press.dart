import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';

class RenderDataArmPress extends StatefulWidget {
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  RenderDataArmPress(
      {required this.data, required this.previewH, required this.previewW, required this.screenH, required this.screenW});
  @override
  _RenderDataArmPressState createState() => _RenderDataArmPressState();
}

class _RenderDataArmPressState extends State<RenderDataArmPress> {
  late Map<String, List<double>> inputArr;

  String excercise = 'arm_press';
  double upperRange = 300;
  double lowerRange = 500;
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

  bool? _postureAccordingToExercise(Map<String, List<double>> poses) {
    setState(() {
      wristLX = poses['leftWrist']![0];
      wristLY = poses['leftWrist']![1];
      wristRX = poses['rightWrist']![0];
      wristRY = poses['rightWrist']![1];
      elbowLX = poses['leftElbow']![0];
      elbowRX = poses['rightElbow']![0];

      shoulderLY = poses['leftShoulder']![1];
      shoulderRY = poses['rightShoulder']![1];
      kneeLY = poses['leftKnee']![1];
      kneeRY = poses['rightKnee']![1];
    });
    if (excercise == 'arm_press') {
      if (squatUp) {
        return wristLX > 280 &&
            elbowLX > 280 &&
            wristRX < 95 &&
            elbowRX < 95 &&
            wristLY < 240 &&
            wristLY > 200 &&
            wristRY < 240 &&
            wristRY > 200;
      } else {
        return wristLY < 125 && wristRY < 125;
      }
    }
  }

  _checkCorrectPosture(Map<String, List<double>> poses) {
    if (_postureAccordingToExercise(poses)!) {
      if (!isCorrectPosture) {
        setState(() {
          isCorrectPosture = true;
          correctColor = Colors.green;
        });
      }
    } else {
      if (isCorrectPosture) {
        setState(() {
          isCorrectPosture = false;
          correctColor = Colors.red;
        });
      }
    }
  }

  Future<void> _countingLogic(Map<String, List<double>> poses) async {
    if (poses != null) {
      _checkCorrectPosture(poses);

      if (isCorrectPosture && squatUp && midCount == false) {
        //in correct initial posture
        setState(() {
          whatToDo = 'Lift';
          //correctColor = Colors.green;
        });
        squatUp = !squatUp;
        isCorrectPosture = false;
      }

      //lowered all the way
      if (isCorrectPosture && !squatUp && midCount == false) {
        midCount = true;
        isCorrectPosture = false;
        squatUp = !squatUp;
        setState(() {
          whatToDo = 'Drop';
          //correctColor = Colors.green;
        });
      }

      //back up
      if (midCount && isCorrectPosture) {
        incrementCounter();
        midCount = false;
        squatUp = !squatUp;
        setState(() {
          whatToDo = 'Lift';
        });
      }
    }
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    void _getKeyPoints(k, x, y) {
      if (k["part"] == 'leftEye') {
        leftEyePos.x = x - 0 + appState.horizontalGap;
        leftEyePos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'nose') {
        nosePos.x = x - 0 + appState.horizontalGap;
        nosePos.y = y - 0 + appState.verticalGap;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x - 0 + appState.horizontalGap;
        rightEyePos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x - 0 + appState.horizontalGap;
        leftShoulderPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x - 0 + appState.horizontalGap;
        rightShoulderPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x - 0 + appState.horizontalGap;
        leftElbowPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x - 0 + appState.horizontalGap;
        rightElbowPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x - 0 + appState.horizontalGap;
        leftWristPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x - 0 + appState.horizontalGap;
        rightWristPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x - 0 + appState.horizontalGap;
        leftHipPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x - 0 + appState.horizontalGap;
        rightHipPos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x - 0 + appState.horizontalGap;
        leftKneePos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x - 0 + appState.horizontalGap;
        rightKneePos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x - 0 + appState.horizontalGap;
        leftAnklePos.y = y - 80 + appState.verticalGap;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x - 0 + appState.horizontalGap;
        rightAnklePos.y = y - 80 + appState.verticalGap;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.data.forEach((re) {
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

          if (k["part"] == 'leftEye') {
            leftEyePos.x = x - 280;
            leftEyePos.y = y - 80;
          }
          if (k['part'] == 'nose') {
            nosePos.x = x - 280;
            nosePos.y = y - 80;
          }
          if (k["part"] == 'rightEye') {
            rightEyePos.x = x - 280;
            rightEyePos.y = y - 80;
          }
          return k['part'] == 'rightEye' ||
              k['part'] == 'leftEye' ||
              k['part'] == 'rightEar' ||
              k['part'] == 'leftEar' ||
              k['part'] == 'nose'
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
          ) : Positioned(
            left: x - 0 + appState.horizontalGap,
            top: y - 80 + appState.verticalGap,
            // width: 15,
            // height: 15,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blueAccent,
                  border: Border.all(color: Colors.white, width: 2)),
              width: 12,
              height: 12,
              // child: Text(
              //   "● ${k["part"]}",
              //   style: TextStyle(
              //     color: Color.fromRGBO(37, 213, 253, 1.0),
              //     fontSize: 12.0,
              //   ),
              // ),
            ),
          );
        }).toList();

        _countingLogic(inputArr);
        inputArr.clear();

        lists..addAll(list);
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Stack(
          children: [
            // CustomPaint(
            //   painter:
            //   TrianglePainter(left: leftEyePos, right: rightEyePos, bottom: nosePos),
            // ),
            CustomPaint(
              painter: CirclePainter(o: nosePos),
            ),
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
      ..strokeWidth = 3;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  Vector left;
  Vector right;
  Vector bottom;
  TrianglePainter({required this.left, required this.right, required this.bottom});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x - 50, left.y);
    final p2 = Offset(right.x + 50, right.y);
    final p3 = Offset(bottom.x, bottom.y);
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.9)

      ..strokeWidth = 50;
    canvas.drawLine(p1, p2, paint);
    // canvas.drawLine(p2, p3, paint);
    // canvas.drawLine(p3, p1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}


class CirclePainter extends CustomPainter {
  Vector o;
  CirclePainter({required this.o});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(o.x + 20, o.y + 50);

    canvas.drawCircle(p1, 70, Paint()
    ..color = Colors.white.withOpacity(0.9));
    // canvas.drawLine(p2, p3, paint);
    // canvas.drawLine(p3, p1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
