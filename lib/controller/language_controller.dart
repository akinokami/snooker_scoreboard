import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final language = ''.obs;

  @override
  void onInit() {
    getLanguage();
    super.onInit();
  }

  void changeLanguage(String languageCode, String countryCode) {
    language.value = languageCode;

    Get.updateLocale(Locale(languageCode, countryCode));
    final box = GetStorage();
    box.write('language', languageCode);
  }

  void getLanguage() {
    final box = GetStorage();
    language.value = box.read('language') ?? 'vi';
  }
}
