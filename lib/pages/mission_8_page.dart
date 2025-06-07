// lib/pages/mission_8_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/utils/globals.dart';
import 'package:mad_unicorn/pages/mission_9_page.dart';

class Mission8Page extends StatelessWidget {
  final bool trustedGhostByte;

  const Mission8Page({super.key, required this.trustedGhostByte});

  @override
  Widget build(BuildContext context) {
    final storyText = trustedGhostByte
        ? 'GhostByte hat Wort gehalten. Gemeinsam infiltriert ihr das Schattennetzwerk. Was ihr findet, übertrifft eure kühnsten Erwartungen: Verschlüsselungen, Hintermänner, und ein Hinweis auf einen bevorstehenden Angriff gegen Flash Systems.'
        : 'GhostByte hat euch verraten. Die Schattenallianz war vorbereitet – euer Zugang wird getrackt. Nur mit knapper Not entkommt ihr. Doch das Risiko ist nun doppelt so hoch.';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Mission 08: Der Tiefe Zugriff'),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              storyText,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 40),
            const Text(
              'Wie reagierst du auf die neuen Informationen?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                mission9Unlocked = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Mission9Page(),
                  ),
                );
              },
              child: const Text('Entschlüssele die Pläne und verhindere den Angriff'),
            ),
            ElevatedButton(
              onPressed: () {
                mission9Unlocked = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Mission9Page(),
                  ),
                );
              },
              child: const Text('Nutze die Info als Druckmittel gegen GhostByte'),
            ),
          ],
        ),
      ),
    );
  }
}
