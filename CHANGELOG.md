# Änderungsverlauf

Dieses Repository folgt einer einfachen, nachvollziehbaren Versionsgeschichte.
Ein Release wird erst eingetragen, wenn der entsprechende Stand veröffentlicht
ist.

## Unveröffentlicht

### Geändert

- `/wissen` ist jetzt mit dem gleichnamigen Skill in MGD_Todo_SKILL
  deckungsgleich: klare Trennung von Aufgaben, Graph und dauerhafter
  Dokumentation, keine automatische private Wissensspeicherung und kein
  automatisches Veröffentlichen. README, Wiki und Befehlsdateien nennen die
  gemeinsame Quelle nachvollziehbar.

## 0.4.0 – 2026-10-24

### Neu

- Graphify als **Karte** der Living Documentation. Der Skill
  `living-documentation` kennt `graphify-out/` als maschinell erzeugte
  Projektkarte und schreibt den Arbeitszyklus vor: Strukturfragen zuerst an den
  Graphen (`graphify query`, `path`, `explain`), nach jedem Teilziel Todo,
  Dokumentation und `graphify update .` nachziehen, Architekturaussagen mit
  Beleg versehen, `graphify-out/` nie als Entscheidungs- oder Statusquelle
  verwenden.
- Neue Referenz `references/karte-graphify.md` sowie `docs/karte-graphify.md`
  und Wiki-Seite „Karte (Graphify)“ mit Befehlen, Vorlagen und Grenzen.
- Ausschlussblöcke für `.graphifyignore` (Agenten-Skills, `TODO/`, geschützte
  Ordner) und `.gitignore` (Cache, datierte Sicherungen, die lokalen
  Pfaddateien `.graphify_python` und `.graphify_root`, projektlokale
  Umgebung). Die Projektvorlage des Kompatibilitätsverweises enthält die
  `.gitignore`-Zeilen und einen Regelabschnitt zur Karte.
- Der `project-start-assistant` bietet die Karte bei Projektstart und
  Bestandsübernahme an, statt sie still einzurichten; Graphify erscheint im
  Skill-Audit als eigene Zeile „Werkzeug“.
- Git-Hooks, `graphify install --platform claude` (globale `~/.claude/CLAUDE.md`)
  und `graphify claude install` sind ausdrücklich nur auf Wunsch vorgesehen.
- Neuer Skill `/wissen`: stimmt TODO, Graphify und Living Documentation ab,
  ohne eine weitere Dokumentationsablage zu schaffen.
- Kurze, einheitliche Statuszeichen für erledigte Punkte, offene Arbeit,
  Fragen, Risiken und Hinweise.

### Dokumentation

- Die Texte zur Karte (README, `docs/karte-graphify.md`, Wiki) sind in
  einfacher Sprache für Einsteiger geschrieben.
- README und Wiki erklären das Zusammenspiel der drei Werkzeuge jetzt in
  einfacher Sprache für Einsteiger.
- Abgestimmt auf den MGD-Plattform-Builder 0.7.0, der Living Documentation,
  Graphify und Todo gemeinsam installiert und jeweils das neueste Release
  verwendet. Am Builder ist für dieses Release nichts zu ändern.

## 0.3.0 – 2026-09-23

- Der frühere `project-start-assistant` ist jetzt ein Kompatibilitätsverweis auf
  den zentralen [MGD_AI-Projektmanager](https://github.com/MichaelGahnDESIGN/MGD_AI-Projektmanager).
  Damit gibt es keine doppelte MGD-Projektzentrale mehr.

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
