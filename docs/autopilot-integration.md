# Verbindliche Autopilot-Integration

Living Documentation hält die überprüfbaren Ergebnisse eines Autopilot-Laufs
fest. Damit bleibt nach einem Kontextwechsel, einer Übergabe oder einem
abgebrochenen Lauf nachvollziehbar, was tatsächlich geprüft wurde und was
noch offen ist.

## Verbindlicher Ablauf

| Autopilot-Phase | Pflicht in der Living Documentation |
| --- | --- |
| Vor dem Start | Ziel, Abschlussbedingung, Abbruchbedingung, Grundlinie und Leitplanken festhalten |
| Beobachten | Den tatsächlichen Ausgangszustand dokumentieren, nicht Erinnerungen oder Annahmen |
| Planen | Teilziel und ein unabhängig prüfbares Akzeptanzkriterium ergänzen |
| Umsetzen | Noch keinen Erfolg behaupten; nur den veränderten Bereich beschreiben |
| Validieren | Befehl oder Ablauf, Ergebnis und bewusst nicht geprüfte Grenzen festhalten |
| Gegenprobe | Das reale Nutzer-, Betriebs- oder Spielziel prüfen, nicht nur ein positives Werkzeugergebnis |
| Abschluss | Ergebnis, offene Grenzen, Risiken und den nächsten sinnvollen Schritt aktualisieren |

## Laufvertrag vor der Änderung

```text
Ziel: <messbar formuliertes Ziel>
Fertig, wenn: <unabhängig prüfbares Kriterium>
Abbruch, wenn: <Versuchs-, Zeit- oder Sicherheitsgrenze>
Grundlinie: <Ausgangszustand mit Datum, Commit und Test-/Build-Ergebnis>
Leitplanken: <geschützte Daten und zustimmungspflichtige Außenaktionen>
```

## Befund nach einem Teilziel

```text
Teilziel: <was sich geändert hat>
Akzeptanzkriterium: <wie ein Dritter es prüft>
Geprüft: <Befehl, Test oder manueller Ablauf>
Ergebnis: <beobachtbares Resultat>
Gegenprobe: <Prüfung am tatsächlichen Ziel>
Offen: <nicht geprüfte Grenze oder nächster Schritt>
```

## Wichtige Grenzen

- Die Dokumentation ist kein Ersatz für Zustimmung bei Pushes, Deployments,
  Löschungen, Rechteänderungen oder sonstigen Außenaktionen.
- Eine Grundlinie kann bereits bekannte Fehler enthalten. Sie rechtfertigt
  keine neue Regression.
- Fehlt ein aussagekräftiger Test, bleibt das ein offener Punkt oder Risiko.
- Bei der Abbruchbedingung wird der Lauf ehrlich beendet und der Befund sichtbar
  dokumentiert; ein unvollständiges Ziel wird nie als erledigt dargestellt.

Die agentenspezifische Regel steht zusätzlich in
[`skills/living-documentation/SKILL.md`](../skills/living-documentation/SKILL.md).
