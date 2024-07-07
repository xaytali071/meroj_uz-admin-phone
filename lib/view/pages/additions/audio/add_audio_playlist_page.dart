import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/audio/add_audio_playlist.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/audio/audio_page.dart';

import '../../../../controller/network_controller/network_state.dart';
import '../../../../controller/provider.dart';

class AddAudioPlaylistPage extends ConsumerStatefulWidget {
  const AddAudioPlaylistPage({super.key});

  @override
  ConsumerState<AddAudioPlaylistPage> createState() => _AddAudioPageState();
}

class _AddAudioPageState extends ConsumerState<AddAudioPlaylistPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(networkProvider.notifier).getPlayList();
    });
    super.initState();
  }

  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final event = ref.read(networkProvider.notifier);
    NetworkState watch = ref.watch(networkProvider);

    return Scaffold(
      appBar: AppHelper.appBar2(context: context, title: "Audio", actions: [
        TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return AddAudioPlaylistSheet();
                  });
            },
            child: Text("Playlist qo'shish",style: Style.normalText(color: Style.yellow),))
      ]),
      backgroundColor: Style.primary,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: watch.playList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 5.h),
                    child: InkWell(
                      onLongPress: (){
                        showDialog(context: context, builder: (_){
                          return Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                10.verticalSpace,
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                  showBottomSheet(context: context, builder: (_){
                                    name=TextEditingController(text: watch.playList[index].playlistName);
                                    return SizedBox(
                                      height: 300.h,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: Column(
                                          children: [
                                            50.verticalSpace,
                                            CustomTextFormField(hint: "Name",controller: name,),
                                            50.verticalSpace,
                                            ElevatedButton(onPressed: (){
                                              event.updatePlaylistName(docId: watch.playList[index].id, name:watch.playList[index].playlistName);
                                            }, child: Text("OK"))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                }, child: Text("Update")),
                               10.verticalSpace,
                                ElevatedButton(onPressed: (){
                                  event.deletePlaylist(docId: watch.playList[index].id, );
                                }, child: Text("Delete playlist")),
                                10.verticalSpace,
                              ],
                            ),
                          );
                        });
                      },
                      onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (_)=>AudioPage(data: watch.playList[index])));
                      },
                      child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Style.white.withOpacity(0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                                                      watch.playList[index].playlistName,
                                                      style: Style.normalText(color: Style.yellow),overflow: TextOverflow.ellipsis,maxLines: 2,
                                                    )),
                          )),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
