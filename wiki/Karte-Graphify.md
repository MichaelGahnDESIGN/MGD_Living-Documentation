# Karte (Graphify)

## Worum geht es?

[Graphify](https://github.com/Graphify-Labs/graphify) liest deinen Code und
deine Markdown-Dateien und baut daraus eine **Karte** deines Projekts. Auf der
Karte steht, **was es gibt** und **was woran hängt**. Sie liegt im Ordner
`graphify-out/`.

Die Karte sagt dir **nicht**, was gilt. Das steht in der Dokumentation.

## Wer ist wofür zuständig?

| Frage | Zuständig | Ort im Projekt |
| --- | --- | --- |
| Was ist bestätigt, entschieden, offen oder riskant? | Living Documentation | `DOKUMENTATION/` (oder dein vorhandener Dokuordner) |
| Was gibt es, und was hängt woran? | Graphify | `graphify-out/` |
| Was ist zu tun? | Todo-Skill | `TODO/TODO.html` |

Jede Aussage hat genau **einen** Besitzer. Verlinke sie, statt sie zu
wiederholen.

⚠️ Die Karte wird nie von Hand geändert. Sie ist kein Beweis, dass etwas
funktioniert, und keine Freigabe.

## So arbeitest du

1. **Erst die Karte fragen, dann suchen:**
   - `graphify query "<Frage>"` beantwortet eine Frage.
   - `graphify path "<A>" "<B>"` zeigt den Weg zwischen zwei Dingen.
   - `graphify explain "<Begriff>"` erklärt ein Ding.
   - `graphify affected "<X>"` zeigt, was betroffen ist.
2. **Teilziel fertig?** Dann in dieser Reihenfolge: Todo-Liste aktualisieren,
   Dokumentation anpassen, `graphify update .` ausführen.
3. **Nenne den Beleg.** Schreibe zu jeder Aussage über den Aufbau: Befehl,
   Datum und Stand. Als sicherer Beleg zählt nur, was Graphify als `EXTRACTED`
   markiert („steht direkt im Code“). `INFERRED` heißt „vermutet“ und
   `AMBIGUOUS` heißt „unklar“.
4. **Nichts erzwingen.** Will `graphify update .` eine kleinere Karte nicht
   speichern, finde zuerst den Grund heraus.

`graphify update .` arbeitet nur auf deinem Rechner. Es braucht kein
KI-Modell und kein Internet.

## Was bleibt draußen?

**Nicht auf die Karte** (Datei `.graphifyignore`): `.claude/`, `.agents/`,
`.codex/`, `TODO/`, `.mgd/graphify-venv/`, `graphify-out/`, und falls es sie
gibt `SECRETS/` und `USER CONCEPT/`.

**Nicht ins Git** (Datei `.gitignore`):
- `graphify-out/cache/` (Zwischenspeicher)
- `graphify-out/.graphify_python` und `graphify-out/.graphify_root` (das sind
  Pfade auf deinem Rechner)
- die Sicherungsordner mit Datum in `graphify-out/`
- `.mgd/graphify-venv/` (die Python-Umgebung nur für dieses Projekt)

✅ **Ins Git** kommen `graph.json` und `GRAPH_REPORT.md`.

Die fertigen Blöcke zum Kopieren stehen in
[docs/karte-graphify.md](../docs/karte-graphify.md).

## Einrichten

⚠️ Graphify wird nie heimlich installiert. Dein Agent fragt dich zuerst:
für alle Projekte, nur für dieses Projekt oder später?

Diese Dinge passieren **nur auf deinen ausdrücklichen Wunsch**:
- `graphify hook install` startet nach jedem Commit automatisch Python in
  deinem Projektordner (sogenannte Git-Hooks).
- `graphify install --platform claude` schreibt in deine **globale**
  `~/.claude/CLAUDE.md`.
- `graphify claude install` ändert die `CLAUDE.md` und die
  `.claude/settings.json` **dieses Projekts**.

Ohne diese drei Befehle funktioniert alles oben.

## Der MGD-Plattform-Builder

Der [MGD-Plattform-Builder](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder)
installiert ab Version 0.7.0 in jedem neuen Projekt Living Documentation,
Graphify und den Todo-Skill zusammen. Er nimmt dabei immer das **neueste
Release** dieses Repositories. Du musst im Builder nichts ändern, wenn hier ein
neues Release erscheint.

## Was die Karte nicht kann

- Sie ersetzt keine Tests und keine Prüfung am echten Ziel.
- Sie sieht nur, was im Code steht. Was erst beim Ausführen passiert, was in
  Einstellungen steckt und was in Datenbanken liegt, sieht sie nicht.
- Sie ist nur so aktuell wie der letzte `graphify update .`.
