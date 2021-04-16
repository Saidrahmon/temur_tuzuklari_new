import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/AppRoutes.dart';
import 'package:temur_tuzuklari_new/pages/home/bindings/binding.dart';
import 'package:temur_tuzuklari_new/pages/home/controllers/controller.dart';
import 'package:temur_tuzuklari_new/pages/home/views/view.dart';
import 'package:temur_tuzuklari_new/pages/story/bindings/binding.dart';
import 'package:temur_tuzuklari_new/pages/story/views/view.dart';

class AppPages{

  static final routes = <GetPage>[
    GetPage(name: AppRoutes.HOME, page:() => HomePage(), binding: HomeControllerBinding()),
    GetPage(name: AppRoutes.STORY, page: () => StoryPage(), binding: StoryControllerBinding())
  ];

}