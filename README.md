# MGD Living Documentation

Ein universeller, lokaler Skill für **ChatGPT Codex, Claude Code und weitere
Agent-Skills-kompatible Tools**. Er macht Projektdokumentation zu einer
verlässlichen, versionierten Arbeitsgrundlage: Was ist nachweislich umgesetzt?
Welche Entscheidung gilt? Was ist offen? Wo besteht ein Risiko? Was wurde
tatsächlich geprüft?

> [!NOTE]
> Die Dokumentation beschreibt den belegbaren Ist-Zustand, nicht den
> Wunschzustand. Ein Build, ein lokaler Commit oder eine Planung sind keine
> Veröffentlichung, kein erfolgreicher Live-Test und keine fertige Funktion.

## Das Problem

Wichtige Informationen verschwinden oft in Chats, verstreuten Notizen oder
veralteten Wiki-Seiten. Neue Personen und KI-Agenten wissen dann nicht, welche
Entscheidung noch gilt, welcher Stand bestätigt wurde oder welche Risiken offen
sind.

Dieser Skill hält die maßgebliche Dokumentation im Repository. Dadurch bleibt
sie offline verfügbar, frei von externen Diensten, über Git nachvollziehbar und
für Menschen wie Agenten direkt bearbeitbar.

## Funktionen

- Aktueller, überprüfbarer Projektstand statt unklarer Verlaufsnotizen
- Entscheidungen mit Begründung und Änderungsbedingung
- Sichtbare offene Punkte und Risiken
- Test- und Verifikationsnachweise mit tatsächlichem Umfang
- Schlanke Übergaben für neue Teammitglieder oder Agenten
- Eine optionale, self-contained HTML-Übersicht: Suche, Filter, Ergänzen,
  Bearbeiten, Entfernen und Export direkt im Browser
- Keine Datenbank, kein Server, kein CDN, kein Tracking

## Enthaltene Dateien

```text
skills/living-documentation/
  SKILL.md                                  # Anweisungen für Coding-Agenten
  references/dokumentationsmodell.md        # Struktur und Vorlagen
  agents/openai.yaml                        # Codex-Metadaten
living-documentation/
  LIVING_DOCUMENTATION.template.html        # Lokale interaktive Übersicht
docs/
  setup.md                                  # Installation und Ersteinrichtung
  html-uebersicht.md                        # Datenformat und Browser-Bedienung
wiki/                                       # Quellen für das GitHub-Wiki
```

## Installation

### ChatGPT Codex – global

Kopiere den Ordner `skills/living-documentation` nach:

```text
~/.codex/skills/living-documentation/
```

Mit dem Codex-Skill-Installer kann das Repository über den Pfad
`skills/living-documentation` installiert werden.

### Claude Code – projektlokal

Im Zielprojekt:

```bash
mkdir -p .claude/skills
cp -R /pfad/zu/MGD_Living-Documentation/skills/living-documentation \
  .claude/skills/living-documentation
```

### Weitere Agent-Skills-kompatible Tools

Viele Tools erkennen Skills im Projektordner `.agents/skills/`:

```bash
mkdir -p .agents/skills
cp -R /pfad/zu/MGD_Living-Documentation/skills/living-documentation \
  .agents/skills/living-documentation
```

Details, Grenzen und ein sicherer Einrichtungsablauf stehen in
[docs/setup.md](docs/setup.md).

## Schnellstart

1. Bestehende Regeln und Dokumentationsordner im Projekt prüfen.
2. Eine vorhandene kanonische Quelle wie `docs/`, `DOKUMENTATION/` oder `WIKI/`
   weiterführen – keine parallele Ablage erzeugen.
3. Falls noch keine Struktur existiert, eine kurze Einstiegsseite sowie
   Entscheidungen, offene Punkte und Risiken anlegen.
4. Nach jeder relevanten Änderung nur die betroffenen Aussagen aktualisieren.
5. Den Zustand klar als **bestätigt**, **Entscheidung**, **offen** oder
   **Risiko** kennzeichnen.

Beispiel für eine belastbare Verifikation:

```text
Geprüft: npm test
Ergebnis: 42 Tests erfolgreich
Nicht geprüft: Staging-Deployment und reale Nutzerrollen
```

## Interaktive Living Documentation

Die Vorlage
[LIVING_DOCUMENTATION.template.html](living-documentation/LIVING_DOCUMENTATION.template.html)
ist eine vollständige lokale Oberfläche. Sie eignet sich als Ergänzung zur
Markdown-Dokumentation, wenn ein Team schnell nach Informationen suchen und
Einträge manuell verwalten möchte.

