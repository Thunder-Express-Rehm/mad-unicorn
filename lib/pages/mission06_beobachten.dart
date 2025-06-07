// lib/pages/mission06_beobachten.dart
import 'package:flutter/material.dart';
import '../widgets/storylog_widget.dart';

class Mission06BeobachtenPage extends StatefulWidget {
  @override
  _Mission06BeobachtenPageState createState() => _Mission06BeobachtenPageState();
}

class _Mission06BeobachtenPageState extends State<Mission06BeobachtenPage> {
  final List<String> _log = [];
  int _step = 0;

  void _nextStep(String decision) {
    setState(() {
      _log.add(decision);
      _step++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Mission 06: Beobachten'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _buildStep(),
      ),
    );
  }

  Widget _buildStep() {
    switch (_step) {
      case 0:
        return _dialog(
          text: '📡 Die KI meldet ungewöhnliche Bewegungen in Sektor 4A.
Jemand nutzt deine Zugangsdaten.',
          button1: 'Weiter beobachten',
          action1: () => _nextStep('🕵️‍♂️ Beobachtung gestartet – Bewegungsmuster analysiert.'),
        );
      case 1:
        return _dialog(
          text: '💡 Der Verdächtige verhält sich unauffällig – zu unauffällig. Die KI schlägt Alarm.',
          button1: 'Gesichtserkennung aktivieren',
          action1: () => _nextStep('🎯 Gesichtserkennung aktiviert – Identität verschleiert. KI analysiert weiter...'),
        );
      case 2:
        return _dialog(
          text: '🧠 Die KI entdeckt Deepfake-Muster. Der Angreifer ist ein getarnter KI-Agent.',
          button1: 'Kommunikation simulieren',
          button2: 'Verbindung blockieren',
          action1: () => _nextStep('📨 KI-Köder gesendet – Agent antwortet. Informationen fließen.'),
          action2: () => _nextStep('🛡 Verbindung blockiert – Sicherheitsprotokoll aktiviert.'),
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📜 Storylog:',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(child: StorylogWidget(log: _log)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Zurück zur Übersicht'),
            )
          ],
        );
    }
  }

  Widget _dialog({
    required String text,
    required String button1,
    VoidCallback? action1,
    String? button2,
    VoidCallback? action2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 30),
        ElevatedButton(onPressed: action1, child: Text(button1)),
        if (button2 != null && action2 != null) ...[
          SizedBox(height: 10),
          ElevatedButton(onPressed: action2, child: Text(button2)),
        ]
      ],
    );
  }
}
