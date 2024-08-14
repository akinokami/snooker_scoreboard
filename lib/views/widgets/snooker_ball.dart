import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text.dart';

import '../../utils/app_theme.dart';

class SnookerBall extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? height;
  final void Function()? onTap;
  const SnookerBall(
      {super.key, this.text, this.color, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.grey,
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(100),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Container(
          height: height ?? 40.h,
          width: height ?? 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/overlay.webp',
                ),
                fit: BoxFit.cover),
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: text ?? '',
            textColor: AppTheme.white,
            fontWeight: FontWeight.bold,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}
