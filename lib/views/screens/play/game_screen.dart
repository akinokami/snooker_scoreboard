import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';
import 'package:snooker_scoreboard/models/snooker.dart';
import 'package:snooker_scoreboard/utils/constants.dart';
import 'package:snooker_scoreboard/views/screens/play/break_screen.dart';
import 'package:snooker_scoreboard/views/widgets/custom_button.dart';

import '../../../utils/app_theme.dart';
import '../../widgets/bottom_sheet.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/snooker_ball.dart';

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
                  // int total = 0;
                  // for (int i = 0;
                  //     i <
                  //         (gameController.pList[index].snookerList ?? [])
                  //             .length;
                  //     i++) {
                  //   total +=
                  //       gameController.pList[index].snookerList?[i].pts ?? 0;
                  // }
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
                            Obx(
                              () => gameController.isLoading.value
                                  ? Container()
                                  : CustomText(
                                      text:
                                          "${gameController.pList[index].total}"),
                            )
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
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'break'.tr),
                  CustomText(text: "${gameController.brek.value}"),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'points_remaining'.tr),
                  CustomText(text: "${gameController.remainPts.value}"),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SnookerBall(
                    color: gameController.isClickRed.value
                        ? Colors.red
                        : Colors.red.shade200,
                    text: gameController.redList.isNotEmpty
                        ? "${gameController.redList.length}"
                        : "",
                    onTap: gameController.redList.isNotEmpty
                        ? () {
                            gameController.addRedSnooker();
                            if (gameController.redList.isNotEmpty) {
                              gameController.isClickRed.value = true;
                            } else {
                              gameController.isClickRed.value = false;
                            }
                          }
                        : null,
                  ),
                  SnookerBall(
                    color: gameController.isClickYellow.value
                        ? Colors.yellow
                        : Colors.yellow.shade200,
                    onTap: gameController.isClickYellow.value
                        ? () {
                            gameController.addOtherSnooker(
                                Snooker(name: SColor.yellow.name, pts: 2));
                          }
                        : null,
                  ),
                  SnookerBall(
                    color: gameController.isClickGreen.value
                        ? Colors.green
                        : Colors.green.shade200,
                    onTap: gameController.isClickGreen.value
                        ? () {
                            gameController.addOtherSnooker(
                                Snooker(name: SColor.green.name, pts: 3));
                          }
                        : null,
                  ),
                  SnookerBall(
                    color: gameController.isClickBrown.value
                        ? Colors.brown
                        : Colors.brown.shade200,
                    onTap: gameController.isClickBrown.value
                        ? () {
                            gameController.addOtherSnooker(
                                Snooker(name: SColor.brown.name, pts: 4));
                          }
                        : null,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SnookerBall(
                    color: gameController.isClickBlue.value
                        ? Colors.blue
                        : Colors.blue.shade200,
                    onTap: gameController.isClickBlue.value
                        ? () {
                            gameController.addOtherSnooker(
                                Snooker(name: SColor.blue.name, pts: 5));
                          }
                        : null,
                  ),
                  SnookerBall(
                    color: gameController.isClickPink.value
                        ? Colors.pink
                        : Colors.pink.shade200,
                    onTap: gameController.isClickPink.value
                        ? () {
                            gameController.addOtherSnooker(
                                Snooker(name: SColor.pink.name, pts: 6));
                          }
                        : null,
                  ),
                  SnookerBall(
                    color: gameController.isClickBlack.value
                        ? Colors.black
                        : Colors.black26,
                    onTap: gameController.isClickBlack.value
                        ? () {
                            gameController.addOtherSnooker(
                                Snooker(name: SColor.black.name, pts: 7));
                          }
                        : null,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => gameController.isGamefinish.value == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: gameController.isUndoVisible.value,
                          child: CustomButton(
                              isRounded: true,
                              height: 30.h,
                              width: 50.w,
                              text: '',
                              icon: Icons.undo,
                              onTap: () {}),
                        ),
                        CustomButton(
                            isRounded: true,
                            height: 30.h,
                            width: 70.w,
                            text: 'foul'.tr,
                            onTap: () {
                              gameController.resetFoulData();
                              constants.foulDialog(gameController);
                            }),
                        CustomButton(
                            isRounded: true,
                            height: 30.h,
                            width: 120.w,
                            text: 'end_of_break'.tr,
                            onTap: () {
                              gameController.selectNextPlayer(
                                  gameController.pIndex.value + 1);
                            }),
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
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                            isRounded: true,
                            height: 30.h,
                            width: 120.w,
                            text: 'new_game'.tr,
                            onTap: () {
                              gameController.restartGame();
                            }),
                        CustomButton(
                            isRounded: true,
                            height: 30.h,
                            width: 120.w,
                            text: 'finish_game'.tr,
                            onTap: () {
                              constants.finishDialog();
                            }),
                        CustomButton(
                            isRounded: true,
                            height: 30.h,
                            width: 50.w,
                            text: '',
                            icon: Icons.pie_chart,
                            onTap: () {
                              Get.to(() => const BreakScreen());
                            })
                      ],
                    ),
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
