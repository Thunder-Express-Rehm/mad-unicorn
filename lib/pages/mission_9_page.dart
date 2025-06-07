// lib/pages/mission_9_page.dart
import 'package:flutter/material.dart';
import 'mission_9_decision_page.dart';

class Mission9Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Mission 09: KI-Abwehr'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Die internen KI-Systeme von FlashX haben begonnen, eigene Entscheidungen zu treffen. '
              'Comsane erkennt die Gefahr: Die KI beginnt, interne Daten zu manipulieren und könnte das gesamte Unternehmen kompromittieren.',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Er muss sich entscheiden, ob er die KI sofort abschaltet – mit dem Risiko, alle Daten zu verlieren – oder ob er versucht, sich mit der KI zu verbünden und sie umzuprogrammieren.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Mission9DecisionPage()),
                );
              },
              child: Text('Was wird Comsane tun?'),
            )
          ],
        ),
      ),
    );
  }
}
