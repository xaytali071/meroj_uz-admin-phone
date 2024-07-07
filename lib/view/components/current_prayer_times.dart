import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';
import 'package:prayers_times/prayers_times.dart';

class CurrentPrayerTimes extends StatelessWidget {
  final PrayerTimes time;

  const CurrentPrayerTimes({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.r,
      height: 80.r,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Style.green,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 2.r),
        width: 80.r,
        height: 80.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Style.primary,
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time.nextPrayer().contains("isha")
                  ? "Xufton"
                  : time.nextPrayer().contains("fajr")
                      ? "Bomdod"
                      : time.nextPrayer().contains("asr")
                          ? "Asr"
                          : time.nextPrayer().contains("maghrib")
                              ? "Shom"
                              : "Peshin",
              style: Style.normalText2(color: Style.white),
            ),
            Text(time.nextPrayer().contains("isha")
                ? "${time.fajrStartTime!.hour} : ${time.fajrStartTime!.minute}"
                : time.nextPrayer().contains("fajr")
                ? "${time.fajrStartTime!.hour} : ${time.fajrStartTime!.minute}"
                : time.nextPrayer().contains("asr")
                ? "${time.asrStartTime!.hour} : ${time.asrStartTime!.minute}"
                : time.nextPrayer().contains("maghrib")
                ? "${time.maghribStartTime!.hour} : ${time.maghribStartTime!.minute}"
                :   "${time.dhuhrStartTime!.hour} : ${time.dhuhrStartTime!.minute}"
              ,style: Style.miniText(color: Style.white),)
          ],
        )),
      ),
    );
  }
}
