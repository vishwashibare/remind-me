import 'package:flutter/material.dart';
import 'package:remind_me/authentication_pages/login_page.dart';


class createaccount extends StatelessWidget {
  const createaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
               Container(
                height: MediaQuery.of(context).size.height / 2.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/image/think.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      iconSize: 35,
                     icon: Icon(Icons.arrow_back),             
                    onPressed: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => login_page(),
                                ));
                    },
                    color: Colors.black38,

                  ),
                  ),
                ),
              ),
                Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  "Sign-Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              SizedBox(height: 10,),
            Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Username",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                              ))),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your username...",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Email",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                              ))),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your email...",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Password",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                              ))),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "enter your password...",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ]
          )
            ),
            SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           primary: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            elevation: 10,
                            padding: EdgeInsets.symmetric(vertical: 14,horizontal: 55 
                            )
                          ),
                          child: Text(
                            "Create account",
                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                          
                          },
                          ),
            ],
          ),
        ),
     ),
    );
  }
}

