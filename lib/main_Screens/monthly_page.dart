import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/main_Screens/Today_page/Add_Task.dart';
import 'package:table_calendar/table_calendar.dart';

class monthly extends StatefulWidget {
  const monthly({Key? key}) : super(key: key);

  @override
  State<monthly> createState() => _monthlyState();
}

class _monthlyState extends State<monthly> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String formatter = new DateFormat.yMMMMd('en_US').format(new DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today $formatter",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                taskWidget(
                    Color(0xfff96060), "Meeting with Sommeone", "9:00 AM"),
                taskWidget(Colors.blue, "Meeting with Sommeone", "9:00 AM"),
                taskWidget(Colors.green, "Take your medicines", "9:00 AM"),
                
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}

Slidable taskWidget(Color color, String title, String time) {
  return Slidable(
    child: Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1)
      ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 4),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              )
            ],
          ),
          Expanded(child: Container()),
          Container(
            height: 50,
            width: 5,
            color: color,
          ),
        ],
      ),
    ),
    endActionPane: const ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          // An action can be bigger than the others.
          flex: 2,
          //autoClose: true,
          onPressed: doNothing,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          icon: Icons.edit,
          label: 'Edit',
        ),
        SlidableAction(
          // An action can be bigger than the others.
          flex: 2,
          //autoClose: true,
          onPressed: doNothing,
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
  );
}

void doNothing(BuildContext context) {}
