// Datei: delivery_page.dart (MissionId = 5)
if (widget.missionId == 5) {
  return Scaffold(
    appBar: AppBar(title: Text('🚨 Mission 05: Der Vertrauensbruch')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🧠 Interner Konflikt: Dein Partner hat hinter deinem Rücken Anteile verkauft.',
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text('Wie reagierst du?', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => handleDecision('💥 Konfrontation – Du forderst sofort eine Erklärung.'),
            child: Text('Konfrontieren'),
          ),
          ElevatedButton(
            onPressed: () => handleDecision('🧊 Strategischer Rückzug – Du beobachtest ihn heimlich weiter.'),
            child: Text('Abwarten und überwachen'),
          ),
          ElevatedButton(
            onPressed: () => handleDecision('🧠 Neutralisieren – Du entziehst ihm Zugriff und startest dein eigenes System.'),
            child: Text('Eiskalt trennen und eigene Lösung starten'),
          ),
          if (decision.isNotEmpty) ...[
            SizedBox(height: 30),
            Text('📜 Deine Entscheidung:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(decision),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => StorylogPage(log: _log)),
                );
              },
              child: Text('Storylog ansehen'),
            ),
          ]
        ],
      ),
    ),
  );
}
