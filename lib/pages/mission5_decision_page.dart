// lib/pages/mission5_decision_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/mission6_page.dart';
import '../utils/globals.dart';

class Mission5DecisionPage extends StatefulWidget {
  @override
  _Mission5DecisionPageState createState() => _Mission5DecisionPageState();
}

class _Mission5DecisionPageState extends State<Mission5DecisionPage> {
  bool _decisionMade = false;
  String _chosenPath = '';

  void _choosePath(String path) {
    setState(() {
      _decisionMade = true;
      _chosenPath = path;
      mission5Path = path; // speichern für spätere Missionen
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Mission6Page()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Mission 05: Entscheidung'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _decisionMade
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_clock, color: Colors.white70, size: 48),
                    SizedBox(height: 16),
                    Text(
                      'Du hast dich entschieden:
"$_chosenPath".
Ladevorgang...',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Du stehst am Rand der Schattenzone.
Zwei Wege führen ins Innere – welcher ist sicherer?',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () => _choosePath('Pfad durch das Netzwerk der Händler'),
                    icon: Icon(Icons.route),
                    label: Text('Gehe durch das Netzwerk'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _choosePath('Pfad durch das Datentunnel-System'),
                    icon: Icon(Icons.data_usage),
                    label: Text('Nimm die Datentunnel'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  ),
                ],
              ),
      ),
    );
  }
}
