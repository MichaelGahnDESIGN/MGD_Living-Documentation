# Projektstruktur und Vorlagen

Diese Struktur ist eine sichere Ausgangsbasis. Bestehende, klarere
Projektstrukturen haben Vorrang; ergänze fehlende Elemente statt umzubenennen.

```text
<Projektwurzel>/
├── index.html                    # lokale, portable Startseite
├── AGENT_GLOBAL_RULES.md         # gemeinsame Agentenregeln
├── README.md                     # Einstieg und Installation
├── DOKUMENTATION/                # kanonische Projektdokumentation
├── SECRETS/                      # lokal, geschützt, nicht versioniert
│   ├── README.md                 # Handhabung ohne echte Daten
│   └── zugangsdaten.template.md  # nur Platzhalter
└── USER CONCEPT/                 # lokal, geschützt, nicht versioniert
    └── README.md                 # Ideen- und Asset-Ablage
```

## `.gitignore` ergänzen

Füge fehlende Zeilen hinzu, ohne bestehende Einträge zu verändern:

```gitignore
# Lokale, sensible Projektdaten. Nur die unbedenklichen Hinweise bleiben sichtbar.
/SECRETS/**
!/SECRETS/README.md
!/SECRETS/zugangsdaten.template.md

# Lokale Ideen und Rohmaterial. Quellen bleiben lokal; Nutzmaterial wird bewusst kopiert.
/USER CONCEPT/**
!/USER CONCEPT/README.md
```

Falls ein Projekt bereits strengere Regeln wie `/SECRETS/` oder
`/USER CONCEPT/` enthält, behalte sie bei. `.gitignore` verhindert kein
Veröffentlichen bereits getrackter Dateien: Vorhandene sensible Dateien nie
automatisch aus dem Index entfernen, sondern den Befund sicher melden.

## `SECRETS/README.md`

```markdown
# Geschützter Bereich: SECRETS

Hier liegen ausschließlich lokale Zugangsdaten, personenbezogene Daten und
andere sensible Projektinformationen.

- Diese Dateien werden nicht in Git, Dokumentation, Screenshots oder Chats geteilt.
- Agenten lesen, ändern, kopieren oder löschen Inhalte nur nach einer konkreten
  Zustimmung für den benannten Pfad in der aktuellen Aufgabe.
- Für neue Einträge die Datei `zugangsdaten.template.md` kopieren und lokal
  ausfüllen. Niemals echte Werte in die Vorlage schreiben.
```

## `SECRETS/zugangsdaten.template.md`

```markdown
# Zugangsdaten – lokale Vorlage

> Diese Datei bleibt lokal. Keine echten Werte in Git, Chat oder öffentliche Dokumentation schreiben.

Dienst: <Name>
Zweck: <Wofür wird der Zugang benötigt?>
Verantwortlich: <Rolle oder Team, keine private Kontaktdaten>
Speicherort des Secrets: <Passwortmanager oder Secret-Manager>
Letzte Prüfung: <YYYY-MM-DD>
Rotation oder Ablauf: <YYYY-MM-DD oder nicht bekannt>
```

## `USER CONCEPT/README.md`

```markdown
# USER CONCEPT

Hier sammeln Nutzer:innen Ideen, Skizzen, Grafiken, Texte und Referenzen.

- Dieser Ordner bleibt lokal und wird nicht automatisch veröffentlicht.
- Benötigte Dateien werden bewusst kopiert, niemals automatisch verschoben oder gelöscht.
- Vor Nutzung außerhalb des Projekts Rechte, Lizenz und Quellenhinweis prüfen.
```
