# PLAYROOM ✦ – Multiplayer Game Night

**Version:** 0.1.0 (spielbarer Web-App-Prototyp)  
**Umfang:** 13 Spiele · 2–6 Spieler · private Lobbys · WebSocket-Multiplayer · mobile und Desktop · 0 externe NPM-Abhängigkeiten

PLAYROOM ist eine eigenständige, moderne Spieleabend-App. Die Spiele verwenden **eigene Namen und Gestaltung** und sind eigenständige, teils vereinfachte Varianten bekannter Spielmechaniken. Keine offiziellen Markenbilder, Logos, Spieltexte oder Lizenzen sind enthalten.

## Schnellstart (Windows / macOS / Linux)

1. Installiere **Node.js 20 oder neuer**: https://nodejs.org/
2. Entpacke den Ordner `playroom`.
3. Öffne in diesem Ordner ein Terminal und führe Folgendes aus:

   ```bash
   npm start
   ```

4. Öffne **http://localhost:3000** im Browser.
5. Wähle ein Spiel, klicke auf **Raum erstellen**, trage deinen Namen ein und teile den angezeigten sechsstelligen Code.
6. Andere Spieler öffnen dieselbe Web-App und wählen **Raum beitreten**. Sobald genug Spieler da sind, kann der Host die Partie starten.

**Tipp – auf einem PC testen:** Öffne einen zweiten privaten/Inkognito-Browser oder einen anderen Browser (auch ein zweiter Tab funktioniert) und tritt über den Code bei. Es sind keine Konten erforderlich.

**Zusammen im WLAN:** Ermittle die lokale IP-Adresse des Computers, auf dem `npm start` läuft, z. B. `192.168.178.24`. Andere Geräte öffnen `http://192.168.178.24:3000`. Der Computer muss erreichbar sein, und ggf. muss der Port 3000 in der lokalen Firewall freigegeben werden.

**Über das Internet:** Die App muss auf einem von allen erreichbaren Node.js-Server gehostet werden, der WebSockets unterstützt (z. B. Render, Railway oder ein VPS). Die beiliegende `render.yaml` ist für ein Render-Webservice-Deployment vorbereitet. Nach Veröffentlichung erhalten Freunde eine gemeinsame `https://...`-Adresse. Ohne Hosting ist `localhost` nur auf deinem eigenen Gerät verfügbar.

## Die 13 Spiele

| Spiel | Spielidee | Personen |
|---|---|---|
| Dice Royale | Fünf Würfel, drei Würfe, 13 Wertungskategorien | 2–6 |
| Color Clash | Farbkarten, Zahlen und Aktionskarten | 2–6 |
| Phase Quest | Sets, Zahlenfolgen, zehn aufsteigende Phasen | 2–6 |
| Smart Dice | Würfelauswahl, Silbertablett, fünf Wertungsbereiche | 2–6 |
| Four in Orbit | Vier Steine verbinden | 2 |
| Triple Tactics | Drei Zeichen verbinden | 2 |
| Ocean Strike | Geheime Schiffsflotten, Treffer und Versenken | 2 |
| Mind Sync | **Koop:** verdeckte Zahlen intuitiv aufsteigend spielen | 2–6 |
| Dice Bluff | Verdeckte Würfel, steigende Gebote, anzweifeln | 2–6 |
| Bull Run | Gleichzeitig Zahlenkarten auswählen, Reihen und Minuspunkte | 2–6 |
| Memory Party | Zwei Karten aufdecken und Paare finden | 2–6 |
| Lucky 21 | In fünf Runden gegen die Bank spielen | 2–6 |
| Letter Rush | Wortkategorien mit gemeinsamem Anfangsbuchstaben | 2–6 |

## Schon enthalten

- Moderne und responsive Dark-Mode-UI für Smartphone, Tablet und Desktop
- 13 unterschiedliche Spielansichten und spielbare Runden-/Gewinnlogik
- Private Spielräume (6-stellige Codes), Spielwechsel und neue Runde
- Live-Spielstände über WebSockets; Server prüft Zugberechtigung und Spielregeln
- Verdeckte Karten, Zahlen und Schiffe pro Spieler; Spielzüge laufen serverseitig
- Wiedereintritt nach Browser-Refresh über einen nur in diesem Tab gespeicherten Sitzungs-Token
- Host-Kontrollen, Spielerübersicht, Regeltexte, Filter und Suchfunktion
- Direkt als PWA installierbar auf unterstützten Browsern (Web-App-Manifest)
- Start ohne `npm install`: ausschließlich Node.js-Bordmittel

## Einschränkungen dieser ersten Version

- **Keine fertige native Android-/iOS-App**: PLAYROOM ist eine responsive Web-App / PWA; eine spätere Verpackung (z. B. Capacitor) ist möglich.
- **Spielvarianten statt vollständiger 1:1-Kopien:** Beispiele: Color Clash hat vereinfachtes Nachziehen; Phase Quest legt den Fokus auf Phasen, Anlegen und Abwerfen, ohne alle Spezialkarten; Smart Dice verwendet eine eigene, vereinfachte Punktewertung.
- **Kein persistenter Spielstand:** Räume leben im RAM des Node.js-Servers und gehen bei Neustart verloren; ein vollständig ungenutzter Raum wird nach 24 Stunden entfernt.
- Keine Bots, Benutzerkonten, öffentlichen Matchmaking-Räume, Ranglisten, Chat-Funktion oder Moderation.
- Letter Rush prüft den Anfangsbuchstaben automatisch, nicht die tatsächliche Bedeutung des Wortes (Ehrlichkeitsmodus).
- Für Internet-Partien benötigt die App ein eigenes Deployment und eine durchgehend erreichbare Serververbindung.
- Dies ist ein **MVP zum Testen und Weiterentwickeln**, keine vollständig getestete Produktionsanwendung für öffentliche Last.

## Entwicklung / Tests

```bash
npm test             # Engine- und WebSocket-Integrationstests
npm run dev          # Node.js Watch-Modus
PORT=8080 npm start  # anderer Port (macOS/Linux)
```

Projektdateien:

```text
playroom/
├── public/
│   ├── index.html           responsive HTML-Einstieg
│   ├── app.js               Spieleansichten / WebSocket-Client
│   ├── style.css            UI-Design und Mobile-Breakpoints
│   ├── icon.svg             eigenes App-Icon
│   └── manifest.webmanifest
├── engine.js                Regeln / Spielzustände / private Ansichten
├── server.js                Webserver / Raumverwaltung / WebSockets
├── render.yaml              optionale Deployment-Konfiguration
├── tests/                   automatische Tests
└── package.json
```

## Ausbauideen (v0.2)

Dauerhafte Raum- und Spieler-Speicherung (Redis/Postgres), richtige Freundeinladungen mit Deeplinks, Gastprofile und Avatare, Chat/Emotes, Animationen/Sounds, eigene Regelvarianten, Best-of-Serien, mobile Push-Benachrichtigungen, Teamwertung, präzisere Kartenspielregeln sowie native Android-/iOS-Container.
