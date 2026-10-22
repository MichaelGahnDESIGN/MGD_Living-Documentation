# Karte (Graphify)

[Graphify](https://github.com/Graphify-Labs/graphify) liest Code und Markdown
eines Projekts und baut daraus einen Wissensgraphen im Ordner `graphify-out/`.
Living Documentation nutzt ihn als **Karte**: Er zeigt, was existiert und wovon
es abhängt. Die Dokumentation bleibt für alles zuständig, was *gilt*.

## Wer ist wofür zuständig?

Jede Aussage hat genau einen Besitzer. Verlinken statt kopieren.

| Frage | Besitzer | Ort im Projekt |
| --- | --- | --- |
| Was ist bestätigt, entschieden, offen, riskant? | Living Documentation | `DOKUMENTATION/` oder die vorhandene kanonische Quelle |
| Was existiert und wovon hängt es ab? | Graphify | `graphify-out/` |
| Was ist zu tun? | Todo-Skill | `TODO/TODO.html` |

Die Karte ist abgeleitet. Sie wird nie von Hand geändert und nie als
Entscheidung, Statusbericht, Testergebnis oder Freigabe zitiert. Widerspricht
sie der Dokumentation, ist das ein Befund.

## Arbeitszyklus

1. **Fragen zuerst an den Graphen:** `graphify query "<Frage>"`,
   `graphify path "<A>" "<B>"`, `graphify explain "<Begriff>"`,
   `graphify affected "<X>"`. Danach erst den Quellbaum durchsuchen.
2. **Nach jedem abgeschlossenen Teilziel:** Todo aktualisieren, Dokumentation
   anpassen, `graphify update .` ausführen.
3. **Architekturaussagen nennen ihren Beleg** – Befehl, Datum, Stand. Als Beleg
   zählen nur Kanten mit der Konfidenz `EXTRACTED`; `INFERRED` und `AMBIGUOUS`
   sind Vermutungen.
4. **Nichts erzwingen:** Verweigert `graphify update .` einen kleineren Graphen,
   zuerst die Ursache klären.

Beispiel für einen Eintrag im aktuellen Stand:

```text
Geprüft: pytest und graphify update .
Ergebnis: 12 Tests erfolgreich; Graph aktualisiert (13 Knoten, 14 Kanten)
Nicht geprüft: Staging-Deployment, echte Nutzerrollen
```

`graphify update .` arbeitet lokal: AST-Analyse des Codes plus die Struktur der
Markdown-Dateien, ohne Sprachmodell und ohne Netzwerk. Semantische Beziehungen
zwischen Dokumenten braucht `/graphify --update` mit einem Modell; das bleibt
optional.

## Einrichten

Graphify wird nie still installiert. Der Agent fragt zuerst.

```bash
# für alle Projekte
uv tool install graphifyy          # oder: pipx install graphifyy

# nur für dieses Projekt (Python 3.10 oder neuer)
uv venv .mgd/graphify-venv --python 3.10
uv pip install --python .mgd/graphify-venv/bin/python graphifyy
.mgd/graphify-venv/bin/graphify --version
```

Danach die Ausschlüsse anlegen – **bevor** der erste Graph entsteht – und
`graphify update .` ausführen (bei der projektlokalen Installation mit
`.mgd/graphify-venv/bin/graphify update .`). Auf der Einstiegsseite der
Dokumentation steht der Abschnitt „Karte (Graphify)“; die Vorlage liegt in
[karte-graphify.md](../skills/living-documentation/references/karte-graphify.md).

### `.graphifyignore`

```gitignore
# Agenten-Skills und Werkzeugordner gehören nicht zur Karte des Projekts
.claude/
.agents/
.codex/
# Projektlokale Graphify-Umgebung und die Ausgabe selbst
.mgd/graphify-venv/
graphify-out/
# Aufgabenliste: beschreibt Arbeit, nicht Struktur
TODO/
# Geschützte Bereiche des Projekts (nur eintragen, wenn sie existieren)
SECRETS/
USER CONCEPT/
```

Graphify beachtet außerdem die `.gitignore`. Verlasse dich bei geschützten
Ordnern nicht darauf allein; trage sie in beiden Dateien ein.

### `.gitignore`

```gitignore
# Graphify: reproduzierbarer Cache, lokale Pfade und Sicherungen bleiben aus Git
graphify-out/cache/
graphify-out/.graphify_python
graphify-out/.graphify_root
graphify-out/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/
.mgd/graphify-venv/
```

`graph.json` und `GRAPH_REPORT.md` werden versioniert. `.graphify_python` und
`.graphify_root` halten Pfade dieser Maschine und werden nie committet; die
Git-Hooks führen den in `.graphify_python` genannten Interpreter aus.

## Nur auf ausdrücklichen Wunsch

| Befehl | Wirkung |
| --- | --- |
| `graphify hook install` | Git-Hooks `post-commit` und `post-checkout` plus Merge-Treiber für `graph.json`; sie führen nach Commits und Checkouts Python im Repository-Wurzelordner aus. Zurück mit `graphify hook uninstall` |
| `graphify install --platform claude` | schreibt in die **globale** `~/.claude/CLAUDE.md` und legt `~/.claude/skills/graphify/` an |
| `graphify claude install` | ergänzt die `CLAUDE.md` des Projekts und trägt `PreToolUse`-Hooks in `.claude/settings.json` ein, mit dem absoluten Pfad der lokalen Installation |

Der Zyklus oben funktioniert ohne diese Befehle vollständig.

## Zusammenspiel mit dem MGD-Plattform-Builder

Der [MGD-Plattform-Builder](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder)
installiert ab Version 0.7.0 in jedem Projekt Living Documentation, Graphify
und den Todo-Skill gemeinsam
([Begleiter-Referenz](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder/blob/main/WIKI/07-AGENTS/COMPANIONS.md),
[Anleitung auf Deutsch](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder/blob/main/wiki/27-Begleiter-Living-Documentation-Graphify-Todo.md)).
Er richtet auch `.graphifyignore` und `.gitignore` ein und baut den ersten
Graphen. Dieser Skill beschreibt dazu die Arbeitsregeln und installiert
nichts selbst ohne Rückfrage.

Versionen werden an einer Stelle gepflegt: Ein neues Release dieses
Repositories genügt. Der Builder nimmt für neue Projekte automatisch das
neueste Release; vorhandene Skill-Ordner überschreibt er nie.

## Grenzen

- Die Karte ersetzt weder Tests noch die Gegenprobe am echten Ziel.
- Der Graph ist nur so aktuell wie der letzte `graphify update .`.
- Statische Analyse sieht keine Laufzeitwege, Konfiguration oder Datenbestände.
- Der Graph übernimmt Namen und Überschriften aus dem Quellbaum. Geheimnisse
  gehören weder dorthin noch in den Graphen; geschützte Ordner bleiben
  ausgeschlossen.
