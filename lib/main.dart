import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:snooker_scoreboard/language/languages.dart';
import 'utils/custom_theme.dart';
import 'utils/global.dart';
import 'views/screens/home_menu.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    Global.language = box.read('language') ?? "vi";
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Betting Tips',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          // theme: CustomTheme.lightTheme,
          // darkTheme: CustomTheme.darkTheme,
          // themeMode: ThemeMode.system,
          translations: Languages(),
          locale: Global.language == 'vi'
              ? const Locale('vi', 'VN')
              : const Locale('en', 'US'),
          fallbackLocale: const Locale('vi', 'VN'),
          home: Home(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
