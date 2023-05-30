import 'package:ai_traning/providers/app_state.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:ai_traning/importer.dart';

late List<CameraDescription> cameras;
bool isCameraOn = false;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 가로 모드 고정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }

  AppState appState = AppState();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppState>(create: (_) => appState),
  ], child: MyApp()));

  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: NewHomeScreen(cameras: cameras)
        );
      },
    );
  }
}