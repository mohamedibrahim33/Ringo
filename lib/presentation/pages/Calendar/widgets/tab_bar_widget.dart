import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        indicatorColor: primaryColor,
        dividerColor: Colors.transparent,
        unselectedLabelColor: secondaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 32),
        labelStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        tabs: const [
          Tab(
            text: "Schedule",
          ),
          Tab(
            text: "Task",
          ),
        ]);
  }
}