import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:ouchmyears/onboarding.dart';

import 'package:ouchmyears/settings.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(), // ← this now loads first
    );
  }
}

class SoundPage extends StatefulWidget {
  const SoundPage({super.key});

  @override
  State<SoundPage> createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  Record soundRecording = Record(); 
  Timer? timer; 

  double volume = 0.0; 
  double minVolume= -45.0; 

  bool isRecording = false; // To help flutter remember if button is pressed

  Future<void> stopRecording() async {
  await soundRecording.stop();  // Stop the microphone recording
  timer?.cancel();             // Stop the timer that updates the volume
  setState(() {
    isRecording = false;       // Update UI to indicate it's stopped
  });
}


//Helper Functions,updates volume variables
  startTimer() async {
    timer ??= Timer.periodic(Duration(milliseconds: 50),(timer)=> updateVolume());    // Calls update volume function 
  }

  updateVolume() async {
    Amplitude ampl = await soundRecording.getAmplitude();
    if (ampl.current > minVolume) {
      setState(() {
        volume = (ampl.current - minVolume) / minVolume; //normalise volume values 
      });

      print("NOISE LEVEL: $volume"); 

    }
  }

//2nd Helper Function 

int getVolumePercent(int maxVolumeToDisplay){
return (volume * maxVolumeToDisplay).round().abs(); //percentage of max vol picked up by microphone
}

String getVolumeFeedback() {
  int percent = getVolumePercent(100);

  if (percent < 20) {
    return "🟢 Quiet - Safe for hearing";
  } else if (percent < 50) {
    return "🟡 Moderate - Safe unless exposed for hours";
  } else if (percent < 75) {
    return "🟠 Loud - Prolonged exposure may damage hearing";
  } else {
    return "🔴 Danger - Protect your ears immediately!";
  }
}



//Starts recording functions while apps loading 
Future<bool> startRecording() async {
  if (await soundRecording.hasPermission()){
    if (!await soundRecording.isRecording()){
    await soundRecording.start (); 

   }
   startTimer(); //starts update volume function call
   return true;
  } else {
    return false;
  }
}





@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "O U C H M Y E A R S",
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: const Color.fromARGB(255, 151, 51, 233),
      elevation: 0,
      actions: [
       IconButton(
  icon: Icon(Icons.settings),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Volume number or instruction
          Text(
            isRecording
                ? getVolumePercent(100).toString()
                : "Press to record current noise levels",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Text feedback for sound level
          Text(
            isRecording ? getVolumeFeedback() : "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          // Microphone toggle button
          IconButton(
            onPressed: () async {
              if (!isRecording) {
                bool started = await startRecording();
                if (started) {
                  setState(() {
                    isRecording = true;
                  });
                }
              } else {
                await stopRecording();
              }
            },
            icon: Icon(
              isRecording ? Icons.mic_off : Icons.mic,
              size: 50,
              color: isRecording ? Colors.red : Colors.green,
            ),
            iconSize: 100,
          ),
        ],
      ),
    ),
  );
}


}
