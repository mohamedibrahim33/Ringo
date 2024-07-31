import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublicBottomSheet {
  static Future<dynamic> bottomSheetWidget(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.8,
          builder: (_, scrollController) => Container(
              //When a mobile device's keyboard is visible viewInsets.bottom corresponds to the top of the keyboard.
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: child),
        );
      },
    );
  }
}
