## Projektdokumentation: Smart Wardrobe Planner

### Allgemeines & Rahmenbedingungen

- **Modul:** Grundlagen des World Wide Web (Mitarbeit am Lehrstuhl für Softwaretechnik, Universität Halle, SS26).

- **Dozent:** PD Dr. Alexander Hinneburg.

- **Team:** Sameer Rana, Doaa (2-Personen-Gruppe, vollständig regelkonform).

- **Prüfungsleistung:** Erfolgreiche Ausarbeitung, Live-Präsentation (10 Min. Demo + 5 Min. Q&A am 16. Juli 2026) und eine anschließende mündliche Prüfung im August 2026 (ca. 35 Minuten).

### Projektidee & Anwendungsfall

Der _Smart Wardrobe Planner_ ist eine interaktive Web-Applikation zur digitalen Verwaltung der eigenen Garderobe und zur strukturierten Planung von Kleidungs-Kombinationen. Die App löst das alltägliche Problem der planlosen Outfitwahl, indem Kleidungsstücke digital kategorisiert, nach Anlass gefiltert und in Kombinationen visuell ausprobiert werden können. Zudem verfügt die App über eine Funktion, die dem Nutzer auf Knopfdruck zufällige, passende Outfit-Kombinationen vorschlägt.

### Architektur & Technische Kernkomponenten

Das Projekt wird strikt nach den vom Dozenten verschärften Kriterien umgesetzt. Alle wesentlichen Funktionen sind ohne Ausnahme in Elm programmiert; JavaScript wird nicht für Kernfeatures genutzt.

```
                                  [ Browser.application ]
                                             |
                      +----------------------+----------------------+
                      |                      |                      |
            [ HTTP / JSON ]           [ Elm-Architektur ]       [ Responsive View ]
                  |                          |                      |
           wardrobe.json                Model (State)           Bulma CSS Layout
           (Statische Daten)                 |                      |
                                       Update (Msg)           Interaktives SVG

```

1. **Software-Architektur (The Elm Architecture - TEA):** Vollständige Umsetzung über `init`, `view` und `update`. Durch eiserne Typisierung und Unveränderlichkeit von Variablen garantiert der Compiler die absolute Abwesenheit von Laufzeitfehlern im Betrieb und während der Prüfung.

2. **Datenhaltung (HTTP & JSON):** Die Anwendung verzichtet auf ein komplexes Server- oder Datenbank-Backend. Die Kleidungsstücke sind als strukturierte Daten in einer statischen `wardrobe.json`-Datei hinterlegt und werden asynchron via HTTP-GET-Anfragen über Elm-Decoder in die App geladen. Ein Import/Export-System ermöglicht es dem Nutzer, den aktuellen Zustand der Garderobe als JSON-String lokal zu sichern.

3. **Benutzeroberfläche (HTML & CSS):** Das visuelle Grid-System, die Navigationsleisten, Eingabemasken und Overlays (Modals) werden mit dem reinen CSS-Design-Framework **Bulma** umgesetzt, um eine konsistente, moderne Ästhetik zu gewährleisten.

4. **URL-Navigation:** Die Anwendung läuft als `Browser.application`. Sie kontrolliert die Browser-Historie autonom, sodass die Zurück- und Vorwärts-Buttons des Webbrowsers über `UrlChanged`- und `LinkClicked`-Nachrichten stabil funktionieren.

5. **Visuelle Engine (SVG):** Generierung dynamischer Vektorgrafiken direkt aus dem Elm-Zustand heraus. Zur fehlerfreien Ereignisverarbeitung wird ein eigener Event-Handler (`onClickNoBubblingUp`) genutzt, der das störende Aufsteigen von Klick-Ereignissen im DOM-Baum blockiert.

### Git-Workflow & Kooperation

Die Entwicklung erfolgt kollaborativ über das universitäre GitLab-System. Um den Einstieg zu erleichtern, arbeitet das Team mit einer klaren Branch-Struktur (`main` und `doaa-dev`).

Dank maßgeschneiderter Shell-Abkürzungen in der Git Bash wie `git ac "Nachricht"`, das automatisiert alle Änderungen stagt und mit einer Notiz versieht, wird die Fehlerquote beim Code-Austausch minimiert. Gemeinsame Pair-Programming-Phasen werden direkt über die VS Code _Live Share_-Erweiterung realisiert.

---

Dieses Dokument dient dir als perfekte, vollständige Übersicht für den aktuellen Stand. Als nächsten Schritt könnt ihr diese Struktur direkt in eure `README.md` im GitLab-Repository einpflegen.
