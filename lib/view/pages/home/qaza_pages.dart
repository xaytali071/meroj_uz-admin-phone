import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/controller/prayer_controller/prayer_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/qaza_count.dart';

import '../../components/style.dart';

class QazaPage extends ConsumerStatefulWidget {
  const QazaPage({super.key});

  @override
  ConsumerState<QazaPage> createState() => _QazaPageState();
}

class _QazaPageState extends ConsumerState<QazaPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(prayerProvider.notifier).getQaza();
      ref.read(appProvider.notifier).changeMode();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event=ref.read(prayerProvider.notifier);
    PrayerState watch=ref.watch(prayerProvider);
    return  Scaffold(
      backgroundColor: Style.primary,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Style.primary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Style.yellow,),
              onPressed: () {
                Navigator.pop(context);
              },),
            title: Text("Qazoloar hisobi",
              style: Style.boldText(color: Style.yellow, size: 20),),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child:
            Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    70.verticalSpace,
                    QazaCount(text: "Bomdod", plusButton: () {
                      event.addBomdod();
                    }, minsButton: () {
                      event.removeBomdod();
                    }, count: watch.bomdodCounter),


                    20.verticalSpace,
                    QazaCount(text: "Peshin", plusButton: () {
                      event.addPeshin();
                    }, minsButton: () {
                      event.removePeshin();
                    }, count: watch.peshinCounter),
                    20.verticalSpace,
                    QazaCount(text: "Asr", plusButton: () {
                      event.addAsr();
                    }, minsButton: () {
                      event.removeAsr();
                    }, count: watch.asrCounter),
                    20.verticalSpace,
                    QazaCount(text: "Shom", plusButton: () {
                      event.addShom();
                    }, minsButton: () {
                      event.removeShom();
                    }, count: watch.shomCounter),
                    20.verticalSpace,
                    QazaCount(text: "Xuftn", plusButton: () {
                      event.addXufton();
                    }, minsButton: () {
                      event.removeXufton();
                    }, count: watch.xuftonCounter),
                    20.verticalSpace,
                    QazaCount(text: "Vitr", plusButton: () {
                      event.addVitr();
                    }, minsButton: () {
                      event.removeVitr();
                    }, count: watch.vitrCounter),
                  ],
                ),

          ),
        );
  }
}
