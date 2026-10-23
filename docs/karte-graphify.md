# Karte (Graphify)

## Worum geht es?

Dein Projekt besteht aus vielen Dateien. Niemand weiß auswendig, was womit
zusammenhängt. Dafür gibt es **Graphify**.

Graphify liest deinen Code und deine Markdown-Dateien. Daraus baut es eine
**Karte**. Auf der Karte steht zum Beispiel: „Die Anmeldung ruft die Datenbank
auf.“ Die Karte liegt im Ordner `graphify-out/`.

Wichtig: Die Karte sagt dir, **was da ist** und **was womit zusammenhängt**.
Sie sagt dir nicht, **was gilt**. Das steht weiter in der Dokumentation.

Graphify selbst findest du hier: <https://github.com/Graphify-Labs/graphify>

## Wer ist wofür zuständig?

Jede Aussage hat genau **einen** Besitzer. Wiederhole sie nicht an einer
zweiten Stelle, sondern verlinke sie.

| Frage | Zuständig | Ort im Projekt |
| --- | --- | --- |
| Was ist bestätigt, entschieden, offen oder riskant? | Living Documentation | `DOKUMENTATION/` (oder dein vorhandener Dokuordner) |
| Was gibt es, und was hängt woran? | Graphify | `graphify-out/` |
| Was ist zu tun? | Todo-Skill | `TODO/TODO.html` |

⚠️ Die Karte wird **nie von Hand geändert**. Sie ist auch **kein Beweis**, dass
etwas funktioniert, und **keine Freigabe**. Passt die Karte nicht zur
Dokumentation, ist das ein Fund. Schreibe ihn als „offenen Punkt“ auf.

## So arbeitest du jeden Tag

1. **Erst die Karte fragen, dann suchen.** Du willst wissen, was woran hängt?
   Frage Graphify:

   ```bash
   graphify query "Wie funktioniert der Login?"
   graphify path "login" "connect"
   graphify explain "login"
   graphify affected "connect"
   ```

   - `query` beantwortet eine Frage.
   - `path` zeigt den kürzesten Weg zwischen zwei Dingen.
   - `explain` erklärt ein Ding und seine Nachbarn.
   - `affected` zeigt, was betroffen ist, wenn du etwas änderst.

   Erst danach durchsuchst du die Dateien selbst.

2. **Ein Teilziel ist fertig? Dann diese drei Dinge, in dieser Reihenfolge:**
   1. Todo-Liste aktualisieren.
   2. Dokumentation anpassen.
   3. Karte auffrischen:

      ```bash
      graphify update .
      ```

3. **Schreibe auf, woher du es weißt.** Eine Aussage über den Aufbau braucht
   einen Beleg: Befehl, Datum und Stand. Beispiel:
   „`graphify explain "login"`, 2026-10-22“.

4. **Nichts erzwingen.** Will `graphify update .` einen kleineren Graphen nicht
   speichern, ist das eine Warnung. Finde zuerst heraus, warum.

So sieht ein Eintrag im „aktuellen Stand“ aus:

```text
Geprüft: pytest und graphify update .
Ergebnis: 12 Tests erfolgreich; Karte aktualisiert (13 Knoten, 14 Kanten)
Nicht geprüft: Staging-Deployment, echte Nutzerrollen
```

### Wie sicher ist ein Treffer?

Graphify markiert jede Verbindung:

| Markierung | Bedeutung | Darfst du es als Beleg nennen? |
| --- | --- | --- |
| `EXTRACTED` | steht so direkt im Code oder in der Datei | ✅ ja |
| `INFERRED` | Graphify vermutet es | ☑️ nur als „Vermutung“ kennzeichnen |
| `AMBIGUOUS` | unklar | ☑️ erst prüfen |

`graphify update .` arbeitet nur auf deinem Rechner. Es braucht kein
KI-Modell und kein Internet.

## Einrichten

⚠️ Graphify wird **nie heimlich** installiert. Dein Agent fragt dich vorher.

**Schritt 1: Graphify installieren.** Du hast zwei Möglichkeiten.

Für **alle Projekte** auf deinem Rechner:

```bash
uv tool install graphifyy
```

(`pipx install graphifyy` geht auch.)

Nur für **dieses Projekt** (du brauchst Python 3.10 oder neuer):

```bash
uv venv .mgd/graphify-venv --python 3.10
uv pip install --python .mgd/graphify-venv/bin/python graphifyy
.mgd/graphify-venv/bin/graphify --version
```

Bei dieser Variante schreibst du vor jeden Befehl
`.mgd/graphify-venv/bin/graphify` statt `graphify`.

**Schritt 2: Lege die beiden Ausschluss-Dateien an.** Tu das **bevor** du die
Karte zum ersten Mal baust. Warum, steht unten.

**Schritt 3: Baue die Karte zum ersten Mal.**

```bash
graphify update .
```

**Schritt 4: Trage es in der Dokumentation ein.** Auf der Einstiegsseite
steht dann ein Abschnitt „Karte (Graphify)“. Die Vorlage dafür liegt in
[karte-graphify.md](../skills/living-documentation/references/karte-graphify.md).

