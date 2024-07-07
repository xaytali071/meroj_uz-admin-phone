import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/audio/add_audio_playlist_page.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/add_hadith_page.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/send_message_page.dart';
import '../../components/app_assets.dart';
import '../../components/buttons/custom_home_button.dart';
import '../../components/style.dart';

import '../home/qibla.dart';
import 'banner/add_banner_page.dart';


class AdditionsPage extends ConsumerStatefulWidget {
  const AdditionsPage({super.key});

  @override
  ConsumerState<AdditionsPage> createState() => _AdditionsPageState();
}

class _AdditionsPageState extends ConsumerState<AdditionsPage> {
  @override
  Widget build(BuildContext context) {
    // final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
    return Scaffold(
      backgroundColor: watch.isDark ? Style.black : Style.white,
      appBar: AppBar(
        backgroundColor: watch.isDark ? Style.primary.withOpacity(0.5) : Style.primary,
        centerTitle: true,
        title: Text("Qo'shimchalar",style: Style.boldText(color: Style.yellow,size: 20),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    CustomHomeButton(
                      image: AppAssets.kunHadisi,
                      text: "Hadis qo'shish",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddHadithPage()));
                      },
                    ),
                    10.horizontalSpace,
                    CustomHomeButton(
                      image: AppAssets.audio,
                      text: "Audio",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAudioPlaylistPage(),
                        ));
                      },
                    ),
                    10.horizontalSpace,
                    CustomHomeButton(
                      image: AppAssets.video,
                      text: "Videolar",
                      onTap: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (_)=> const AddVideoPlaylistPage(),));
                      },
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    CustomHomeButton(
                      image: AppAssets.duo,
                      text: "Xabar jo'natish",
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_)=>const SendMessagePage()));
                      },
                    ),
                    10.horizontalSpace,
                    CustomHomeButton(
                      image: AppAssets.name99,
                      text: "Banner",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddBanner()));
                      },
                    ),
                    10.horizontalSpace,
                    CustomHomeButton(
                      image: AppAssets.compass,
                      text: "Qibla",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const QiblaPage()));
                      },
                    ),
                  ],
                ),
              ),


            ],),
        ),
      ),
    );
  }
}
