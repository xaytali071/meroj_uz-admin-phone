import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomArrow extends StatelessWidget {
  const CustomArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 50,
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 20.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Style.white
              ),
            ),
            Positioned(
            top: 0,
                //bottom: 80,
                left: 6,
                right: 6,
                child: Icon(Icons.arrow_drop_up,size: 80,color: Style.white,)),
          ],
        ),
      ),
    );
  }
}
