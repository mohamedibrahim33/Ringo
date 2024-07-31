import 'package:calendar_view/calendar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleDetailsWidget extends StatelessWidget {
  final List<CalendarEventData> events;
  const ScheduleDetailsWidget({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(end: 16.w),
      margin: EdgeInsetsDirectional.only(end: 12.w),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFEDFCC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: double.infinity,
            margin: EdgeInsetsDirectional.only(end: 16.w),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFFD7722),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                    title: events[0].title,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.watch_later_rounded,
                        color: secondaryColor, size: 16.w),
                    SizedBox(width: 8.w),
                    TextWidget(
                        title:
                            "${DateFormat("hh:mm a").format(events[0].startTime ?? DateTime.now())} - ${DateFormat("hh:mm a").format(events[0].endTime ?? DateTime.now())}",
                        fontSize: 12,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
