import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snooker_scoreboard/utils/constants.dart';

import '../utils/app_theme.dart';

class PlayerController extends GetxController {
  final nameTxtController = TextEditingController();
  RxList<String> playerList = <String>[].obs;
  RxList<String> selectedPlayerList = <String>[].obs;
  final typeId = 0.obs;

  @override
  void onInit() {
    typeId.value = Get.arguments['typeId'];
    super.onInit();
  }

  void addPlayer() {
    if (nameTxtController.text == '') {
      constants.showSnackBar(
          title: 'error'.tr,
          msg: 'please_fill_player_name'.tr,
          textColor: AppTheme.red);
    } else {
      // playerList.add(nameTxtController.text);
      selectedPlayerList.add(nameTxtController.text);
      nameTxtController.text = '';
    }
  }

  void deletePlayer(int index) {
    playerList.removeAt(index);
  }

  void addToSelectedList(int index, String name) {
    selectedPlayerList.add(name);
    playerList.removeAt(index);
  }

  void removeFromSelectedList(int index, String name) {
    print(name);
    playerList.add(name);
    selectedPlayerList.removeAt(index);
  }
}
