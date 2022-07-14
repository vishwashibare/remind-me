import 'package:flutter/material.dart';
import 'package:remind_me/authentication_pages/login_page.dart';


class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: _onboarding(),
    );
  }
}

class _onboarding extends StatefulWidget {
  const _onboarding({super.key});

  @override
  State<_onboarding> createState() => __onboardingState();
}

class __onboardingState extends State<_onboarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    OnBoardPage("onboard1", "Welcome to remind me"),
                    OnBoardPage("onboard2", "Work Happens"),
                    OnBoardPage("onboard3", "Task and Assignments"),
                  ],
                  onPageChanged: (value) => (setCurrentPage(value)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('asset/image/path2.jpg'),
                fit: BoxFit.fill,
              )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login_page(),));
                      }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 90),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.black54,
                        boxShadow: [BoxShadow(
                          color:Colors.black.withOpacity(0.2),
                          offset: Offset(0,9),
                          blurRadius: 20,
                          spreadRadius: 3,
                        )]
                      ),
                      child: Text("Get Started",style: TextStyle(fontSize: 16,color: Colors.white),),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Text("Login",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// this is used to get 3 horizontal points getting dark and grey
  AnimatedContainer getIndicator(int pagNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pagNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: currentPage == pagNo ? Colors.black : Colors.grey,
      ),
    );
  }

  Column OnBoardPage(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('asset/image/$img.png'))),
        ),
        SizedBox(
          height: 45,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }
}
