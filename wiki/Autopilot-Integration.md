# Autopilot-Integration

Living Documentation und `$autopilot` bilden zusammen einen nachvollziehbaren
autonomen Arbeitszyklus: Autopilot plant, setzt um und prüft; Living
Documentation bewahrt die belegbaren Ergebnisse dauerhaft im Repository.

## Verbindliche Zuordnung

| Autopilot-Phase | Dokumentationspflicht |
| --- | --- |
| Vertrag vor Start | Ziel, messbare Abschluss- und Abbruchbedingung, Grundlinie, Leitplanken |
| Beobachten | Tatsächlichen Ausgangszustand statt Erinnerung festhalten |
| Planen | Teilziel und unabhängiges Akzeptanzkriterium ergänzen |
| Umsetzen | Keine Erfolgsaussage ohne Prüfung dokumentieren |
| Validieren | Test, Build oder Prüfung mit Ergebnis und Grenzen festhalten |
| Gegenprobe | Am realen Ziel prüfen und Werkzeugergebnis davon unterscheiden |
| Abschluss | Ergebnis, Risiken, offene Punkte und nächsten Schritt aktualisieren |

## Laufvertrag

```text
Ziel: <messbar formuliertes Ziel>
Fertig, wenn: <unabhängig prüfbares Kriterium>
Abbruch, wenn: <Versuchs-, Zeit- oder Sicherheitsgrenze>
Grundlinie: <Ausgangszustand mit Datum, Commit und Test-/Build-Ergebnis>
Leitplanken: <geschützte Daten und zustimmungspflichtige Außenaktionen>
```

## Teilziel dokumentieren

```text
Teilziel: <was sich geändert hat>
Akzeptanzkriterium: <wie ein Dritter es prüft>
Geprüft: <Befehl, Test oder manueller Ablauf>
Ergebnis: <beobachtbares Resultat>
Gegenprobe: <Prüfung am tatsächlichen Ziel>
Offen: <nicht geprüfte Grenze oder nächster Schritt>
```

## Grenzen

- Dokumentation ersetzt keine Zustimmung für Pushes, Deployments, Löschungen,
  Rechteänderungen oder andere Außenaktionen.
- Eine Grundlinie ist kein Freibrief für neue Fehler.
- Fehlt ein aussagekräftiger Test, wird das als offener Punkt oder Risiko
  sichtbar gehalten.
- Bei einer Abbruchbedingung endet der Lauf ehrlich; das unvollständige Ziel
  wird nicht als erledigt gekennzeichnet.
