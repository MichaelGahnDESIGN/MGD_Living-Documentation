---
name: living-documentation
description: Pflegt eine lebendige, repositorynahe Projektdokumentation mit aktuellem Stand, Entscheidungen, Risiken und offenen Punkten. Verwenden bei Umsetzung, Architekturentscheidungen, Übergaben oder wenn Dokumentation dauerhaft aktuell bleiben soll.
---

# Living Documentation

Nutze diesen Skill, damit die Projektdokumentation eine verlässliche,
wartbare Quelle für den aktuellen Stand bleibt. Die Dokumentation beschreibt
den nachweisbaren Zustand – nicht den Wunschzustand.

Wenn ein neues Projekt eingerichtet oder ein bestehendes Projekt strukturell
übernommen werden soll, nutze zusätzlich den benachbarten
`project-start-assistant`. Er richtet Dashboard, Schutzordner, globale Regeln
und den Skill-Audit ein; diese Dokumentation bleibt dabei die kanonische Quelle.

## Verbindliche Autopilot-Integration

Wenn ein Projektziel autonom abgearbeitet wird oder der Skill `$autopilot`
verfügbar beziehungsweise ausdrücklich aufgerufen ist, ist Living Documentation
Teil des verbindlichen Arbeitszyklus. Dokumentation darf dann nicht erst am
Ende aus Erinnerung ergänzt werden.

Vor der ersten relevanten Änderung dokumentiere oder aktualisiere:

1. **Ziel und Abschlussbedingung:** Woran ist der Auftrag messbar erledigt?
2. **Abbruchbedingung:** Wann wird der Lauf mit einem ehrlichen offenen Befund
   beendet statt endlos wiederholt?
3. **Grundlinie:** Welcher Test-, Build- oder Betriebszustand lag vorher vor?
4. **Leitplanken:** Welche Daten, Systeme oder Aktionen sind für diesen Lauf
   geschützt beziehungsweise nur mit menschlicher Zustimmung erlaubt?

Nach jedem abgeschlossenen Teilziel gehört mindestens ein belegbarer Befund in
den aktuellen Stand, eine Entscheidung, einen offenen Punkt oder ein Risiko.
Ein positiver Test allein reicht nicht: Prüfe die Änderung zusätzlich am
eigentlichen Ziel, bevor sie als bestätigt markiert wird.

Am Ende eines Autopilot-Laufs dokumentiere Ergebnis, tatsächlich ausgeführte
Prüfungen, verbleibende Grenzen und den nächsten Schritt. Wurde das Ziel nicht
erreicht, bleibt dies sichtbar als offener Punkt oder Risiko – niemals als
implizit erledigt. Die genaue Zuordnung der Autopilot-Phasen steht in
[Autopilot-Integration](references/autopilot-integration.md).

## Zuerst einordnen

1. Lies die projektbezogenen Regeln und die bestehende Dokumentationsstruktur.
2. Ermittle die kanonische Dokumentationsquelle. Bevorzuge versionierte Dateien
   im Repository gegenüber externen Wikis oder Chat-Zusammenfassungen.
3. Prüfe den tatsächlichen Änderungsstand und die durchgeführten Prüfungen,
   bevor du eine Aussage als erledigt dokumentierst.
4. Bei einem erkannten Erstlauf in diesem Projekt (siehe unten) zusätzlich den
   Begleit-Skill-Check durchführen, bevor die eigentliche Dokumentationsarbeit
   beginnt.

Passe dich an vorhandene Namen und Strukturen an. Lege keine parallele
Dokumentationswelt an, wenn das Projekt bereits `docs/`, `DOKUMENTATION/` oder
eine vergleichbare kanonische Quelle besitzt.

## Begleit-Skill-Check (bei Erstlauf)

Living Documentation ist einer von vier zusammengehörigen MGD-Skills, die im
selben Projekt sinnvoll zusammenspielen: **MGD_DEV_SKILL** (Release, Sync,
Backup, Cleanup, Tests), **Fragenkatalog-Skill** (Design-Fragenkatalog mit
KI-Antworten), **MGD_Todo_SKILL** (selbst-gehostete `TODO.html`) und dieser
Skill. Beim allerersten Einsatz in einem Projekt prüft der Agent aktiv, ob die
anderen drei bereits installiert sind, statt das nur in Prosa zu erwähnen.

