# Dokumentationsmodell

Dieses Modell ist eine anpassbare Orientierung, kein Zwang zu einer großen
Ordnerstruktur. Bestehende, funktionierende Projektnamen und Ablagen bleiben
erhalten.

## Sinnvoller Minimalumfang

| Dokument | Zweck |
| --- | --- |
| `README.md` oder `docs/README.md` | Einstieg, kanonische Quelle und Navigation |
| Projektüberblick | Ziel, Grenzen und bestätigter Gesamtstand |
| Entscheidungen | Datum, Entscheidung, Begründung und Rücknahmebedingung |
| Offene Punkte | Ungeklärte Fragen, Abhängigkeiten und nächste Schritte |
| Risiken | Konkrete Risiken mit Auswirkung und Minderung |

Ergänze bei Bedarf Setup, Architektur, Betrieb/Deployment, Sicherheit,
Lizenzen, Backups oder Versionshinweise. Für ein kleines Projekt genügt häufig
eine Einstiegsseite mit klaren Abschnitten statt vieler Dateien.

## Vorlagen

### Entscheidung

| Datum | Entscheidung | Begründung | Rücknahme oder Änderungsbedingung |
| --- | --- | --- | --- |
| YYYY-MM-DD | Kurze Entscheidung | Nachvollziehbarer Grund | Wann sie überprüft wird |

### Offener Punkt

| Thema | Warum offen | Benötigte Entscheidung oder Abhängigkeit | Nächster Schritt |
| --- | --- | --- | --- |
| Kurzer Titel | Konkreter Grund | Was fehlt | Kleinster sinnvoller Schritt |

### Risiko

| Risiko | Auswirkung | Minderung | Status |
| --- | --- | --- | --- |
| Konkretes Ereignis | Betroffener Bereich | Praktische Schutzmaßnahme | offen, gemindert oder akzeptiert |

### Verifikation

Dokumentiere eine Prüfung immer mit ihrem tatsächlichen Umfang:

```text
Geprüft: <Befehl, Test oder manueller Ablauf>
Ergebnis: <beobachtbares Resultat>
Nicht geprüft: <Grenze oder ausstehender Bereich>
```

## Externe Kopien

Ein Wiki, eine Website oder ein Handbuch kann aus der Repository-Dokumentation
abgeleitet werden. Vor der Veröffentlichung gelten mindestens diese Prüfungen:

1. Keine Secrets oder personenbezogenen Betriebsdaten.
2. Keine unbestätigten Aussagen als Tatsachen.
3. Keine internen Betriebsdetails, die nicht freigegeben sind.
4. Die Quellversion und der Zeitpunkt der Übernahme sind nachvollziehbar.
