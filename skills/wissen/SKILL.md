---
name: wissen
description: Aktualisiert in einem Rutsch das ganze Projektwissen (TODO, Wissensgraph, Living-Documentation, Wissensspeicher). Aufrufen mit "/wissen", wenn nach einer Arbeitsphase alles auf den neuesten Stand soll.
---

# /wissen – alles Wissen auf einmal aktuell machen

Dieser Skill ist ein **Sammelknopf**. Er ruft der Reihe nach die anderen Skills auf und prüft am Ende, ob alles stimmt.
Er ersetzt keinen der Skills, er koordiniert sie.

## Antwort-Stil (gilt immer)
- Einfach und verständlich schreiben, wie für einen Laien (kurze Sätze, keine unerklärten Abkürzungen).
- Marker benutzen:
  - ❓ Frage an Michael
  - ⚠️ wichtiger Hinweis
  - ✅ erledigt
  - ☑️ noch offen
  - 🔎 geprüft / gefunden, 🚫 geht nicht, ➕ neu
- READMEs und Wikis für den **DAU** schreiben (der dümmste anzunehmende User): Schritt für Schritt, mit Beispiel.

## Aufruf
```
/wissen                 # alles aktualisieren
/wissen --nur todo      # nur TODO
/wissen --nur graph     # nur Wissensgraph
/wissen --nur doku      # nur Living-Documentation
/wissen --nur speicher  # nur Wissensspeicher (AI_Knowledge)
/wissen --pruefen       # nichts ändern, nur sagen, was veraltet ist
```

## Ablauf (immer in dieser Reihenfolge)

### 1. Ist-Stand erheben (nichts erfinden)
- `git status`, `git log -10`, Versionsdatei, offene PRs, laufende Dienste.
- Alles, was nicht belegt ist, als „nicht belegt" markieren.

### 2. TODO aktualisieren (`/todo`)
- Erledigtes abhaken ✅, Neues eintragen ➕, Offenes lassen ☑️.
- Jede offene Frage an Michael mit ❓ markieren.
- Wichtige Risiken mit ⚠️ markieren.

### 3. Wissensgraph aktualisieren (`/graphify`)
- Nur **inkrementell** aktualisieren (`--update`), nie neu bauen.
- Verweigert graphify das Schreiben (Schrumpfschutz), ist das ein Befund: erst klären, nie `--force`.
- Ist graphify nicht installiert: überspringen und ☑️ vermerken, nichts installieren ohne Rückfrage.

### 4. Living-Documentation aktualisieren (`/living-documentation`)
- Aktuellen Projektstand, Entscheidungen (mit Grund), offene Punkte, Risiken und Nachweise nachtragen.
- Nur belegten Ist-Zustand schreiben, nicht den Wunschzustand.

### 5. Wissensspeicher aktualisieren (AI_Knowledge)
- Neue Erkenntnisse in die passende Notiz im Wissensspeicher einsortieren (kein Doppeltes, Verweise statt Kopien).
- Dateien mit Zugangsdaten, Kundendaten oder fremder Arbeit (z. B. andere laufende Apps im Vault) **nie** mit committen.
- Vor dem Pushen immer erst `git pull --rebase --autostash`. Gibt es Konflikte oder SMB-Fehler (fehlende Dateien), anhalten und ❓ fragen.

### 6. Gegenprobe
- Stimmen Versionen, Links und Zahlen in TODO, Doku und Graph überein?
- Steht nirgends ein Passwort, Schlüssel oder eine private Adresse?
- Kurzbericht: was ✅ erledigt ist, was ☑️ offen ist, was ❓ gefragt wird, was ⚠️ wichtig ist.

## Grenzen
- Keine Passwörter, Tokens oder Kundendaten in Wissen, Doku, Commits oder Chats.
- Nie `git reset --hard`, nie Force-Push, nie Dateien löschen, die man nicht selbst angelegt hat.
- Bei Unklarheit anhalten und mit ❓ nachfragen.

## Zusammenspiel
| Skill | Wofür hier |
|---|---|
| `/todo` | Aufgaben, Marker |
| `/graphify` | Wissensgraph |
| `/living-documentation` | Projektstand, Entscheidungen |
| `/dev` bzw. `/dev-fast` | Commit, Release, Deploy |
| `/autopilot` | Prüfschleife bei langen Läufen |
