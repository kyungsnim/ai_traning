import 'package:ai_traning/importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Practice1Page extends StatefulWidget {
  const Practice1Page({Key? key}) : super(key: key);

  @override
  State<Practice1Page> createState() => _Practice1PageState();
}

class _Practice1PageState extends State<Practice1Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    richTextWidget(
                      '스트레칭 운동',
                      Colors.black,
                      16.sp,
                      kFontWeightRegular,
                    ),
                    richTextWidget(
                      '목 주변 근육의 경직은 목통증의 주된 원인 중에 하나입니다. 목 주변 근육의 스트레칭 운동은 목통증의 예방과 치료에 도움이 됩니다.',
                      Colors.black,
                      14.sp,
                      kFontWeightRegular,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('홈으로 이동'),
                        Icon(Icons.arrow_back_ios_new),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 100,
                            height: 100,
                            child: Text('1234')
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}
