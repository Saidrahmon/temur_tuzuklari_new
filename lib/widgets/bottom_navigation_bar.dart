import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomNavigationBarWidget extends StatelessWidget {

  Function onPressNextButton;
  Function onPressPrevButton;
  Function onPressSettingsButton;

  ScrollController scrollController;

  BottomNavigationBarWidget({
    required this.scrollController,
    required this.onPressNextButton,
    required this.onPressPrevButton,
    required this.onPressSettingsButton
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: scrollController.position.userScrollDirection == ScrollDirection.reverse ? 0: 56,
          child: child,
        );
      },
      child: SingleChildScrollView(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFF937245),
          unselectedItemColor: Color(0xFF937245),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              label: 'Avvalgi kitob',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Sozlamalar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              label: 'Keyingi kitob',
            ),
          ],
          onTap: (index){
            switch(index){
              case 0 : {
                onPressPrevButton();
              }; break;
              case 1 : {
                onPressSettingsButton();
                //showAsBottomSheetForSettings(context, controller);
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) =>
                //       BuildModalBotomSheetForSettings(controller: controller.service,),
                // );
                //bottomSheetDialog(context, controller);
              }; break;
              case 2 : {
                onPressNextButton();
              }; break;
            }
          },
        ),
      ),
    );
  }

  // void showAsBottomSheetForSettings(BuildContext context, StoryScreenController controller) async {
  //   final result = await showSlidingBottomSheet(
  //       context,
  //       builder: (context) {
  //         return SlidingSheetDialog(
  //           elevation: 8,
  //           cornerRadius: 16,
  //           snapSpec: const SnapSpec(
  //             snap: true,
  //             snappings: [0.6, 0.7, 1.0],
  //             positioning: SnapPositioning.relativeToAvailableSpace,
  //           ),
  //           builder: (context, state) {
  //             return SettingsTextWidget(controller: controller.service,);
  //           },
  //         );
  //       }
  //   );
  //   print(result); // This is the result.
  // }
}



