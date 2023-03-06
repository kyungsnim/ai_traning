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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            richTextWidget(
              '목통증 예방 운동 프로그램',
              kBlackColor,
              20.sp,
              kFontWeightBold,
            ),
            SizedBox(height: 60.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                  onTap: () => Get.to(() => Practice1Page()), // Practice1Page()),
                  child: _buildCategory('스트레칭\n운동')),
              InkWell(
                  onTap: () => Get.to(() => Practice2Page()),
                  child: _buildCategory('마사지')),
              InkWell(
                  onTap: () => Get.to(() => Practice3Page()),
                  child: _buildCategory('자세교육')),
              InkWell(
                  onTap: () => Get.to(() => Practice4Page()),
                  child: _buildCategory('가동성\n결손\n목운동')),
              InkWell(
                  onTap: () => Get.to(() => Practice5Page()),
                  child: _buildCategory('움직임\n협은손상\n목운동')),
              InkWell(
                  onTap: () => Get.to(() => Practice6Page()),
                  child: _buildCategory('두통을\n동반한\n목통증')),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kGreyColor,
      ),
      alignment: Alignment.center,
      width: Get.width * 0.15,
      height: Get.width * 0.15,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
