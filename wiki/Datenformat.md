# Datenformat

Die interaktive Übersicht enthält ihre Daten als JSON im HTML-Skriptblock
`livingDocumentationData`. Dadurch können Menschen die Datei im Browser und
Agenten sie direkt im Repository bearbeiten.

## Eintrag

```json
{
  "id": "D014",
  "title": "Migrationspfad bestätigt",
  "status": "decision",
  "type": "Architektur",
  "area": "Datenbank",
  "date": "2026-09-23",
  "content": "Die Migration wird zuerst in Staging getestet und benötigt ein geprüftes Backup.",
  "sources": "docs/migration.md"
}
```

## Regeln

- IDs folgen `DNNN` und werden fortlaufend vergeben.
- Bereits entfernte IDs werden nicht neu verwendet.
- `status` ist einer von `confirmed`, `decision`, `open`, `risk`, `archived`.
- `type` und `area` sind Freitext; die Oberfläche erzeugt Filter aus den
  vorhandenen Werten.
- `date` nutzt das Format `YYYY-MM-DD`.
- `sources` enthält nur hilfreiche, nicht sensible Verweise.

## Bearbeitung durch Agenten

Agenten ändern die JSON-Daten, nicht das Steuerungs- oder Sicherheitsverhalten
der Oberfläche, sofern keine UI-Änderung beauftragt ist. Bei einer Veränderung
der HTML-Oberfläche müssen Suche, Filter und Export im Browser geprüft werden.
