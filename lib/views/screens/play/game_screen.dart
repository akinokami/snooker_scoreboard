import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';
import 'package:snooker_scoreboard/views/widgets/custom_button.dart';

import '../../../utils/app_theme.dart';
import '../../widgets/bottom_sheet.dart';
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: gameController.pList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      gameController.selectedPlayer.value =
                          gameController.pList[index];
                    },
                    child: Obx(
                      () => Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            color: AppTheme.greyTicket,
                            borderRadius: BorderRadius.circular(5.r)),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Visibility(
                              visible:
                                  gameController.selectedPlayer.value.name ==
                                      gameController.pList[index].name,
                              child: Icon(
                                Icons.circle,
                                size: 18.sp,
                                color: AppTheme.indicatorColor,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: CustomText(
                                  text: gameController.pList[index].name),
                            ),
                            CustomText(
                                text: "${gameController.pList[index].pts}")
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'break'.tr),
                CustomText(text: "${gameController.brek.value}"),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'points_remaining'.tr),
                CustomText(text: "${gameController.remainPts.value}"),
              ],
            ),
            SizedBox(
              height: 30.h,
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
              height: 20.h,
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
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    isRounded: true,
                    height: 30.h,
                    width: 50.w,
                    text: '',
                    icon: Icons.undo,
                    onTap: () {}),
                CustomButton(
                    isRounded: true,
                    height: 30.h,
                    width: 70.w,
                    text: 'foul'.tr,
                    onTap: () {}),
                CustomButton(
                    isRounded: true,
                    height: 30.h,
                    width: 120.w,
                    text: 'end_of_break'.tr,
                    onTap: () {}),
                CustomButton(
                    isRounded: true,
                    height: 30.h,
                    width: 50.w,
                    text: '',
                    icon: Icons.more_horiz,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (ctx) => const BottomSheetWidget(),
                      );
                    })
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
