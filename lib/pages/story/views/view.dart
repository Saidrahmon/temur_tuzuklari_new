import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/pages/story/controllers/controller.dart';
import 'package:temur_tuzuklari_new/widgets/buildBottomSheetDialog.dart';

import 'desc_widget.dart';

class StoryPage extends GetView<StoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children : [
              Container(color: Colors.white,),
              NestedScrollView(
                  controller: controller.hideButtonController,
                  headerSliverBuilder: (BuildContext context, bool inner){
                    return <Widget>[
                      SliverAppBar(
                        title: Text('title_app'.tr),
                        backgroundColor: Color(0xFF937245),
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
                                  child: Obx((){
                                    return Container(
                                      padding: EdgeInsets.only(top: 20, left: 15, right: 20),
                                      child: Text(
                                          this.controller.title.value,
                                          // style: Theme.of(context).textTheme.display1.copyWith(
                                          //     color: controller.service.isRead.value ? kColorMain.withOpacity(0.5) : kColorMain.withOpacity(0.8),
                                          //     fontSize: (controller.service.sliderValue.value + 6).toDouble(),
                                          //     fontWeight: controller.service.isBold.value ? FontWeight.bold : FontWeight.normal
                                          //)
                                      ),
                                    );
                                  }
                                  ),
                                ),
                              ],
                            ),
                            Obx(() {
                              return Stack(
                                children: [
                                  Markdown(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    styleSheet: MarkdownStyleSheet(
                                        // p: TextStyle(
                                        //     fontSize: controller.service.sliderValue.value.toDouble(),
                                        //     color: controller.service.isRead.value ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8),
                                        //     fontWeight: controller.service.isBold.value ? FontWeight.w500 : FontWeight.normal
                                        // )
                                    ),
                                    selectable: true,
                                    data: controller.label.value,
                                    onTapLink: (text, href, title) => {
                                      showAsBottomSheet(context, child: DescWidget(href: href!))
                                    },
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ]
        )
    );
  }
}
