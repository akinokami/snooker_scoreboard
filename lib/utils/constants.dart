import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';
import 'package:snooker_scoreboard/utils/app_theme.dart';

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
        title: "Finish game",
        middleText: "Are you sure you want to finish this game?",
        backgroundColor: AppTheme.white,
        titleStyle: TextStyle(color: AppTheme.black),
        middleTextStyle: TextStyle(color: AppTheme.black),
        textConfirm: "Yes",
        textCancel: "No",
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
      title: "Restart game",
      middleText: "Are you sure you want to restart this game?",
      backgroundColor: AppTheme.white,
      titleStyle: TextStyle(color: AppTheme.black),
      middleTextStyle: TextStyle(color: AppTheme.black),
      textConfirm: "Yes",
      textCancel: "No",
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
}
