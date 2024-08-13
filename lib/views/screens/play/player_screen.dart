import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/views/widgets/custom_button.dart';
import 'package:snooker_scoreboard/views/widgets/custom_text_form_field.dart';

import '../../../utils/app_theme.dart';
import '../../widgets/custom_text.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'player_name'.tr,
                isValidate: false,
                prefixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.person_rounded,
                      size: 18.sp,
                    )),
              ),
              SizedBox(height: 10.h),
              CustomButton(
                  text: 'add_players'.tr, icon: Icons.add, onTap: () {})
            ],
          ),
        ));
  }
}
