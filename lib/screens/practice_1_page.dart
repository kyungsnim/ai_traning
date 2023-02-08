import 'package:ai_traning/importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Practice1Page extends StatefulWidget {
  const Practice1Page({Key? key}) : super(key: key);

  @override
  State<Practice1Page> createState() => _Practice1PageState();
}

class _Practice1PageState extends State<Practice1Page> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
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
      body: Row(
        children: [


      ],
      )
    );
  }
}
