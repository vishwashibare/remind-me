import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/model/work_list.dart';

class remind_List extends StatelessWidget {
  final List<Worklists> lists;
  final Function deleteTx;
remind_List(this.lists, this.deleteTx);
String formatter = new DateFormat.yMMMMd('en_US').format(new DateTime.now());

  @override
  Widget build(BuildContext context) {
    if (lists.isEmpty) {
      return LayoutBuilder(builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                "Today $formatter",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              'No remind lists added yet!',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/image/empty.jpg'),
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        );
      });
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          Color color =
              Colors.primaries[Random().nextInt(Colors.primaries.length)];
          return Slidable(
            
            endActionPane: ActionPane(
              extentRatio: 0.16,
              motion: ScrollMotion(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(lists[index].id),
                    ),
                    Text("Delete"),
                  ],
                ),
              ],
            ),
            child: Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: Offset(0, 9),
                    blurRadius: 20,
                    spreadRadius: 1)
              ]), //transactions[index].description,
              child: ListTile(
                leading: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 13),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: color, width: 4)),
                ),
                title: Text(
                  lists[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(lists[index].date),
                ),
                trailing: Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  width: 5,
                  color: color,
                ),
              ),
            ),
          );
        },
        itemCount: lists.length,
      );
    }
  }
}

void doNothing(BuildContext context) {}
