import 'package:flutter/material.dart';
import 'package:remind_me/authentication_pages/create_account.dart';
import 'package:remind_me/authentication_pages/forget_password.dart';
import 'package:remind_me/main_Screens/main_screen.dart';

import 'package:remind_me/pages_beforeauth/home_page.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: loginpage(),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            builder: (context) => home_page(),
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
                "Log-in...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Password",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ))),
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Password...",
                          suffixIcon: IconButton(
                            onPressed: (() {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          )),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => forgetpass(),
                                ));
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 10,
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 55)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabBarPage(),
                                ));
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account,",
                            style: TextStyle(color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => createaccount(),
                                ));
                            },
                            child: Text(
                              "Click here...",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
