# Integration in den Projektalltag

## Mit Git

Dokumentation wird zusammen mit der zugehörigen Umsetzung versioniert. Ein
guter Commit enthält Code und die konkret betroffenen Dokumentationsaussagen.
Bei größeren Entscheidungen kann ein eigener, klar benannter Dokumentations-
Commit sinnvoll sein.

## Mit Tests und Releases

- Nach Tests Ergebnis und Grenze dokumentieren.
- Vor einem Release offene kritische Risiken und Abhängigkeiten prüfen.
- Nach einem Deployment erst dann „bereitgestellt“ dokumentieren, wenn der
  Zielzustand tatsächlich geprüft wurde.
- Ein lokaler Build oder HTTP-Status allein belegt keine vollständige Funktion.

## Mit Aufgabenlisten

Eine Aufgabenliste beantwortet „Was ist zu tun?“. Living Documentation
beantwortet „Warum, in welchem Kontext und nach welchem aktuellen Stand?“. Ein
Todo sollte auf die relevante Spezifikation oder Entscheidung verweisen, aber
die Spezifikation nicht durch einen kurzen Aufgabentext ersetzen.

## Mit Autopilot

Bei einem autonomen `$autopilot`-Lauf ist Living Documentation verbindlicher
Bestandteil des Zyklus. Vor der ersten relevanten Änderung werden Ziel,
Abschluss- und Abbruchbedingung, Grundlinie sowie Leitplanken dokumentiert.
Nach jedem Teilziel folgt ein belegbarer Befund. Ein positiver Test wird erst
nach einer Gegenprobe am tatsächlichen Ziel als bestätigter Stand geführt.

Die vollständige Phasen-Zuordnung und kopierbare Vorlagen stehen unter
[Autopilot-Integration](Autopilot-Integration).

## Mit dem Projekt-Start-Assistenten

Für neue oder bestehende Projekte richtet der `project-start-assistant` eine
lokale `index.html`, globale Agentenregeln, einen Skill-Audit und die geschützten
Ordner `SECRETS/` sowie `USER CONCEPT/` ein. Die Markdown-Dokumentation bleibt
dabei die kanonische Quelle; das Dashboard ist ihre verständliche Übersicht.
Details stehen unter [Projekt-Start-Assistent](Projekt-Start-Assistent).

## Mit externem Wiki

Halte die Quellen im Repository aktuell und kopiere nur freigegebene Inhalte
in ein externes Wiki. So bleiben Änderungen reviewbar und ein Wiki-Ausfall oder
eine Berechtigungsänderung gefährdet nicht die kanonische Projektdokumentation.

## Mit den anderen MGD-Skills

Living Documentation ist einer von vier zusammengehörigen Skills für Claude
Code und ChatGPT Codex. Beim Erstlauf in einem Projekt prüft der Skill aktiv,
ob die anderen drei bereits installiert sind, und bietet sie bei Bedarf zur
Installation an (siehe „Begleit-Skill-Check (bei Erstlauf)" in
[skills/living-documentation/SKILL.md](../skills/living-documentation/SKILL.md)).

### MGD_DEV_SKILL

[MichaelGahnDESIGN/MGD_DEV_SKILL](https://github.com/MichaelGahnDESIGN/MGD_DEV_SKILL)
kümmert sich um Release, Sync, Backup, Cleanup und Tests. Praktisches
Zusammenspiel:

- Vor einem `/dev`-Release den aktuellen Stand aus den Registern
  „Entscheidungen", „Offene Punkte" und „Risiken" gegen den tatsächlichen
  Projektstand prüfen, bevor der Release als bereit gilt.
- Nach einem erfolgreichen Test- oder Deployment-Lauf des DEV-Skills genau die
  Aussage dokumentieren, die tatsächlich geprüft wurde (siehe
  [Arbeitsweise](Arbeitsweise.md)), statt sie pauschal als „fertig" zu
  übernehmen.
- Der Changelog-Pflege des DEV-Skills entsprechende Einträge in
  [CHANGELOG.md](../CHANGELOG.md) und im bestätigten Projektstand
  gegenüberstellen, damit beide Quellen konsistent bleiben.

### Fragenkatalog-Skill

[MichaelGahnDESIGN/Fragenkatalog-Skill](https://github.com/MichaelGahnDESIGN/Fragenkatalog-Skill)
sammelt Design-Fragen mit KI-Antworten aus wählbarer Experten-Perspektive,
inklusive einer Rechts-Kategorie. Praktisches Zusammenspiel:

- Eine unbeantwortete Frage aus dem Fragenkatalog wird als offener Punkt mit
  Verweis auf die Katalog-Quelle dokumentiert, nicht als eigenständiger
  Fließtext dupliziert.
- Wird eine Frage im Fragenkatalog beantwortet und wirkt sich die Antwort auf
  eine bestehende Architektur- oder Produktentscheidung aus, wird daraus ein
  Eintrag im Register „Entscheidungen" mit Begründung und Quelle.
- Fragen aus der Rechts-Kategorie, die eine dokumentierte Grenze berühren
  (siehe [Sicherheit](Sicherheit.md)), werden als Risiko statt als einfacher
  offener Punkt geführt, solange keine Freigabe vorliegt.

### MGD_Todo_SKILL

[MichaelGahnDESIGN/MGD_Todo_SKILL](https://github.com/MichaelGahnDESIGN/MGD_Todo_SKILL)
verwaltet Projekt-Todos in einer selbst-gehosteten, sortier- und
durchsuchbaren `TODO.html`. Praktisches Zusammenspiel:

- Ein Todo verweist über einen kurzen Quellenhinweis auf den betroffenen
  Dokumentationsabschnitt (z. B. eine Entscheidung oder ein offenes Risiko),
  statt die Spezifikation im Todo-Text zu wiederholen.
- Wird ein Todo abgeschlossen, das eine offene Dokumentationsaussage betraf,
  wird der zugehörige Eintrag in Living Documentation auf „bestätigt"
  aktualisiert oder – falls er sich erledigt hat – ins Archiv verschoben.
- Die Trennung bleibt klar: Die `TODO.html` beantwortet „Was ist zu tun?",
  Living Documentation beantwortet „Warum, in welchem Kontext und nach
  welchem aktuellen Stand?" (siehe Abschnitt „Mit Aufgabenlisten" oben).
