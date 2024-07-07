import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_assets.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class Takbir extends StatelessWidget {
  const Takbir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primary,
      appBar: AppHelper.appBar(context, "Takbir"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text("«Allohu akbar», deb iftitoh takbiri aytiladi. Bu takbirda erkaklar qo'llar kaftini qiblaga qaratib, bosh barmoqlarining uchini quloqlarining yumshoq joyiga tekkizishadi. Ayollar qo'llarini yelka barobarida ko'taradilar. ",style: Style.normalText2(color: Style.yellow),),

            50.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppAssets.menTakbir,width: 100.w,height: 200.h,fit: BoxFit.cover,),
                Image.asset(AppAssets.womenTakbir,width: 100.w,height: 200.h,fit: BoxFit.cover,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
