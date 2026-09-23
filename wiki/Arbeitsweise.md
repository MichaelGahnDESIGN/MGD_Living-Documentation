# Arbeitsweise

## Die fünf Informationsarten

| Art | Wann verwenden? | Beispiel |
| --- | --- | --- |
| Bestätigt | Code, Build, Test oder Betrieb wurde tatsächlich geprüft | „Unit-Test-Suite: 42/42 erfolgreich“ |
| Entscheidung | Eine Richtung ist bewusst gewählt | „PostgreSQL für persistente Daten“ |
| Offen | Eine Entscheidung, Abhängigkeit oder Prüfung fehlt | „Live-Rollenprüfung steht aus“ |
| Risiko | Es gibt eine konkrete mögliche Auswirkung | „Migration ohne Backup gefährdet Produktionsdaten“ |
| Archiv | Historischer Kontext, nicht aktuell maßgeblich | „Planung vor Architekturentscheid“ |

## Aktualisieren nach einer Änderung

1. Änderung umsetzen und angemessen prüfen.
2. Betroffene Fachseite aktualisieren: Architektur, Setup, Bedienung oder
   Betrieb – nur falls tatsächlich verändert.
3. Entscheidung, offenen Punkt oder Risiko ergänzen, sofern neu entstanden.
4. Verifikation mit Ergebnis und Grenzen notieren.
5. Veraltete Statusaussagen bereinigen oder ins Archiv verschieben.

## Entscheidungsvorlage

| Datum | Entscheidung | Begründung | Änderungsbedingung |
| --- | --- | --- | --- |
| YYYY-MM-DD | Kurzer Beschluss | Warum diese Variante | Wann neu entscheiden |

## Gute Übergabe

Eine Übergabe beantwortet kurz:

- Was ist in welchem Bereich bestätigt?
- Welche Prüfungen wurden durchgeführt und welche nicht?
- Welche offenen Punkte oder Risiken sind wichtig?
- Was ist der kleinste sinnvolle nächste Schritt?

Vermeide Chat-Protokolle als Übergabe. Sie enthalten meist historische
Zwischenstände, die eine geltende Spezifikation überlagern können.
