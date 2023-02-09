import 'package:ai_traning/importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../main.dart';
import '../pushed_pageA.dart';

class Practice1Page extends StatefulWidget {
  const Practice1Page({Key? key}) : super(key: key);

  @override
  State<Practice1Page> createState() => _Practice1PageState();
}

class _Practice1PageState extends State<Practice1Page> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'PQeRqGLE_hA',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: richTextWidget(
          '스트레칭 운동',
          Colors.white,
          16.sp,
          kFontWeightBold,
        ),
        elevation: 0,
        backgroundColor: kGreyColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.5,
              child: YoutubePlayer(
                aspectRatio: 1/1,
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
            SizedBox(
              width: Get.width * 0.5,
              child: PushedPageA(
                cameras: cameras,
                title: '',
              ),
            )
        ],
        ),
      )
    );
  }
}
