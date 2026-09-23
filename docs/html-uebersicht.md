# Interaktive HTML-Übersicht

`LIVING_DOCUMENTATION.template.html` ist eine einzelne, lokal ausführbare
Datei. CSS, JavaScript und Daten liegen darin zusammen. Sie benötigt weder
Internet noch Server noch ein Benutzerkonto.

## Datenformat

Die Daten stehen im Skriptblock `livingDocumentationData` als JSON:

```json
{
  "project": { "title": "Mein Projekt", "description": "Kurzer, aktueller Kontext" },
  "entries": [
    {
      "id": "D001",
      "title": "API-Vertrag bestätigt",
      "status": "confirmed",
      "type": "Architektur",
      "area": "Backend",
      "date": "2026-09-23",
      "content": "Der Vertrag wurde gegen den Staging-Endpunkt geprüft.",
      "sources": "docs/api.md, Testlauf 2026-09-23"
    }
  ]
}
```

## Statuswerte

| Wert | Bedeutung |
| --- | --- |
| `confirmed` | umgesetzt oder geprüft, mit belegbarer Grundlage |
| `decision` | geltende, bewusste Entscheidung |
| `open` | noch nicht entschieden oder erledigt |
| `risk` | konkrete Gefährdung mit Auswirkung oder Minderung |
| `archived` | Historie, nicht maßgebliche Gegenwart |

`type` und `area` sind Freitext. Die Filter leiten ihre Auswahl automatisch aus
den tatsächlich vorkommenden Werten ab.

## Manuelle Bearbeitung im Browser

1. HTML-Datei im Browser öffnen.
2. Über „Eintrag hinzufügen“ einen neuen Eintrag erstellen oder „Bearbeiten“
   beziehungsweise „Entfernen“ wählen.
3. „Aktualisierte HTML exportieren“ auswählen.
4. Die heruntergeladene Datei mit der Projektdatei vergleichen.
5. Nur nach dieser Prüfung die kanonische Datei ersetzen und versionieren.

Die Änderungen im Browser sind bis zum Export nur temporär. Das ist eine
Sicherheitsgrenze, damit eine lokal geöffnete Datei nicht unbemerkt den
versionierten Stand überschreibt.

## Bearbeitung durch Agenten

Agenten aktualisieren ausschließlich das JSON im Daten-Skriptblock. Neue IDs
folgen `DNNN` und sind fortlaufend; sie werden nicht nach dem Entfernen erneut
verwendet. Bei umfangreicheren Änderungen muss die Suche, mindestens ein Filter
und der Export im Browser geprüft werden.
