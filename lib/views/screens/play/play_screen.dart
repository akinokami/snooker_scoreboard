import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/global.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  bool isAccepted = false;
  bool isChecked = false;
  String first = '';

  @override
  void initState() {
    super.initState();
    final box = GetStorage();
    first = box.read('first') ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (first == '') {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => Builder(builder: (context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 1.sh * 0.80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChildScrollView(
                              child: SizedBox(
                                  height: 1.sh * 0.65,
                                  width: double.infinity,
                                  child: WebViewWidget(
                                      controller: WebViewController()
                                        ..loadHtmlString(Global.language == "vi"
                                            ? Global.policyHtmlVi
                                            : Global.policyHtmlEn))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  activeColor: AppTheme.premiumColor2,
                                  side: BorderSide(
                                    width: 1.5,
                                    color: isChecked
                                        ? AppTheme.premiumColor2
                                        : Colors.black,
                                  ),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                      if (isChecked) {
                                        isAccepted = true;
                                      } else {
                                        isAccepted = false;
                                      }
                                    });
                                  },
                                ),
                                CustomText(
                                  text: 'agree'.tr,
                                  size: 12,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          isAccepted
                                              ? AppTheme.premiumColor2
                                              : AppTheme.greyTicket)),
                              // ignore: sort_child_properties_last
                              child: CustomText(
                                text: 'accept'.tr,
                                size: 12,
                              ),
                              onPressed: isAccepted
                                  ? () async {
                                      final box = GetStorage();
                                      box.write('first', 'notfirst');
                                      Navigator.pop(context);
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          }
        }
      } catch (e) {
        // print("Error fetching SharedPreferences: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.white,
        title: CustomText(
          text: 'new_game'.tr,
          size: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppTheme.indicatorColor,
        onPressed: () {},
        label: CustomText(
          text: 'add_players'.tr,
          textColor: AppTheme.white,
        ),
        icon: Icon(Icons.add, color: Colors.white, size: 18.sp),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomCard(
            //         widget: Row(
            //           children: [
            //             Icon(
            //               Icons.sports_football,
            //               size: 18.sp,
            //             ),
            //             SizedBox(
            //               width: 10.w,
            //             ),
            //             CustomText(text: 'Football')
            //           ],
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: CustomCard(
            //         widget: Row(
            //           children: [
            //             Icon(
            //               Icons.sports_football,
            //               size: 18.sp,
            //             ),
            //             SizedBox(
            //               width: 10.w,
            //             ),
            //             CustomText(text: 'Football')
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomCard(
            //         widget: Row(
            //           children: [
            //             Icon(
            //               Icons.sports_football,
            //               size: 18.sp,
            //             ),
            //             SizedBox(
            //               width: 10.w,
            //             ),
            //             CustomText(text: 'Football')
            //           ],
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: CustomCard(
            //         widget: Row(
            //           children: [
            //             Icon(
            //               Icons.sports_football,
            //               size: 18.sp,
            //             ),
            //             SizedBox(
            //               width: 10.w,
            //             ),
            //             CustomText(text: 'Football')
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
