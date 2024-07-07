import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';
import 'package:meroj_uz_admin_phone/view/components/image/custom_image.dart';

class SendMessagePage extends ConsumerStatefulWidget {
  const SendMessagePage({super.key});

  @override
  ConsumerState<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends ConsumerState<SendMessagePage> {

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController videoId=TextEditingController();
  late FirebaseStorage storage;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(networkProvider.notifier).getUsers();
      storage = FirebaseStorage.instance;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkState watch=ref.watch(networkProvider);
    final event=ref.read(networkProvider.notifier);
    return Scaffold(
      appBar: AppHelper.appBar(context, "Xabar jo'natish"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            GestureDetector(
                onTap: (){
                  event.getImageGallery(() { });
                },
                child:ref.watch(networkProvider).imagePath=="" ? Text("Galerey") : CustomImage(url: ref.watch(networkProvider).imagePath,width: 100,height: 100,)),
            50.verticalSpace,
            CustomTextFormField(hint: "Title",controller: title,),
            20.verticalSpace,
            CustomTextFormField(hint: "Body",controller: body,),
            20.verticalSpace,
            const CustomTextFormField(hint: "Image",),
            20.verticalSpace,
            CustomTextFormField(hint: "VideoId",controller: videoId,),
            50.verticalSpace,
            watch.isLoading ? const CircularProgressIndicator() :  ElevatedButton(onPressed: () {

              event.createImageUrl(imagePath: watch.imagePath,onSuccess: (){
                print(watch.imagePath);
                print(watch.imageUrl);
                print(event.imageUrll);
                for(int i=0;i<watch.listOfUsers.length;i++) {
                  event.sendNotificationImage(
                      fcmToken: watch.listOfUsers[i].fcm,  //"dYNQAkqURYSooa5lFD7ZEL:APA91bFsALlepB5v8LI1RCBdqscZdiR4was_L6csaxAwDhsdTq7HF-bA7PUoJrn1rf7jIn78sxwz-QBrp_AC8VnPOda51j_mwPL4GDuNrXT7O0cWNyMgV8_MyeRJ5E26OPodTwkDW0EX",
                      body: body.text,
                      videoId: videoId.text,
                      title: title.text,
                      userId: watch.listOfUsers[i].id,
                      image: event.imageUrll);
                  //"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg");
                }
              });


            }, child: const Text("Send"))
          ],
        ),
      ),
    );
  }
}
