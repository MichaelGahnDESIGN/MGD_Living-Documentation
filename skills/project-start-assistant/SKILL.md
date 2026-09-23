---
name: project-start-assistant
description: Richtet neue oder bestehende Softwareprojekte sicher als dokumentierte, skill-gestützte Arbeitsumgebung ein. Verwenden für Projektstarts, Bestandsprojekt-Migrationen, Projekt-Dashboards, Skill-Audits und globale Agentenregeln.
---

# Projekt-Start-Assistent

Richte ein Projekt so ein, dass Menschen und Agenten den aktuellen Stand,
Dokumentation, Aufgaben und Schutzgrenzen schnell verstehen. Arbeite klein,
prüfbar und token-sparend. Verwende vorhandene, funktionierende Strukturen
weiter; ersetze Regeln oder Konfigurationen nie stillschweigend.

## Modus wählen

Ermittle zuerst, ob es sich um ein **neues** oder ein **bestehendes** Projekt
handelt.

- **Neues Projekt:** Erzeuge die Grundstruktur aus
  [Projektstruktur](references/projektstruktur.md), passe Namen und Ziele an
  und erstelle das Dashboard aus `assets/project-dashboard/index.html`.
- **Bestehendes Projekt:** Lies zuerst Regeln, README, Dokumentation,
  `.gitignore`, Git-Status und vorhandene Skill-Hinweise. Erstelle daraus einen
  Migrationsbefund. Ergänze nur fehlende, konfliktfreie Bestandteile; bewahre
  bisherige kanonische Dokumentation und funktionierende Automatisierung.

Vor dem ersten relevanten Eingriff halte Ziel, Akzeptanzkriterium, Grundlinie,
Abbruchbedingung und geschützte Bereiche fest. Falls `$autopilot` verfügbar
oder aufgerufen ist, gelten zusätzlich die verbindlichen Regeln des
`living-documentation`-Skills.

## Unverhandelbare Schutzbereiche

Lege im Hauptverzeichnis stets `SECRETS/` und `USER CONCEPT/` an, sofern sie
nicht bereits existieren. Ergänze passende `.gitignore`-Regeln, ohne bestehende
Regeln zu entfernen.

- **`SECRETS/`:** Nur lokale Vorlagen und sensible Projektinformationen. Den
  Ordner nie auflisten, lesen, ändern, kopieren, löschen oder veröffentlichen,
  außer der Nutzer benennt den konkreten Pfad und stimmt der Aktion in der
  aktuellen Aufgabe ausdrücklich zu. Keine Secret-Werte in Chat, Logs, Commits,
  Dashboards oder Dokumentation wiedergeben. Die Vorlagen aus
  [Projektstruktur](references/projektstruktur.md) enthalten ausschließlich
  Platzhalter.
- **`USER CONCEPT/`:** Lokale Sammelstelle für Ideen, Grafiken, Referenzen und
  Rohmaterial. Inhalte bleiben dort erhalten. Kopiere nur benötigte Dateien an
  einen konkret vereinbarten Zielort; niemals automatisch verschieben oder
  löschen. Prüfe Rechte und Lizenz vor einer Veröffentlichung.

Die beiden Ordner werden nicht in Git eingecheckt. Erlaubt sind nur ihre
unbedenklichen Platzhalterdateien, wenn die `.gitignore` sie ausdrücklich
ausnimmt.

## Globale Arbeitsregeln im Projekt

Erstelle oder ergänze `AGENT_GLOBAL_RULES.md` anhand von
`assets/project-template/AGENT_GLOBAL_RULES.template.md`. Verweise von einer
vorhandenen `AGENTS.md`, `CLAUDE.md` oder vergleichbaren Regeldatei darauf,
statt deren Regeln zu überschreiben. Die Regeln müssen mindestens festlegen:

1. Das sparsamste zuverlässige Modell empfehlen und kurz begründen. Höhere
   Denkstufe nur für Architektur, Sicherheits-, Daten-, Rechte-, Migrations-
   oder Release-Risiken empfehlen.
2. Token- und Zeitlimits bewusst behandeln: kleine prüfbare Teilziele,
   gezieltes Lesen, keine Endlosschleifen; bei knappen Limits einen sicheren
   Zwischenstand committen und ehrlich dokumentieren.
