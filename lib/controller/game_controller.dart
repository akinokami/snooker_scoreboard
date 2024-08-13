import 'dart:convert';

import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<String> selectedPlayerList = <String>[].obs;
  final typeId = 0.obs;
  final players = ''.obs;

  @override
  void onInit() {
    typeId.value = Get.arguments['typeId'];
    players.value = Get.arguments['players'];
    print(players.value);
    super.onInit();
  }
}
