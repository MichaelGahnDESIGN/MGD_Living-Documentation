# Integration in den Projektalltag

## Mit Git

Dokumentation wird zusammen mit der zugehörigen Umsetzung versioniert. Ein
guter Commit enthält Code und die konkret betroffenen Dokumentationsaussagen.
Bei größeren Entscheidungen kann ein eigener, klar benannter Dokumentations-
Commit sinnvoll sein.

## Mit Tests und Releases

- Nach Tests Ergebnis und Grenze dokumentieren.
- Vor einem Release offene kritische Risiken und Abhängigkeiten prüfen.
- Nach einem Deployment erst dann „bereitgestellt“ dokumentieren, wenn der
  Zielzustand tatsächlich geprüft wurde.
- Ein lokaler Build oder HTTP-Status allein belegt keine vollständige Funktion.

## Mit Aufgabenlisten

Eine Aufgabenliste beantwortet „Was ist zu tun?“. Living Documentation
beantwortet „Warum, in welchem Kontext und nach welchem aktuellen Stand?“. Ein
Todo sollte auf die relevante Spezifikation oder Entscheidung verweisen, aber
die Spezifikation nicht durch einen kurzen Aufgabentext ersetzen.

## Mit externem Wiki

Halte die Quellen im Repository aktuell und kopiere nur freigegebene Inhalte
in ein externes Wiki. So bleiben Änderungen reviewbar und ein Wiki-Ausfall oder
eine Berechtigungsänderung gefährdet nicht die kanonische Projektdokumentation.
