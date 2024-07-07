import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

import '../../../../components/app_assets.dart';

class Sajda extends StatelessWidget {
  const Sajda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primary,
      appBar: AppHelper.appBar(context, "Sajda"),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("«Allohu akbar» deb avvalo tizzalar, ke-yin qo'llar, so'ng peshona va burun yerga tekkizilib, sajda qilinadi. Sajda qi-linayotganda oyoq panjalari qiblaga qaratiladi, erkaklarning tirsaklari yerga tegmaydi. Ayollar tirsaklarini yerga qo'yadilar. Sajdada uch marta: «Subhana robbiyal a'la» (Ey ulug' Robbim, Sen butun nuqsonlardan poksan), deyiladi.",style: Style.normalText2(color: Style.yellow),),
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 150.w,
                      height: 185.h,
                      color: Style.white,
                      child: Image.asset(AppAssets.menSajda,width: 150.w,height: 200.h,fit: BoxFit.contain,)),
                  Image.asset(AppAssets.womenSajda,width: 150.w,height: 200.h,fit: BoxFit.contain,),
                ],
              ),
        20.verticalSpace,
        Text("«Allohu akbar» deb sajdadan bosh ko'tariladi va tiz cho'kkan holda bir oz o'tiriladi, bu holat «jalsa» deyiladi. Jalsada qo'llar, barmoqlar o'z holicha tutilib, songa qo'yiladi. Barmoq uchlari tizza bilan teng bo'lishi lozim.",style: Style.normalText2(color: Style.yellow),),
              20.verticalSpace,
              Text("Erkaklar chap oyoqlari ustiga o'tiradilar. O'ng oyoq panjalari qiblaga qaratiladi. Ayollar oyoqlarini o'ng tarafdan chiqarib o'tiradilar.",style: Style.normalText2(color: Style.yellow),),
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppAssets.menQadda,width: 150.w,height: 200.h,fit: BoxFit.cover,),
                  Image.asset(AppAssets.womenQadda,width: 150.w,height: 200.h,fit: BoxFit.cover,),
                ],
              ),
              20.verticalSpace,
              Text("«Allohu akbar», deb ikkinchi marta sajda qilinadi. Sajdada uch marta: «Subhana robbiyal a'la», deyiladi. Shu bilan birinchi rakat tugaydi.",style: Style.normalText2(color: Style.yellow),),
              20.verticalSpace,
              Text("«Allohu akbar», deb qiyomga (tikka) turiladi.",style: Style.normalText2(color: Style.yellow),),
            30.verticalSpace,

            ],
          ),
        ),
      ),
    );
  }
}
