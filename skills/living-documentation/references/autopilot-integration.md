# Autopilot-Integration

Living Documentation und Autopilot ergänzen sich: Autopilot liefert den
kontrollierten Arbeitszyklus, Living Documentation bewahrt dessen überprüfbare
Ergebnisse über Sitzungen, Teamwechsel und Kontextgrenzen hinweg.

## Verbindliche Zuordnung

| Autopilot-Phase | Dokumentationspflicht |
| --- | --- |
| Vertrag vor Start | Ziel, messbare Abschluss- und Abbruchbedingung, Grundlinie, Leitplanken |
| Beobachten | Tatsächlichen Ausgangszustand statt Erinnerung festhalten |
| Planen | Teilziel und unabhängiges Akzeptanzkriterium ergänzen |
| Umsetzen | Keine Erfolgsaussage dokumentieren, solange keine Prüfung vorliegt |
| Validieren | Test, Build oder Prüfung mit Ergebnis und Grenzen festhalten |
| Gegenprobe | Am realen Ziel prüfen und Ergebnis vom Werkzeugergebnis unterscheiden |
| Festschreiben | Commit, Release oder Deployment nur als Tatsache dokumentieren, wenn der Zielstand geprüft ist |
| Aufschreiben | Entscheidung, Risiko, offener Punkt und Übergabe aktualisieren |

## Geeignete Einträge

### Laufvertrag

```text
Ziel: <messbar formuliertes Ziel>
Fertig, wenn: <unabhängig prüfbares Kriterium>
Abbruch, wenn: <Versuchs-, Zeit- oder Sicherheitsgrenze>
Grundlinie: <Ausgangszustand mit Datum, Commit und Test-/Build-Ergebnis>
Leitplanken: <geschützte Daten und zustimmungspflichtige Außenaktionen>
```

### Teilziel abgeschlossen

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
  Berechtigungsänderungen oder andere Außenaktionen.
- Die Grundlinie darf bekannte Fehler enthalten. Sie ist kein Vorwand, neue
  Fehler als Altbestand zu erklären.
- Fehlt ein aussagekräftiger Test, ist dessen Schaffung ein offener Punkt –
  nicht eine Lizenz, unbelegt „fertig“ zu melden.
- Bei einer Abbruchbedingung wird der Lauf sauber beendet und der Grund als
  offener Punkt oder Risiko festgehalten.
