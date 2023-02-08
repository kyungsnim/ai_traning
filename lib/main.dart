import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'main_screen.dart';
import 'home_screen.dart';
import 'package:ai_traning/importer.dart';

late List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 가로 모드 고정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          home: NewHomeScreen(cameras: cameras),
          //home: MainScreen(cameras),
          // routes: {
          //   MainScreen.id: (context) => MainScreen(cameras),
          //DemoScreen.id: (context) => DemoScreen(),
          // },
        );
      },
    );
  }
}
