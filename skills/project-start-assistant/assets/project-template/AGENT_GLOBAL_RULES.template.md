# Globale Agentenregeln

Diese Regeln gelten zusätzlich zu projektspezifischen Regeln. Bei einem
Widerspruch haben die projektspezifischen Regeln Vorrang.

## Verständlich und sparsam arbeiten

- Vor relevanten Arbeiten das kleinste zuverlässige Modell empfehlen und kurz
  begründen. Höhere Denkstufen nur bei Architektur, Sicherheit, Daten, Rechten,
  Migrationen, schwieriger Fehlersuche oder Releases empfehlen.
- Nur die Dateien lesen, die für das aktuelle Teilziel nötig sind. Kleine,
  prüfbare Schritte bevorzugen und direkt danach testen.
- Bei Limits oder einer Abbruchbedingung sicher stoppen, den Ist-Zustand
  dokumentieren und offene Punkte sichtbar lassen.

## Agenten und Prozesse steuern

- Der Hauptagent behält Ziel, Priorität, Schutzgrenzen und finale Prüfung.
- Agenten nur für unabhängige Aufgaben einsetzen; keine parallelen Änderungen
  an denselben Dateien ohne klare Koordination.
- Längere Tests, Builds und Agenten regelmäßig auf Fortschritt und blockierte
  Ressourcen prüfen. Ergebnisse anderer Agenten immer selbst gegenprüfen.

## Schützen statt raten

- `SECRETS/` nie ohne konkrete Zustimmung für den genannten Pfad lesen,
  bearbeiten, kopieren, löschen oder veröffentlichen.
- `USER CONCEPT/` nur bei Bedarf kopieren. Originale nie automatisch
  verschieben oder löschen; Rechte und Lizenzen vor Veröffentlichung prüfen.
- Vor Pushes und Releases auf Secrets, personenbezogene Daten und sensible
  Infrastrukturdetails prüfen.

## Prüfen und aufräumen

- Erfolg erst nach Test und Gegenprobe am tatsächlichen Ziel behaupten.
- Vor `project-clean` inventarisieren. Nur eindeutig reproduzierbare,
  unkritische Dateien löschen. Backups, Nutzerinhalte, Secrets und unklare
  Dateien bleiben geschützt.
