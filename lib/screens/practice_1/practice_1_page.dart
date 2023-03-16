import 'package:ai_traning/importer.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        child: Row(children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 4.w, right: 4.w, top: 12.h, bottom: 12.h),
              child: Column(
                children: [
                  _buildPracticeTitle(),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: richTextWidget(
                        practice1Description,
                        Colors.black,
                        14.sp,
                        kFontWeightRegular,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildBackButton(),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: _buildPracticeGrid(),
          )
        ]),
      )),
    );
  }

  _buildPracticeTitle() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          color: Colors.grey.withOpacity(0.2)),
      child: richTextWidget(
        practice1Title,
        Colors.black,
        16.sp,
        kFontWeightRegular,
      ),
    );
  }

  _buildBackButton() {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              richTextWidget(
                '홈으로 이동',
                Colors.white,
                12.sp,
                kFontWeightRegular,
              ),
              const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPracticeGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: practice1List.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Get.to(
                    () => Practice1Detail1Page(
                      youtubeId: practice1YoutubeId[index],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            richTextWidget(
                              practice1List[index],
                              Colors.black,
                              12.sp,
                              kFontWeightBold,
                            ),
                            Spacer(),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://img.youtube.com/vi/${practice1YoutubeId[index]}/0.jpg',
                              fit: BoxFit.fitWidth,
                              errorWidget: (context, s, d) {
                                return Container();
                              },
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
