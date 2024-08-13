import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<String> selectedPlayerList = <String>[].obs;
  final typeId = 0.obs;

  @override
  void onInit() {
    typeId.value = Get.arguments['typeId'];
    selectedPlayerList.value = Get.arguments['players'] as List<String>;
    super.onInit();
  }
}
