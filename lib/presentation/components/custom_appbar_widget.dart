import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/app_assets.dart';
import 'package:flutter_dev_test/presentation/components/svg_icon.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBArWidget extends StatelessWidget {
  final String title;
  const CustomAppBArWidget( {
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: const BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Color(0xffE8EAEE), width: 1.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.menu),
           Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 24),
              child: TextWidget(
                  title: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.all(8.r),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.5, color: Color(0xFFE8EAEE)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                clipBehavior: Clip.none,
                children: [
                  const SvgIcon(icon: IconsManager.notification),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFDD4A4A),
                      shape: OvalBorder(
                        side: BorderSide(width: 1.50, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
