import 'package:flutter/material.dart';


class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,  // Background color of the page
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text for the app title
            Text(
              "O U C H M Y E A R S",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            SizedBox(height: 20),

            // Paragraph explaining the app
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "O U C H M Y E A R S is an app designed to alert you when the noise levels "
                "around you may be harmful to your ears. The app uses your phone’s microphone to "
                "detect the surrounding sound, and it provides real-time feedback on whether the sound "
                "is safe for your hearing or potentially damaging.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),

            // Actual image inserted here
            Image.asset(
              'assets/images/noisepollution.png',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}