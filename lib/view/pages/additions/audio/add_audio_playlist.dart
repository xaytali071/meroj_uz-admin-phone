import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';

class AddAudioPlaylistSheet extends StatefulWidget {
  const AddAudioPlaylistSheet({super.key});

  @override
  State<AddAudioPlaylistSheet> createState() => _AddAudioPlaylistSheetState();
}

class _AddAudioPlaylistSheetState extends State<AddAudioPlaylistSheet> {

  TextEditingController playList=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
        return Container(
          width: MediaQuery
              .sizeOf(context)
              .width,
          height: 300.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                40.verticalSpace,
                CustomTextFormField(hint: "Playlist nomi",controller: playList,),
                40.verticalSpace,
                ElevatedButton(onPressed: () {
ref.read(networkProvider.notifier).addNewPlayList(playListName: playList.text);
                }, child: Text("Ok"))
              ],
            ),
          ),
        );
      }
    );
  }
}
