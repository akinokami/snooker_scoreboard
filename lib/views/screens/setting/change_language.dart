import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/language_controller.dart';
import '../../../utils/app_theme.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.white,
        iconTheme: const IconThemeData(color: AppTheme.black),
        title: CustomText(
          text: 'change_language'.tr,
          size: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("en", "US");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/usa.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "English",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value == "en"
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value == "en"
                                ? AppTheme.indicatorColor
                                : AppTheme.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Obx(
                //   () => GestureDetector(
                //     onTap: () {
                //       languageController.changeLanguage("zh", "CN");
                //     },
                //     child: Card(
                //       color: cardColor,
                //       child: ListTile(
                //         leading: Image.asset(
                //           "assets/images/china.webp",
                //           width: 20.w,
                //           height: 20.h,
                //         ),
                //         title: CustomText(
                //           text: "中国人",
                //           //color: lightWhiteColor,
                //         ),
                //         trailing: Icon(
                //           languageController.language.value == "zh"
                //               ? Icons.check_circle
                //               : Icons.check_circle_outline,
                //           color: languageController.language.value == "zh"
                //               ? secondaryColor
                //               : greyColor,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("vi", "VN");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/vietnam.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "Tiếng Việt",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value == "vi"
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value == "vi"
                                ? AppTheme.indicatorColor
                                : AppTheme.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
