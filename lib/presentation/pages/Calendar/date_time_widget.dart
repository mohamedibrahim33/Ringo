import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';

class DateTimeWIdget extends StatelessWidget {
  const DateTimeWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //`selectedDate` the new date selected.
        },
        headerProps: const EasyHeaderProps(
          monthPickerType: MonthPickerType.switcher,
          dateFormatter: DateFormatter.custom('MMMM yyyy'),
          // selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY
        ),
        dayProps:  const EasyDayProps(
          dayStructure: DayStructure.dayStrDayNum,
          inactiveDayDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          inactiveDayStrStyle: TextStyle(
            color: secondaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          activeDayStyle: DayStyle(
            dayNumStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            dayStrStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0C191D2B),
                  blurRadius: 30,
                  offset: Offset(0, 12),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
