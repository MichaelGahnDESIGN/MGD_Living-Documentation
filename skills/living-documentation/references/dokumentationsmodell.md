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
| Karte (Graphify), optional | Abschnitt auf der Einstiegsseite, der auf den maschinell erzeugten Graphen in `graphify-out/` verweist |

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

## Karte (Graphify)

Die Karte beantwortet „was existiert und wovon hängt es ab?“. Sie ist
abgeleitet und gehört nicht in die Register oben: Entscheidungen, offene
Punkte und Risiken bleiben Aussagen der Dokumentation. Eine Architekturaussage
nennt ihren Beleg aus dem Graphen:

```text
Aussage: Die Anmeldung ruft die Datenbankverbindung direkt auf.
Beleg: graphify path "login" "connect", 2026-10-22, Stand abc1234
Konfidenz: EXTRACTED
Grenze: ein Pfad belegt eine vorhandene Beziehung, nicht, dass es keine
        weiteren gibt; dynamisch geladene Module und Konfiguration fehlen.
```

Vorlage für den Einstiegsabschnitt, Befehle und Ausschlussblöcke stehen in
[Karte (Graphify)](karte-graphify.md).

## Externe Kopien

Ein Wiki, eine Website oder ein Handbuch kann aus der Repository-Dokumentation
abgeleitet werden. Vor der Veröffentlichung gelten mindestens diese Prüfungen:

1. Keine Secrets oder personenbezogenen Betriebsdaten.
2. Keine unbestätigten Aussagen als Tatsachen.
3. Keine internen Betriebsdetails, die nicht freigegeben sind.
4. Die Quellversion und der Zeitpunkt der Übernahme sind nachvollziehbar.
