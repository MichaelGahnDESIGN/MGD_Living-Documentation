---
name: living-documentation
description: Pflegt eine lebendige, repositorynahe Projektdokumentation mit aktuellem Stand, Entscheidungen, Risiken und offenen Punkten. Verwenden bei Umsetzung, Architekturentscheidungen, Übergaben oder wenn Dokumentation dauerhaft aktuell bleiben soll.
---

# Living Documentation

Nutze diesen Skill, damit die Projektdokumentation eine verlässliche,
wartbare Quelle für den aktuellen Stand bleibt. Die Dokumentation beschreibt
den nachweisbaren Zustand – nicht den Wunschzustand.

## Zuerst einordnen

1. Lies die projektbezogenen Regeln und die bestehende Dokumentationsstruktur.
2. Ermittle die kanonische Dokumentationsquelle. Bevorzuge versionierte Dateien
   im Repository gegenüber externen Wikis oder Chat-Zusammenfassungen.
3. Prüfe den tatsächlichen Änderungsstand und die durchgeführten Prüfungen,
   bevor du eine Aussage als erledigt dokumentierst.

Passe dich an vorhandene Namen und Strukturen an. Lege keine parallele
Dokumentationswelt an, wenn das Projekt bereits `docs/`, `DOKUMENTATION/` oder
eine vergleichbare kanonische Quelle besitzt.

## Was festgehalten wird

Ordne neue Informationen eindeutig einer dieser Kategorien zu:

- **Bestätigter Stand:** implementiert oder überprüft, mit kurzer Angabe der
  belastbaren Prüfung.
- **Entscheidung:** bewusst gewählte Richtung, Begründung und – wenn sinnvoll –
  eine Rücknahme- oder Änderungsbedingung.
- **Offener Punkt:** fehlende Entscheidung, Abhängigkeit oder manueller Schritt.
- **Risiko:** konkrete Auswirkung, betroffener Bereich und realistische
  Minderung.

Dokumentiere nur Informationen, die künftige Arbeit, Betrieb, Sicherheit oder
Übergaben besser machen. Wiederhole weder offensichtlichen Code noch komplette
Chatverläufe.

## Beim Aufbau einer neuen Dokumentation

Falls noch keine tragfähige Struktur existiert, erstelle eine schlanke
Einstiegsseite und nur die Register, die für das Projekt tatsächlich gebraucht
werden. Als Orientierung für ein umfassendes Softwareprojekt dient
[Dokumentationsmodell](references/dokumentationsmodell.md).

Die Einstiegsseite beantwortet mindestens: Was ist das Projekt? Wo liegt der
aktuelle Stand? Welche Dokumente sind maßgeblich? Welche Themen sind offen?

## Bei Änderungen am Projekt

Aktualisiere die Dokumentation im selben Änderungsumfang wie die Umsetzung:

- Ergänze Architektur, Setup oder Bedienhinweise nur, wenn sie sich tatsächlich
  geändert haben.
- Ergänze Entscheidungen und Risiken nicht rückwirkend als Tatsachen.
- Halte Tests mit Ergebnis und Grenzen fest, etwa „Build erfolgreich“ statt
  pauschal „funktioniert“.
- Bereinige veraltete Statusangaben oder markiere sie als historisch, damit die
  Einstiegsseiten aktuell bleiben.

Für Übergaben sind betroffenes Gebiet, bestätigter Stand, offene Punkte,
Risiken und der nächste sinnvolle Schritt wichtiger als ein langer Verlauf.

## Interaktive Living Documentation

Wenn ein Projekt eine durchsuchbare und manuell pflegbare Übersicht braucht,
verwende die Vorlage
`living-documentation/LIVING_DOCUMENTATION.template.html` aus diesem
Repository. Sie ist vollständig lokal, ohne Datenbank, CDN oder Tracking.

Die Einträge liegen als verständliches JSON in der HTML-Datei. Menschen können
sie direkt im Browser ergänzen, ändern oder entfernen; anschließend erzeugt
„Aktualisierte HTML exportieren“ eine Datei, die nach Prüfung die versionierte
Originaldatei ersetzt. Agenten bearbeiten ausschließlich die JSON-Daten im
Skriptblock und behalten die Oberfläche unverändert, sofern keine UI-Änderung
beauftragt ist.

Nutze diese Arbeitsweisen nur bei passendem Bedarf:

- **Einrichten:** Vorlage in die bestehende Dokumentationsstruktur kopieren,
  Projekttitel und Beispieldaten durch überprüfte Informationen ersetzen.
- **Eintrag ergänzen:** eindeutige, fortlaufende `DNNN`-ID vergeben und Status,
  Typ, Bereich, Datum, Inhalt und relevante Quellen angeben.
- **Eintrag aktualisieren:** bestehenden Eintrag anpassen statt widersprüchliche
  Duplikate anzulegen; historisch gewordene Informationen archivieren.
- **Eintrag entfernen:** nur mit ausdrücklicher Berechtigung und nach einer
  Sicherung oder einem nachvollziehbaren Git-Stand. Unklare Historie wird
  archiviert, nicht gelöscht.
- **Prüfen:** Suche, Status-, Typ- und Bereichsfilter sowie Export mindestens
  einmal im Browser prüfen, wenn die HTML-Oberfläche verändert wurde.

Die Datei ist ein lokales Arbeitsmittel, keine Echtzeit-Mehrbenutzerlösung.
Gleichzeitige Bearbeitungen werden über normale Git-Prüfung und Merge-Konflikte
koordiniert.

## Sicherheits- und Veröffentlichungsgrenzen

Niemals in die Projektdokumentation oder ein öffentliches Wiki aufnehmen:

- Passwörter, Tokens, API-Schlüssel, Recovery-Codes oder vollständige
  Zugangsdaten;
- personenbezogene Betriebsdaten, private E-Mail-Adressen, interne IP-Adressen
  oder nicht freigegebene Serverpfade;
- Datenbankexporte, Sicherheitslücken mit ausnutzbaren Details oder Inhalte,
  deren Veröffentlichung nicht autorisiert ist.

Vor einem Wiki-Sync, Push oder einer Veröffentlichung prüfe die betroffenen
Dokumente gezielt auf solche Inhalte. Eine externe Kopie ist abgeleitet; die
versionierte, geprüfte Quelle im Repository bleibt maßgeblich.

## Qualitätsmaßstab

Eine gute lebendige Dokumentation ist knapp genug, um gelesen zu werden, und
konkret genug, um Entscheidungen ohne Rätsel nachvollziehen zu können. Behaupte
nicht, dass etwas funktioniert, bereitgestellt oder geprüft sei, wenn dafür
keine Beobachtung vorliegt.
