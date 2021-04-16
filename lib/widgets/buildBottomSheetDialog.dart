import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void showAsBottomSheet(BuildContext context, {required Widget child}) async {
  final result = await showSlidingBottomSheet(
      context,
      builder: (context) {
        return SlidingSheetDialog(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            return child;
          },
        );
      }
  );
  print(result); // This is the result.
}