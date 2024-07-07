import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/buttons/button_effect.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomShapeButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final double size;

  const CustomShapeButton(
      {super.key,
      required this.child,
      required this.onTap,
      this.color = Style.primary,
       this.size=100});

  @override
  Widget build(BuildContext context) {
    return AnimationButtonEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            width: size.r,
            height: size.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(child: child)),
      ),
    );
  }
}
