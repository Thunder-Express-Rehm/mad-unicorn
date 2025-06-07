// lib/pages/mission_detail_page.dart
import 'package:flutter/material.dart';

class MissionDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final List<String> decisions;

  const MissionDetailPage({
    required this.title,
    required this.description,
    required this.decisions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 24),
            Text('Deine Entscheidung:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            ...decisions.map((option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: ElevatedButton(
                onPressed: () {
                  // Entscheidung speichern oder weiterleiten
                  Navigator.pop(context, option);
                },
                child: Text(option),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
