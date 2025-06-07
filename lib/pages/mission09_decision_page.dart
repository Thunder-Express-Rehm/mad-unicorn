// Datei: lib/pages/mission09_decision_page.dart
import 'package:flutter/material.dart';
import 'mission10_page.dart';

class Mission09DecisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Mission 09 – Entscheidung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Du stehst vor einer strategischen Weggabelung. Deine Firma ist kurz davor, die Konkurrenz endgültig zu überholen.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Mission10Page(decision: 'offensive'),
                  ),
                );
              },
              child: Text('Volle Expansion – Mit allen Mitteln'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Mission10Page(decision: 'strategic'),
                  ),
                );
              },
              child: Text('Strategischer Rückzug – Kräfte sammeln'),
            ),
          ],
        ),
      ),
    );
  }
}
