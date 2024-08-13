import 'package:get/get.dart';
import 'package:snooker_scoreboard/models/snooker_type.dart';

class PlayController extends GetxController {
  RxList<SnookerType> stList = <SnookerType>[].obs;
  Rx<SnookerType> selectedType =
      SnookerType(id: 6, name: '6', image: 'assets/images/snooker_six.webp')
          .obs;

  @override
  void onInit() {
    getTypeList();
    super.onInit();
  }

  void getTypeList() {
    stList.value = typeList;
  }
}
