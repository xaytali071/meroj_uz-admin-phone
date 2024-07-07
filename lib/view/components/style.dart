import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {
  Style._();

  static const primary = Color(0xff023e24);
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const transparent = Color(0x00000000);
  static const green = Color(0xff1D9D3C);
  static const darkGrey = Color(0xFF757575);
  static const grey = Color(0xffF9F7F7);
  static const yellow = Color(0xffECDF2C);
  static const red=Color(0xFFB71C1C);

  static TextStyle boldText(
      {double size = 24,
      FontWeight weight = FontWeight.w700,
      Color color = Style.black}) {
    return GoogleFonts.roboto(color: color, fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle normalText(
      {double size = 12,
      FontWeight weight = FontWeight.w700,
      Color color = Style.black}) {
    return GoogleFonts.roboto(color: color, fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle miniText(
      {double size = 8,
      FontWeight weight = FontWeight.w500,
      Color color = Style.black}) {
    return GoogleFonts.roboto(color: color, fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle hintText(
      {double size = 12,
      FontWeight weight = FontWeight.w700,
      Color color = Style.darkGrey}) {
    return GoogleFonts.roboto(color: color, fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle normalText2(
      {double size = 10,
      FontWeight weight = FontWeight.w600,
      Color color = Style.black}) {
    return GoogleFonts.roboto(color: color, fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle logoText(
      {double size = 24,
      FontWeight weight = FontWeight.w900,
      Color color = Style.black}) {
    return GoogleFonts.charm(
        color: color, fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle mentionText(
      {double size = 24,
      FontWeight weight = FontWeight.w900,
      Color color = Style.black}) {
    return GoogleFonts.rumRaisin(
        color: color, fontSize: size.sp, fontWeight: weight);
  }
}
