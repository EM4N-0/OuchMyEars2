import 'package:flutter/material.dart';
import 'package:ouchmyears/intro/page1.dart';
import 'package:ouchmyears/intro/page2.dart';
import 'package:ouchmyears/intro/page3.dart';
import 'package:ouchmyears/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen ({Key? key}):super (key: key);

  @override 
  _OnBoardingScreenState createState() => _OnBoardingScreenState (); 
}


class _OnBoardingScreenState extends State<OnBoardingScreen> {

// keep track of onboarding pages
PageController _controller = PageController();

//keep track if we are on last page or not

bool onLastPage = false; //boolean values, default is false


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) { //if we're on last page this will return true
              setState(() {
                onLastPage = (index==2);
              });
              
            },
        children: [
          IntroPage1(),
          IntroPage2(),
          IntroPage3(),
        ]
      ),
      
      //dot indicators for scrolling motion
      Container(
        alignment: Alignment(0, 0.8),      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //skip intro
            GestureDetector( //detects users gestures
              onTap: () {
                _controller.jumpToPage(2); 
              },
              child: Text('Skip')),

            //dot indicator for page
            SmoothPageIndicator(controller: _controller, count: 3),

            //next page or completely done
            onLastPage 
            ? GestureDetector( //if true on last page button will change to done
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SoundPage (); 

                }));
                
              },
              //if false and not on last page it will simply display next
              child: Text('Done'),
              ) 
              :GestureDetector(
                onTap: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 400), 
                    curve: Curves.easeIn,
                  );
                },
                child: Text('Next'), 
              )
          ],
        )
        ),
      
        ]
      )
    );
  
  }
}