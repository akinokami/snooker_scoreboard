import 'package:get/get.dart';
import 'package:snooker_scoreboard/models/player_model.dart';

import '../models/snooker.dart';

enum SColor { red, yellow, green, brown, blue, pink, black }

/// red 1, yellow 2, green 3, brown 4, blue 5, pink 6, black 7

class GameController extends GetxController {
  RxList<String> selectedPlayerList = <String>[].obs;
  final typeId = 0.obs;
  RxList<PlayerModel> pList = <PlayerModel>[].obs;
  final selectedPlayer = PlayerModel().obs;
  final pIndex = 0.obs;
  final isLoading = false.obs;

  ///game
  final brek = 0.obs;
  final remainPts = 0.obs;
  RxList<Snooker> redList = <Snooker>[].obs;
  RxList<Snooker> sList = <Snooker>[].obs;
  RxList<PlayerModel> brekList = <PlayerModel>[].obs;

  final isClick = false.obs;

  @override
  void onInit() {
    typeId.value = Get.arguments['typeId'];
    selectedPlayerList.value = Get.arguments['players'] as List<String>;
    startGame();
    super.onInit();
  }

  void startGame() {
    if (typeId.value == 6) {
      remainPts.value = 75;
    }
    if (typeId.value == 10) {
      remainPts.value = 107;
    }
    if (typeId.value == 15) {
      remainPts.value = 147;
    }
    for (int i = 0; i < selectedPlayerList.length; i++) {
      pList.add(PlayerModel(name: selectedPlayerList[i]));
    }
    selectedPlayer.value = pList.first;
    pIndex.value = 0;

    for (int r = 0; r < typeId.value; r++) {
      redList.add(Snooker(name: SColor.red.name, pts: 1));
    }
  }

  void resetGame() {
    brek.value = 0;
  }

  void selectNextPlayer(int index) {
    if (index == pList.length) {
      selectedPlayer.value = pList.first;
      pIndex.value = 0;
    } else {
      selectedPlayer.value = pList[index];
      pIndex.value = index;
    }
  }

  void addRedSnooker() {
    isLoading.value = true;
    redList.removeLast();
    sList.clear();
    sList.add(Snooker(name: SColor.red.name, pts: 1));
    pList[pIndex.value].snookerList = sList;
    calculateTotal();
  }

  void calculateTotal() {
    for (int j = 0; j < (pList[pIndex.value].snookerList ?? []).length; j++) {
      pList[pIndex.value].total = (pList[pIndex.value].total ?? 0) +
          (pList[pIndex.value].snookerList?[j].pts ?? 0);
    }
    brekList
        .add(PlayerModel(name: selectedPlayer.value.name, snookerList: sList));
    isClick.value = true;
    isLoading.value = false;
  }

  void addOtherSnooker(Snooker snooker) {
    isLoading.value = true;
    sList.clear();
    pList[pIndex.value].snookerList?.add(snooker);
    calculateOtherTotal();
  }

  void calculateOtherTotal() {
    for (int j = 0; j < (pList[pIndex.value].snookerList ?? []).length; j++) {
      pList[pIndex.value].total = (pList[pIndex.value].total ?? 0) +
          (pList[pIndex.value].snookerList?[j].pts ?? 0);
    }

    //todo
    brekList
        .add(PlayerModel(name: selectedPlayer.value.name, snookerList: sList));
    isClick.value = false;
    isLoading.value = false;
  }
}
