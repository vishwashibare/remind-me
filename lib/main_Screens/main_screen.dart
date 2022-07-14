/*
import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.yellow.shade800,
                  elevation: 0,
                  title: Text(
                    "Work List...",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  actions: [
                    IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.short_text,
                          color: Colors.black,
                          size: 30,
                        ))
                  ],
                ),
                Container(
                  height: 70,
                  color: Colors.yellow.shade800,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                               
                              },
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 4,
                              width: 120,
                              color: Colors.white
                                  
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Monthly",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 4,
                              width: 120,
                              color: Colors.white
                                
                            )
                          ],
                        )
                      ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:remind_me/authentication_pages/login_page.dart';
import 'package:remind_me/main_Screens/monthly_page.dart';
import 'package:remind_me/main_Screens/Today_page/today_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black38,
            size: 35,
          ),
          onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login_page(),
                          ));},
        ),
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        title: Text(
          "Work List...",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        
      ),
      body: Stack(
        children: [
          Column(
            children: [
            
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade800,
                  //  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        controller: tabController,
                        tabs: [
                          Tab(
                            text: 'Today',
                          ),
                          Tab(
                            text: 'Monthly',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    today(),
                    monthly(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
