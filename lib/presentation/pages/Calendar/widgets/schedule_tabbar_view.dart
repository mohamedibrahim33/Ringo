
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/presentation/pages/Calendar/widgets/schedule_details_widget.dart';

class ScheduleTabBarView extends StatelessWidget {
  const ScheduleTabBarView({
    super.key,
    required this.eventController,
  });

  final EventController<Object?> eventController;

  @override
  Widget build(BuildContext context) {
    return DayView(
      controller: eventController,
      eventTileBuilder: (date, events, boundry, start, end) {
        // Return your widget to display as event tile.
        return ScheduleDetailsWidget(
          events: events,
        );
      },
      fullDayEventBuilder: (events, date) {
        // Return your widget to display full day event view.
        return Container();
      },
      showVerticalLine:
          false, // To display live time line in day view.
      showLiveTimeLineInAllDays:
          true, // To display live time line in all pages in day view.
      minDay: DateTime.now(),
      maxDay: DateTime.now(),
      initialDay: DateTime.now(),
      heightPerMinute: 1, // height occupied by 1 minute time span.
      eventArranger:
          const SideEventArranger(), // To define how simultaneous events will be arranged.
      onEventTap: (events, date) => print(events),
      onEventDoubleTap: (events, date) => print(events),
      onEventLongTap: (events, date) => print(events),
      onDateLongPress: (date) => print(date),
      startHour: 0, // To set the first hour displayed (ex: 05:00)
      endHour: 24, // To set the end hour displayed
      dayTitleBuilder: DayHeader.hidden, // To Hide day header
      keepScrollOffset:
          true, // To maintain scroll offset when the page changes
    );
  }
}
