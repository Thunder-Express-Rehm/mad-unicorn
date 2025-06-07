// lib/pages/mission_page.dart
import 'package:flutter/material.dart';
import '../utils/globals.dart';
import 'delivery_page.dart';
import 'dialog_page.dart';
import 'storylog_page.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missionen'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          _buildMissionTile(
            context,
            title: 'Mission 01: Erste Lieferung',
            subtitle: 'Starte dein erstes Logistikabenteuer.',
            missionId: 1,
          ),
          _buildMissionTile(
            context,
            title: 'Mission 02: Campus-Verbindung',
            subtitle: 'Organisiere den Campus-Verteiler.',
            missionId: 2,
          ),
          _buildMissionTile(
            context,
            title: 'Mission 03: Geheime Übergabe',
            subtitle: 'Lieferung unter dem Radar.',
            missionId: 3,
          ),
          _buildDialogTile(context),
          if (mission4Unlocked)
            _buildMissionTile(
              context,
              title: '🔓 Mission 04: Zugangscode-Übergabe',
              subtitle: 'Nächste Phase der Lieferung beginnt.',
              missionId: 4,
            ),
          if (mission5Unlocked)
            _buildMissionTile(
              context,
              title: '🔓 Mission 05: Entscheidung im Netzwerk',
              subtitle: 'Wähle deinen Weg durch das System.',
              missionId: 5,
            ),
        ],
      ),
    );
  }

  Widget _buildMissionTile(BuildContext context,
      {required String title,
      required String subtitle,
      required int missionId}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DeliveryPage(missionId: missionId)),
        );
      },
    );
  }

  Widget _buildDialogTile(BuildContext context) {
    return ListTile(
      title: const Text('KI-Dialog starten'),
      subtitle: const Text('Sprich mit dem Kunden.'),
      trailing: const Icon(Icons.chat_bubble_outline),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DialogPage()),
        );
      },
    );
  }
}
