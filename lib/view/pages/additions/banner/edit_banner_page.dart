import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/infostructure/model/banner_model.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';
import 'package:meroj_uz_admin_phone/view/components/image/custom_image.dart';

class EditBannerPage extends ConsumerStatefulWidget {
  final BannerModel data;
  const EditBannerPage({super.key,required this.data,});

  @override
  ConsumerState<EditBannerPage> createState() => _EditBannerPageState();
}

class _EditBannerPageState extends ConsumerState<EditBannerPage> {

  TextEditingController videoUrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final event=ref.read(networkProvider.notifier);
    NetworkState watch=ref.watch(networkProvider);
    return Scaffold(
      appBar: AppHelper.appBar(context, "Edit banner"),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              30.verticalSpace,

              GestureDetector(
                onTap: (){
                  event.getImageGallery(() { });
                },
                  child: watch.imagePath=="" ? const Text("Galerey") : CustomImage(url: watch.imagePath,height: 150,)),
              30.verticalSpace,
              CustomTextFormField(hint: "Video url",controller: videoUrl,),
              30.verticalSpace,
              ElevatedButton(onPressed: (){
                event.updateBanner(docId: widget.data.id ?? "", image: watch.imagePath, videoId: videoUrl.text, oldVideoId: widget.data.videoUrl ?? "");
              }, child: Text("OK"))
            ],
          ),
        ),
      ),
    );
  }
}
