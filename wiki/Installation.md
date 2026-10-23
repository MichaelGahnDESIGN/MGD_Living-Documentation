# Installation

## Voraussetzungen

- Ein lokales Projekt, vorzugsweise mit Git
- Codex, Claude Code oder eine andere Umgebung mit Agent-Skills-Unterstützung
- Optional ein Browser für die interaktive Übersicht

## ChatGPT Codex

Lege den Ordner `living-documentation` im globalen Codex-Skill-Verzeichnis ab:

```text
~/.codex/skills/living-documentation/
```

Bei einer Installation aus einem GitHub-Repository muss der gesamte
Skill-Ordner inklusive `references/` übernommen werden.

## Claude Code

Für ein einzelnes Projekt liegt der Skill hier:

```text
<projekt>/.claude/skills/living-documentation/
```

Eine globale Installation ist möglich, wenn dieselben Regeln in mehreren
Projekten gelten sollen. Projektregeln haben weiterhin Vorrang.

## Andere Agenten

Für Agent-Skills-kompatible Tools kann der gleiche Ordner unter
`<projekt>/.agents/skills/living-documentation/` liegen. Prüfe bei einem
konkreten Tool dessen Dokumentation zur Skill-Erkennung.

## Erstes Projekt anschließen

1. Bestehende Anweisungen lesen.
2. Bereits vorhandene Dokumentation als kanonische Quelle wählen.
3. Nur fehlende Register ergänzen.
4. Aktuellen Stand aus Dateien und echten Prüfungen ableiten.
5. Optional die HTML-Übersicht einrichten.

Ein bestehendes `docs/`, `DOKUMENTATION/` oder `WIKI/` wird weitergeführt. Der
Skill erstellt nicht ungefragt eine zweite, konkurrierende Dokumentationsablage.

## Optional: Karte (Graphify)

Wer eine maschinell erzeugte Projektkarte möchte, richtet Graphify nach
Rückfrage ein: `uv tool install graphifyy` für alle Projekte oder eine
projektlokale Umgebung in `.mgd/graphify-venv/` (Python 3.10 oder neuer). Die
Schritte und Ausschlüsse stehen unter [Karte (Graphify)](Karte-Graphify).
Alternativ installiert der
[MGD-Plattform-Builder](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder)
die Begleiter gemeinsam.
