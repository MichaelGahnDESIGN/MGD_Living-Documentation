# Änderungsverlauf

Dieses Repository folgt einer einfachen, nachvollziehbaren Versionsgeschichte.
Ein Release wird erst eingetragen, wenn der entsprechende Stand veröffentlicht
ist.

## 0.2.1 – 2026-09-23

- Release-Paket-Skript korrigiert: absolute und repository-relative Zielordner
  werden sicher unterschieden.

## 0.2.0 – 2026-09-23

- Living Documentation ist verbindlich mit dem `$autopilot`-Zyklus verzahnt:
  Laufvertrag, Grundlinie, Leitplanken, Gegenprobe und ehrlicher
  Abschlussbefund werden als Dokumentationspflichten beschrieben.
- Neuer `project-start-assistant`: sichere Projektgrundstruktur für neue und
  bestehende Projekte, verständliches Dashboard, Skill-Audit, globale
  Agentenregeln sowie geschützte `SECRETS/`- und `USER CONCEPT/`-Ordner.

## 0.1.0 – 2026-09-23

- Portabler Skill `living-documentation` für Codex, Claude Code und
  Agent-Skills-kompatible Tools.
- Vorlagen für bestätigten Stand, Entscheidungen, offene Punkte, Risiken und
  Verifikation.
- Lokale interaktive HTML-Übersicht mit Suche, Filtern, Ergänzen, Bearbeiten,
  Entfernen, JSON-Import und HTML-Export.
- Versionierte Quellen für ein ausführliches GitHub-Wiki.
- MIT-Lizenz für freie Nachnutzung und Weiterentwicklung.
- Begleit-Skill-Check bei Erstlauf: prüft aktiv per Datei-/Verzeichnisprüfung,
  ob MGD_DEV_SKILL, Fragenkatalog-Skill und MGD_Todo_SKILL im Projekt oder
  global installiert sind, bietet fehlende Skills gezielt zur Installation an
  und dokumentiert das Ergebnis auf der Einstiegsseite als Marker für
  künftige Läufe.
