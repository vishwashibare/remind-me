import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remind_me/main_Screens/Today_page/Add_Task.dart';
import 'package:remind_me/main_Screens/Today_page/lists_printing.dart';
import 'package:remind_me/model/work_list.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}



class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
      final List<Worklists> _userTransactions = [
   
  ];
  List<Worklists> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  
  void _addNewTransaction(
      String txTitle, String txAmount, DateTime chosenDate) {
    final newTx = Worklists(
      title: txTitle,
      description: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }
 
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade800,
          
        title: Text(
          'Work List...',
          style: TextStyle(color: Colors.black,fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle,color: Colors.black,size: 30),
            onPressed: () {},
          ),
        ],
      ),
        body: remind_List(_userTransactions, _deleteTransaction),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.yellow.shade800,
                onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addnewtask(_addNewTransaction),
                          ))
              ),
      );
  }
}
