import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
                icon: Icons.info_outline,
                text: 'textAboutTemur'.tr,
                onTap: (){
                  Navigator.pop(context);
                  //Get.toNamed(Routes.ABOUT_TEMUR_SCREEN, arguments: controller.service.lang);
                }),
            _createDrawerItem(
                icon: Icons.settings,
                text: 'textSettings'.tr,
                onTap: (){
                  Navigator.pop(context);
                  //Get.toNamed(Routes.SETTINGS_SCREEN);
                }
            ),
            _createDrawerItem(
                icon: Icons.share,
                text: 'textShare'.tr,
                onTap: (){
                  // final RenderBox box = context.findRenderObject();
                  // Share.share('https://medium.com/@suryadevsingh24032000',
                  //     subject: 'hello',
                  //     sharePositionOrigin:
                  //     box.localToGlobal(Offset.zero) &
                  //     box.size);
                }
            ),
          ],
        ),
      ),
    );
  }
  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/header_image.jpg'))),
      child: null,
    );
  }
  Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}