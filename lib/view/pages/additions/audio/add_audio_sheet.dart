import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';

class AddAudioSheet extends ConsumerStatefulWidget {
  final String docId;
  final String playlistName;

  const AddAudioSheet(
      {super.key, required this.docId, required this.playlistName});

  @override
  ConsumerState<AddAudioSheet> createState() => _AddAudioSheetState();
}

class _AddAudioSheetState extends ConsumerState<AddAudioSheet> {
  TextEditingController part = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 300.h,
      child: Column(
        children: [
          40.verticalSpace,
          CustomTextFormField(
            hint: "Nomi",
            controller: name,
          ),
          30.verticalSpace,
          CustomTextFormField(
            hint: "Url",
            controller: url,
          ),
          30.verticalSpace,
          CustomTextFormField(
            hint: "Qism",
            controller: part,
            keyBoardType: TextInputType.number,
          ),
          50.verticalSpace,
          ElevatedButton(
              onPressed: () {
                ref.read(networkProvider.notifier).addNewAudio(
                    docId: widget.docId,
                    playListName: widget.playlistName,
                    name: name.text,
                    part: int.parse(part.text),
                    url: url.text);
              },
              child: Text("Ok"))
        ],
      ),
    );
  }
}
