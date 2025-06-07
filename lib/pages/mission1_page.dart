// lib/pages/mission1_page.dart
import 'package:flutter/material.dart';
import 'storylog_page.dart';

class Mission1Page extends StatelessWidget {
  const Mission1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Mission 1: Der erste Schritt"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/mission1_intro.png'),
            const SizedBox(height: 24),
            const Text(
              'Comsane steht vor der Entscheidung, ob er alles auf eine Karte setzt. 

Gründe deinen eigenen Lieferservice auf dem Campus – oder suche weiter nach einem sicheren Job?',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StorylogPage()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
              child: const Text("Starte die Mission"),
            )
          ],
        ),
      ),
    );
  }
}
