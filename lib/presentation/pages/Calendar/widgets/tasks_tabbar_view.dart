import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksTabBarView extends StatelessWidget {
  final List<String> tasksList = [
    "Meeting Concept",
    "Information Architecture",
    "Monitoring Project",
    "Daily Standup",
    "Monitoring Project",
  ];
  TasksTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.all(24.w),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 24,
                  offset: Offset(4, 8),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          title: tasksList[index],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                      const TextWidget(
                          title: "Due Date : Mon, 12 Jan 2023",
                          fontSize: 12,
                          color: Color(0XFF697898)),
                    ],
                  ),
                ),
                Container(
                    width: 26,
                    height: 26,
                    margin: const EdgeInsetsDirectional.only(end: 4),
                    child: Checkbox(
                      value: true,
                      onChanged: (v) {},
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return const Color(0xff5ECEB3);
                        }
                        return Colors.grey;
                      }),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      side: const BorderSide(color: Colors.grey, width: 1),
                    )),
              ],
            ),
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
