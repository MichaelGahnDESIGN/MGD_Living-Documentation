# Globale Agentenregeln

Nutze diese Regeln projektweit, ohne verbindliche Regeln des jeweiligen
Projekts zu verdrängen.

## Modell und Limits

Der Agent empfiehlt vor relevanten Arbeiten das kleinste Modell, das Aufgabe,
Risiko und Prüfbedarf zuverlässig abdeckt. Eine kurze Begründung genügt.
Höhere Denkstufen sind für Architektur, Sicherheit, Authentifizierung,
Datenbankmigrationen, komplexe Fehleranalyse und Releases sinnvoll.

Arbeite token-sparend: nur relevante Dateien lesen, kleine Teilziele wählen,
Prüfungen direkt nach Änderungen ausführen und Ergebnisse dauerhaft notieren.
Bei einem Limit oder einer Abbruchbedingung sauber stoppen, einen sicheren
Zwischenstand sichern und offene Punkte klar benennen.

## Agentenpool und Prozesskontrolle

Der Hauptagent behält Ziel, Priorität, Schutzgrenzen und Abschlussprüfung. Er
delegiert nur unabhängige Teilaufgaben. Mehrere Agenten dürfen keine
überlappenden Dateien ohne Koordination ändern.

Bei längeren Läufen regelmäßig prüfen, ob Agenten, Tests und Builds Fortschritt
machen oder Ressourcen blockieren. Hängende eigene Prozesse kontrolliert
beenden; Ergebnisse anderer Agenten stets durch Diff, Test oder Gegenprobe
selbst prüfen.

## Karte (Graphify)

Ist die Karte eingerichtet, fragt der Agent Strukturfragen zuerst den Graphen
(`graphify query`, `graphify path`, `graphify explain`) und führt nach jedem
abgeschlossenen Teilziel Todo, Dokumentation und `graphify update .` nach.
Der Graph ist abgeleitet: Er liefert Belege für Architekturaussagen, nie
Entscheidungen, Status oder Freigaben. Hooks und Eingriffe in die globale oder
projektweite Agentenkonfiguration erfolgen nur auf ausdrücklichen Wunsch.

## Project-Clean

Vor einer Bereinigung eine Inventur von Git-Status, Dateien, Backups,
Build-Artefakten und offenen Aufgaben machen. Entferne nur eindeutig
reproduzierbare, nicht benötigte Dateien. Nie automatisch löschen:

- `SECRETS/`, `USER CONCEPT/`, Backups, Datenbanken, Uploads oder Logs;
- unbekannte Dateien, lokale Arbeitsstände oder nicht nachvollziehbare Archive;
- bereits versionierte sensible Daten ohne eine gezielte, abgestimmte
  Bereinigungsstrategie.

Dokumentiere, was aufgeräumt wurde, was bewusst blieb und wie eine
Wiederherstellung möglich ist.
