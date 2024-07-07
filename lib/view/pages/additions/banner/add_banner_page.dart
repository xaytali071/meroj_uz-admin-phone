import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';
import 'package:meroj_uz_admin_phone/view/components/image/custom_image.dart';

class AddBanner extends ConsumerStatefulWidget {
  const AddBanner({super.key});

  @override
  ConsumerState<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends ConsumerState<AddBanner> {

  TextEditingController url=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final event=ref.read(networkProvider.notifier);
    NetworkState watch=ref.watch(networkProvider);
    return Scaffold(
      appBar: AppHelper.appBar(context, "Banner"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            GestureDetector(
              onTap: (){
                event.getImageGallery(() { });
              },
              child: watch.imagePath=="" ? Text("Galerey") : CustomImage(url: watch.imagePath),
            ),
            20.verticalSpace,
            CustomTextFormField(hint: "Video url",controller: url,),
            100.verticalSpace,
         watch.isLoading ? CircularProgressIndicator() : ElevatedButton(onPressed: (){
              event.addBanner(videoUrl: url.text, image: watch.imagePath);
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
