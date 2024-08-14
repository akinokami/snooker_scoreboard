import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/views/screens/setting/setting_screen.dart';
import 'package:snooker_scoreboard/views/screens/play/play_screen.dart';

import '../../controller/home_controller.dart';
import '../../utils/app_theme.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 10.sp);

  final TextStyle selectedLabelStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.sp);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 56.h,
          child: BottomNavigationBar(
            selectedFontSize: 10.sp,
            unselectedFontSize: 10.sp,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: AppTheme.white,
            unselectedItemColor: AppTheme.grey,
            selectedItemColor: AppTheme.indicatorColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.gamepad,
                  size: 15.sp,
                ),
                label: 'play'.tr,
                backgroundColor: AppTheme.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 15.sp,
                ),
                label: 'settings'.tr,
                backgroundColor: AppTheme.white,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, homeController),
      body: Obx(() => IndexedStack(
            index: homeController.tabIndex.value,
            children: const [
              PlayScreen(),
              SettingScreen(),
            ],
          )),
    ));
  }
}
