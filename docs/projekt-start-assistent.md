# Projekt-Start-Assistent

Der Projekt-Start-Assistent richtet neue und bestehende Projekte als sichere,
leicht verständliche Arbeitsumgebung ein. Er ist kein Generator für beliebigen
Code. Seine Aufgabe ist, Regeln, Dokumentation, Schutzbereiche, Dashboard und
passende Skills sauber zusammenzuführen.

## Ergebnis in einem neuen Projekt

Der Assistent erstellt oder ergänzt:

- eine lokale `index.html` als Projekt-Dashboard;
- eine kurze Erklärung „So arbeitet der Assistent“ in einfachen Sätzen;
- kanonische Projektdokumentation und Verweise auf vorhandene Quellen;
- `AGENT_GLOBAL_RULES.md` für Modellwahl, Limits, Agentensteuerung,
  Prozesskontrolle, token-sparendes Arbeiten und sichere Bereinigung;
- `SECRETS/` mit unbedenklichen lokalen Vorlagen;
- `USER CONCEPT/` als lokale Sammlung für Ideen und Quellmaterial;
- `.gitignore`-Regeln, die beide Schutzordner aus dem Repository fernhalten;
- einen Skill-Audit mit gezielten Empfehlungen statt einer pauschalen
  Installationsliste.

Die Vorlagen liegen unter
[`skills/project-start-assistant/assets/`](../skills/project-start-assistant/assets/).
Sie werden in das Zielprojekt kopiert und mit überprüften Informationen
ausgefüllt.

## Dashboard in Codex, Claude und anderen Tools

Die generierte `index.html` ist absichtlich ohne Build, Datenbank, Tracking,
CDN und Framework gebaut. Sie funktioniert lokal und bleibt die portable
Quelle.

- In **ChatGPT Codex** kann sie nach der Prüfung als Site oder Datei geöffnet
  werden, sofern die verwendete Oberfläche diese Darstellung anbietet.
- In **Claude Code** kann dieselbe Datei als Artefakt gezeigt werden, sofern
  Artefakte verfügbar sind.
- Fehlt eine solche Oberfläche, wird die Datei direkt im Browser geöffnet.

Ein Tool-spezifisches Artefakt ersetzt nie die versionierte Datei im Projekt.

## Schutzbereiche

`SECRETS/` ist für Zugangsdaten, personenbezogene und andere sensible Daten.
Der Assistent darf diesen Ordner ohne eine konkrete Zustimmung für den benannten
Pfad nicht lesen, verändern, kopieren, löschen oder veröffentlichen. Die
enthaltene Markdown-Vorlage dokumentiert nur Zweck, Verantwortlichkeit und
Speicherort des Secrets – niemals echte Werte.

`USER CONCEPT/` sammelt Grafiken, Ideen, Skizzen und Referenzen. Der Assistent
kopiert einzelne benötigte Dateien erst bei einem konkreten Bedarf in den
Zielbereich. Er verschiebt oder löscht die Originale nicht automatisch.

Beide Ordner stehen standardmäßig in `.gitignore`. Bereits versionierte oder
sensibel wirkende Dateien werden nicht automatisiert entfernt; das wird als
Sicherheitsbefund gemeldet.

## Bestehende Projekte

Bei einem Bestandsprojekt beginnt der Assistent mit einer Bestandsaufnahme:
Regeln, Git-Status, Dokumentation, vorhandene Skills, `.gitignore` und
Automatisierungen. Er verknüpft danach vorhandene kanonische Quellen und
ergänzt nur konfliktfreie Bestandteile. Bestehende `AGENTS.md`, `CLAUDE.md`,
Build-Skripte, Workflows und Produktionskonfigurationen werden nicht
überschrieben.

Nicht automatisch angepasst werden Secrets, Datenbanken, Deployments,
produktive Konfigurationen und bereits veröffentlichte Inhalte.

## Skill-Audit

Der Assistent listet vorhandene Skills mit ihrem tatsächlichen Nutzen auf. Er
empfiehlt Ergänzungen nur bei einer nachweisbaren Lücke und nennt dabei Nutzen,
Quelle sowie mögliche Kosten- oder Datenschutzaspekte. Nicht mehr benötigte
Skills werden nur als Empfehlung markiert; Installation, Update und Entfernung
erfolgen ausschließlich nach ausdrücklicher Nutzerentscheidung.

## Tägliche Zusammenarbeit

Der Assistent liest zuerst Regeln und aktuellen Stand. Dann wählt er kleine,
prüfbare Schritte. Passende Skills helfen bei Spezialaufgaben, aber sie
ersetzen keine Prüfung. Nach jeder Änderung hält der Assistent fest, was er
geprüft hat und was offen ist. Bei knappen Limits stoppt er sauber und lässt
einen sicheren, dokumentierten Zwischenstand zurück.
