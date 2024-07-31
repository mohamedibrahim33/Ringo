import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/core/utils/app_assets.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_dev_test/presentation/components/svg_icon.dart';
import 'package:flutter_dev_test/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Container(
          width: double.infinity,
          height: 88,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BottomNavigationIcon(
                          icon: IconsManager.category,
                          onTap: () => cubit.changeBottomNavIndex(0)),
                      BottomNavigationIcon(
                          icon: IconsManager.projects,
                          onTap: () => cubit.changeBottomNavIndex(1)),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BottomNavigationIcon(
                          icon: IconsManager.calendar,
                          onTap: () => cubit.changeBottomNavIndex(2)),
                      BottomNavigationIcon(
                          icon: IconsManager.profile,
                          onTap: () => cubit.changeBottomNavIndex(3)),
                    ],
                  ))
                ],
              ),
              Positioned(
                top: -22.h,
                child: Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: const ShapeDecoration(
                      color: primaryColor,
                      shape: CircleBorder(),
                      shadows: [
                        BoxShadow(
                            color: primaryColor,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class BottomNavigationIcon extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const BottomNavigationIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 40.w),
      child: icon.endsWith(".svg")
          ? GestureDetector(
              onTap: onTap,
              child: SvgIcon(
                icon: icon,
                size: 24.w,
              ),
            )
          : GestureDetector(
              onTap: onTap,
              child: Image.asset(
                icon,
                width: 24.w,
                height: 24.h,
              ),
            ),
    );
  }
}
