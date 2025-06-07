// lib/pages/mission3_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/mission4_decision_page.dart';

class Mission3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mission 03: Die Übergabe'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mission 03 – Die Übergabe',
              style: TextStyle(
                fontSize: 26,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Du triffst einen Kontaktmann im Schatten eines Nachtmarkts in Bangkok. Seine Worte sind knapp, sein Blick wachsam.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Er überreicht dir einen metallenen Aktenkoffer – darin: ein mysteriöser Chip. Der Empfänger wartet schon ...',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Mission4DecisionPage()),
                  );
                },
                child: Text('Weiter zu Mission 04'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
