import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/blur_wrap.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomVideoButton extends StatelessWidget {
  const CustomVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlurWrap(
      radius: BorderRadius.circular(16.r),
      child: Container(
        width: 150.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Style.black.withOpacity(0.3)
        ),
        child:  Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Videoni ko'rish",style: Style.normalText(color: Style.white,size: 14),),
            Icon(Icons.play_circle_outline,color: Style.white,)
          ],
        )),
      ),
    );
  }
}
