import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text.dart';

import '../../utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? size;
  final Color? txtColor;
  final Color? bgColor;
  final Color? outlineColor;
  final Color? shadowColor;
  final bool? isRounded;
  final double? width;
  final double? height;
  final IconData? icon;
  final String? image;
  final void Function()? onTap;

  const CustomButton(
      {super.key,
      required this.text,
      this.size,
      this.txtColor,
      this.bgColor,
      this.outlineColor,
      this.shadowColor,
      this.isRounded,
      this.width,
      this.height,
      this.icon,
      this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 35.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: outlineColor ?? AppTheme.indicatorColor, width: 2),
          borderRadius: isRounded == true
              ? BorderRadius.circular(100)
              : BorderRadius.circular(5),
          color: bgColor ?? AppTheme.indicatorColor,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Padding(
                padding: text != ''
                    ? const EdgeInsets.only(right: 8.0)
                    : const EdgeInsets.all(0),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
            Visibility(
              visible: image != null,
              child: Padding(
                padding: text != ''
                    ? const EdgeInsets.only(right: 8.0)
                    : const EdgeInsets.all(0),
                child: Image.asset(
                  image ?? '',
                  width: 20.h,
                  height: 20.h,
                ),
              ),
            ),
            CustomText(
              text: text,
              textColor: txtColor ?? Colors.white,
              size: size ?? 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
