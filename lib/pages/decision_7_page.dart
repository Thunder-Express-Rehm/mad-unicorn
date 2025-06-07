// lib/pages/decision_7_page.dart
import 'package:flutter/material.dart';
import 'mission_8_page.dart';

class Decision7Page extends StatelessWidget {
  const Decision7Page({super.key});

  void _navigateToNext(BuildContext context, String decision) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Mission8Page(playerDecision: decision),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Entscheidung – Schattenallianz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'GhostByte will dir helfen, in das Schattennetz einzudringen.
Doch seine Methoden sind riskant – und seine Loyalität zweifelhaft.
Wie willst du vorgehen?',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _navigateToNext(context, 'Vertrauen'),
              child: const Text('Ich vertraue ihm – Risiko eingehen'),
            ),
            ElevatedButton(
              onPressed: () => _navigateToNext(context, 'Abbruchcode'),
              child: const Text('Ich baue einen geheimen Abbruchcode ein'),
            ),
            ElevatedButton(
              onPressed: () => _navigateToNext(context, 'KI-Überwachung'),
              child: const Text('Ich setze ein eigenes Überwachungs-KI-Modul ein'),
            ),
            const Spacer(),
            const Text(
              'Mission 7 – Entscheidung trifft Schicksal.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
