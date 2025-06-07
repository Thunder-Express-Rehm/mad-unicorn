// lib/pages/mission01_decision_page.dart
import 'package:flutter/material.dart';
import '../utils/globals.dart';
import 'storylog_page.dart';

class Mission01DecisionPage extends StatefulWidget {
  @override
  _Mission01DecisionPageState createState() => _Mission01DecisionPageState();
}

class _Mission01DecisionPageState extends State<Mission01DecisionPage> {
  String decision = '';
  List<String> log = ['🚀 Mission 01: Der erste große Pitch'];

  void makeDecision(String value, bool trustedInvestor) {
    setState(() {
      decision = value;
      investorTrusted = trustedInvestor;
      log.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mission 01: Entscheidung')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Du triffst dich mit einem möglichen Investor.
Er verspricht Millionen – verlangt aber die Mehrheit der Kontrolle.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            if (decision.isEmpty) ...[
              ElevatedButton(
                onPressed: () => makeDecision(
                    '🤝 Entscheidung: Investor akzeptiert – Kontrolle abgegeben.',
                    true),
                child: Text('Investor akzeptieren'),
              ),
              ElevatedButton(
                onPressed: () => makeDecision(
                    '🚪 Entscheidung: Abgelehnt – du gehst deinen eigenen Weg.',
                    false),
                child: Text('Investor ablehnen'),
              ),
            ] else ...[
              Text('🧭 Deine Entscheidung:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(decision),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StorylogPage(log: log)),
                  );
                },
                child: Text('Storylog ansehen'),
              )
            ]
          ],
        ),
      ),
    );
  }
}
