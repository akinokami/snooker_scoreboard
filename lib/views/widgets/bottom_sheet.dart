import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/utils/app_theme.dart';
import 'package:snooker_scoreboard/views/screens/play/break_screen.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: SizedBox(
        height: 200.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: AppTheme.greyLight,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.square,
                  size: 18.sp,
                  color: AppTheme.indicatorColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(text: 'finish_game'.tr)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.restart_alt,
                  size: 18.sp,
                  color: AppTheme.indicatorColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(text: 'restart_game'.tr)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.delete,
                  size: 18.sp,
                  color: AppTheme.indicatorColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(text: 'remove_red_from_table'.tr)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const BreakScreen());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.pie_chart,
                    size: 18.sp,
                    color: AppTheme.indicatorColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(text: 'breaks'.tr)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
