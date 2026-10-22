# Karte (Graphify)

[Graphify](https://github.com/Graphify-Labs/graphify) baut aus Code und
Markdown eines Projekts einen Wissensgraphen im Ordner `graphify-out/`. Living
Documentation nutzt ihn als **Karte**: Er zeigt, was existiert und wovon es
abhängt. Die Dokumentation bleibt für alles zuständig, was *gilt*.

## Wer ist wofür zuständig?

| Frage | Besitzer | Ort im Projekt |
| --- | --- | --- |
| Was ist bestätigt, entschieden, offen, riskant? | Living Documentation | `DOKUMENTATION/` oder die vorhandene kanonische Quelle |
| Was existiert und wovon hängt es ab? | Graphify | `graphify-out/` |
| Was ist zu tun? | Todo-Skill | `TODO/TODO.html` |

Jede Aussage hat genau einen Besitzer; verlinken statt kopieren. Die Karte ist
abgeleitet: Sie wird nie von Hand geändert und nie als Entscheidung,
Statusbericht, Testergebnis oder Freigabe zitiert.

## Arbeitszyklus

1. Strukturfragen zuerst an den Graphen: `graphify query "<Frage>"`,
   `graphify path "<A>" "<B>"`, `graphify explain "<Begriff>"`,
   `graphify affected "<X>"`.
2. Nach jedem abgeschlossenen Teilziel: Todo aktualisieren, Dokumentation
   anpassen, `graphify update .` ausführen.
3. Architekturaussagen nennen ihren Beleg (Befehl, Datum, Stand). Als Beleg
   zählen nur Kanten mit der Konfidenz `EXTRACTED`.
4. Nichts erzwingen: Verweigert `graphify update .` einen kleineren Graphen,
   zuerst die Ursache klären.

`graphify update .` arbeitet lokal, ohne Sprachmodell und ohne Netzwerk.

## Was gehört nicht in den Graphen und nicht in Git?

- **Nicht in den Graphen** (`.graphifyignore`): `.claude/`, `.agents/`,
  `.codex/`, `TODO/`, `.mgd/graphify-venv/`, `graphify-out/` sowie `SECRETS/`
  und `USER CONCEPT/`, falls vorhanden.
- **Nicht in Git** (`.gitignore`): `graphify-out/cache/`,
  `graphify-out/.graphify_python`, `graphify-out/.graphify_root`, die datierten
  Sicherungsordner in `graphify-out/` und `.mgd/graphify-venv/`. Die beiden
  Punkt-Dateien halten Pfade dieser Maschine.
- **Versioniert:** `graph.json` und `GRAPH_REPORT.md`.

Die vollständigen Blöcke zum Kopieren stehen in
[docs/karte-graphify.md](../docs/karte-graphify.md).

## Einrichten und Grenzen

Graphify wird nie still installiert; der Agent fragt zuerst nach der
Installationsart (für alle Projekte, nur dieses Projekt oder später). Git-Hooks
(`graphify hook install`), die globale Agent-Registrierung
(`graphify install --platform claude`) und `graphify claude install` gibt es
nur auf ausdrücklichen Wunsch. Der Zyklus funktioniert ohne sie.

Die gemeinsame Installation von Living Documentation, Graphify und Todo
übernimmt der
[MGD-Plattform-Builder](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder)
(ab Version 0.7.0). Er nimmt für neue Projekte automatisch das neueste Release
dieses Repositories.

Die Karte ersetzt weder Tests noch die Gegenprobe am echten Ziel. Statische
Analyse sieht keine Laufzeitwege, Konfiguration oder Datenbestände.
