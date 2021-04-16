import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/pages/home/controllers/controller.dart';
import 'package:temur_tuzuklari_new/pages/home/views/TabWidget.dart';
import 'package:temur_tuzuklari_new/pages/home/views/tab_list_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner){
          return <Widget>[
            SliverAppBar(
              title: Text('title_app'.tr),
              backgroundColor: Color(0xFF937245),
              // actions: [IconButton(
              //     icon: Icon(Icons.search, color: Colors.white,),
              //     onPressed: (){
              //       showSearch(context: context, delegate: SearchTitle(controller));
              //     })
              // ],
              floating: true,
              pinned: true,
              snap: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                controller: controller.tabController,
                tabs: [
                  TabWidget(title: 'first_book'.tr),
                  TabWidget(title: 'second_book'.tr)
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          controller: controller.tabController,
          children: [
            TabListWidget(controller.firstTitles),
            TabListWidget(controller.secondTitles),
          ],
        ),
      ),
    );
  }
}
