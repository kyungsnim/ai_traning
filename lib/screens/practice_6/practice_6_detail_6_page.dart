import 'dart:async';

import 'package:ai_traning/importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '/importer.dart';

class Practice6Detail6Page extends StatefulWidget {
  final String youtubeId;

  const Practice6Detail6Page({
    Key? key,
    required this.youtubeId,
  }) : super(key: key);

  @override
  State<Practice6Detail6Page> createState() => _Practice6Detail6PageState();
}

class _Practice6Detail6PageState extends State<Practice6Detail6Page> {
  late YoutubePlayerController _controller;
  bool _isStart = false;
  bool _isTimerStart = false;
  late Timer _timer;
  int _time = 3;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
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
              aspectRatio: 16 / 9,
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
          _isStart ? Positioned(
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
          ) : SizedBox(),
          _isStart ? Positioned(
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
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.w,
                  color: Colors.white,
                ),
              ),
            ),
          ) : SizedBox(),
          _isStart ? SizedBox() : InkWell(
            onTap: () {
              setState(() => _isTimerStart = true);

              _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                setState(() {
                  _time--;

                  if (_time == 0) {
                    _isStart = true;
                    _controller.play();
                    _timer.cancel();
                  }
                });
              });
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.7),
              width: Get.width,
              height: Get.height,
              child: _isTimerStart ? richTextWidget(
                _time.toString(),
                Colors.white,
                30.sp,
                kFontWeightBold,
              ) : Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: richTextWidget(
                  '시작하기',
                  Colors.black,
                  20.sp,
                  kFontWeightBold,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
