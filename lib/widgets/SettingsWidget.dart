import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/Config.dart';

class SettingsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 800),
                height: Get.mediaQuery.size.height*0.6,
                child: Material(
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
                                        //controller.saveIsBold();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Config.primaryColor,
                                            width: 2//controller.isBold.value ? 0 : 2,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Text('Aa', style: TextStyle(fontSize: 30),),
                                              Text('bold'.tr, textAlign: TextAlign.center,style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        //controller.saveIsBold();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Config.primaryColor,
                                            width: 2//controller.isBold.value ? 2 : 0,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Aa', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                              ),
                                              Text('italic'.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Container(
                            //   constraints: BoxConstraints(maxWidth: 600),
                            //   child: Slider(
                            //     activeColor: Color(0xFF937245),
                            //     divisions: 11,
                            //     inactiveColor: Colors.grey,
                            //     label: controller.sliderValue.value.round().toString(),
                            //     value: controller.sliderValue.value.toDouble(),
                            //     max: 30.0,
                            //     min: 16.0,
                            //     // onChangeEnd: (value) => print("Endi $value"),
                            //     onChanged: (value){
                            //       //print(value.toInt());
                            //       controller.saveSliderValue(value.toInt());
                            //     },
                            //   ),
                            // ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 600),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        //controller.saveIsRead();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Config.primaryColor,
                                              width: 2//controller.isRead.value ? 0 : 2,
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
                                        //controller.saveIsRead();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Config.primaryColor,
                                            width: 2//controller.isRead.value ? 2 : 0,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                          //color: kColorRead,
                                        ),
                                        child: Text(
                                          'dark'.tr, style: TextStyle(fontSize: 18, color: Config.primaryColor), textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                      )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //   color: controller.isRead.value ? kColorIsRead : kColorIsNotRead,
      // ),
    );
  }
}