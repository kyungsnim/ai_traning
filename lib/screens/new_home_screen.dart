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
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xFF78BCBE),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            richTextWidget(
              '목통증 예방 운동 프로그램',
              Colors.white,
              30.sp,
              kFontWeightRegular,
            ),
            SizedBox(height: 60.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                  onTap: () => Get.to(() => Practice1Page()), // Practice1Page()),
                  child: _buildCategory('스트레칭 운동')),
              InkWell(
                  onTap: () => Get.to(() => Practice2Page()),
                  child: _buildCategory('마사지')),
            ]),
            SizedBox(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                  onTap: () => Get.to(() => Practice3Page()),
                  child: _buildCategory('자세교육')),
              InkWell(
                  onTap: () => Get.to(() => Practice4Page()),
                  child: _buildCategory('가동성 결손 목운동')),
            ]),
            SizedBox(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                  onTap: () => Get.to(() => Practice5Page()),
                  child: _buildCategory('움직임 협은손상 목운동')),
              InkWell(
                  onTap: () => Get.to(() => Practice6Page()),
                  child: _buildCategory('두통을 동반한 목통증')),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title) {
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
      height: Get.width * 0.4,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 18.sp,
            wordSpacing: 0.5,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
