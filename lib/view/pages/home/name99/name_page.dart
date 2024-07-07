import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_notifire.dart';
import 'package:meroj_uz_admin_phone/controller/app_controller/app_state.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/app_const.dart';

import '../../../components/style.dart';
import 'name_desc.dart';

class NamePage extends ConsumerStatefulWidget {
  const NamePage({super.key});

  @override
  ConsumerState<NamePage> createState() => _NamePageState();
}

class _NamePageState extends ConsumerState<NamePage> {

  
  @override
  Widget build(BuildContext context) {
    final event=ref.read(appProvider.notifier);
    AppState watch=ref.watch(appProvider);
    return  Scaffold(
      backgroundColor: watch.isDark ? Style.black : Style.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Style.yellow,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: watch.isDark ? Style.black : Style.primary,
        title:  Text("Al-Asmo al-Husno",style: Style.boldText(color: Style.yellow,size: 20),),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: AppConst.listOf99Name.length,
          itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            print(AppConst.listOf99Name.length);
            Navigator.push(context, MaterialPageRoute(builder: (_)=>NameDesc(name: AppConst.listOf99Name[index].name, desc: AppConst.listOf99Name[index].desc)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            width: MediaQuery.sizeOf(context).width,
            height: 50.h,
            decoration: BoxDecoration(
              color: Style.white.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(16.r))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(AppConst.listOf99Name[index].name,style: Style.normalText(color: Style.yellow),),
                Text(AppConst.listOf99Name[index].arabic,style: Style.normalText2(color: Style.white),)
              ],
            ),
          ),
        );
      }),
    );
  }
}
