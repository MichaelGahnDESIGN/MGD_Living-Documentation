# Setup und Ersteinrichtung

## Voraussetzungen

- Ein lokales Projektverzeichnis, idealerweise mit Git
- ChatGPT Codex, Claude Code oder ein Agent mit Agent-Skills-Unterstützung
- Optional ein Browser für die interaktive Übersicht

## Skill installieren

Kopiere den vollständigen Ordner `skills/living-documentation` in das
Skill-Verzeichnis der gewünschten Umgebung. Die Referenzdatei muss neben der
`SKILL.md` erhalten bleiben, da sie bei einer neuen Dokumentationsstruktur
verwendet wird.

| Umgebung | Empfohlener Zielort |
| --- | --- |
| Codex global | `~/.codex/skills/living-documentation/` |
| Claude Code, nur ein Projekt | `.claude/skills/living-documentation/` |
| universelles Agent-Skills-Format | `.agents/skills/living-documentation/` |

## Bestehendes Projekt anschließen

1. Vorhandene Anweisungen und Dokumentationsordner lesen.
2. Die bereits maßgebliche Quelle bestimmen. Häufig ist das `docs/`,
   `DOKUMENTATION/`, `WIKI/` oder ein klar benanntes Dokumentationsverzeichnis.
3. Einstieg und Navigation prüfen. Fehlende Register nur anlegen, wenn sie
   später wirklich genutzt werden.
4. Aktuellen Stand, offene Fragen und Risiken von vorhandenen Dateien und
   tatsächlich ausgeführten Prüfungen ableiten.
5. Keine alte Planung als Implementierungsnachweis übernehmen.

## Neues Projekt einrichten

Für ein kleines Projekt genügt eine Datei mit den Abschnitten „Aktueller
Stand“, „Entscheidungen“, „Offene Punkte“ und „Risiken“. Größere Projekte
profitieren von einzelnen, verlinkten Seiten. Die Vorlage im Skill enthält
geeignete Tabellen, aber keine Pflichtdateinamen.

## Interaktive HTML-Übersicht einrichten

```bash
mkdir -p DOKUMENTATION
cp /pfad/zu/MGD_Living-Documentation/living-documentation/LIVING_DOCUMENTATION.template.html \
  DOKUMENTATION/LIVING_DOCUMENTATION.html
```

Danach Titel, Beschreibung und die zwei Beispieldatensätze in der Datei durch
reale Informationen ersetzen. Die Datei lässt sich direkt im Browser öffnen.
Nach manuellen Änderungen immer exportieren, Diff prüfen und erst dann die
versionierte Originaldatei ersetzen.

## Sicherer Update-Ablauf

1. Vor einer Änderung den Git-Status und die aktuelle Dokumentation prüfen.
2. Quellcode oder Konfiguration umsetzen und angemessen prüfen.
3. Nur die dadurch betroffenen Dokumentationsaussagen aktualisieren.
4. Testgrenzen klar lassen: „nicht geprüft“ ist besser als eine Vermutung.
5. Bei Entfernen oder einer größeren Umstrukturierung eine Sicherung oder einen
   nachvollziehbaren Git-Stand sicherstellen.

## Autopilot verbindlich verwenden

Ist `$autopilot` für einen autonomen Projektlauf aktiv, wird Living
Documentation verbindlich mitgeführt. Vor der ersten relevanten Änderung
gehören Ziel, Abschlussbedingung, Abbruchbedingung, Grundlinie und
Sicherheitsleitplanken in die kanonische Projektdokumentation. Nach jedem
Teilziel wird mindestens ein belegbarer Befund ergänzt. Ein erfolgreicher Test
ist erst nach einer Gegenprobe am tatsächlichen Ziel ein bestätigter Stand.

Die genaue Zuordnung und kopierbare Vorlagen stehen in
[Autopilot-Integration](autopilot-integration.md).
