// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:meroj_uz_admin_phone/model/func.dart';
// import 'package:meroj_uz_admin_phone/view/components/app_assets.dart';
// import 'package:meroj_uz_admin_phone/view/components/buttons/custom_home_button.dart';
// import 'package:meroj_uz_admin_phone/view/components/current_prayer_times.dart';
// import 'package:meroj_uz_admin_phone/view/components/hadith_widget.dart';
// import 'package:meroj_uz_admin_phone/view/components/notification_widget.dart';
// import 'package:meroj_uz_admin_phone/view/components/style.dart';
// import 'package:meroj_uz_admin_phone/view/pages/home/name/name_page.dart';
// import 'package:meroj_uz_admin_phone/view/pages/home/qaza_pages.dart';
// import 'package:meroj_uz_admin_phone/view/pages/home/qibla.dart';
// import 'package:meroj_uz_admin_phone/view/pages/home/tasbeh_page.dart';
// import 'package:prayers_times/prayers_times.dart';
//
// import '../../../components/banner.dart';
//
//
// class HomePage2 extends StatefulWidget {
//   const HomePage2({super.key});
//
//   @override
//   State<HomePage2> createState() => _HomePage2State();
// }
//
// class _HomePage2State extends State<HomePage2> {
//
//   PrayerTimes prayerTimes = PrayerTimes(
//     coordinates: Coordinates(41.248545, 69.789190),
//     calculationParameters: PrayerCalculationMethod.other(),
//     locationName: 'Asia/Tashkent',
//     precision: true,
//     dateTime: DateTime.now(), // Specify the desired date
//   );
//   var today = HijriCalendar.now();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Style.primary,
//         leadingWidth: 300.w,
//         leading: Row(
//             children: [
//               Image.asset(
//                 AppAssets.logo,
//                 width: 50.r,
//                 height: 50.r,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Assalamu alaikum",
//                     style:
//                     Style.normalText(color: Style.white, size: 16),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.location_on,
//                         color: Style.white,
//                         size: 15,
//                       ),
//                       Text(
//                         "So'qoq",
//                         style: Style.miniText(color: Style.white),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         actions: [
//           const Spacer(),
//           NotificationWidget(count: 1, onTap: (){}),
//         ],
//
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.sizeOf(context).width,
//               height: 300.h,
//               decoration: BoxDecoration(
//                   color: Style.primary,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(64.r),
//                       bottomRight: Radius.circular(64.r))),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     4.verticalSpace,
//                     Row(
//                       children: [
//                         20.horizontalSpace,
//                         Column(
//                           children: [
//                             Text(
//                               "${today.longMonthName}, ${today.hDay} ,${today.hYear}",
//                               style: Style.normalText(color: Style.white),
//                             ),
//                             Text(
//                               "${DateTime.now().year} ${DateTime.now().day} ${FuncDate.getMonth()}, ${FuncDate.getDay()}",
//                               style: Style.normalText2(color: Style.white),
//                             )
//                           ],
//                         ),
//                         const Spacer(),
//                         CurrentPrayerTimes(
//                           time: prayerTimes,
//                         ),
//                         20.horizontalSpace,
//                       ],
//                     ),
//                     20.verticalSpace,
//                     const BannerHome(),
//                   ],
//                 ),
//               ),
//             ),
//             20.verticalSpace,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Row(
//                 children: [
//                   CustomHomeButton(
//                     image: AppAssets.kunHadisi,
//                     text: "Kun hadisi",
//                     onTap: () {
//                       showBottomSheet(
//                           backgroundColor: Style.transparent,
//                           context: context, builder: (_){
//                         return BlocProvider(
//                           create: (context) => NetworkCubit(),
//                           child: HadithWidget(),
//                         );
//                       });
//                     },
//                   ),
//                   10.horizontalSpace,
//                   CustomHomeButton(
//                     image: AppAssets.tasbeh,
//                     text: "Tasbeh",
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_)=>BlocProvider(
//                         create: (context) => AppCubit(),
//                         child: TasbehPage(),
//                       )));
//                     },
//                   ),
//                   10.horizontalSpace,
//                   CustomHomeButton(
//                     image: AppAssets.qazo,
//                     text: "Qazolar",
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_)=>BlocProvider(
//                         create: (context) => PrayerCubit(),
//                         child: QazaPage(),
//                       )));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             20.verticalSpace,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Row(
//                 children: [
//                   CustomHomeButton(
//                     image: AppAssets.duo,
//                     text: "Duolar",
//                     onTap: () {},
//                   ),
//                   10.horizontalSpace,
//                   CustomHomeButton(
//                     image: AppAssets.name99,
//                     text: "Alloh",
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_)=>NamePage()));
//                     },
//                   ),
//                   10.horizontalSpace,
//                   CustomHomeButton(
//                     image: AppAssets.compass,
//                     text: "Qibla",
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_)=>QiblaPage()));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             20.verticalSpace,
//           ],
//         ),
//       ),
//     );
//   }
// }
