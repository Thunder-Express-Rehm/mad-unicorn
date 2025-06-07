// lib/pages/mission_11_finale.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/widgets/decision_button.dart';
import 'summary_dashboard.dart';

class Mission11Finale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Mission 11: Showdown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Der Moment der Entscheidung ist gekommen. Dein Unternehmen ist bereit für den finalen Schritt.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Wähle deinen Weg zum ultimativen Erfolg:',
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            DecisionButton(
              label: 'IPO (Börsengang) – Maximiere deine Reichweite',
              icon: Icons.public,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SummaryDashboard(outcome: 'IPO-Erfolg – Du bist jetzt global!')),
              ),
            ),
            SizedBox(height: 20),
            DecisionButton(
              label: 'Private Expansion – Stille Macht aufbauen',
              icon: Icons.shield,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SummaryDashboard(outcome: 'Diskret expandiert – Du kontrollierst die Branche.')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
