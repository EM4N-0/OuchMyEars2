import 'package:flutter/material.dart';


class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image of iPhone mic
          Image.asset(
            'assets/images/iphonemic.png',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),

          SizedBox(height: 30),

          Text(
            "How Does It Work?",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          Text(
            "Using your phone’s microphone, the app listens to surrounding sounds and calculates how loud they are as a percentage of a maximum safe level. This makes it easy to understand at a glance whether the noise around you could be harmful, especially if you’re exposed for a long time.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}