import 'package:get/get.dart';
import 'package:snooker_scoreboard/models/player_model.dart';

import '../models/snooker.dart';

enum SColor { red, yellow, green, brown, blue, pink, black, foul, miss }

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
  RxList<PlayerModel> brekList = <PlayerModel>[].obs;

  final isClickRed = true.obs;
  final isClickYellow = false.obs;
  final isClickGreen = false.obs;
  final isClickBrown = false.obs;
  final isClickBlue = false.obs;
  final isClickPink = false.obs;
  final isClickBlack = false.obs;
  final isGamefinish = false.obs;
  final isUndoVisible = false.obs;
  final redCount = 0.obs;
  final isMissChecked = false.obs;
  final isFreeChecked = false.obs;

  //foul
  final isWhiteSelected = true.obs;
  final isRedSelected = false.obs;
  final isYellowSelected = false.obs;
  final isGreenSelected = false.obs;
  final isBrownSelected = false.obs;
  final isBlueSelected = false.obs;
  final isPinkSelected = false.obs;
  final isBlackSelected = false.obs;
  Rx<Snooker> selectedFoulSnooker =
      Snooker(name: SColor.foul.name, isFoul: true, pts: -4).obs;
  final isFreeBall = false.obs;

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
      pList.add(PlayerModel(name: selectedPlayerList[i], snookerList: []));
    }
    selectedPlayer.value = pList.first;
    pIndex.value = 0;

    for (int r = 0; r < typeId.value; r++) {
      redList.add(Snooker(name: SColor.red.name, pts: 1));
    }
  }

  void restartGame() {
    redList.clear();

    pList.clear();
    brekList.clear();
    isClickRed.value = true;
    isGamefinish.value = false;
    brek.value = 0;
    startGame();
    setClickAllFalse();
    resetFoulData();
  }

  void selectNextPlayer(int index) {
    if (index == pList.length) {
      selectedPlayer.value = pList.first;
      pIndex.value = 0;
    } else {
      selectedPlayer.value = pList[index];
      pIndex.value = index;
    }
    if (redList.isNotEmpty) {
      setClickAllFalse();
    }
    brek.value = 0;
  }

  void addRedSnooker() {
    isLoading.value = true;
    isUndoVisible.value = true;
    redList.removeLast();
    pList[pIndex.value]
        .snookerList
        ?.add(Snooker(name: SColor.red.name, pts: 1));
    calculateTotal(Snooker(name: SColor.red.name, pts: 1));
  }

  void calculateTotal(Snooker snooker) {
    for (int p = 0; p < pList.length; p++) {
      pList[p].posPts = 0;
      pList[p].total = 0;
      for (int q = 0; q < (pList[p].snookerList ?? []).length; q++) {
        if ((pList[p].snookerList?[q].pts ?? 0) > 0) {
          pList[p].posPts =
              (pList[p].posPts ?? 0) + (pList[p].snookerList?[q].pts ?? 0);
        }
        pList[p].total = (pList[pIndex.value].total ?? 0) +
            (pList[pIndex.value].snookerList?[q].pts ?? 0);
      }
    }
    addToBreakerList(snooker);
    calculateBreakRemainPts(snooker);
    if (redList.isNotEmpty) {
      setClickAllTrue();
    } else {
      //
      calculateClickable(snooker);
    }
    calculateMax();
    isLoading.value = false;
  }

  void addOtherSnooker(Snooker snooker) {
    isLoading.value = true;
    pList[pIndex.value].snookerList?.add(snooker);
    calculateOtherTotal(snooker);
  }

  void calculateOtherTotal(Snooker snooker) {
    for (int p = 0; p < pList.length; p++) {
      pList[p].posPts = 0;
      pList[p].total = 0;
      for (int q = 0; q < (pList[p].snookerList ?? []).length; q++) {
        if ((pList[p].snookerList?[q].pts ?? 0) > 0) {
          pList[p].posPts =
              (pList[p].posPts ?? 0) + (pList[p].snookerList?[q].pts ?? 0);
        }
        pList[p].total = (pList[pIndex.value].total ?? 0) +
            (pList[pIndex.value].snookerList?[q].pts ?? 0);
      }
    }
    addToBreakerList(snooker);
    calculateBreakRemainPts(snooker);
    if (redList.isNotEmpty) {
      setClickAllFalse();
    } else {
      calculateClickable(snooker);
    }
    if (snooker.name == SColor.red.name) {
      if (redList.isNotEmpty) {
        redList.removeLast();
      }
    }
    isFreeBall.value = false;
    calculateMax();
    isLoading.value = false;
  }

  void addToBreakerList(Snooker snooker) {
    if (brekList.isEmpty) {
      brekList
          .add(PlayerModel(name: selectedPlayer.value.name, snookerList: []));
      brekList.last.snookerList?.add(snooker);
    } else {
      if (brekList.last.name == selectedPlayer.value.name) {
        brekList.last.snookerList?.add(snooker);
      } else {
        brekList
            .add(PlayerModel(name: selectedPlayer.value.name, snookerList: []));
        brekList.last.snookerList?.add(snooker);
      }
    }
  }

  void calculateBreakRemainPts(Snooker snooker) {
    brek.value += snooker.pts ?? 0;
    if (snooker.isFoul == true ||
        snooker.isMiss == true ||
        snooker.isFree == true) {
      if (snooker.isFree == true) {
        remainPts.value -= 8;
      }
    } else {
      if (snooker.name == SColor.red.name) {
        remainPts.value -= 1;
      } else {
        if (redList.isNotEmpty) {
          remainPts.value -= 7;
        } else {
          remainPts.value -= snooker.pts ?? 0;
        }
      }
    }
  }

  void calculateMax() {
    int max = 0;
    for (int m = 0; m < pList.length; m++) {
      // max = pList[m].total ?? 0;
      if ((pList[m].total ?? 0) > max) {
        max = pList[m].total ?? 0;
      }
    }
    print("max>>>$max");
  }

  void removeRedFromTable() {
    if (redList.isNotEmpty) {
      redList.removeLast();
      remainPts.value -= 8;
    }
  }

  void setClickAllTrue() {
    isClickYellow.value = true;
    isClickGreen.value = true;
    isClickBrown.value = true;
    isClickBlue.value = true;
    isClickPink.value = true;
    isClickBlack.value = true;
  }

  void setClickAllFalse() {
    isClickYellow.value = false;
    isClickGreen.value = false;
    isClickBrown.value = false;
    isClickBlue.value = false;
    isClickPink.value = false;
    isClickBlack.value = false;
  }

  void calculateClickable(Snooker snooker) {
    if (snooker.name == SColor.red.name) {
      isClickRed.value = false;
      isClickYellow.value = true;
    }
    if (snooker.name == SColor.yellow.name) {
      isClickYellow.value = false;
      isClickGreen.value = true;
    } else if (snooker.name == SColor.green.name) {
      isClickGreen.value = false;
      isClickBrown.value = true;
    } else if (snooker.name == SColor.brown.name) {
      isClickBrown.value = false;
      isClickBlue.value = true;
    } else if (snooker.name == SColor.blue.name) {
      isClickBlue.value = false;
      isClickPink.value = true;
    } else if (snooker.name == SColor.pink.name) {
      isClickPink.value = false;
      isClickBlack.value = true;
    } else if (snooker.name == SColor.black.name) {
      isClickBlack.value = false;
      remainPts.value = 0;
      isGamefinish.value = true;
    }
  }

  void addFoul() {
    addOtherSnooker(selectedFoulSnooker.value);
    if (isMissChecked.value) {
      addOtherSnooker(Snooker(name: SColor.miss.name, isMiss: true, pts: 0));
    } else if (isFreeChecked.value) {
      isFreeBall.value = true;
      remainPts.value += 8;
      setClickAllTrue();
    } else if (redCount.value > 0) {
      for (int r = 0; r < redCount.value; r++) {
        redList.removeAt(r);
        remainPts.value -= 8;
      }
    }
    selectNextPlayerFoul(pIndex.value + 1);
  }

  void selectNextPlayerFoul(int index) {
    if (index == pList.length) {
      selectedPlayer.value = pList.first;
      pIndex.value = 0;
    } else {
      selectedPlayer.value = pList[index];
      pIndex.value = index;
    }
    brek.value = 0;
  }

  void resetFoulData() {
    redCount.value = 0;
    isMissChecked.value = false;
    isFreeChecked.value = false;
    isWhiteSelected.value = true;
    isRedSelected.value = false;
    isYellowSelected.value = false;
    isGreenSelected.value = false;
    isBrownSelected.value = false;
    isBlueSelected.value = false;
    isPinkSelected.value = false;
    isBlackSelected.value = false;
    selectedFoulSnooker.value =
        Snooker(name: SColor.foul.name, isFoul: true, pts: -4);
    isFreeBall.value = false;
  }
}
