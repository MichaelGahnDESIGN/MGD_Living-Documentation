# Sicherheit und Veröffentlichung

Living Documentation ist nur dann wertvoll, wenn sie sicher weitergegeben
werden kann. Die folgenden Inhalte gehören nie in Repository-Dokumentation,
HTML-Übersicht oder Wiki:

- Passwörter, Tokens, API-Schlüssel und Recovery-Codes
- Vollständige Zugangsdaten oder private Schlüssel
- Personenbezogene Betriebsdaten und private E-Mail-Adressen
- Interne IP-Adressen, nicht freigegebene Serverpfade oder Backups
- Sicherheitslücken mit Details, die einen Angriff direkt erleichtern
- Nicht freigegebene Vertrags-, Finanz- oder Kundendaten

## Vor dem Push oder Wiki-Sync

1. Diff auf sensible Inhalte prüfen.
2. Sichtbarkeit des Ziel-Repositories prüfen.
3. Nur bestätigte technische Aussagen veröffentlichen.
4. Interne Betriebsdetails entfernen oder abstrahieren.
5. Bei rechtlichen oder datenschutzrelevanten Inhalten fachliche Prüfung
   kennzeichnen statt Sicherheit zu behaupten.

## Graphify-Ausgabe

`graphify-out/` ist abgeleitet und übernimmt Namen und Überschriften aus dem
Quellbaum. Deshalb gilt vor dem ersten `graphify update .`:

- `SECRETS/` und `USER CONCEPT/` stehen in `.graphifyignore` und `.gitignore`.
- `graphify-out/.graphify_python` und `graphify-out/.graphify_root` halten Pfade
  dieser Maschine und werden nie committet; die Git-Hooks führen den in
  `.graphify_python` genannten Interpreter aus.
- Git-Hooks, `graphify install --platform claude` (globale `~/.claude/CLAUDE.md`)
  und `graphify claude install` (`CLAUDE.md` und `.claude/settings.json` mit
  absolutem Pfad) gibt es nur auf ausdrücklichen Wunsch.

## Quellen und Verweise

Ein Link in der Dokumentation darf nicht auf eine Secret-Datei, einen privaten
Backup-Ordner oder ein nicht freigegebenes System zeigen. Verlinke nur Quellen,
die für Umsetzung, Betrieb oder Prüfung wirklich hilfreich und autorisiert sind.
