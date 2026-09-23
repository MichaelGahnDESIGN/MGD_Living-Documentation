# Interaktive Übersicht

Die optionale `LIVING_DOCUMENTATION.html` macht die Dokumentation im Browser
durchsuchbar, filterbar und manuell bearbeitbar. Sie ist eine einzelne lokale
Datei ohne Server, Datenbank, Konto, CDN oder Tracking.

## Bedienung

| Bedienung | Zweck |
| --- | --- |
| Suche | Durchsucht Titel, Inhalt, Bereich und Quellen |
| Statusfilter | Zeigt nur bestätigt, Entscheidungen, offene Punkte, Risiken oder Archiv |
| Typfilter | Filtert beispielsweise Architektur, Setup oder Produkt |
| Bereichsfilter | Filtert beispielsweise Frontend, Backend oder Sicherheit |
| Eintrag hinzufügen | Erzeugt eine fortlaufende Dokumentations-ID |
| Bearbeiten | Aktualisiert vorhandene Informationen ohne Duplikat |
| Entfernen | Entfernt nach Bestätigung aus der aktuellen Browseransicht |
| Export | Lädt die aktualisierte HTML-Datei herunter |

## Dauerhaft speichern

Ein Browser kann eine lokal geöffnete Originaldatei nicht sicher überschreiben.
Änderungen sind deshalb zunächst nur in der Ansicht aktiv. Für eine dauerhafte,
versionierte Änderung gilt:

1. Bearbeiten.
2. Aktualisierte HTML exportieren.
3. Export mit der Projektdatei vergleichen.
4. Nach Prüfung die kanonische Datei ersetzen.
5. Committen.

## Entfernen oder archivieren?

Alte Informationen, die für spätere Entscheidungen noch wichtig sind, erhalten
den Status `archived`. Entfernen ist für echte Dubletten, Fehleinträge oder
ausdrücklich nicht mehr gewünschte Inhalte gedacht. Vor dem Entfernen sollte
ein Git-Stand oder eine Sicherung vorhanden sein.

## Mehrbenutzergrenze

Die Datei ist keine Echtzeit-Datenbank. Wenn mehrere Menschen oder Agenten sie
gleichzeitig ändern, löst Git mögliche Konflikte. Vor dem Bearbeiten zuerst den
aktuellen Stand einholen.
