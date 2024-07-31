import 'package:flutter/material.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_dev_test/presentation/pages/projects/projects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectStatusContainer extends StatelessWidget {
  final ProjectStatus status;
  final String title;
  const ProjectStatusContainer({
    super.key,
    required this.status,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            gradient: status == ProjectStatus.inProgress
                ? LinearGradient(
                    colors: [
                      const Color(0xFF3A9ADE),
                      const Color(0xFF5EACE4).withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                  )
                : status == ProjectStatus.completed
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF3F8B8D),
                          Color(0xFF58B2B4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xFFDD4A4A),
                          Color(0xFFE87777),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
            shadows: [
              BoxShadow(
                color: status == ProjectStatus.inProgress
                    ? const Color(0xff5EACE4).withOpacity(0.8)
                    : status == ProjectStatus.completed
                        ? const Color(0xff58B2B4).withOpacity(0.8)
                        : const Color(0xffE77474).withOpacity(0.8),
                offset: Offset(0, 2.h),
                blurRadius: 6.r,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: FittedBox(
                    child: TextWidget(
                        title: title,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(width: 32.w),
                status == ProjectStatus.inProgress
                    ? const Icon(Icons.watch_later, color: Colors.white)
                    : status == ProjectStatus.completed
                        ? const Icon(Icons.verified, color: Colors.white)
                        : const Icon(Icons.cancel, color: Colors.white),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: TextWidget(
                  title: status == ProjectStatus.inProgress
                      ? 'Project\nIn Progress'
                      : status == ProjectStatus.completed
                          ? 'Project\nCompleted'
                          : 'Project\nCancelled',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.8)),
            ),
          ],
        ),
      ),
    );
  }
}
