# Wiki-Quellen

Dieser Ordner ist die versionierte Quelle für das GitHub-Wiki. Dadurch werden
Wiki-Änderungen im normalen Pull-Request- und Git-Verlauf überprüfbar.

## Seiten

- [Home](Home.md): Einstieg und Schnellreferenz
- [Installation](Installation.md): Codex, Claude Code und Agent-Skills
- [Arbeitsweise](Arbeitsweise.md): bestätigter Stand, Entscheidungen und Übergaben
- [Interaktive Übersicht](Interaktive-Uebersicht.md): Suche, Filter und Bearbeitung
- [Datenformat](Datenformat.md): JSON-Schema und Regeln für Agenten
- [Sicherheit](Sicherheit.md): Schutz- und Veröffentlichungsgrenzen
- [Integration](Integration.md): Nutzung im Projektalltag
- [Autopilot-Integration](Autopilot-Integration.md): verbindlicher autonomer Arbeitszyklus
- [Projekt-Start-Assistent](Projekt-Start-Assistent.md): Dashboard, Schutzbereiche und Skill-Audit

## GitHub-Wiki kontrolliert aktualisieren

GitHub-Wikis sind eigene Git-Repositories. Kopiere oder synchronisiere diese
Seiten erst nach einer Geheimnis- und Link-Prüfung in das Wiki-Repository.
Die Dateien in diesem Ordner bleiben maßgeblich; das GitHub-Wiki ist eine
abgeleitete, veröffentlichte Ansicht.

Vor einem Sync prüfen:

1. Kein Secret, keine personenbezogenen Betriebsdaten und keine privaten
   Infrastrukturdetails.
2. Keine unbestätigte Aussage als Fakt.
3. Alle relativen Links funktionieren auch im Wiki-Kontext.
4. Die gewünschte Repository-Sichtbarkeit und die berechtigten Personen sind
   geprüft.
