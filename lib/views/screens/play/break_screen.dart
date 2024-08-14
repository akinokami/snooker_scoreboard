import 'package:flutter/material.dart';
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
            itemCount: gameController.brekList.length,
            itemBuilder: (context, index) {
              return CustomCard(
                  widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: gameController.brekList[index].name),
                      CustomText(text: '10'),
                    ],
                  ),
                  SnookerBall(
                    height: 30.h,
                    color: Colors.red,
                  )
                ],
              ));
            }));
  }
}
