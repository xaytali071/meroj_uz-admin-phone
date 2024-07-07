import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_notifire.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/shape_button.dart';
import 'package:meroj_uz_admin_phone/view/components/custom_drop_down_button.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';


class TasbehPage extends ConsumerStatefulWidget {
  const TasbehPage({super.key});

  @override
  ConsumerState<TasbehPage> createState() => _TasbehPage();
}

class _TasbehPage extends ConsumerState<TasbehPage> {

  List<String> listOfZikir=["Subhan Alloh","Alhamdulillah","Allohu Akbar"];
  List<String> listOfTaxsbeh=["33","99","100","101","111","333","1000"];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(appProvider.notifier).changeMode();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
    return Scaffold(
      backgroundColor: watch.isDark ? Style.black : Style.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Style.yellow,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: watch.isDark ? Style.primary.withOpacity(0.5) : Style.primary,
        title:  Text("Zikirlar",style: Style.boldText(color: Style.yellow,size: 20),),
      ),
      body:  Column(
            children: [
              Container(
                width: MediaQuery
                    .sizeOf(context)
                    .width,
                height: 400.h,
                decoration: BoxDecoration(
          color: watch.isDark ? Style.primary.withOpacity(0.5) : Style.primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(64.r),
                        bottomRight: Radius.circular(64.r))),
                child:  SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      50.verticalSpace,
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            CustomDropDown(hint: "SubhanAlloh",width: 150,list: listOfZikir,onChanged: (s){
                              event.changeMentions(s);
                            },),
                            Spacer(),
                            CustomDropDown(hint: "33",list: listOfTaxsbeh,width: 150,onChanged: (s){
                              event.maxTasbeh(int.parse(s));
                            },)
                          ],
                        ),
                      ),
                      70.verticalSpace,

                      Center(child: Text(watch.mentions,style: Style.mentionText(color: Style.yellow),)),
                    80.verticalSpace,
                    Center(child: Text(watch.tasbehCount.toString(),style: Style.boldText(color: Style.yellow),))
                    ],
                  ),
                ),
              ),
              70.verticalSpace,
              CustomShapeButton(child: Text(watch.tasbehCount.toString(),style: Style.normalText(color: Style.white),), onTap: () {
                event.tasbehCounter();
                Vibrate.feedback(FeedbackType.light);
              }),
            ],
          ),
);
  }
}
