/*
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/main_Screens/Today_page/Add_Task.dart';
import 'package:remind_me/main_Screens/Today_page/lists_printing.dart';
import 'package:remind_me/model/work_list.dart';

class today extends StatefulWidget {
  const today({Key? key}) : super(key: key);

  @override
  State<today> createState() => _todayState();
}

class _todayState extends State<today> {
  String formatter = new DateFormat.yMMMMd('en_US').format(new DateTime.now());
  String taskPop = "close";
  final List<worklist> _userTransactions = [];
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today $formatter",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
        //  remindme_list(_userTransactions, _deleteTransaction),
         
        ],
      ),
      // Container(
      //   alignment: Alignment.bottomRight,
      //   padding: EdgeInsets.all(20),
      //   child: FloatingActionButton(
      //       child: Icon(Icons.add),
      //       backgroundColor: Colors.yellow.shade800,
      //       elevation: 5,
      //       onPressed: () => Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(
      //               builder: (BuildContext context) => add_task()))),
      // ),
    ]
    )
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
*/