### Was kommt NICHT auf die Karte? (`.graphifyignore`)

Lege im Projektordner die Datei `.graphifyignore` an:

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

Warum? Sonst landen die Skill-Dateien deiner Agenten auf der Karte. Das macht
sie unübersichtlich. Bei einem Test sank die Karte von 15 auf 11 Einträge,
nachdem die Skill-Ordner ausgeschlossen waren.

⚠️ `SECRETS/` und `USER CONCEPT/` gehören **unbedingt** in diese Datei. Und
trage sie auch in die `.gitignore` ein. Graphify beachtet zwar die
`.gitignore`, aber verlass dich bei geheimen Ordnern nie nur auf eine Datei.

### Was kommt NICHT ins Git? (`.gitignore`)

Ergänze die `.gitignore`:

```gitignore
# Graphify: reproduzierbarer Cache, lokale Pfade und Sicherungen bleiben aus Git
graphify-out/cache/
graphify-out/.graphify_python
graphify-out/.graphify_root
graphify-out/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/
.mgd/graphify-venv/
```

Was heißt das?

| Eintrag | Was ist das? | Warum nicht ins Git? |
| --- | --- | --- |
| `graphify-out/cache/` | Zwischenspeicher | lässt sich jederzeit neu erzeugen |
| `graphify-out/.graphify_python` | Pfad zu Python auf **deinem** Rechner | gehört nur zu deinem Rechner |
| `graphify-out/.graphify_root` | Pfad zum Projekt auf **deinem** Rechner | gehört nur zu deinem Rechner |
| `graphify-out/2026-…/` | automatische Sicherung der alten Karte | brauchst du nicht im Git |
| `.mgd/graphify-venv/` | die Python-Umgebung nur für dieses Projekt | lässt sich neu bauen |

✅ **Ins Git** kommen `graph.json` und `GRAPH_REPORT.md`.

⚠️ Warum ist `.graphify_python` besonders wichtig? Die Git-Hooks (siehe
unten) starten das Python-Programm, das in dieser Datei steht. Eine fremde
Datei könnte dort etwas Falsches eintragen.

## Nur auf deinen ausdrücklichen Wunsch

Diese Befehle verändern mehr als nur die Karte. Dein Agent führt sie **nie von
selbst** aus. Dein Arbeitsablauf funktioniert auch ohne sie.

| Befehl | Was passiert? |
| --- | --- |
| `graphify hook install` | Installiert **Git-Hooks**. Das sind kleine Programme, die Git automatisch nach jedem Commit und jedem Wechsel des Branches startet. Dann baut sich die Karte von selbst neu. Dafür läuft Python in deinem Projektordner. Nur sinnvoll in Projekten, denen du vertraust. Rückgängig machst du es mit `graphify hook uninstall`. Ob es aktiv ist, zeigt `graphify hook status`. |
| `graphify install --platform claude` | Schreibt in deine **globale** Datei `~/.claude/CLAUDE.md`. Das betrifft **alle** deine Projekte. |
| `graphify claude install` | Ergänzt die `CLAUDE.md` **dieses Projekts** und trägt Hilfsprogramme in `.claude/settings.json` ein. Darin steht der Pfad zu Graphify auf deinem Rechner. Committe das nicht ungeprüft. |

## Zusammenspiel mit dem MGD-Plattform-Builder

Der [MGD-Plattform-Builder](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder)
installiert ab Version 0.7.0 in jedem neuen Projekt drei Begleiter auf einmal:

- Living Documentation (dieses Repository)
- Graphify
- den Todo-Skill

Er legt auch `.graphifyignore` und `.gitignore` an und baut die erste Karte.
Mehr dazu steht in der
[Begleiter-Referenz](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder/blob/main/WIKI/07-AGENTS/COMPANIONS.md)
und in der
[deutschen Anleitung](https://github.com/MichaelGahnDESIGN/MGD-Plattform-Builder/blob/main/wiki/27-Begleiter-Living-Documentation-Graphify-Todo.md).

Dieses Repository baut den Installer **nicht** nach. Es beschreibt nur, wie
man mit der Karte arbeitet.

Für dich heißt das: Du pflegst Versionen an **einer** Stelle. Veröffentlichst
du hier ein neues Release, nimmt der Builder es für jedes **neue** Projekt
automatisch. Im Builder musst du nichts ändern. Bestehende Skill-Ordner
überschreibt der Builder nie.

## Was die Karte nicht kann

- Sie ersetzt keine Tests. Prüfe immer am echten Ziel.
- Sie ist nur so aktuell wie der letzte `graphify update .`.
- Sie sieht nur, was im Code steht. Was erst beim Ausführen passiert, was in
  Einstellungen steckt und was in Datenbanken liegt, sieht sie nicht.
- Sie übernimmt Namen und Überschriften aus deinen Dateien. Stehen dort
  Geheimnisse, landen sie auch in der Karte. Halte deshalb geschützte Ordner
  draußen.
