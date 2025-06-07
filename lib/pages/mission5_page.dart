// lib/pages/mission5_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mission5Page extends StatefulWidget {
  @override
  _Mission5PageState createState() => _Mission5PageState();
}

class _Mission5PageState extends State<Mission5Page> {
  String _missionStatus = "Lade Missionsdaten...";

  @override
  void initState() {
    super.initState();
    _loadDecision();
  }

  Future<void> _loadDecision() async {
    final prefs = await SharedPreferences.getInstance();
    final acceptedUSB = prefs.getBool('accepted_usb') ?? false;

    setState(() {
      if (acceptedUSB) {
        _missionStatus =
            "Du hast den USB-Stick akzeptiert. Die verschlüsselten Daten bringen dich zum geheimen Serverraum der Shadow Corp. Aber jemand beobachtet dich...";
      } else {
        _missionStatus =
            "Du hast den USB-Stick abgelehnt. Ohne Zugangsdaten bleibt dir nur der riskante Umweg durch das alte Versorgungstunnelnetz...";
      }
    });
  }

  void _proceedToNextPhase() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text("Mission 5: Folgeauftrag")),
          body: Center(
            child: Text(
              "Fortsetzung folgt... Dies ist das Ende der aktuellen Beta-Mission.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mission 05: Die Schattenzone")),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.visibility_off, size: 100, color: Colors.deepPurpleAccent),
            SizedBox(height: 30),
            Text(
              _missionStatus,
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _proceedToNextPhase,
              child: Text("Weiter zur nächsten Phase"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
