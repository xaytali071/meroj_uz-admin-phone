import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class NotificationWidget extends StatelessWidget {
  final int count;
  final VoidCallback onTap;
  const NotificationWidget({super.key, required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 35.w,
        height: 35.h,
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              color: Style.white,
              size: 30,
            ),
            Positioned(
              right: 8.w,
              top: 0.h,
              child: count==0 ? SizedBox.shrink() : Container(
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Style.red,
                ),
                child: Center(child: Text(count.toString(),style: Style.miniText(size: 7,weight: FontWeight.w600,color: Style.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}