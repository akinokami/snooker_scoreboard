import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/controller/player_controller.dart';
import 'package:snooker_scoreboard/views/screens/play/game_screen.dart';
import 'package:snooker_scoreboard/views/widgets/custom_button.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text_form_field.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';
import '../../widgets/custom_text.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playerController = Get.put(PlayerController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.white,
          iconTheme: const IconThemeData(color: AppTheme.black),
          title: CustomText(
            text: 'players'.tr,
            size: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: playerController.selectedPlayerList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: AppTheme.greyTicket,
                          borderRadius: BorderRadius.circular(5.r)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: playerController.selectedPlayerList[index]),
                          InkWell(
                            onTap: () {
                              playerController.removeFromSelectedList(index,
                                  playerController.selectedPlayerList[index]);
                            },
                            child: Icon(
                              Icons.close_rounded,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                CustomText(text: 'players'.tr),
                SizedBox(height: 10.h),
                Visibility(
                  visible: playerController.playerList.isNotEmpty,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: playerController.playerList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  playerController.addToSelectedList(index,
                                      playerController.playerList[index]);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  padding: EdgeInsets.all(5.w),
                                  decoration: BoxDecoration(
                                      color: AppTheme.greyTicket,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      CustomText(
                                          text: playerController
                                              .playerList[index]),
                                      SizedBox(width: 10.w),
                                      InkWell(
                                        onTap: () {
                                          playerController.deletePlayer(index);
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 18.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  controller: playerController.nameTxtController,
                  hintText: 'player_name'.tr,
                  isValidate: false,
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.person_rounded,
                      size: 18.sp,
                    ),
                  ),
                  onChange: (value) {
                    if (value == '') {
                      playerController.isApVisible.value = false;
                    } else {
                      playerController.isApVisible.value = true;
                    }
                  },
                ),
                SizedBox(height: 10.h),
                playerController.isApVisible.value == true
                    ? CustomButton(
                        text: 'add_players'.tr,
                        icon: Icons.add,
                        onTap: () {
                          playerController.addPlayer();
                        },
                      )
                    : CustomButton(
                        text: 'start_game'.tr,
                        outlineColor: playerController.isGameClickable.value
                            ? AppTheme.indicatorColor
                            : AppTheme.greyTicket,
                        bgColor: playerController.isGameClickable.value
                            ? AppTheme.indicatorColor
                            : AppTheme.greyTicket,
                        onTap: playerController.isGameClickable.value
                            ? () {
                                if (playerController
                                    .selectedPlayerList.isNotEmpty) {
                                  Get.to(() => const GameScreen(), arguments: {
                                    'typeId': playerController.typeId.value,
                                    'players':
                                        playerController.selectedPlayerList,
                                  });
                                } else {
                                  constants.showSnackBar(
                                      title: 'warning'.tr,
                                      msg: 'please_select_player'.tr,
                                      textColor: AppTheme.black);
                                }
                              }
                            : null,
                      )
              ],
            ),
          ),
        ));
  }
}
