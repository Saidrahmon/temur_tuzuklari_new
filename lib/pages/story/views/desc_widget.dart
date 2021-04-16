import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/pages/story/controllers/controller.dart';
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
            child: Container(
              height: Get.mediaQuery.size.height*0.9,
              child: Material(
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
                                    // style: TextStyle(
                                    //     fontSize: controller.service.sliderValue.value.toDouble(),
                                    //     color: controller.service.isRead.value ? kColorMain.withOpacity(0.5) : kColorMain.withOpacity(0.8),
                                    //     fontWeight: controller.service.isBold.value ? FontWeight.w500 : FontWeight.normal
                                    // )
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 800),
                              child: Text(controller.getDescByKey(href),
                                  // style: TextStyle(
                                  //     fontSize: controller.service.sliderValue.value.toDouble(),
                                  //     color: controller.service.isRead.value ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8),
                                  //     fontWeight: controller.service.isBold.value ? FontWeight.w500 : FontWeight.normal
                                  // )
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
            ),
          )
        ],
      ),
      // decoration: BoxDecoration(
      //   color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
      // ),
    );
  }
}