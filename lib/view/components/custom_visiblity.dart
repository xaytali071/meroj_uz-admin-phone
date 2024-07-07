import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/controller/provider.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomVisiblity extends ConsumerWidget {
  final String title;
  final Widget data;
  const CustomVisiblity({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context,ref) {

    return InkWell(
      onTap: (){
        ref.read(appProvider.notifier).hide();
      },
      child:
           ref.watch(appProvider).isHide ? DecoratedBox(decoration: BoxDecoration(
            color: Style.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Row(
            children: [
              20.horizontalSpace,
            Text(title,style: Style.normalText(color: Style.black,size: 16),),
            ref.watch(appProvider).isHide ? Icon(Icons.keyboard_arrow_down,color: Style.white,) :Icon(Icons.arrow_forward_ios,color: Style.white,
              size: 20,)
            ],
          ),
              Padding(
                padding:  EdgeInsets.all(10.r),
                child: data
              )
            ],
          ),
          ) : Row(
            children: [
              Text(title,style: Style.normalText(color: Style.white,size: 16),),
             ref.watch(appProvider).isHide ? Icon(Icons.keyboard_arrow_down,color: Style.white,) :Icon(Icons.arrow_forward_ios,color: Style.white,
             size: 20,)
            ],
          ),
    );
  }
}
