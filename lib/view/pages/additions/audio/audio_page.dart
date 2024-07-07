import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/infostructure/model/maruza_model.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/audio/add_audio_sheet.dart';
import 'package:meroj_uz_admin_phone/view/pages/additions/audio/audio_player.dart';

import '../../../../controller/network_controller/network_state.dart';
import '../../../../controller/provider.dart';
import '../../../components/style.dart';

class AudioPage extends ConsumerStatefulWidget {
  final MaruzaModel data;

  const AudioPage({super.key, required this.data});

  @override
  ConsumerState<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends ConsumerState<AudioPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(networkProvider.notifier).getAudio(
            docId: widget.data.id,
            playListName: widget.data.playlistName,
          );
    });
    super.initState();
  }

  goTo({required String url, required String name}) {
    ref.read(networkProvider.notifier).getAudioUrl(url).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AudioPlayerPage(
                    audioUrl: value ?? "",
                    name: name,
                  )));
    });
  }

  TextEditingController part = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final event = ref.read(networkProvider.notifier);
    NetworkState watch = ref.watch(networkProvider);
    return Scaffold(
      appBar: AppHelper.appBar2(
          context: context,
          title: widget.data.playlistName,
          actions: [
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return AddAudioSheet(
                            docId: widget.data.id,
                            playlistName: widget.data.playlistName);
                      });
                },
                child: Text(
                  "Add audio",
                  style: Style.normalText(color: Style.yellow),
                ))
          ]),
      backgroundColor: Style.primary,
      body: watch.isLoading
          ? const CircularProgressIndicator()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: watch.listOfAudio.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: InkWell(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        10.verticalSpace,
                                        ElevatedButton(
                                            onPressed: () {
                                              name=TextEditingController(text: watch.listOfAudio[index].name);
                                              part=TextEditingController(text: watch.listOfAudio[index].part.toString());
                                              url=TextEditingController(text: watch.listOfAudio[index].audioUrl);
                                              Navigator.pop(context);
                                              showBottomSheet(
                                                  context: context,
                                                  builder: (_) {
                                                    return Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          50.verticalSpace,
                                                          CustomTextFormField(
                                                            hint: "Name",
                                                            controller: name,
                                                          ),
                                                          30.verticalSpace,
                                                          CustomTextFormField(
                                                            hint: "URL",
                                                            controller: url,
                                                          ),
                                                          30.verticalSpace,
                                                          CustomTextFormField(
                                                            hint: "Part",
                                                            controller: part,
                                                          ),
                                                          50.verticalSpace,
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                event.updateAudio(
                                                                    docId: widget
                                                                        .data.id,
                                                                    playListName:
                                                                        widget
                                                                            .data
                                                                            .playlistName,
                                                                    audioId: watch
                                                                            .listOfAudio[
                                                                                index]
                                                                            .id ??
                                                                        "",
                                                                    audioUrl:
                                                                        url.text,
                                                                    name:
                                                                        name.text,
                                                                    part: int
                                                                        .parse(part
                                                                            .text));
                                                              },
                                                              child: Text("OK")),
                                                          50.verticalSpace,
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Text("Update")),
                                        10.verticalSpace,
                                        ElevatedButton(
                                            onPressed: () {
                                              event.deleteAudio(
                                                  docId: widget.data.id,
                                                  playListName:
                                                      widget.data.playlistName,
                                                  audioId: watch
                                                          .listOfAudio[index]
                                                          .id ??
                                                      "");
                                            },
                                            child: Text("Dalete audio")),
                                        10.verticalSpace,
                                      ],
                                    ),
                                  );
                                });
                          },
                          onTap: () {
                            goTo(
                                url: watch.listOfAudio[index].audioUrl ?? "",
                                name: watch.listOfAudio[index].name ?? "");
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
                                  watch.listOfAudio[index].name ?? "",
                                  style: Style.normalText(color: Style.yellow),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )),
                              )),
                        ),
                      );
                    }),
              ),
            ),
    );
  }
}
