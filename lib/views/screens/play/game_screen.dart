import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';

import '../../../utils/app_theme.dart';
import '../../widgets/custom_text.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = Get.put(GameController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.white,
        iconTheme: const IconThemeData(color: AppTheme.black),
        title: CustomText(
          text: '',
          size: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'break'.tr),
                CustomText(text: '0'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'points_remaining'.tr),
                CustomText(text: '0'),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.red,
                ),
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.yellow,
                ),
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.green,
                ),
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.brown,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.blue,
                ),
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.pink,
                ),
                Image.asset(
                  'assets/images/overlay.webp',
                  height: 40.h,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
