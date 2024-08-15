import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';
import 'package:snooker_scoreboard/models/snooker.dart';
import 'package:snooker_scoreboard/utils/app_theme.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text.dart';
import 'package:snooker_scoreboard/views/widgets/snooker_ball.dart';

import '../views/screens/home_menu.dart';

Constants constants = Constants();

class Constants {
  static final Constants _constants = Constants._i();

  factory Constants() {
    return _constants;
  }

  Constants._i();
  void showSnackBar(
      {String? title, String? msg, Color? bgColor, Color? textColor}) {
    Get.snackbar(
      title ?? "",
      msg ?? "",
      colorText: textColor ?? AppTheme.blackTextColor,
      backgroundColor: bgColor ?? AppTheme.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void finishDialog() {
    Get.defaultDialog(
        titlePadding: EdgeInsets.all(10.w),
        contentPadding: EdgeInsets.all(10.w),
        title: 'finish_game'.tr,
        middleText: 'are_you_sure_to_finish'.tr,
        backgroundColor: AppTheme.white,
        titleStyle: TextStyle(color: AppTheme.black, fontSize: 15.sp),
        middleTextStyle: TextStyle(color: AppTheme.black, fontSize: 12.sp),
        textConfirm: 'yes'.tr,
        textCancel: 'no'.tr,
        cancelTextColor: AppTheme.black,
        confirmTextColor: AppTheme.white,
        buttonColor: AppTheme.indicatorColor,
        barrierDismissible: false,
        radius: 10.r,
        onConfirm: () {
          Get.offAll(() => Home());
        });
  }

  void restartDialog(GameController gameController) {
    Get.defaultDialog(
      titlePadding: EdgeInsets.all(10.w),
      contentPadding: EdgeInsets.all(10.w),
      title: 'restart_game'.tr,
      middleText: 'are_you_sure_to_restart'.tr,
      backgroundColor: AppTheme.white,
      titleStyle: TextStyle(color: AppTheme.black, fontSize: 15.sp),
      middleTextStyle: TextStyle(color: AppTheme.black, fontSize: 12.sp),
      textConfirm: 'yes'.tr,
      textCancel: 'no'.tr,
      cancelTextColor: AppTheme.black,
      confirmTextColor: AppTheme.white,
      buttonColor: AppTheme.indicatorColor,
      barrierDismissible: false,
      radius: 10.r,
      onConfirm: () {
        Get.back();
        gameController.resetGame();
      },
    );
  }

  void foulDialog(GameController gameController) {
    Get.defaultDialog(
        titlePadding: EdgeInsets.all(10.w),
        contentPadding: EdgeInsets.all(10.w),
        title: 'foul'.tr,
        backgroundColor: AppTheme.white,
        titleStyle: TextStyle(color: AppTheme.black, fontSize: 15.sp),
        textConfirm: 'submit'.tr,
        textCancel: 'cancel'.tr,
        cancelTextColor: AppTheme.black,
        confirmTextColor: AppTheme.white,
        buttonColor: AppTheme.indicatorColor,
        barrierDismissible: false,
        radius: 10.r,
        onConfirm: () {
          Get.back();
          gameController.resetGame();
        },
        content: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SnookerBall(
                  color: Colors.white,
                  height: 25.h,
                  text: '4',
                  onTap: () {},
                ),
                SnookerBall(
                  color: Colors.red,
                  height: 25.h,
                  text: '4',
                  onTap: () {},
                ),
                SnookerBall(
                  color: Colors.yellow,
                  height: 25.h,
                  text: '4',
                  onTap: () {},
                ),
                SnookerBall(
                  color: Colors.green,
                  height: 25.h,
                  text: '4',
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SnookerBall(
                  color: Colors.brown,
                  height: 25.h,
                  text: '4',
                  onTap: () {},
                ),
                SnookerBall(
                  color: Colors.blue,
                  height: 25.h,
                  text: '5',
                  onTap: () {},
                ),
                SnookerBall(
                  color: Colors.pink,
                  height: 25.h,
                  text: '6',
                  onTap: () {},
                ),
                SnookerBall(
                  color: Colors.black,
                  height: 25.h,
                  text: '7',
                  onTap: () {},
                ),
              ],
            )
          ],
        ));
  }
}
