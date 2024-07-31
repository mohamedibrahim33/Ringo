import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/svg_icon.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  final String title;
  final String icon;
  const SocialMediaButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: SvgIcon(
                icon: icon,
                size: 24,
              )),
          SizedBox(
            width: 8.w,
          ),
          TextWidget(
            title: title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ]));
  }
}
