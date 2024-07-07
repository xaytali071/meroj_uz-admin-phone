import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meroj_uz_admin_phone/view/components/style.dart';

class CustomDropDown extends StatelessWidget {
  final List list;
  final Color borderColor;
  final String hint;
  final double width;
  final double height;
  final String? value;
  final ValueChanged? onChanged;
  final String? Function(Object?)? validator;

  const CustomDropDown(
      {super.key,
      required this.list,
      this.borderColor = Style.primary,
      this.value,
      this.width = double.infinity,
      this.height = 40,
      this.hint = "Zikirlar",
        this.onChanged,
        this.validator,
     });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: DropdownButtonFormField(
          focusColor: Style.white,
          hint: Text(
            hint,
            style: Style.hintText(color: Style.yellow),
          ),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(color: borderColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(color: borderColor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(
                    color: borderColor,
                  )),
              contentPadding: REdgeInsets.symmetric(horizontal: 5, vertical: 8),
              hintText: hint,
              hintStyle: Style.hintText(color: Style.yellow),
              fillColor: Style.white.withOpacity(0.1),
              filled: true),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Style.yellow,
          ),
          dropdownColor: Style.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.r),
          value: value,
          items: list
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e ?? "",style: Style.normalText(color: Style.yellow),),
                  ))
              .toList(),
          onChanged:onChanged),
    );
  }
}
