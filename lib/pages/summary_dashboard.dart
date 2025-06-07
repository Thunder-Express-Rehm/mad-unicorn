// lib/pages/summary_dashboard.dart
import 'package:flutter/material.dart';

class SummaryDashboard extends StatelessWidget {
  final String outcome;

  const SummaryDashboard({super.key, required this.outcome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Mission Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deine unternehmerische Reise:',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              outcome,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(color: Colors.deepPurpleAccent),
            const SizedBox(height: 20),
            const Text(
              'Statistik (fiktiv):',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Marktanteil: 67%
• Kundenzufriedenheit: 95%
• Wachstum: +330%
• Technologievorsprung: hoch
• Wettbewerber verdrängt: 4',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                icon: const Icon(Icons.replay),
                label: const Text('Erneut spielen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
