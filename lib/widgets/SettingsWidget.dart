import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:temur_tuzuklari_new/services/StorageService.dart';

import '../config/Config.dart';

class SettingsWidget extends StatelessWidget {

  bool isBold;

  SettingsWidget({required this.isBold});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GetX<StorageService>(builder: (service) => Container(
            child: Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 800),
                height: Get.mediaQuery.size.height * 0.5,
                child: Material(
                  color: service.getIsRead() ? Config.colorIsRead : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('change_shrift_title'.tr, style: TextStyle(fontSize: 20.0),),
                          Container(
                            constraints: BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                      onTap: (){
                                        service.setIsBold(false);
                                      },
                                      child: Container(
                                        constraints: BoxConstraints(maxHeight: 100),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Config.primaryColor,
                                            width: service.getIsBold() ? 0 : 2,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Aa', style: TextStyle(fontSize: 30),),
                                            Text('italic'.tr, textAlign: TextAlign.center,style: TextStyle(fontSize: 15),)
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: (){
                                        Get.find<StorageService>().setIsBold(true);
                                      },
                                      child: Container(
                                        constraints: BoxConstraints(maxHeight: 100),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Config.primaryColor,
                                            width: service.getIsBold() ? 2 : 0,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Aa', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                            ),
                                            Text('bold'.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              constraints: BoxConstraints(maxWidth: 600),
                              child: Slider(
                                activeColor: Config.primaryColor,
                                divisions: 50,
                                inactiveColor: Colors.grey,
                                label: '${(service.getZoom() * 100).round()}%',
                                value: service.getZoom(),//controller.sliderValue.value.toDouble(),
                                max: 2.0,
                                min: 1.0,
                                // onChangeEnd: (value) => print("Endi $value"),
                                onChanged: (value){
                                  service.setZoom(value);
                                },
                              )
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      service.setIsRead(false);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Config.primaryColor,
                                            width: (service.getIsRead()) ? 0 : 2,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.white
                                      ),
                                      child: Text('light'.tr, style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.center,),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      service.setIsRead(true);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Config.primaryColor,
                                          width: (service.getIsRead()) ? 2 : 0,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                        //color: kColorRead,
                                      ),
                                      child: Text(
                                        'dark'.tr, style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.center,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
      // decoration: BoxDecoration(
      //   color: controller.isRead.value ? kColorIsRead : kColorIsNotRead,
      // ),
    );
  }
}