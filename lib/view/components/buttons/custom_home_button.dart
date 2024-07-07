import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/button_effect.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomHomeButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;

  const CustomHomeButton(
      {super.key,
      required this.text,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimationButtonEffect(
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Style.darkGrey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Container(
                width: 100.r,
                height: 100.r,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              Text(
                text,
                style: Style.normalText(color: Style.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
