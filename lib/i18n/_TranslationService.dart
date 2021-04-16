import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/i18n/uz.dart';

import 'oz.dart';

class TranslationService extends Translations {
  static Locale locale = Locale('oz');

  @override
  Map<String, Map<String, String>> get keys => {
        'oz': oz,
        'uz': uz,
      };
}
