import 'package:get/get.dart';
import 'package:snooker_scoreboard/models/player_model.dart';

class GameController extends GetxController {
  RxList<String> selectedPlayerList = <String>[].obs;
  final typeId = 0.obs;
  RxList<PlayerModel> pList = <PlayerModel>[].obs;
  final selectedPlayer = PlayerModel().obs;
  final pIndex = 0.obs;

  ///game
  final brek = 0.obs;
  final remainPts = 0.obs;

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
    print(pList.length);
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
}