### Woran „Erstlauf in diesem Projekt" erkannt wird

Ein Lauf gilt als Erstlauf, wenn **beide** Bedingungen zutreffen:

- Es existiert noch keine kanonische Einstiegsseite für dieses Projekt (z. B.
  `docs/`, `DOKUMENTATION/` oder `WIKI/` mit einer Einstiegs-/Home-Datei), die
  diesen Skill bereits nutzt, **oder** eine bereits vorhandene Einstiegsseite
  enthält noch keinen Eintrag „Begleit-Skill-Check".
- In der aktuellen Sitzung wurde der Begleit-Skill-Check noch nicht
  ausgeführt.

Sobald der Check einmal durchgeführt wurde, wird das Ergebnis als knapper
Eintrag auf der Einstiegsseite dokumentiert (siehe Schritt 3 unten). Bei jedem
späteren Lauf liest der Agent diesen Eintrag zuerst und überspringt den Check,
solange sich die Projektstruktur nicht wesentlich ändert (z. B. neues
Unterprojekt, neuer Repository-Root). So nervt die Prüfung nicht bei jedem
Aufruf erneut.

### 1. Prüfen, was bereits installiert ist

Suche im Projekt (projektlokal) und – soweit zugreifbar – global nach
Anzeichen der drei anderen Skills:

| Skill | Projektlokale Anzeichen | Globale Anzeichen |
| --- | --- | --- |
| MGD_DEV_SKILL | `.claude/commands/dev.md`, `.claude/commands/dev-changelog.md`, `.claude/commands/dev-fast.md`, `.codex/commands/dev.md`, `.codex/commands/dev-changelog.md`, `.codex/commands/dev-fast.md` | `~/.claude/skills/dev/SKILL.md`, `~/.codex/skills/dev/SKILL.md`, `~/.claude/commands/dev.md`, `~/.codex/commands/dev.md` |
| Fragenkatalog-Skill | `.claude/commands/fragenkatalog*.md`, `.codex/commands/fragenkatalog*.md`, ein Ordner oder eine Datei mit „fragenkatalog" im Namen <!-- ggf. exakte Zielpfade beim nächsten Sync mit dem Ziel-Repo verifizieren, Stand dieses Checks: das Repo enthält nur eine README ohne festgelegte Installationsstruktur --> | `~/.claude/skills/fragenkatalog/`, `~/.codex/skills/fragenkatalog/` <!-- ggf. exakte Zielpfade beim nächsten Sync mit dem Ziel-Repo verifizieren --> |
| MGD_Todo_SKILL | `.claude/commands/todo.md`, `.codex/commands/todo.md`, eine `TODO.html` bzw. ein Pfad aus `PROJEKT/TODO/.todo-config` | `~/.claude/skills/todo/SKILL.md`, `~/.codex/skills/todo/SKILL.md` |

Nutze dafür einfache Datei- und Verzeichnisprüfungen (z. B. `ls`, `find`,
`test -e`) statt Vermutungen. Ein Skill gilt als installiert, wenn mindestens
eines der genannten Anzeichen tatsächlich existiert.

### 2. Bei fehlenden Skills aktiv nachfragen

Fehlt einer oder mehrere der drei Skills, frage den Nutzer für jeden
fehlenden Skill konkret, statt es nur zu erwähnen, zum Beispiel:

> „Ich habe festgestellt, dass [Skill X] in diesem Projekt noch nicht
> installiert ist. Er ergänzt [kurzer Nutzen, siehe Tabelle unten]. Soll ich
> ihn jetzt mitinstallieren? (ja/nein)"

Kurzer Nutzen je Skill für diese Frage:

- **MGD_DEV_SKILL:** gleicht vor Releases den dokumentierten Stand mit dem
  tatsächlichen Projektstand ab und hält Sync-, Backup- und Testabläufe fest.
- **Fragenkatalog-Skill:** sammelt offene Design-Fragen mit KI-Antworten aus
  wählbarer Experten-Perspektive; unbeantwortete Fragen werden zu offenen
  Punkten in der Living Documentation.
