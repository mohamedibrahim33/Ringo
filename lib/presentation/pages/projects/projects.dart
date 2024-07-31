import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/app_assets.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/button_widget.dart';
import 'package:flutter_dev_test/presentation/components/custom_appbar_widget.dart';
import 'package:flutter_dev_test/presentation/components/edit_text_widget.dart';
import 'package:flutter_dev_test/presentation/components/svg_icon.dart';
import 'package:flutter_dev_test/presentation/components/text_widget.dart';
import 'package:flutter_dev_test/presentation/pages/projects/widgets/productivity_chart.dart';
import 'package:flutter_dev_test/presentation/pages/projects/widgets/project_status_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ProjectStatus { inProgress, completed, cancelled }

class Projects extends StatelessWidget {
  final emailController = TextEditingController();
  Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const CustomAppBArWidget(title: "Project Summary"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "Search".tr(),
                          fontWeight: FontWeight.w600,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "Search project here",
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgIcon(
                                icon: IconsManager.search,
                                size: 24.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: Row(
                            children: [
                              const ProjectStatusContainer(
                                  status: ProjectStatus.inProgress, title: "4"),
                              SizedBox(width: 8.w),
                              const ProjectStatusContainer(
                                  status: ProjectStatus.completed, title: "6"),
                              SizedBox(width: 8.w),
                              const ProjectStatusContainer(
                                  status: ProjectStatus.cancelled, title: "8"),
                            ],
                          ),
                        ),
                        ButtonWidget(
                          title: "View All Project",
                          onTap: () {},
                          backgroundButtonColor: Colors.transparent,
                          fontSize: 14,
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          withBorder: true,
                        ),
                      ],
                    ),
                  ),
                  ProductivityChart()
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
