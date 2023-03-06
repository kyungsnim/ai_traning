import 'package:ai_traning/importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '/importer.dart';

class Practice1Detail1Page extends StatefulWidget {
  const Practice1Detail1Page({Key? key}) : super(key: key);

  @override
  State<Practice1Detail1Page> createState() => _Practice1Detail1PageState();
}

class _Practice1Detail1PageState extends State<Practice1Detail1Page> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '_KsWtJSxi1o',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        // appBar: AppBar(
        //   title: richTextWidget(
        //     '스트레칭 운동',
        //     Colors.white,
        //     16.sp,
        //     kFontWeightBold,
        //   ),
        //   elevation: 0,
        //
        // ),
        body: Stack(
          children: [
            SizedBox(
              width: Get.width,
              child: YoutubePlayer(
                progressColors: ProgressBarColors(
                  backgroundColor: Colors.white,
                  playedColor: Colors.black,
                ),
                progressIndicatorColor: Colors.black,
                aspectRatio: 16/9,
                key: ObjectKey(_controller),
                controller: _controller,
                actionsPadding: const EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  //FullScreenButton(),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: 70.h,
              child: Container(
                // color: Colors.white.withOpacity(0),
                alignment: Alignment.bottomRight,
                width: Get.height * 0.5,
                height: Get.height * 0.5,
                child: PushedPageA(
                  cameras: cameras,
                  title: '',
                ),
              ),
            ),
            Positioned(
              left: 25.w,
              top: 15.h,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Icon(Icons.arrow_back_ios_new,
                  size: 20.w,
                  color: Colors.white,),
                ),
              ),
            ),
        ],
        )
      ),
    );
  }
}
