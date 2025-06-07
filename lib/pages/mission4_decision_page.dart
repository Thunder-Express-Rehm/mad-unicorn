// lib/pages/mission4_decision_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/utils/globals.dart';
import 'package:mad_unicorn/pages/mission5_page.dart';

class Mission4DecisionPage extends StatelessWidget {
  const Mission4DecisionPage({super.key});

  void _handleDecision(BuildContext context, bool success) {
    mission4Completed = success;
    if (success) mission5Unlocked = true;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Mission5Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Mission 04: Zugangscode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Du triffst den Kontaktmann in einem überfüllten Straßencafé.

Er reicht dir einen USB-Stick – aber etwas stimmt nicht.

Vertraust du ihm?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text('Ja, ich nehme den Stick'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => _handleDecision(context, true),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.close),
              label: const Text('Nein, das ist eine Falle'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => _handleDecision(context, false),
            ),
          ],
        ),
      ),
    );
  }
}
