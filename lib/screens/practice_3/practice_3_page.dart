import 'package:ai_traning/importer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Practice3Page extends StatefulWidget {
  const Practice3Page({Key? key}) : super(key: key);

  @override
  State<Practice3Page> createState() => _Practice3PageState();
}

class _Practice3PageState extends State<Practice3Page> {

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 4.w, right: 4.w, top: 12.h, bottom: 12.h),
              child: Column(
                children: [
                  _buildPracticeTitle(isLandscape),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: richTextWidget(
                        practice3Description,
                        Colors.black,
                        isLandscape ? 18 : 18.sp,
                        kFontWeightRegular,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildBackButton(isLandscape),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          Flexible(
            flex: isLandscape ? 1 : 2,
            child: _buildPracticeGrid(isLandscape),
          )
        ]),
      )),
    );
  }

  _buildPracticeTitle(bool isLandscape) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF78BCBE),
            width: 2,
          ),
          color: const Color(0xFF78BCBE),
      ),
      child: richTextWidget(
        practice3Title,
        Colors.white,
        isLandscape ? 20 : 20.sp,
        kFontWeightRegular,
      ),
    );
  }

  _buildBackButton(bool isLandscape) {
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
                isLandscape ? 16 : 16.sp,
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

  _buildPracticeGrid(bool isLandscape) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandscape ? 3 : 2,
              ),
              itemCount: practice3List.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Get.to(
                    () => PracticeDetailPage(
                      youtubeId: practice3YoutubeId[index],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          color: Colors.white,
                        ),
                        width: 100,
                        // height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              const Spacer(),
                              richTextWidget(
                                practice3List[index],
                                Colors.black,
                                isLandscape ? 16 : 16.sp,
                                kFontWeightBold,
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  'https://img.youtube.com/vi/${practice3YoutubeId[index]}/0.jpg',
                                  fit: BoxFit.fitWidth,
                                  errorWidget: (context, s, d) {
                                    return Container();
                                  },
                                ),
                              ),
                            ],
                          ),
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
