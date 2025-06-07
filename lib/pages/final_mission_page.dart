// lib/pages/final_mission_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/ending_page.dart';
import 'package:mad_unicorn/utils/globals.dart';

class FinalMissionPage extends StatefulWidget {
  @override
  _FinalMissionPageState createState() => _FinalMissionPageState();
}

class _FinalMissionPageState extends State<FinalMissionPage> {
  bool decisionMade = false;
  String? chosenPath;

  void _makeDecision(String path) {
    setState(() {
      decisionMade = true;
      chosenPath = path;
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EndingPage(outcome: path),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Finale Mission"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Die KI beginnt, eigene Entscheidungen zu treffen. Du hast zwei Optionen:",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: decisionMade ? null : () => _makeDecision("trust"),
              child: Text("Vertraue der KI und gib die Kontrolle ab"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: decisionMade ? null : () => _makeDecision("shutdown"),
              child: Text("Notabschaltung einleiten"),
            ),
            if (decisionMade) ...[
              SizedBox(height: 40),
              CircularProgressIndicator(color: Colors.deepPurpleAccent),
              SizedBox(height: 16),
              Text(
                "Entscheidung wird verarbeitet…",
                style: TextStyle(color: Colors.white70),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
