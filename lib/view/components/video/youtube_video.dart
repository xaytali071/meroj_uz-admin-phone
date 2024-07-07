import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Vedio extends StatefulWidget {
  final String videoId;
  const Vedio({super.key, required this.videoId});

  @override
  State<Vedio> createState() => _VedioState();
}

class _VedioState extends State<Vedio> {

  var controller=YoutubePlayerController();

  @override
  void initState() {
    controller = YoutubePlayerController.fromVideoId(
      videoId:widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: false,enableCaption: false,showControls: false,),

    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: YoutubePlayerScaffold(
              autoFullScreen: false,
              backgroundColor: Style.transparent,
              builder: (context, player) {
                return player;
              }, controller: controller),
        );

  }
}