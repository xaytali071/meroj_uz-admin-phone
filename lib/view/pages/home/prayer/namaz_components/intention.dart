import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_assets.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class Intention extends StatelessWidget {
  const Intention({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primary,
      appBar: AppHelper.appBar(context, "Niyat"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
        Text("«Alloh rizoligi uchun qibla tomonga yuzlanib, bugungi bomdod namozining ikki rakat sunnatini o'qishni niyat qildim», deb ko'ngildan o'tkaziladi.",style: Style.normalText2(color: Style.yellow),),
            50.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppAssets.menNiyyat,width: 100.w,height: 200.h,fit: BoxFit.cover,),
                Image.asset(AppAssets.womenNiyyat,width: 100.w,height: 200.h,fit: BoxFit.cover,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
