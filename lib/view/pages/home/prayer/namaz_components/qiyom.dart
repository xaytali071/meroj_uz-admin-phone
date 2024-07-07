import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/app_helper.dart';
import 'package:meroj_uz_admin_phone/view/components/custom_visiblity.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

import '../../../../components/app_assets.dart';

class Qiyom extends StatelessWidget {
  const Qiyom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHelper.appBar(context, "Qiyom"),
      backgroundColor: Style.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text("Qo'llar bog'lanadi. Erkaklar o'ng qo'l kaftini chap qo'l ustiga qo'yishadi. O'ng qo'lning bosh va kichik barmoqlari bilan chap qo'l bilagini ushlashadi.Ayollar o'ng qo'lni chap qo'l us-tida tutib, qo'llarini ko'krakka qo'yadilar. Bu hol «qiyom» deyiladi. Qiyomda (tik turgan holda) sajda qilinadigan joyga qarab, navbati bilan, quyidagilar o'qiladi.",style: Style.normalText2(color: Style.yellow),),
              20.verticalSpace,
              Text("SANO DUOSI",style: Style.normalText(color: Style.white),),
              Text("Subhanakallouhumma va bihamdika va tabarokasmuka va taa’la jadduka va la ilaha g‘oyruk.\n\nMa'nosi: «Allohim! Sening noming muborakdir. Shon-sharafing ulug'dir. Sendan o'zga iloh yo'qdir»",style: Style.normalText2(color: Style.white),),
        
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppAssets.menQol,width: 100.w,height: 200.h,fit: BoxFit.cover,),
                  Image.asset(AppAssets.womenQol,width: 100.w,height: 200.h,fit: BoxFit.cover,),
                ],
              ),
              30.verticalSpace,
              Text("FOTIHA SURASI",style: Style.normalText(color: Style.white),),
              20.verticalSpace,
              Text("بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ \nالْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ\nالرَّحْمَٰنِ الرَّحِيمِ\nمَالِكِ يَوْمِ الدِّينِ\nإِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ\nاهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ\nصِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ ",style: Style.normalText2(color: Style.white),),
              20.verticalSpace,
            Text("A’uzu billahi minash shaytonir rojiym. Bismillahir rohmanir rohiym. Al hamdulillahi robbil ‘alamiyn. Ar-rohmanir rohiym. Maliki yavmiddiyn. Iyyaka na’budu va iyyaka nasta’iyn. Ihdinas sirotol mustaqiym. Sirotollaziyna an’amta ‘alayhim g‘oyril mag‘zubi ‘alayhim valazzolliyn.",style: Style.normalText2(color: Style.white),),
              20.verticalSpace,
              CustomVisiblity(
                  title: "KAVSAR", data: Column(
                children: [
                  Text("إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ\nفَصَلِّ لِرَبِّكَ وَانْحَرْ\nإِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ ",style: Style.normalText2(color: Style.yellow),),
                  20.verticalSpace,
                  Text("Inna a’toynakal-kavsar. Fa solli lirobbika vanhar. Inna shaniaka huval abtar.",style: Style.normalText2(color: Style.yellow),)
                ],
              )),
              20.verticalSpace,
              CustomVisiblity(title: "IXLOS SURASI", data: Column(
                children: [
                  Text("Qul huvallohu ahad. Allohus-somad. Lam yalid. Va lam yuvlad va lam yakullahu kufuvan ahad.",style: Style.normalText2(color: Style.yellow),),
                ],
              )),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
