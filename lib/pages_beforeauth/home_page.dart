import 'dart:async';

import 'package:flutter/material.dart';
import 'package:remind_me/pages_beforeauth/Onboarding.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}



class _home_pageState extends State<home_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
    Duration(seconds: 1), 
    () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => onboarding()))
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/image/logo.png')),
          ),
        ),
      ),
    );
  }

}