| Funktion | Verhalten |
| --- | --- |
| Suche | Durchsucht Titel, Inhalt, Bereich und Quellen lokal im Browser |
| Filter | Filtert nach Status, Typ und Bereich; Optionen entstehen aus den tatsächlichen Daten |
| Hinzufügen | Legt einen neuen Eintrag mit fortlaufender `DNNN`-ID an |
| Bearbeiten | Ändert einen bestehenden Eintrag direkt per Formular |
| Entfernen | Fragt vor dem Entfernen nach; Änderungen sind erst nach Export dauerhaft |
| Export | Lädt eine aktualisierte `LIVING_DOCUMENTATION.html` ohne externe Datenübertragung herunter |
| JSON-Import | Lädt ein kompatibles Datenobjekt nur in die aktuelle Browseransicht |

Browser können lokale Dateien nicht zuverlässig an ihrem Ursprung
überschreiben. Daher ist der sichere Ablauf: bearbeiten → HTML exportieren →
Diff prüfen → die kanonische Datei ersetzen → committen. Details und das
Datenformat stehen in [docs/html-uebersicht.md](docs/html-uebersicht.md).

## Dokumentationsmodell

Der Skill erzwingt keine starre Ordnerstruktur. Für größere Projekte hat sich
aber diese Trennung bewährt:

| Bereich | Inhalt |
| --- | --- |
| Einstieg | Ziel, aktueller Stand, Navigation und kanonische Quelle |
| Entscheidungen | Datum, Entscheidung, Begründung, Änderungsbedingung |
| Architektur und Setup | Nur bestätigte technische Abläufe und Grenzen |
| Offene Punkte | Fehlende Entscheidungen, Abhängigkeiten, nächste Schritte |
| Risiken | Auswirkung, Minderung und Status |
| Archiv | Historische Übergaben und alte Entscheidungen – nie einzige Quelle einer geltenden Regel |

Kompakte Vorlagen findest du unter
[dokumentationsmodell.md](skills/living-documentation/references/dokumentationsmodell.md).

## Zusammenarbeit von Menschen und Agenten

- Vor einer Änderung zuerst den aktuellen Projektstand lesen.
- Eine neue Entscheidung zuerst an der maßgeblichen Fachseite dokumentieren,
  danach operative Aufgaben oder Archiv ergänzen.
- Quellen verlinken, wenn sie zur Umsetzung oder Prüfung wirklich gebraucht
  werden; keine Link-Sammlung ohne Nutzen erzeugen.
- Bei gleichzeitiger Arbeit gilt Git als Konfliktlösung. Die HTML-Übersicht ist
  kein Echtzeit-Mehrbenutzersystem.

## Sicherheits- und Veröffentlichungsregeln

> [!WARNING]
> Dokumentation liegt im Repository und kann veröffentlicht werden. Niemals
> Passwörter, Tokens, API-Schlüssel, Recovery-Codes, personenbezogene
> Betriebsdaten, private Infrastrukturpfade oder nicht freigegebene Inhalte
> dokumentieren.

Vor einem Push, Wiki-Sync oder einer anderen Veröffentlichung immer gezielt
prüfen:

1. Keine Secrets oder personenbezogenen Daten.
2. Keine nicht bestätigten Aussagen als Tatsachen.
3. Keine ausnutzbaren Sicherheitsdetails oder internen Betriebsinformationen.
4. Die Repository-Dokumentation bleibt die kanonische Quelle; externe Wikis
   sind nur abgeleitete Kopien.

## Grenzen

- Der Skill ersetzt keine Produktentscheidung, Rechtsberatung, Sicherheitsprüfung
  oder ein Projektmanagement-Tool.
- Die HTML-Übersicht speichert im Browser nicht automatisch in die Datei.
- Gleichzeitige Änderungen können normale Git-Merge-Konflikte erzeugen.
- Historische Dokumente dürfen keine aktuelle Spezifikation überstimmen.

## Wiki

Die ausführlichen, versionierten Wiki-Quellen liegen im Ordner [wiki/](wiki/).
Sie enthalten Einstieg, Installation, Arbeitsweise, HTML-Datenformat,
Sicherheitsgrenzen und Integrationshinweise. Eine Anleitung zum kontrollierten
Abgleich mit dem GitHub-Wiki steht in [wiki/README.md](wiki/README.md).

## Änderungen

Der aktuelle Entwicklungsstand und spätere Releases werden in
[CHANGELOG.md](CHANGELOG.md) festgehalten.

## Lizenz

MIT – frei verwendbar, anpassbar und weitergebbar, sofern der Lizenzhinweis
erhalten bleibt. Siehe [LICENSE](LICENSE).
