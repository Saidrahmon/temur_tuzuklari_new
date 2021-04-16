import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/pages/home/controllers/controller.dart';

class HomeControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}