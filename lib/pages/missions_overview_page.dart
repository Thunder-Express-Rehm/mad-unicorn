// lib/pages/missions_overview_page.dart
import 'package:flutter/material.dart';
import 'mission_detail_page.dart';

class MissionsOverviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> missions = [
    {
      'title': 'Mission 06: Drohnenabsturz',
      'subtitle': 'Finde das verlorene KI-Paket.',
      'id': 6,
    },
    {
      'title': 'Mission 07: Doppelspiel',
      'subtitle': 'Ein Maulwurf wurde enttarnt. Was nun?',
      'id': 7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🧭 MAD UNICORN: Missionen')),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return ListTile(
            title: Text(mission['title'], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(mission['subtitle']),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MissionDetailPage(missionId: mission['id']),
              ),
            ),
          );
        },
      ),
    );
  }
}
