# /wissen – alles Wichtige an einem Projektstand pflegen

`/wissen` ist der gemeinsame Aufräumknopf nach einer Änderung. Er hält nicht
einfach „alles“ aktuell, sondern prüft die betroffenen Informationen und
aktualisiert sie an ihrem richtigen Platz.

## Was passiert dabei?

1. Die Aufgabenliste beantwortet: **Was bleibt noch zu tun?**
2. Graphify zeigt: **Welche Dateien und Bereiche hängen zusammen?**
3. Living Documentation erklärt: **Was gilt, warum und was wurde wirklich
   geprüft?**

So entstehen keine drei Kopien derselben Information. Eine Aufgabe bleibt eine
Aufgabe, der Graph bleibt eine Landkarte und die Dokumentation bleibt die
Erklärung.

## Einfacher Ablauf

Nach einer Änderung genügt zum Beispiel:

```text
/wissen
```

Der Agent liest zuerst Regeln und den aktuellen Git-Stand. Er aktualisiert
eine vorhandene TODO-Datei, führt Graphify nur aus, wenn es im Projekt
eingerichtet ist, und ergänzt die betroffene Living Documentation. Anschließend
prüft er Diff und Links und meldet klar, was belegt ist und was offen blieb.

## Statuszeichen

| Zeichen | Bedeutung |
| --- | --- |
| ✅ | Erledigt und belegt |
| ☑️ | Offen oder als Nächstes dran |
| ❓ | Entscheidung von Michael nötig |
| ⚠️ | Wichtiges Risiko oder Grenze |
| ℹ️ | Zusätzliche Information |

## Wichtige Grenze

`/wissen` veröffentlicht nichts automatisch. Ein Commit, ein GitHub-Push und
ein Live-Deployment sind unterschiedliche Schritte und werden auch getrennt
berichtet. Zugangsdaten, Backups und persönliche Daten bleiben aus allen
Dokumentationen draußen. Die identische Skill-Fassung ist auch Teil von
[MGD_Todo_SKILL](https://github.com/MichaelGahnDESIGN/MGD_Todo_SKILL), damit
Aufgaben und Dokumentation dieselben Grenzen kennen.

## Dokumentation ansehen

```text
/wissen-ansehen
```

Der Befehl öffnet die **vorhandene Dokumentation des aktuellen Projekts**.
Er bevorzugt einen dokumentierten HTML-Einstieg und bietet vorhandene
Markdown-Dokumentation als Rückfall an. Es werden keine Inhalte geändert,
keine Builds gestartet und keine Daten veröffentlicht. Wenn noch keine
Dokumentation existiert, meldet der Agent das und nennt `/wissen` als
möglichen nächsten Schritt. Er erstellt nichts automatisch.

### Installieren

Den Ordner `skills/wissen-ansehen` vollständig in das Skill-Verzeichnis
deines Werkzeugs kopieren, zum Beispiel nach
`~/.codex/skills/wissen-ansehen/` oder `~/.claude/skills/wissen-ansehen/`.
Für projektlokale Nutzung entsprechend `.agents/skills/` beziehungsweise
`.claude/skills/` verwenden. Die jeweilige Befehlsdatei
`.codex/commands/wissen-ansehen.md` oder `.claude/commands/wissen-ansehen.md`
kann zusätzlich in das entsprechende Befehlsverzeichnis kopiert werden.
Ein Wrapper allein ersetzt nicht den installierten Skill. Falls die neue
Auswahl noch nicht erscheint, die Skill-Liste neu laden oder eine neue
Sitzung öffnen.

Der nur lesende Suchhelfer benötigt Python 3.9 oder neuer. Fehlt Python,
prüft der Agent die vorhandenen Dokumentationspfade direkt; es wird nichts
installiert. Der Skill liegt unter
[`skills/wissen-ansehen/SKILL.md`](../skills/wissen-ansehen/SKILL.md).
