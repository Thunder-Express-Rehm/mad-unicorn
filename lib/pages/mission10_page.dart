// Datei: lib/pages/mission10_page.dart
import 'package:flutter/material.dart';

class Mission10Page extends StatelessWidget {
  final String decision;

  const Mission10Page({super.key, required this.decision});

  @override
  Widget build(BuildContext context) {
    String outcomeText;

    if (decision == 'offensive') {
      outcomeText =
          'Du hast dein gesamtes Kapital mobilisiert und setzt auf aggressive Expansion. Der Plan geht auf – du wirst Marktführer in Südostasien.';
    } else {
      outcomeText =
          'Du ziehst dich vorerst zurück, stärkst dein Fundament und entwickelst neue Technologien. Langfristig bringt dir das die Führung.';
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Mission 10 – Ergebnis'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                outcomeText,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Zurück'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
