import 'package:flutter/material.dart';
import 'package:gomart/pages/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IntroductionScreen(
            globalBackgroundColor: Colors.white,
            scrollPhysics: BouncingScrollPhysics(), // Disable scrolling
            pages: [
              _buildPage(
                imagePath: "assets/images/bgimg1.png",
                description: "Get Fresh & Hygienic Grocery\nin your Finger tips!",
              ),
              _buildPage(
                imagePath: "assets/images/bgimg2.png",
                description: 'Select your Grocery Item into\nTrolley Cart at your Home',
              ),
              _buildPage(
                imagePath: "assets/images/bgimg3.png",
                description: 'Booked Grocery items\nwith easy step',
              ),
              _buildPage(
                imagePath: "assets/images/bgimg4.png",
                description: 'Get Grocery Basket\ndelivered at your Doorstep',
              ),
            ],
            onDone: () {
              _navigateToLogin();
            },
            onSkip: () {
              _navigateToLogin();
            },
            showSkipButton: false,
            skip: Container(), // Remove skip button
            next: Text(
              'Next',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF3F2037),
              ),
            ),
            done: Text(
              'Finish',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF3F2037),
              ),
            ),
            dotsDecorator: DotsDecorator(
              size: Size.square(10),
              activeSize: Size(20, 10),
              color: Color(0xFF95A0BE),
              activeColor: Colors.blue,
              spacing: EdgeInsets.symmetric(horizontal: 2),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 17,
            left: 33,
            child: TextButton(
              onPressed: () {
                _navigateToLogin();
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF3F2037),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }

  PageViewModel _buildPage(
      {required String imagePath, required String description}) {
    return PageViewModel(
      title: '',
      decoration: PageDecoration(contentMargin: EdgeInsets.zero),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            // fit: BoxFit.cover,
          ),
          // SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF3F2037),
              fontSize: 24,
              fontFamily: 'Be Vietnam',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Mylogin()),
    );
  }
}
