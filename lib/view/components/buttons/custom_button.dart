
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget sufix;
  final Widget perfix;
  final String text;

  const CustomButton({super.key, this.width=double.infinity, this.height=40, this.sufix=const SizedBox.shrink(),required this.perfix, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Style.darkGrey.withOpacity(0.1),
      ),
      child: Row(
        children: [
          10.horizontalSpace,
        perfix,
          10.horizontalSpace,
          Text(text,style: Style.normalText(color: Style.primary),),
          Spacer(),
          sufix,
          10.horizontalSpace,
        ],
      ),
    );
  }
}
