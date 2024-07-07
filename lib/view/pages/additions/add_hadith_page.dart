import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/network_controller/network_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/custom_visiblity.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/custom_form_field_label.dart';
import 'package:meroj_uz_admin_phone/view/components/form_field/keyboard_dissimer.dart';
import 'package:meroj_uz_admin_phone/view/components/hadith_widget.dart';
import 'package:meroj_uz_admin_phone/view/components/image/custom_image.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

import '../../components/image/custom_network_image.dart';

class AddHadithPage extends ConsumerStatefulWidget {
  const AddHadithPage({super.key});

  @override
  ConsumerState<AddHadithPage> createState() => _AddHadithPageState();
}

class _AddHadithPageState extends ConsumerState<AddHadithPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(networkProvider.notifier).gethadith();
    });
    super.initState();
  }

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final event = ref.read(networkProvider.notifier);
    NetworkState watch = ref.watch(networkProvider);
    return KeyboardDissimer(
      child: Scaffold(
        appBar: AppHelper.appBar(context, "Hadis q'shish"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                30.verticalSpace,
                watch.imagePath == "" ? ElevatedButton(onPressed: () {
                  event.getImageGallery(() {});
                }, child: Text("Rasim qo'yish")) :
                CustomImage(url: watch.imagePath, height: 300,),
                30.verticalSpace,
                CustomLabelblFormField(hint: "Sarlavha",
                  controller: title,
                  maxLine: 5,
                  heigth: 70,
                  borderColor: Style.darkGrey,),
                30.verticalSpace,
                CustomLabelblFormField(
                  controller: body,
                  hint: "Hadis", maxLine: 20, heigth: 200,),
                30.verticalSpace,
                watch.isLoading ? const CircularProgressIndicator() :
                ElevatedButton(onPressed: () {
                  event.addHadith(title: title.text, body: body.text, image: watch.imagePath);
                }, child: Text("Qo'shish")),
                50.verticalSpace,
                ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: watch.listOfHadith.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Style.white,
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  watch.listOfHadith[index].title ?? "",
                                  style: Style.normalText(),),
                                10.verticalSpace,
                                watch.listOfHadith[index].image == ""
                                    ? const SizedBox.shrink()
                                    : CustomImageNetwork(
                                  image: watch.listOfHadith[index].image ??
                                      "", height: 200,),
                                10.verticalSpace,
                                Text(watch.listOfHadith[index].body ?? "",
                                  style: Style.miniText(),)
                              ],
                            ),
                          ),
                        ),
                      );
                    })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
