import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/presentation/components/custom_appbar_widget.dart';
import 'package:flutter_dev_test/presentation/pages/Calendar/date_time_wIdget.dart';
import 'package:flutter_dev_test/presentation/pages/Calendar/widgets/schedule_tabbar_view.dart';
import 'package:flutter_dev_test/presentation/pages/Calendar/widgets/tab_bar_widget.dart';
import 'package:flutter_dev_test/presentation/pages/Calendar/widgets/tasks_tabbar_view.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  EventController eventController = EventController();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    final event = [
      CalendarEventData(
        date: DateTime.now(),
        event: "Event 1",
        title: 'Meeting with Client',
        startTime: DateTime.now().add(const Duration(hours: 2)),
        endTime: DateTime.now().add(const Duration(hours: 3)),
      ),
      CalendarEventData(
        date: DateTime.now(),
        event: "Event 2",
        title: 'Daily Standup',
        startTime: DateTime.now().add(const Duration(hours: 7)),
        endTime: DateTime.now().add(const Duration(hours: 8)),
        color: Colors.red,
      )
    ];
    eventController.addAll(event);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const CustomAppBArWidget(title: "Calendar"),
          const DateTimeWIdget(),
          TabBarWidget(tabController: tabController),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              ScheduleTabBarView(eventController: eventController),
              TasksTabBarView()
            ]),
          )
        ],
      ),
    ));
  }
}
