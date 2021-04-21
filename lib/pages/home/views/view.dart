import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/config/Config.dart';
import 'package:temur_tuzuklari_new/pages/home/controllers/controller.dart';
import 'package:temur_tuzuklari_new/pages/home/views/TabWidget.dart';
import 'package:temur_tuzuklari_new/pages/home/views/TabListWidget.dart';
import 'package:temur_tuzuklari_new/pages/home/views/build_drawer.dart';
import 'package:temur_tuzuklari_new/pages/home/views/search_title.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner) {
          return <Widget>[
            SliverAppBar(
              title: Text('title_app'.tr),
              backgroundColor: Config.primaryColor,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SearchTitle(controller.allTitles));
                  },
                )
              ],
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
