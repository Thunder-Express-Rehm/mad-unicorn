// lib/pages/mission6_decision_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/mission7_page.dart';

class Mission6DecisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mission 06: Entscheidung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Du hast den geheimen Mikrochip gefunden, aber eine letzte Firewall blockiert den Zugriff auf den KI-Code.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'Was wirst du tun?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(Icons.vpn_key),
              label: Text('Sicherheitsalgorithmus selbst knacken'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Mission7Page(decision: 'knacken')),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.search),
              label: Text('Externe KI um Hilfe bitten'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Mission7Page(decision: 'hilfe_rufen')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
