import 'package:ai_traning/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:ai_traning/widgets/search_bar.dart';

import 'pushed_pageA.dart';
import 'pushed_pageS.dart';
import 'pushed_pageY.dart';

class MainScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  MainScreen(this.cameras);

  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'AlignAI',
                style: TextStyle(
                  color: Color(0xFFFE7C7C),
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Master Your Body Alignment',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('images/align.PNG'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: SizedBox(
                child: SearchBar('What pose do you wish to align?'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Strength Alignment',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: 150,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 140,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset('images/arm_press.PNG')),
                            onTap: () =>
                                onSelectA(context: context, modelName: 'posenet'),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 140,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset('images/squat.PNG')),
                            onTap: () =>
                                onSelectS(context: context, modelName: 'posenet'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Yoga Alignment',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              child: SizedBox(
                height: 150,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 140,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset('images/yoga4.PNG')),
                            onTap: () =>
                                onSelectY(context: context, modelName: 'posenet'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onSelectA({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageA(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectS({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectY({required BuildContext context, required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageY(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}
