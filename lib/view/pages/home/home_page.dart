import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/view/components/app_assets.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/custom_home_button.dart';
import 'package:meroj_uz_admin_phone/view/components/current_prayer_times.dart';
import 'package:meroj_uz_admin_phone/view/components/hadith_widget.dart';
import 'package:meroj_uz_admin_phone/view/components/notification_widget.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/prayer/bomdod.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/qaza_pages.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/qibla.dart';
import 'package:meroj_uz_admin_phone/view/pages/home/tasbeh_page.dart';
import 'package:prayers_times/prayers_times.dart';

import '../../../controller/provider.dart';
import '../../../infostructure/func.dart';
import '../../components/banner.dart';
import 'name99/name_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  PrayerTimes prayerTimes = PrayerTimes(
    coordinates: Coordinates(41.248545, 69.789190),
    calculationParameters: PrayerCalculationMethod.other(),
    locationName: 'Asia/Tashkent',
    precision: true,
    dateTime: DateTime.now(), // Specify the desired date
  );

  var today = HijriCalendar.now();

@override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    ref.read(appProvider.notifier).changeMode();
    ref.read(networkProvider.notifier).getBanner();
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
    return Scaffold(
      backgroundColor: watch.isDark ? Style.black : Style.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 350.h,
              decoration: BoxDecoration(
                  color:watch.isDark ? Style.primary.withOpacity(0.5) : Style.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                      bottomRight: Radius.circular(40.r))),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.logo,
                          width: 50.r,
                          height: 50.r,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Assalamu alaikum",
                              style:
                                  Style.normalText(color: Style.white, size: 16),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Style.white,
                                  size: 15,
                                ),
                                Text(
                                  "So'qoq",
                                  style: Style.miniText(color: Style.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        NotificationWidget(count: 1, onTap: (){}),
                      ],
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        20.horizontalSpace,
                        Column(
                          children: [
                            Text(
                              "${today.longMonthName}, ${today.hDay} ,${today.hYear}",
                              style: Style.normalText(color: Style.white),
                            ),
                            Text(
                              "${DateTime.now().year} ${DateTime.now().day} ${FuncDate.getMonth()}, ${FuncDate.getDay()}",
                              style: Style.normalText2(color: Style.white),
                            )
                          ],
                        ),
                        const Spacer(),
                        CurrentPrayerTimes(
                          time: prayerTimes,
                        ),
                        20.horizontalSpace,
                      ],
                    ),
                    20.verticalSpace,
                     BannerHome(list: ref.watch(networkProvider).listOfBanner,),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CustomHomeButton(
                    image: AppAssets.kunHadisi,
                    text: "Kun hadisi",
                    onTap: () {
                      ref.read(networkProvider.notifier).gethadith();
                      showBottomSheet(
                        backgroundColor: Style.transparent,
                          context: context, builder: (_){
                        return HadithWidget();
                      });
                    },
                  ),
                  10.horizontalSpace,
                  CustomHomeButton(
                    image: AppAssets.tasbeh,
                    text: "Tasbeh",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> TasbehPage(),
                      ));
                    },
                  ),
                  10.horizontalSpace,
                  CustomHomeButton(
                    image: AppAssets.qazo,
                    text: "Qazolar",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> QazaPage(),
                      ));
                    },
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  CustomHomeButton(
                    image: AppAssets.namoz,
                    text: "Namoz",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Bomdod(),
                      ));
                    },
                  ),
                  10.horizontalSpace,
                  CustomHomeButton(
                    image: AppAssets.name99,
                    text: "Alloh",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> NamePage()));
                    },
                  ),
                  10.horizontalSpace,
                  CustomHomeButton(
                    image: AppAssets.compass,
                    text: "Qibla",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>QiblaPage()));
                    },
                  ),
                ],
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );

  }
}