- **MGD_Todo_SKILL:** verwaltet Projekt-Todos in einer eigenen `TODO.html` und
  kann Todos auf Dokumentations-Abschnitte verlinken.

Bei Zustimmung installiere den jeweiligen Skill über `git clone` der Quelle
und kopiere die Dateien gemäß der von diesem Repository dokumentierten
Zielstruktur:

```bash
# MGD_DEV_SKILL (projektneutraler Skill für Release/Sync/Backup/Tests)
git clone https://github.com/MichaelGahnDESIGN/MGD_DEV_SKILL.git /tmp/MGD_DEV_SKILL
mkdir -p ~/.claude/skills ~/.claude/commands
cp -R /tmp/MGD_DEV_SKILL/dev ~/.claude/skills/dev
cp /tmp/MGD_DEV_SKILL/.claude/commands/*.md ~/.claude/commands/

# Fragenkatalog-Skill
# <!-- ggf. exakte Zielpfade beim nächsten Sync mit dem Ziel-Repo verifizieren -->
git clone https://github.com/MichaelGahnDESIGN/Fragenkatalog-Skill.git /tmp/Fragenkatalog-Skill
# Zielordner gemäß der README des Ziel-Repos wählen, sobald dort eine feste
# Installationsstruktur dokumentiert ist.

# MGD_Todo_SKILL
git clone https://github.com/MichaelGahnDESIGN/MGD_Todo_SKILL.git /tmp/MGD_Todo_SKILL
mkdir -p ~/.claude/skills/todo PROJEKT/TODO
cp /tmp/MGD_Todo_SKILL/SKILL.md ~/.claude/skills/todo/SKILL.md
cp /tmp/MGD_Todo_SKILL/todo/TODO.template.html PROJEKT/TODO/TODO.html
```

Ist kein Netzzugriff möglich, führe den Klon/die Kopie nicht aus. Beschreibe
stattdessen die konkreten Schritte wie oben, kennzeichne sie mit dem
Platzhalter-Kommentar `<!-- ggf. exakte Zielpfade beim nächsten Sync mit den
Ziel-Repos verifizieren -->` und weise den Nutzer auf die manuelle
Installation hin.

Lehnt der Nutzer die Installation ab, respektiere das und frage nicht in
derselben Sitzung erneut nach.

### 3. Ergebnis dokumentieren

Halte das Ergebnis knapp auf der Einstiegsseite der Living Documentation fest,
zum Beispiel als eigener Punkt unter „Bestätigter Stand":

```text
Begleit-Skill-Check durchgeführt am <Datum>: MGD_DEV_SKILL gefunden;
Fragenkatalog-Skill auf Wunsch installiert; MGD_Todo_SKILL vom Nutzer
abgelehnt.
```

Dieser Eintrag ist der Marker für künftige Läufe: Solange er aktuell ist,
gilt der Check als erledigt und wird nicht erneut ausgelöst.

## Was festgehalten wird

Ordne neue Informationen eindeutig einer dieser Kategorien zu:

- **Bestätigter Stand:** implementiert oder überprüft, mit kurzer Angabe der
  belastbaren Prüfung.
- **Entscheidung:** bewusst gewählte Richtung, Begründung und – wenn sinnvoll –
  eine Rücknahme- oder Änderungsbedingung.
- **Offener Punkt:** fehlende Entscheidung, Abhängigkeit oder manueller Schritt.
- **Risiko:** konkrete Auswirkung, betroffener Bereich und realistische
  Minderung.

Dokumentiere nur Informationen, die künftige Arbeit, Betrieb, Sicherheit oder
Übergaben besser machen. Wiederhole weder offensichtlichen Code noch komplette
Chatverläufe.

## Beim Aufbau einer neuen Dokumentation

Falls noch keine tragfähige Struktur existiert, erstelle eine schlanke
Einstiegsseite und nur die Register, die für das Projekt tatsächlich gebraucht
werden. Als Orientierung für ein umfassendes Softwareprojekt dient
[Dokumentationsmodell](references/dokumentationsmodell.md).

