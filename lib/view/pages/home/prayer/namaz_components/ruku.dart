import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

import '../../../../components/app_assets.dart';

class Ruku extends StatelessWidget {
  const Ruku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primary,
      appBar: AppHelper.appBar(context, "Ruku"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text(" Zam sura tugagach, «Allohu akbar», deb ruku qilinadi. Erkaklar tirsaklari va tizzalarini bukmasdan, barmoqlarini ochgan holda, tizzalarini mahkam changallab egiladilar.Ayollar erkaklarga nisbatan ozroq egiladilar. Tizzalarini bir oz bukadilar. Barmoqlarini jamlab tizzalarini tutadilar.Rukuda uch marta «Subhana robbiyal aziym» (Ey buyuk Robbim, Sen barcha nuqsonlardan poksan), deyiladi.",style: Style.normalText2(color: Style.yellow),),
            50.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppAssets.menRuku,width: 150.w,height: 200.h,fit: BoxFit.fill,),
                Image.asset(AppAssets.womenRuku,width: 150.w,height: 200.h,fit: BoxFit.fill,),
              ],
            ),
          30.verticalSpace,
          Text("Rukudan «Sami'allohu liman hamidah» (Alloh Uni hamd etganlarni eshitguvchidir), deb qad ko'tariladi, bu holat «qavma» deyiladi.Qavma holida: «Robbana lakal hamd» (Ey Robbimiz, har turli hamd-sanolar yolg'iz Sengadir), deyiladi.",style: Style.normalText2(color: Style.yellow),)
          ],
        ),
      ),
    );
  }
}
