// lib/pages/mission_summary_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MissionSummaryPage extends StatefulWidget {
  @override
  _MissionSummaryPageState createState() => _MissionSummaryPageState();
}

class _MissionSummaryPageState extends State<MissionSummaryPage> {
  late SharedPreferences _prefs;
  Map<int, bool> missionStatus = {};

  @override
  void initState() {
    super.initState();
    _loadMissionStatus();
  }

  Future<void> _loadMissionStatus() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 1; i <= 6; i++) {
        missionStatus[i] = _prefs.getBool('mission_$i') ?? false;
      }
    });
  }

  Widget _buildMissionCard(int missionNumber, String title, String subtitle) {
    final isUnlocked = missionStatus[missionNumber] ?? false;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(
          isUnlocked ? Icons.check_circle : Icons.lock_outline,
          color: isUnlocked ? Colors.green : Colors.grey,
        ),
        title: Text('Mission $missionNumber: $title'),
        subtitle: Text(subtitle),
        trailing: isUnlocked ? Icon(Icons.play_arrow) : null,
        onTap: isUnlocked
            ? () {
                Navigator.pushNamed(context, '/mission_$missionNumber');
              }
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Missionsübersicht')),
      body: ListView(
        children: [
          _buildMissionCard(1, 'Campus-Bote', 'Die erste Lieferung.'),
          _buildMissionCard(2, 'Verdeckter Übergang', 'Der Tunnel ist der Schlüssel.'),
          _buildMissionCard(3, 'Geheime Lieferung', 'Bringe das Paket unbemerkt ans Ziel.'),
          _buildMissionCard(4, 'Zugangscode-Übergabe', 'Beginn der nächsten Phase.'),
          _buildMissionCard(5, 'Das Netzwerk', 'Wer ist Freund, wer ist Feind?'),
          _buildMissionCard(6, 'Schattenpfade', 'Verfolgung und Verschlüsselung.')
        ],
      ),
    );
  }
}
