import 'package:flutter/material.dart';
import 'package:foode/core/constans/app_colors.dart';

sealed class AppTextStyles {
  static const button = TextStyle(
      color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w500);
  static const appBar = TextStyle(
      color: AppColors.black, fontSize: 22, fontWeight: FontWeight.w600);

  /// font size 26 , fontWeight: w600, color ?? white)
  static TextStyle h1({Color? color}) => TextStyle(
      fontSize: 28, fontWeight: FontWeight.w600, color: color ?? Colors.white);

  /// font size 26 , fontWeight: w600, color ?? white)
  static TextStyle h2({Color? color}) => TextStyle(
      fontSize: 26, fontWeight: FontWeight.w600, color: color ?? Colors.white);

  /// font size 24 , fontWeight: w600, color ?? white)
  static TextStyle h3({Color? color}) => TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: color ?? Colors.white);

  /// font size 20 , fontWeight: w600, color ?? white)
  static TextStyle h4({Color? color}) => TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: color ?? Colors.white);

  /// font size 16 , fontWeight: w600, color ?? white)
  static TextStyle h5({Color? color}) => TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: color ?? Colors.white);

  /// font size 14 , fontWeight: w500, color ?? white)
  static TextStyle h6({Color? color}) => TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: color ?? Colors.white);

  /// font size 12 , fontWeight: w400, color ?? white)
  static TextStyle h7({Color? color}) => TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: color ?? Colors.white);

  /// font size 10 , fontWeight: w300, color ?? white)
  static TextStyle h8({Color? color}) => TextStyle(
      fontSize: 10, fontWeight: FontWeight.w300, color: color ?? Colors.white);
}
