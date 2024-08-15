import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/game_controller.dart';
import 'package:snooker_scoreboard/views/widgets/custom_card.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text.dart';
import 'package:snooker_scoreboard/views/widgets/snooker_ball.dart';

import '../../../utils/app_theme.dart';

class BreakScreen extends StatelessWidget {
  const BreakScreen({super.key});

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
            text: 'breaks'.tr,
            size: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: ListView.builder(
            reverse: true,
            itemCount: gameController.brekList.length,
            itemBuilder: (context, index) {
              int total = 0;
              for (int i = 0;
                  i < (gameController.brekList[index].snookerList ?? []).length;
                  i++) {
                total +=
                    gameController.brekList[index].snookerList?[i].pts ?? 0;
              }
              return CustomCard(
                  widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: gameController.brekList[index].name),
                      CustomText(text: total.toString()),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 34.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          gameController.brekList[index].snookerList?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index1) {
                        return SnookerBall(
                          height: 30.h,
                          color: gameController.brekList[index]
                                      .snookerList?[index1].name ==
                                  SColor.red.name
                              ? Colors.red
                              : gameController.brekList[index]
                                          .snookerList?[index1].name ==
                                      SColor.yellow.name
                                  ? Colors.yellow
                                  : gameController.brekList[index]
                                              .snookerList?[index1].name ==
                                          SColor.green.name
                                      ? Colors.green
                                      : gameController.brekList[index]
                                                  .snookerList?[index1].name ==
                                              SColor.brown.name
                                          ? Colors.brown
                                          : gameController
                                                      .brekList[index]
                                                      .snookerList?[index1]
                                                      .name ==
                                                  SColor.blue.name
                                              ? Colors.blue
                                              : gameController
                                                          .brekList[index]
                                                          .snookerList?[index1]
                                                          .name ==
                                                      SColor.pink.name
                                                  ? Colors.pink
                                                  : Colors.black,
                        );
                      },
                    ),
                  )
                ],
              ));
            }));
  }
}
