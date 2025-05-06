import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade200,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image of decibel levels
          Image.asset(
            'assets/images/decibellevels.png',
            height: 180,
            width: 180,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 30),
          
          Text(
            "Real-Time Safety Warnings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          
          Text(
            "Your microphone listens to nearby sound levels and shows them as a percentage.\n\nBased on this, you'll get live feedback — from 'Safe' to 'Dangerous', so you know when it’s time to protect your ears.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          Text(
            "🟢 Quiet\n🟡 Moderate\n🟠 Loud\n🔴 Danger",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
