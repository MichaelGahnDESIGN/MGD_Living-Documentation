# Projekt-Start-Assistent – Kompatibilitätsverweis

Der frühere Projekt-Start-Assistent bleibt für bestehende Installationen
erhalten. Die zentrale AI-Dev-OS-Projektzentrale ist jetzt der
[MGD_AI-Projektmanager](https://github.com/MichaelGahnDESIGN/MGD_AI-Projektmanager).
Neue Projekte, Migrationen, `/Dashboard` und Skill-Audits werden dort geführt.

Dieser Übergang verändert keine bestehende Dokumentation, keine Skills und
keine geschützten Inhalte aus `SECRETS/` oder `USER CONCEPT/`.

## Was entsteht?

- eine lokale `index.html` als übersichtliches Dashboard;
- ein kurzer Abschnitt „So arbeitet der Assistent“ in einfachen Worten;
- `AGENT_GLOBAL_RULES.md` für Modellwahl, Limits, Agentensteuerung,
  Prozesskontrolle, token-sparendes Arbeiten und sichere Bereinigung;
- ein geschütztes lokales `SECRETS/` mit Vorlagen ohne echte Werte;
- ein lokales `USER CONCEPT/` für Ideen, Grafiken und Referenzen;
- `.gitignore`-Regeln für beide Schutzordner;
- ein Bericht über vorhandene Skills und begründete Empfehlungen.

## Dashboard überall nutzen

Die Startseite ist statisches HTML ohne Tracking, CDN, Datenbank oder Build.
Sie funktioniert direkt im Browser. Wenn die Oberfläche es erlaubt, kann
ChatGPT Codex sie als Site und Claude Code sie als Artefakt zeigen. Die Datei
im Repository bleibt immer die maßgebliche, portable Quelle.

## Schutzbereiche

`SECRETS/` enthält sensible oder personenbezogene Daten. Ohne eine konkrete
Zustimmung für den benannten Pfad darf der Assistent ihn nicht lesen,
bearbeiten, kopieren, löschen oder veröffentlichen.

`USER CONCEPT/` bewahrt Ideen und Rohmaterial. Benötigte Dateien werden bewusst
kopiert, nicht automatisch verschoben oder gelöscht. Vor Veröffentlichung
prüft der Assistent Rechte und Lizenzen.

Beide Ordner werden standardmäßig ignoriert. Bereits versionierte sensible
Dateien werden nicht automatisch entfernt, sondern als Sicherheitsbefund
gemeldet.

## Bestehende Projekte

Der Assistent liest zuerst Regeln, Git-Status, Dokumentation, `.gitignore`,
Automatisierungen und vorhandene Skills. Er ergänzt nur konfliktfreie
Bestandteile. Bestehende Regeln, Workflows, Build-Skripte, produktive Systeme,
Secrets und Datenbanken werden nicht stillschweigend verändert.

## Skill-Audit

Der Bericht trennt zwischen „vorhanden und genutzt“, „sinnvolle Ergänzung“ und
„möglicherweise entbehrlich“. Empfehlungen nennen den konkreten Nutzen und
eventuelle Kosten- oder Datenschutzaspekte. Skills werden nie automatisch
installiert, aktualisiert oder entfernt.
