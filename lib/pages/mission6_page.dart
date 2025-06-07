// lib/pages/mission6_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mission6_decision_page.dart';

class Mission6Page extends StatelessWidget {
  Future<void> _completeMission6(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('mission6_completed', true);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Mission6DecisionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Mission 06: Die letzte Lieferung'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bangkok, Mitternacht.

Comsane steht vor dem alten Regierungslager – dem Ort, an dem alles begann. Die Lieferung, die dort erwartet wird, könnte alles verändern: Die Zukunft von Flash Logistics, seine persönliche Freiheit – oder beides. Doch der Ort wird überwacht. KI-Drohnen kreisen. Nur ein stiller Schatten schafft es unentdeckt hinein.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _completeMission6(context),
                icon: Icon(Icons.north_east),
                label: Text('Eindringen ins Lager'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
