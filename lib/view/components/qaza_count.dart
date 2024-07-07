import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/shape_button.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class QazaCount extends StatelessWidget {
  final VoidCallback plusButton;
  final VoidCallback minsButton;
  final int count;
  final double buttonSize;
  final double textSize;
  final FontWeight fontWeight;
  final String text;

  const QazaCount({
    super.key,
    required this.plusButton,
    required this.minsButton,
    required this.count,
    this.buttonSize = 40,
    this.textSize = 24,
    this.fontWeight = FontWeight.w700,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: Style.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24.r)),
      child: Row(
        children: [
          30.horizontalSpace,
          Text(
            text,
            style: Style.normalText(color: Style.yellow),
          ),
          Spacer(),
          CustomShapeButton(
            child: const Icon(
              Icons.remove,
              color: Style.yellow,
            ),
            onTap:minsButton,
            size: buttonSize,
            color: Style.green.withOpacity(0.5),
          ),
          20.horizontalSpace,
          SizedBox(
            width: 40.w,
            child: Center(
              child: Text(
                "$count",
                style: Style.boldText(
                    size: textSize, weight: fontWeight, color: Style.yellow),
              ),
            ),
          ),
          20.horizontalSpace,
          CustomShapeButton(
            child: const Icon(
              Icons.add,
              color: Style.yellow,
            ),
            onTap:plusButton,
            size: buttonSize,
            color: Style.green.withOpacity(0.5),
          ),
          5.horizontalSpace,
        ],
      ),
    );
  }
}
