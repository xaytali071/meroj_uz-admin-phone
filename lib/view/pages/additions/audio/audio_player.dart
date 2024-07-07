import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';

import '../../../../controller/network_controller/network_state.dart';
import '../../../../controller/provider.dart';
import '../../../components/app_assets.dart';
import '../../../components/image/custom_image.dart';
import '../../../components/style.dart';

class AudioPlayerPage extends ConsumerStatefulWidget {
  final String audioUrl;
  final String name;

  const AudioPlayerPage({
    super.key,
    required this.audioUrl,
    required this.name,
  });

  @override
  ConsumerState<AudioPlayerPage> createState() => _AudioState();
}

class _AudioState extends ConsumerState<AudioPlayerPage> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  AudioPlayer audioPalayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration positionad = Duration.zero;
  bool isPlaying = false;
  String audioUrl="";



  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      audioPalayer.setAudioSource(
          AudioSource.uri(Uri.parse(widget.audioUrl)));
      print(widget.audioUrl);
      audioPalayer.play();
      duration= audioPalayer.duration ?? Duration.zero;
      isPlaying = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPalayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final event = ref.read(networkProvider.notifier);
    NetworkState watch = ref.watch(networkProvider);
    return Scaffold(
      appBar: AppHelper.appBar(context, widget.name ?? ""),
      backgroundColor: Style.primary,
      body:  Column(
        children: [
          150.verticalSpace,
          CustomImage(url: AppAssets.domla,width: MediaQuery.sizeOf(context).width-100,),
          50.verticalSpace,
          StreamBuilder(
              stream: audioPalayer.positionStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Slider(
                      activeColor: Style.yellow,
                      min: 0,
                      max: audioPalayer.duration?.inSeconds.toDouble() ?? 0,
                      value: audioPalayer.position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        audioPalayer.seek(Duration(seconds: value.toInt()));
                        audioPalayer.play();
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text("${((audioPalayer.position.inSeconds.toDouble()) ~/ 60).toString()}:${((audioPalayer.position.inSeconds.toInt()) % 60).toString()}",style: Style.normalText2(color: Style.white),),
                          Spacer(),
                          Text("${((audioPalayer.duration?.inSeconds.toDouble() ?? 0) ~/ 60).toString()}:${((audioPalayer.duration?.inSeconds.toInt() ?? 0) % 60).toString()}",style: Style.normalText2(color: Style.white),),
                        ],
                      ),
                    ),
                  ],
                );
              }),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous_rounded,size: 40,color: Style.yellow,)),
              IconButton(
                onPressed: () async {

                  if (isPlaying) {
                    audioPalayer.play();
                    isPlaying = false;
                    event.playAudio();
                    controller.reset();

                  } else {
                    audioPalayer.pause();
                    isPlaying = true;
                    event.playAudio();
                    controller.forward();
                    if(watch.audio==""){
                      audioPalayer.setAudioSource(
                          AudioSource.uri(Uri.parse(watch.audio)));
                    }
                  }
                },
                icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: controller,size: 45,color: Style.yellow,),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.skip_next_sharp,size: 40,color: Style.yellow,))
            ],
          ),
        ],
      ),
    );
  }
}
