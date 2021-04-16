import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/config/Config.dart';
import 'package:temur_tuzuklari_new/pages/story/controllers/controller.dart';
import 'package:temur_tuzuklari_new/services/StorageService.dart';
import 'package:temur_tuzuklari_new/widgets/bottom_navigation_bar.dart';
import 'package:temur_tuzuklari_new/widgets/buildBottomSheetDialog.dart';
import '';

import 'desc_widget.dart';

class StoryPage extends GetView<StoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget() ,
      body: Stack(
        children: [
          NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (BuildContext context, bool inner) {
              return <Widget>[
                SliverAppBar(
                  title: Text('title_app'.tr),
                  backgroundColor: Config.primaryColor,
                  floating: true,
                  snap: true,
                ),
              ];
            },
            body: Stack(
              children: [
                // Obx(() =>
                //     Container(
                //       //color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
                //     ),
                // ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: 20, left: 15, right: 20),
                              child: GetX<StorageService>(
                                builder: (service) {
                                  return Text(
                                    this.controller.title.value,
                                    style: TextStyle(
                                      fontSize: service.getZoom() * 20,
                                    ),
                                    // style: Theme.of(context).textTheme.display1.copyWith(
                                    //     color: controller.service.isRead.value ? kColorMain.withOpacity(0.5) : kColorMain.withOpacity(0.8),
                                    //     fontSize: (controller.service.sliderValue.value + 6).toDouble(),
                                    //     fontWeight: controller.service.isBold.value ? FontWeight.bold : FontWeight.normal
                                    // )
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          GetX<StorageService>(
                            builder: (service) {
                              return Markdown(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                styleSheet: MarkdownStyleSheet(
                                  p: TextStyle(
                                    fontSize: service.getZoom() * 16,
                                    // color: service.isRead.value
                                    //     ? Colors.black.withOpacity(0.5)
                                    //     : Colors.black.withOpacity(0.8),
                                    // fontWeight: service.isBold.value
                                    //     ? FontWeight.w500
                                    //     : FontWeight.normal,
                                  ),
                                ),
                                selectable: true,
                                data: controller.label.value,
                                onTapLink: (text, href, title) => {
                                  showAsBottomSheet(context,
                                      child: DescWidget(href: href!))
                                },
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
