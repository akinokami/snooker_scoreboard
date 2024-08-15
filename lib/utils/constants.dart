import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';
import 'package:snooker_scoreboard/utils/app_theme.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text.dart';
import 'package:snooker_scoreboard/views/widgets/snooker_ball.dart';

import '../models/snooker.dart';
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
        gameController.restartGame();
      },
    );
  }

  void foulDialog(GameController gameController) {
    Get.defaultDialog(
        titlePadding: EdgeInsets.all(10.w),
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
          gameController.addFoul();
        },
        content: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SnookerBall(
                      color: Colors.white,
                      height:
                          gameController.isWhiteSelected.value ? 32.h : 25.h,
                      text: '4',
                      onTap: () {
                        gameController.isWhiteSelected.value = true;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -4);
                      },
                    ),
                    SnookerBall(
                      color: Colors.red,
                      height: gameController.isRedSelected.value ? 32.h : 25.h,
                      text: '4',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = true;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -4);
                      },
                    ),
                    SnookerBall(
                      color: Colors.yellow,
                      height:
                          gameController.isYellowSelected.value ? 32.h : 25.h,
                      text: '4',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = true;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -4);
                      },
                    ),
                    SnookerBall(
                      color: Colors.green,
                      height:
                          gameController.isGreenSelected.value ? 32.h : 25.h,
                      text: '4',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = true;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -4);
                      },
                    ),
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SnookerBall(
                      color: Colors.brown,
                      height:
                          gameController.isBrownSelected.value ? 32.h : 25.h,
                      text: '4',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = true;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -4);
                      },
                    ),
                    SnookerBall(
                      color: Colors.blue,
                      height: gameController.isBlueSelected.value ? 32.h : 25.h,
                      text: '5',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = true;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -5);
                      },
                    ),
                    SnookerBall(
                      color: Colors.pink,
                      height: gameController.isPinkSelected.value ? 32.h : 25.h,
                      text: '6',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = true;
                        gameController.isBlackSelected.value = false;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -6);
                      },
                    ),
                    SnookerBall(
                      color: Colors.black,
                      height:
                          gameController.isBlackSelected.value ? 32.h : 25.h,
                      text: '7',
                      onTap: () {
                        gameController.isWhiteSelected.value = false;
                        gameController.isRedSelected.value = false;
                        gameController.isYellowSelected.value = false;
                        gameController.isGreenSelected.value = false;
                        gameController.isBrownSelected.value = false;
                        gameController.isBlueSelected.value = false;
                        gameController.isPinkSelected.value = false;
                        gameController.isBlackSelected.value = true;
                        gameController.selectedFoulSnooker.value = Snooker(
                            name: SColor.foul.name, isFoul: true, pts: -7);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'miss'.tr,
                    size: 12.sp,
                  ),
                  Obx(
                    () => Checkbox(
                      value: gameController.isMissChecked.value,
                      activeColor: AppTheme.indicatorColor,
                      onChanged: (value) {
                        gameController.isMissChecked.value = value!;
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'free_ball'.tr,
                    size: 12.sp,
                  ),
                  Obx(
                    () => Checkbox(
                      value: gameController.isFreeChecked.value,
                      activeColor: AppTheme.indicatorColor,
                      onChanged: (value) {
                        gameController.isFreeChecked.value = value!;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Obx(
                () => Visibility(
                  visible: gameController.redList.isNotEmpty,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'remove_reds'.tr,
                        size: 12.sp,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: gameController.redCount.value > 0
                                ? () {
                                    if (gameController.redCount.value > 0) {
                                      gameController.redCount.value -= 1;
                                    }
                                  }
                                : null,
                            child: Icon(
                              Icons.remove,
                              size: 18.sp,
                              color: gameController.redCount.value > 0
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            text: gameController.redCount.value.toString(),
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: gameController.redCount.value <
                                    gameController.redList.length
                                ? () {
                                    gameController.redCount.value += 1;
                                  }
                                : null,
                            child: Icon(
                              Icons.add,
                              size: 18.sp,
                              color: gameController.redCount.value <
                                      gameController.redList.length
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