3. Agenten nur für unabhängige Teilaufgaben einsetzen. Der Hauptagent besitzt
   Ziel, Entscheidungen und finale Prüfung; Agenten dürfen nicht dieselben
   Dateien parallel ändern. Laufende Agenten und Prozesse regelmäßig prüfen und
   bei Hängern stoppen oder sauber neu starten.
4. Vor Abschluss testen, am realen Ziel gegenprüfen und den tatsächlichen
   Umfang dokumentieren.
5. `project-clean` nur nach Inventur verwenden: keine Backups, Secrets,
   Nutzerinhalte oder unklare Dateien löschen; Bereinigung, Git-Status und
   Restpunkte dokumentieren.

Die ausführliche Formulierung und Grenzen stehen in
[Globale Agentenregeln](references/globale-agentenregeln.md).

## Dashboard und verständliche Einführung

Erzeuge im Projektstamm eine lokale `index.html`. Sie ist eine statische,
offline nutzbare Übersicht ohne Tracking, CDN oder externe Datenübertragung.
Ersetze die Platzhalter durch bestätigte Projektinformationen und verlinke auf
die vorhandene Dokumentation.

Das Dashboard enthält mindestens: Projektziel, bestätigten Stand, offene
Punkte, Risiken, Navigation, Skill-Status und einen Abschnitt **„So arbeitet
der Assistent“**. Formuliere diesen letzten Abschnitt in kurzen, einfachen
Sätzen. Er erklärt: was der Assistent zuerst liest, wann Skills eingesetzt
werden, wie Änderungen geprüft werden, wie sensible Daten geschützt sind und
wo Nutzer:innen Ideen ablegen.

- **ChatGPT Codex:** Biete die `index.html` nach der Prüfung als Site/Datei in
  Codex an, wenn die Umgebung dies unterstützt. Die Datei im Repository bleibt
  die kanonische, portable Quelle.
- **Claude Code:** Biete dieselbe Datei als Artefakt an oder lege sie im
  Arbeitsbereich offen, wenn Artefakte unterstützt werden. Nicht verfügbare
  Oberflächen sind kein Fehler; die lokale HTML-Datei bleibt voll nutzbar.
- **Andere Tools:** Verwende die lokale Datei als portable Projekt-Startseite.

Nutze für Datenstruktur und Aktualisierung das `living-documentation`-Modell.
Das Dashboard ist eine lesbare Ansicht, keine zweite Wahrheit neben der
kanonischen Markdown-Dokumentation.

## Skill-Audit und Empfehlungen

Prüfe bei neuen und bestehenden Projekten die tatsächlich installierten Skills
und die lokalen Projekt-Hinweise. Vergleiche sie mit den fachlich benötigten
Fähigkeiten, nicht mit einer pauschalen Wunschliste. Nutze
[Skill-Audit](references/skill-audit.md).

Melde verständlich:

- **vorhanden und genutzt** – mit konkretem Einsatzzweck;
- **sinnvolle Ergänzung** – nur wenn eine erkennbare Lücke besteht, mit Nutzen,
  Quelle, möglichem Kosten-/Datenschutzhinweis und Entscheidung des Nutzers;
- **möglicherweise entbehrlich** – nur als Empfehlung. Entferne globale oder
  projektlokale Skills niemals ohne ausdrückliche Zustimmung.

Ein Skill-Audit darf keine Skills installieren, aktualisieren oder entfernen,
solange der Nutzer nicht dazu zugestimmt hat.

## Abschluss eines Projektstarts

1. Aktualisiere Dokumentation und Dashboard mit den beobachteten Ergebnissen.
2. Prüfe Links, `.gitignore`, HTML-Syntax, Git-Diff und auf Secrets. Teste die
   Dashboard-Ansicht, wenn ein Browser sicher verfügbar ist.
3. Ergänze am Ende der Startdokumentation eine kurze, leicht verständliche
   Erklärung für die tägliche Zusammenarbeit.
4. Committe nur freigegebene, nicht sensible Dateien. Pushes, Releases,
   Deployments, Installationen und Löschungen erfordern weiterhin die jeweils
   nötige ausdrückliche Berechtigung.

Für eine neue Projektstruktur lies [Projektstruktur](references/projektstruktur.md).
Für eine sichere Migration lies [Bestandsprojekte](references/bestandsprojekte.md).
