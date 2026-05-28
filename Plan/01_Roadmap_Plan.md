# Roadmap & Aktionsplan

> **Start**: 24. Mai 2026  
> **Projektvorstellung**: 16. Juli 2026  
> **Mündliche Prüfung**: Letzte zwei August-Wochen

---

## Phase 1: Elm Grundlagen lernen (24. Mai – 31. Mai)

### Tag 1 — Elm-Guide + TEA
- [ ] [Elm Guide](https://guide.elm-lang.org/) lesen: Core Language, Types, The Elm Architecture
- [ ] `elm repl` installieren und ausprobieren
- [ ] Custom Types, Pattern Matching, List-Operationen verstehen
- [ ] **Ressource**: [Learn You an Elm](https://learnyouanelm.github.io/)

### Tag 2 — Aufgaben 01–03 (Ellie)
- [ ] **A01**: Adresse in Elm darstellen + Sprachumschaltung (Buttons, Model, Update)
- [ ] **A02**: Imagemap mit Elm + Tabellen + Formulare
- [ ] **A03**: Bulma CSS + Modals + Animationen
- [ ] Lösungen von Kommilitonen im Wiki anschauen

### Tag 3 — Aufgabe 04 (SVG)
- [ ] **A04**: SVG-Elemente in Elm, interaktives Zeichnen
- [ ] Maus-Events in SVG verarbeiten (`onClick`, `onInput`)
- [ ] SVG responsiv machen (viewBox, width=100%)

### Tag 4 — Aufgaben 05–06 (HTTP + URL)
- [ ] **A05**: HTTP Requests + JSON Decoder in Elm
- [ ] **A06**: `Browser.application` statt `Browser.sandbox`
- [ ] URL-Routing + Navigation + Browser-Historie
- [ ] Elm lokal installieren (für A06 nötig)

### Erfolgskriterium
Ein lauffähiges Elm-Programm mit:
- [ ] Browser.application (URL-Routing)
- [ ] SVG-Ausgabe
- [ ] HTTP + JSON-Decoder
- [ ] Bulma-CSS

---

## Phase 2: Projektidee finden + Proposal (1. Juni – 7. Juni)

- [ ] Projektidee mit Partner diskutieren
- [ ] 3–4 Sätze Beschreibung schreiben
- [ ] Im Wiki eintragen (bei Hinneburg zur Genehmigung)
- [ ] GitLab-Repo einrichten (gitlab-lehre)
- [ ] CI/CD für GitLab Pages konfigurieren
- [ ] Partner in Git-Grundlagen einweisen (`clone`, `add`, `commit`, `push`)

---

## Phase 3: MVP bauen (8. Juni – 21. Juni)

### Woche 1 (8.–14. Juni)
- [ ] Elm-Projekt lokal aufsetzen (`elm init`)
- [ ] `Browser.application` mit 2–3 Routen (z.B. Home, Search, Detail)
- [ ] Grundlegende Views mit Bulma
- [ ] HTTP-Calls + JSON-Decoding implementieren

### Woche 2 (15.–21. Juni)
- [ ] Interaktives SVG einbauen (abhängig vom Model-Zustand)
- [ ] Hauptinteraktion programmieren (Suchen, Filtern, Darstellen)
- [ ] Auf GitLab Pages deployen (erste Version online)

---

## Phase 4: Projekt verfeinern (22. Juni – 6. Juli)

- [ ] URL-History mit Back/Forward testen
- [ ] Error-Handling + Loading-States
- [ ] Fehlende Features ergänzen
- [ ] CSS/UI polieren
- [ ] Partner: letzte Featurarbeit + Testen

---

## Phase 5: Präsentation vorbereiten (7. Juli – 15. Juli)

- [ ] **2–5 PDF-Folien** erstellen:
  1. Projekttitel + Motivation
  2. Architektur (TEA: Model/View/Update-Diagramm)
  3. Interessantes Detail (z.B. JSON-Decoder, SVG-Interaktion, Routing)
  4. Demo
- [ ] Folien in StudIP hochladen
- [ ] 10 Min. Vortrag durchproben (mit Timer)
- [ ] Deployment checken (funktioniert alles?)

---

## Phase 6: Prüfungsvorbereitung (August)

- [ ] VL-Folien durcharbeiten: c1 (Internet) – ca (HTTP)
- [ ] Eigene Projekt-Code-Struktur erklären können
- [ ] Elm-Konzepte: TEA, Types, Pattern Matching, JSON-Decoder, Ports

---

## Checkliste: Meilensteine

| Datum | Meilenstein | Status |
|---|---|---|
| 31. Mai | Elm-Grundlagen sitzen | ☐ |
| 4. Juni | Projektidee eingereicht | ☐ |
| 7. Juni | Projekt genehmigt + Repo bereit | ☐ |
| 21. Juni | MVP läuft auf GitLab Pages | ☐ |
| 6. Juli | Projekt fertig + getestet | ☐ |
| 15. Juli | Folien hochgeladen | ☐ |
| **16. Juli** | **Projektvorstellung** | ☐ |
| August | Mündliche Prüfung | ☐ |

---

## Tools & Deployment

| Tool | Zweck |
|---|---|
| **Ellie** | Schnelles Prototyping (Online-Editor) |
| **Lokales Elm** | `elm init`, `elm make`, `elm reactor` |
| **GitLab Lehre** | Repo + CI/CD + Pages |
| **Cloudflare Pages** | Alternative zu GitLab Pages |
| **Netlify** | Alternative zu GitLab Pages |
