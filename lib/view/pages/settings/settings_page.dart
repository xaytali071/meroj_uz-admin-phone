import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/app_assets.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/custom_button.dart';

import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../../infostructure/local_store.dart';


class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends ConsumerState<SettingsPage> {

 // bool isDark=LocalStorage.getMode() ?? false;

  @override
  // void initState() {
  //   ref.read(appProvider.notifier).changeMode();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
    return  Scaffold(
      backgroundColor: watch.isDark ? Style.black : Style.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      centerTitle: true,
        backgroundColor: watch.isDark ? Style.primary.withOpacity(0.5) : Style.primary,
        title:  Text("Sozlamalar",style: Style.boldText(color: Style.yellow,size: 20),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200.h,
              decoration: BoxDecoration(
                  color: watch.isDark ? Style.primary.withOpacity(0.5) : Style.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(64.r),
                      bottomRight: Radius.circular(64.r))),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.logo,width: 200.r,height: 200.r,),
                  ],
                ),
              ),
            ),
20.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const CustomButton(perfix: Icon(Icons.language,color: Style.primary,),text: 'Ilova tili',),
                  15.verticalSpace,
                  const CustomButton(perfix: Icon(Icons.notifications,color: Style.primary,),text: "Bildirishnomalar"),
                  15.verticalSpace,
                  const CustomButton(perfix: Icon(Icons.messenger,color: Style.primary,),text: "Murojaat",),
                15.verticalSpace,
                  CustomButton(perfix: const Icon(Icons.dark_mode,color: Style.primary,), text: "Tungi rejim",sufix:
                  SwitcherButton(
                    value: watch.isDark,
                    onChange: (value) {
                      LocalStorage.setMode(value);
                      event.changeMode();
                    },
                  )
                  ),
                  15.verticalSpace,
                  const CustomButton(perfix: Icon(Icons.share,color: Style.primary,), text: "Ulashish"),
                  15.verticalSpace,
                  const CustomButton(perfix: Icon(Icons.info,color: Style.primary,), text: "Dastur haqida"),
                20.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
