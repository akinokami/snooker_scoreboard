import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:snooker_scoreboard/utils/constants.dart';

import '../utils/app_theme.dart';

class PlayerController extends GetxController {
  final nameTxtController = TextEditingController();
  RxList<String> playerList = <String>[].obs;
  RxList<String> selectedPlayerList = <String>[].obs;
  RxList<String> combineList = <String>[].obs;
  final typeId = 0.obs;
  final isApVisible = false.obs;
  final isGameClickable = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    typeId.value = Get.arguments['typeId'];
    String players = box.read('players') ?? '';
    if (players != '') {
      playerList.value = jsonDecode(players).cast<String>().toList();
    }
    super.onInit();
  }

  void addPlayer() {
    var contain = playerList.where((element) =>
        element.toLowerCase() == nameTxtController.text.toLowerCase());
    if (contain.isNotEmpty) {
      selectedPlayerList.add(nameTxtController.text);
      playerList.removeWhere((element) =>
          element.toLowerCase() == nameTxtController.text.toLowerCase());
      nameTxtController.text = '';
      isApVisible.value = false;
      setGameClickable();
    } else {
      var containSelected = selectedPlayerList.where((element) =>
          element.toLowerCase() == nameTxtController.text.toLowerCase());
      if (containSelected.isNotEmpty) {
        constants.showSnackBar(
            title: 'warning'.tr,
            msg: "${nameTxtController.text} ${'player_already_exists'.tr}",
            textColor: AppTheme.black);
        nameTxtController.text = '';
        isApVisible.value = false;
      } else {
        selectedPlayerList.add(nameTxtController.text);
        nameTxtController.text = '';
        isApVisible.value = false;
        setGameClickable();
      }
    }
    addToCombineList();
  }

  void deletePlayer(int index) {
    playerList.removeAt(index);
    addToCombineList();
  }

  void addToSelectedList(int index, String name) {
    selectedPlayerList.add(name);
    playerList.removeAt(index);
    setGameClickable();
  }

  void removeFromSelectedList(int index, String name) {
    playerList.add(name);
    selectedPlayerList.removeAt(index);
    setGameClickable();
  }

  void setGameClickable() {
    if (selectedPlayerList.isNotEmpty) {
      isGameClickable.value = true;
    } else {
      isGameClickable.value = false;
    }
  }

  void addToCombineList() {
    combineList.clear();
    combineList.addAll(playerList);
    combineList.addAll(selectedPlayerList);
    combineList.toSet().toList();
    box.write('players', jsonEncode(combineList));
  }
}
