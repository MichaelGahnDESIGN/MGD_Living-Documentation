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
meldet er klar, was belegt ist und was offen blieb.

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
Dokumentationen draußen.
