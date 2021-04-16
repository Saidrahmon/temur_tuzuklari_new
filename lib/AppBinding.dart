import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/services/StorageService.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(StorageService());
  }
}