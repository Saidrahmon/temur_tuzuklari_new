import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/pages/story/controllers/controller.dart';

class StoryControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoryController());
  }

}