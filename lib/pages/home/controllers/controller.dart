import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/models/title_model.dart';
import 'package:temur_tuzuklari_new/repositories/db_helper_content.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  
  late TabController tabController;

  //var service = Get.put(AppService());

  var allTitles = <TitleModel>[];
  var firstTitles = <TitleModel>[].obs;
  var secondTitles = <TitleModel>[].obs;
  //String langg;

  @override
  void onInit() async{
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getAllTitles();
    //updateLang();
  }

  void getAllTitles(){
    allTitles = <TitleModel>[];
    firstTitles.clear();
    secondTitles.clear();
    DatabaseHelper.instance.getAllTitles().then((value){
      allTitles.addAll(value);
      allTitles.forEach((element) {
        if(element.categoryId == 1){
          firstTitles.add(element);
        }else if(element.categoryId == 2){
          secondTitles.add(element);
        }
      });
    });
  }

  // void updateLang() async{
  //   service.getLang().then((value) {
  //     langg = value;
  //     var locale = Locale(langg);
  //     Get.updateLocale(locale);
  //     getAllTitles(langg);
  //   });


}