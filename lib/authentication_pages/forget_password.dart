import 'package:flutter/material.dart';
import 'package:remind_me/authentication_pages/login_page.dart';
import 'package:remind_me/authentication_pages/reset_password.dart';

class forgetpass extends StatelessWidget {
  const forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Scaffold(
        body: Column(
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
                                  builder: (context) => loginpage(),
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
                "Forgot Password...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(height: 20,),
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
                        hintText: "jack@example.com",
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
                          "Send request",
                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => resetpassword(),
                                ));
                        },
                        ),
          ],
        ),
     ),
    );
  }
}