Die Einstiegsseite beantwortet mindestens: Was ist das Projekt? Wo liegt der
aktuelle Stand? Welche Dokumente sind maßgeblich? Welche Themen sind offen?

## Bei Änderungen am Projekt

Aktualisiere die Dokumentation im selben Änderungsumfang wie die Umsetzung:

- Ergänze Architektur, Setup oder Bedienhinweise nur, wenn sie sich tatsächlich
  geändert haben.
- Ergänze Entscheidungen und Risiken nicht rückwirkend als Tatsachen.
- Halte Tests mit Ergebnis und Grenzen fest, etwa „Build erfolgreich“ statt
  pauschal „funktioniert“.
- Bereinige veraltete Statusangaben oder markiere sie als historisch, damit die
  Einstiegsseiten aktuell bleiben.

Für Übergaben sind betroffenes Gebiet, bestätigter Stand, offene Punkte,
Risiken und der nächste sinnvolle Schritt wichtiger als ein langer Verlauf.

## Interaktive Living Documentation

Wenn ein Projekt eine durchsuchbare und manuell pflegbare Übersicht braucht,
verwende die Vorlage
`living-documentation/LIVING_DOCUMENTATION.template.html` aus diesem
Repository. Sie ist vollständig lokal, ohne Datenbank, CDN oder Tracking.

Die Einträge liegen als verständliches JSON in der HTML-Datei. Menschen können
sie direkt im Browser ergänzen, ändern oder entfernen; anschließend erzeugt
„Aktualisierte HTML exportieren“ eine Datei, die nach Prüfung die versionierte
Originaldatei ersetzt. Agenten bearbeiten ausschließlich die JSON-Daten im
Skriptblock und behalten die Oberfläche unverändert, sofern keine UI-Änderung
beauftragt ist.

Nutze diese Arbeitsweisen nur bei passendem Bedarf:

- **Einrichten:** Vorlage in die bestehende Dokumentationsstruktur kopieren,
  Projekttitel und Beispieldaten durch überprüfte Informationen ersetzen.
- **Eintrag ergänzen:** eindeutige, fortlaufende `DNNN`-ID vergeben und Status,
  Typ, Bereich, Datum, Inhalt und relevante Quellen angeben.
- **Eintrag aktualisieren:** bestehenden Eintrag anpassen statt widersprüchliche
  Duplikate anzulegen; historisch gewordene Informationen archivieren.
- **Eintrag entfernen:** nur mit ausdrücklicher Berechtigung und nach einer
  Sicherung oder einem nachvollziehbaren Git-Stand. Unklare Historie wird
  archiviert, nicht gelöscht.
- **Prüfen:** Suche, Status-, Typ- und Bereichsfilter sowie Export mindestens
  einmal im Browser prüfen, wenn die HTML-Oberfläche verändert wurde.

Die Datei ist ein lokales Arbeitsmittel, keine Echtzeit-Mehrbenutzerlösung.
Gleichzeitige Bearbeitungen werden über normale Git-Prüfung und Merge-Konflikte
koordiniert.

## Sicherheits- und Veröffentlichungsgrenzen

Niemals in die Projektdokumentation oder ein öffentliches Wiki aufnehmen:

- Passwörter, Tokens, API-Schlüssel, Recovery-Codes oder vollständige
  Zugangsdaten;
- personenbezogene Betriebsdaten, private E-Mail-Adressen, interne IP-Adressen
  oder nicht freigegebene Serverpfade;
- Datenbankexporte, Sicherheitslücken mit ausnutzbaren Details oder Inhalte,
  deren Veröffentlichung nicht autorisiert ist.

Vor einem Wiki-Sync, Push oder einer Veröffentlichung prüfe die betroffenen
Dokumente gezielt auf solche Inhalte. Eine externe Kopie ist abgeleitet; die
versionierte, geprüfte Quelle im Repository bleibt maßgeblich.

## Qualitätsmaßstab

Eine gute lebendige Dokumentation ist knapp genug, um gelesen zu werden, und
konkret genug, um Entscheidungen ohne Rätsel nachvollziehen zu können. Behaupte
nicht, dass etwas funktioniert, bereitgestellt oder geprüft sei, wenn dafür
keine Beobachtung vorliegt.
