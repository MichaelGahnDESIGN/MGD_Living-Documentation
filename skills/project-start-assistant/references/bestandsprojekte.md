# Bestehende Projekte sicher übernehmen

## Reihenfolge

1. Projektregeln, README, Dokumentation, `.gitignore`, Git-Status, Branches,
   Automatisierungen und vorhandene Skills lesen.
2. Einen Befund schreiben: vorhandene Struktur, kanonische Quellen, fehlende
   Schutzbereiche, erkannte Risiken, unklare Zuständigkeiten und installierte
   Skills.
3. Einen kleinen Migrationsplan mit Akzeptanzkriterien formulieren.
4. Fehlende, konfliktfreie Bestandteile ergänzen: `SECRETS/`, `USER CONCEPT/`,
   `.gitignore`-Regeln, Dashboard und globale Agentenregeln.
5. Bestehende Regeln und Dokumente verlinken; nur nach Prüfung konsolidieren.
6. Links, Git-Diff und Schutzregeln prüfen; sichtbar dokumentieren, was nicht
   automatisiert angepasst werden konnte.

## Nie automatisch tun

- vorhandene `AGENTS.md`, `CLAUDE.md`, Workflows, Build-Skripte oder
  Dokumentation überschreiben;
- `SECRETS/` auflisten, lesen, verschieben, ändern oder löschen;
- bereits getrackte sensible Daten entfernen oder veröffentlichen;
- Skills installieren, deinstallieren oder aktualisieren;
- produktive Konfigurationen, Deployments oder Datenbanken ändern.

## Erfolgskriterien

Ein bestehendes Projekt ist erst dann auf das System angepasst, wenn die
kanonischen Quellen verlinkt sind, die geschützten Ordner ignoriert werden, das
Dashboard keine erfundenen Aussagen enthält, der Skill-Befund verständlich ist
und alle offenen Konflikte oder Entscheidungen dokumentiert bleiben.
