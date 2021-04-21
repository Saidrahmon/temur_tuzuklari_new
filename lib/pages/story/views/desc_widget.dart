import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/config/Config.dart';
import 'package:temur_tuzuklari_new/pages/story/controllers/controller.dart';
import 'package:temur_tuzuklari_new/services/StorageService.dart';

class DescWidget extends GetView<StoryController> {

  String href;

  DescWidget({required this.href});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GetX<StorageService>(builder: (service) => Container(
              height: Get.mediaQuery.size.height*0.9,
              child: Material(
                color: service.getIsRead() ? Config.colorIsRead : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Tavsif',
                                  style: TextStyle(
                                      fontSize: service.getZoom() * 16,
                                      color: service.getIsRead() ? Config.primaryColor.withOpacity(0.5) : Config.primaryColor.withOpacity(0.8),
                                      fontWeight: service.getIsBold() ? FontWeight.w500 : FontWeight.normal
                                  )
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 800),
                              child: Text(controller.getDescByKey(href),
                                style: TextStyle(
                                    fontSize: service.getZoom() * 16,
                                    color: service.getIsRead() ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8),
                                    fontWeight: service.getIsBold() ? FontWeight.w500 : FontWeight.normal
                                )
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),)
          )
        ],
      ),
      // decoration: BoxDecoration(
      //   color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
      // ),
    );
  }
}