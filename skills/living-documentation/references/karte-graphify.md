# Karte (Graphify)

[Graphify](https://github.com/Graphify-Labs/graphify) erzeugt aus Code und
Markdown einen Wissensgraphen im Ordner `graphify-out/`. In der Living
Documentation ist er die maschinell erzeugte **Karte**: Sie zeigt, was
existiert und wovon es abhängt. Sie sagt nicht, was gilt.

## Wer besitzt welche Aussage?

Jede Aussage hat genau einen Besitzer. Verlinken statt kopieren.

| Frage | Besitzer | Ort im Projekt |
| --- | --- | --- |
| Was ist bestätigt, entschieden, offen, riskant? | Living Documentation | `DOKUMENTATION/` oder die vorhandene kanonische Quelle |
| Was existiert und wovon hängt es ab? | Graphify | `graphify-out/` |
| Was ist zu tun? | Todo | `TODO/TODO.html` |

Die Karte ist **abgeleitet**. Sie wird nie von Hand bearbeitet und nie als
Entscheidung, Statusbericht oder Freigabe zitiert. Widerspricht der Graph der
Dokumentation, ist das ein Befund – kein Grund, eine der beiden Seiten still
anzupassen.

## Was `graphify update .` leistet

`graphify update .` analysiert Code lokal per AST und liest die Struktur von
Markdown-Dateien. Es braucht kein Sprachmodell und kein Netzwerk. Semantische
Beziehungen zwischen Dokumenten liefert erst `/graphify --update` mit einem
Modell; das ist optional und nicht Teil des Pflichtzyklus.

Jede Kante trägt eine Konfidenz:

| Konfidenz | Bedeutung für die Dokumentation |
| --- | --- |
| `EXTRACTED` | direkt aus Code oder Struktur gelesen – darf als Beleg zitiert werden |
| `INFERRED` | geschlossen, nicht gelesen – nur als Vermutung kennzeichnen |
| `AMBIGUOUS` | unklar – prüfen, bevor es in eine Aussage eingeht |

## Befehle

Bei einer projektlokalen Installation steht vor jedem Befehl
`.mgd/graphify-venv/bin/graphify` statt `graphify`.

| Befehl | Zweck |
| --- | --- |
| `graphify query "<Frage>"` | Breitensuche im Graphen zu einer Frage; `--budget N` begrenzt die Ausgabe (Standard 2000 Token), `--dfs` sucht in die Tiefe |
| `graphify path "<A>" "<B>"` | kürzester Weg zwischen zwei Knoten |
| `graphify explain "<Begriff>"` | Klartext zu einem Knoten und seinen Nachbarn |
| `graphify affected "<X>"` | was von X abhängt (Rückwärtssuche, Standardtiefe 2) |
| `graphify god-nodes --top 5` | die am stärksten vernetzten Knoten, also die tragenden Abstraktionen |
| `graphify update .` | Graph nach einer Änderung aktualisieren |

Beispiel mit der tatsächlichen Ausgabe-Form:

```text
$ graphify path "login" "connect"
Shortest path (1 hops):
  login() --calls [EXTRACTED]--> connect()
```

Verweigert `graphify update .`, einen kleineren Graphen zu schreiben, ist das
ein Schutz vor stillem Datenverlust. Zuerst die Ursache klären und nichts
erzwingen. `--force` existiert für bewusst gelöschten Code (etwa nach einem
Umbau); setze es nur mit Zustimmung des Nutzers ein.

## Vorlage: Abschnitt „Karte (Graphify)“

Dieser Abschnitt gehört auf die Einstiegsseite der Dokumentation:

```markdown
## Karte (Graphify)

Die Karte ist **abgeleitet** und wird nie von Hand bearbeitet. Sie beantwortet
„was hängt woran?“, sie ersetzt keine Entscheidung und keinen Statusbericht.

- Übersicht: `graphify-out/GRAPH_REPORT.md`, interaktiv: `graphify-out/graph.html`
- Fragen zuerst an den Graphen: `graphify query "<Frage>"`,
  `graphify path "<A>" "<B>"`, `graphify explain "<Begriff>"`
- Nach jeder relevanten Änderung: `graphify update .`
- Architekturaussagen nennen ihren Beleg, z. B. „`graphify explain "Login"`, <Datum>“
```

## Vorlage: Beleg für eine Architekturaussage

```text
Aussage: <Architekturaussage in einem Satz>
Beleg: <graphify-Befehl>, <Datum>, Stand <Commit oder „nicht committet“>
Konfidenz: <EXTRACTED | INFERRED | AMBIGUOUS>
Grenze: <was der Graph nicht zeigt, z. B. Laufzeitverhalten oder Konfiguration>
```

Ein Graph zeigt statische Beziehungen. Dynamisches Verhalten, Konfiguration und
Datenbestände sieht er nicht; dafür bleibt die Gegenprobe am echten Ziel
nötig.

## Einrichtung (nur nach Rückfrage)

Graphify wird nie still installiert. Der Agent fragt, bevor er etwas
installiert oder konfiguriert, und dokumentiert die Antwort.

1. **Prüfen, was vorhanden ist:** `command -v graphify`, dann
   `.mgd/graphify-venv/bin/graphify --version` und `ls graphify-out/graph.json`.
   Das Paket `graphifyy` braucht Python 3.10 oder neuer; das mitgelieferte
   `python3` des Systems kann älter sein (`python3 --version`).
2. **Installationsart erfragen:**
   - *für alle Projekte:* `uv tool install graphifyy` (oder
     `pipx install graphifyy`);
   - *nur für dieses Projekt:*

     ```bash
     uv venv .mgd/graphify-venv --python 3.10
     uv pip install --python .mgd/graphify-venv/bin/python graphifyy
     ```

     Aufruf danach mit `.mgd/graphify-venv/bin/graphify`;
   - *später:* nichts installieren und die Entscheidung als offenen Punkt
     festhalten.
3. **Ausschlüsse anlegen** (siehe nächster Abschnitt) und vorhandene Zeilen
   dabei unverändert lassen.
4. **Erstlauf:** `graphify update .` und das Ergebnis (Knoten- und Kantenzahl)
   in der Dokumentation festhalten.
5. **Marker** auf der Einstiegsseite setzen:

   ```text
   Karte (Graphify) eingerichtet am <Datum>: Version <x.y.z>, Installation
   <für alle Projekte | nur Projekt | später>, Git-Hooks <aus | an>.
   ```

Wer Graphify gemeinsam mit den anderen Begleitern in einem Schritt einrichten
möchte, nutzt den Installer des
[MGD-Plattform-Builders](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder)
(`mgd-platform companions install`). Er ist dafür zuständig; dieser Skill
dupliziert ihn nicht. Der Builder installiert jeweils das neueste Release der
Begleiter.

## Was nicht in den Graphen gehört

`.graphifyignore` nutzt dieselbe Syntax wie `.gitignore`:

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

Im Test mit einem kleinen Projekt sank der Graph von 15 auf 11 Knoten, sobald
zwei Skill-Ordner ausgeschlossen waren. Der MGD-Plattform-Builder misst in
einem seiner Tests 256 von 283 Knoten aus Skill-Dateien.

Graphify beachtet außerdem die `.gitignore` des Projekts. Das ist keine
Garantie für geschützte Ordner: Fehlt `SECRETS/` dort, landet es im Graphen,
und der Graph wird versioniert. Deshalb steht der Ausschluss vor dem ersten
`graphify update .` in beiden Dateien.

## Was nicht in Git gehört

```gitignore
# Graphify: reproduzierbarer Cache, lokale Pfade und Sicherungen bleiben aus Git
graphify-out/cache/
graphify-out/.graphify_python
graphify-out/.graphify_root
graphify-out/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/
.mgd/graphify-venv/
```

| Pfad | Warum nicht versionieren |
| --- | --- |
| `graphify-out/cache/` | reproduzierbar |
| `graphify-out/.graphify_python` | Pfad des Python-Interpreters dieser Maschine; die Git-Hooks führen den dort genannten Interpreter aus |
| `graphify-out/.graphify_root` | nach einem Lauf des `/graphify`-Skills ein absoluter Pfad dieser Maschine (`graphify update .` allein schreibt nur `.`) |
| `graphify-out/<JJJJ-MM-TT>/` | Sicherung des bisherigen Graphen, die `graphify update` anlegen kann |
| `.mgd/graphify-venv/` | lokale Python-Umgebung |

Versioniert werden `graph.json` und `GRAPH_REPORT.md`; so legt es auch der
MGD-Plattform-Builder fest. Ob `graph.html` und `manifest.json` ebenfalls in
Git liegen, entscheidet das Projekt. Beide lassen sich mit `graphify update .`
neu erzeugen; `manifest.json` enthält Änderungszeiten und erzeugt viel
Diff-Rauschen.

## Nur auf ausdrücklichen Wunsch

| Befehl | Was er tut | Warum nicht automatisch |
| --- | --- | --- |
| `graphify hook install` | installiert Git-Hooks (`post-commit`, `post-checkout`) und einen Merge-Treiber für `graph.json` (Git-Konfiguration und `.gitattributes`) | Die Hooks führen nach jedem Commit und Checkout Python im Repository-Wurzelordner aus. Nur in Repositories sinnvoll, denen der Nutzer vertraut. Rückgängig mit `graphify hook uninstall`, Stand mit `graphify hook status` |
| `graphify install --platform claude` | legt den `/graphify`-Skill unter `~/.claude/skills/graphify/` an und ergänzt einen Registrierungsblock in der **globalen** `~/.claude/CLAUDE.md` | verändert die globale Konfiguration des Nutzers für alle Projekte |
| `graphify claude install` | schreibt einen Graphify-Abschnitt in die `CLAUDE.md` des Projekts und trägt `PreToolUse`-Hooks in `.claude/settings.json` ein | verändert Agentenregeln des Projekts; die Hook-Einträge enthalten den absoluten Pfad der lokalen Graphify-Installation und gehören nicht ungeprüft in Git |

Ohne diese Befehle funktioniert der Zyklus vollständig: `graphify update .`
von Hand (oder durch den Agenten) nach jedem Teilziel genügt.

## Grenzen

- Die Karte ersetzt weder Tests noch die Gegenprobe am echten Ziel.
- Der Graph ist nur so aktuell wie der letzte `graphify update .`. Ein Treffer
  aus einem alten Graphen ist ein Hinweis, kein Befund.
- Ohne Modell erfasst Graphify Code und die Struktur von Markdown, nicht den
  Inhalt von Prosa.
- Der Graph übernimmt Namen, Überschriften und Beziehungen aus Quelltext und
  Markdown. Er enthält nur dann keine Geheimnisse oder personenbezogenen
  Daten, wenn der Quellbaum und die Ausschlüsse oben sauber sind. Findet sich
  doch etwas in `graphify-out/`, wird es nicht committet und als Risiko
  dokumentiert.
