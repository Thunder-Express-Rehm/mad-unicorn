// lib/pages/mission2_decision_page.dart
import 'package:flutter/material.dart';
import 'mission3_page.dart';

class Mission2DecisionPage extends StatelessWidget {
  const Mission2DecisionPage({super.key});

  void _navigateToNextMission(BuildContext context, String decision) {
    // Hier kann später Logik zur Speicherung der Entscheidung eingebaut werden
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Mission3Page(decision: decision)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Mission 2: Entscheidung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Du stehst vor dem geheimen Lagerhaus.
Was tust du?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () => _navigateToNextMission(context, 'vorsichtig_untersuchen'),
              child: const Text('Ich untersuche vorsichtig den Eingang'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () => _navigateToNextMission(context, 'direkt_eindringen'),
              child: const Text('Ich dringe direkt ein, keine Zeit verlieren!'),
            ),
          ],
        ),
      ),
    );
  }
}
