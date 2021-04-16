import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/AppPages.dart';
import 'package:temur_tuzuklari_new/AppRoutes.dart';
import 'package:temur_tuzuklari_new/i18n/_TranslationService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: AppRoutes.HOME,
      locale: TranslationService.locale,
      translations: TranslationService(),
    );
  }
}
