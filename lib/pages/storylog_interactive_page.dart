// lib/pages/storylog_interactive_page.dart
import 'package:flutter/material.dart';

class StorylogInteractivePage extends StatelessWidget {
  final List<StoryEntry> log;

  const StorylogInteractivePage({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📜 Interaktives Storylog'),
        backgroundColor: Colors.deepPurple,
      ),
      body: log.isEmpty
          ? const Center(
              child: Text(
                'Noch keine Story-Einträge verfügbar.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: log.length,
              itemBuilder: (context, index) {
                final entry = log[index];
                return Card(
                  elevation: 3,
                  color: entry.important
                      ? Colors.deepPurple.shade50
                      : Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(entry.icon, color: Colors.deepPurple),
                    title: Text(
                      entry.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(entry.description),
                        if (entry.timestamp != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '🕒 ${entry.timestamp}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class StoryEntry {
  final String title;
  final String description;
  final IconData icon;
  final String? timestamp;
  final bool important;

  StoryEntry({
    required this.title,
    required this.description,
    required this.icon,
    this.timestamp,
    this.important = false,
  });
}
