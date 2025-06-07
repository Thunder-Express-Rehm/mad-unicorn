// lib/pages/mission_story_7.dart
import 'package:flutter/material.dart';
import 'decision_7_page.dart';

class MissionStory7Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mission 07: Die Schattenallianz',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'Comsane ist gezwungen, sich mit einem alten Rivalen – dem abtrünnigen Hacker "GhostByte" – zu verbünden. '
                    'Nur gemeinsam können sie sich in die verschlüsselte Datenbank der Schattenallianz hacken. '
                    'Doch während die ersten Firewalls fallen, stellt sich die Frage: Wird GhostByte loyal bleiben oder plant er seinen eigenen Coup?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Decision7Page()),
                    );
                  },
                  icon: Icon(Icons.keyboard_double_arrow_right),
                  label: Text('Deine Entscheidung'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
