import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ai_traning/importer.dart';

class NewHomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const NewHomeScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xFF78BCBE),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLandscape ? SizedBox(height: 60.h) : SizedBox(),
              richTextWidget(
                '목통증 예방 운동 프로그램',
                Colors.white,
                30,
                kFontWeightRegular,
              ),
              SizedBox(height: 60.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                    onTap: () => Get.to(() => Practice1Page()), // Practice1Page()),
                    child: _buildCategory('스트레칭 운동', isLandscape)),
                InkWell(
                    onTap: () => Get.to(() => Practice2Page()),
                    child: _buildCategory('마사지', isLandscape)),
              ]),
              SizedBox(height: 20.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                    onTap: () => Get.to(() => Practice3Page()),
                    child: _buildCategory('자세교육', isLandscape)),
                InkWell(
                    onTap: () => Get.to(() => Practice4Page()),
                    child: _buildCategory('가동성 결손 목운동', isLandscape)),
              ]),
              SizedBox(height: 20.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                    onTap: () => Get.to(() => Practice5Page()),
                    child: _buildCategory('움직임 협은손상 목운동', isLandscape)),
                InkWell(
                    onTap: () => Get.to(() => Practice6Page()),
                    child: _buildCategory('두통을 동반한 목통증', isLandscape)),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, bool isLandscape) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF78BCBE),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      width: Get.width * 0.45,
      height: isLandscape ? Get.width * 0.1 : Get.width * 0.4,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 18,
            wordSpacing: 0.5,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
