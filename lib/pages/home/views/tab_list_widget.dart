import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari_new/AppRoutes.dart';
import 'package:temur_tuzuklari_new/models/title_model.dart';

class TabListWidget extends StatelessWidget {
  List<TitleModel> contents;

  TabListWidget(this.contents);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.builder(
          itemCount: contents.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(Icons.navigate_next),
                      SizedBox(
                        width: 8.0,
                      ),
                      Flexible(
                        child: Text(
                          contents[index].title,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  )),
              onTap: () {
                Get.toNamed(AppRoutes.STORY, arguments: contents[index].chapter);
              },
            );
          },
        );
      },
    );
  }
}
