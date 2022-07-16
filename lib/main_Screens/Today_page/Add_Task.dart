import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/main_Screens/button/adbtive_flat_button.dart';
import 'package:remind_me/main_Screens/main_screen.dart';

class addnewtask extends StatefulWidget {
  final Function addTx;

  addnewtask(this.addTx);

  @override
  _addnewtaskState createState() => _addnewtaskState();
}

class _addnewtaskState extends State<addnewtask> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _txtTimeController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  TextEditingController timeinput = TextEditingController();
  late TimeOfDay pickedTime = TimeOfDay.now();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;

    if (enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade800,
          elevation: 0,
          title: Text(
            "New Task",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TabBarPage()));
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 30,
                color: Colors.yellow.shade800,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "For",
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.grey.withOpacity(0.2)),
                            child: Text(
                              "Asignee",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "In",
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.grey.withOpacity(0.2)),
                            child: Text(
                              "Project",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.grey.withOpacity(0.2),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                              hintText: "Title", border: InputBorder.none),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description...",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: TextField(
                                controller: _amountController,
                                maxLines: 6,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " Add description here",
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.attach_file,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              // padding: EdgeInsets.all(3),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      _selectedDate == null
                                          ? 'No Date Chosen!'
                                          : 'Picked Date: ${DateFormat.yMMMMd('en_US').format(_selectedDate)}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  AdaptiveFlatButton(
                                      'Choose Date', _presentDatePicker)
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              // padding: EdgeInsets.all(3),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    timeinput  == null
                                        ? 'No Time Chosen!'
                                        : 'Picked Date: ${DateFormat('HH:mm:ss')
                                              .format(DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString()))}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  TextField(
                                    controller:
                                        timeinput, //editing controller of this TextField
                                    decoration: InputDecoration(
                                        icon: Icon(
                                            Icons.timer), //icon of text field
                                        labelText:
                                            "Enter Time" //label text of field
                                        ),
                                    readOnly:
                                        true, //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      pickedTime =
                                          (await showTimePicker(
                                        initialTime: TimeOfDay.now(),
                                        context: context,
                                      ))!;

                                      if (pickedTime != null) {
                                        print(pickedTime
                                            .format(context)); //output 10:51 PM
                                        DateTime parsedTime = DateFormat.jm()
                                            .parse(pickedTime
                                                .format(context)
                                                .toString());
                                        //converting to DateTime so that we can further format on different pattern.
                                        print(
                                            parsedTime); //output 1970-01-01 22:53:00.000
                                        String formattedTime =
                                            DateFormat('HH:mm:ss')
                                                .format(parsedTime);
                                        print(formattedTime); //output 14:59:00
                                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                                        setState(() {
                                          timeinput.text =
                                              formattedTime; //set the value of text field.
                                        });
                                      } else {
                                        print("Time is not selected");
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Add member",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: Text(
                                "Anyone",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                //color: Color(0xffff96060)
                              ),
                              child: Center(
                                child: ElevatedButton(
                                  child: Text(
                                    'Add Task',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow.shade800,
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: _submitData,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
