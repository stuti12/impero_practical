import 'package:flutter/material.dart';
import 'package:practical_stuti/utils/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key, required this.text, this.fontWeight, this.fontColor, this.fontSize});

  final String text;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize:fontSize?? 12,
          fontWeight: fontWeight,
          color: fontColor ?? AppColors.black),
    );
  }
}
