# Guide für Partner (keine Vorkenntnisse)

> Hiermit kannst du deine Partnerin Schritt für Schritt einweisen.
> Ihre Hauptrolle: **UI/Styling + Testing** — sie gestaltet die Optik und testet die App.

---

## Woche 1: Git + Elm kennenlernen

### Git installieren
```bash
sudo apt install git
```

### Grundlegende Git-Kommandos

```bash
# Repository klonen
git clone <url>

# Änderungen prüfen
git status

# Änderungen hinzufügen
git add .

# Commit machen
git commit -m "Nachricht"

# Hochladen
git push
```

### Elm ausprobieren
- [ ] https://ellie-app.com öffnen
- [ ] Beispiel-Code ausprobieren
- [ ] Eigenes "Hello World" in Elm schreiben

### Konzepte erklären
- Elm Guide: Core Language + Types
- Was ist TEA? (Model → View → Update)
- Ellie vs. lokale Entwicklung

---

## Woche 2: Erste eigene Elm-Aufgaben

- [ ] Aufgabe 01 (Adresse anzeigen)
- [ ] Aufgabe 02 (Bild + Tabelle)
- [ ] Aufgabe 03 (CSS + Bulma)

---

## Woche 3: Projektarbeit beginnen

### Aufteilung (generisch — anpassen nach Projektwahl)
| Person A (du) | Person B (Partnerin — UI/Styling + Testing) |
|---|---|
| Elm-Projekt-Struktur + `elm init` | **Bulma-Styling**: Farben, Abstände, Navbar, Karten |
| `Browser.application` + Routing | **HTML-Views**: Home-Seite, Suchergebnisse, Detailansicht |
| HTTP-Requests + JSON-Decoder | **SVG-Farben**: Farb-Mapping für Chart-Komponenten |
| SVG-Berechnungen (Chart-Logik) | **Fehlersuche**: manuelles Testen aller Routen und States |
| Deployment (GitLab/GitHub Pages) | **Bulma-Komponenten**: Cards, Modals, Notifications, Formulare |
| Integration + Pair Programming | **Mobile Ansicht testen** |

### Was die Partnerin konkret macht (Beispiele)
- Farbpalette für die App festlegen (z.B. "pastellige Töne für Buch-App")
- Bulma-Klassen in den View-Funktionen setzen: `class "card"`, `class "button is-primary"`
- Leere-Zustände gestalten: "Keine Ergebnisse" mit freundlicher Nachricht
- Bei Detailansicht: Layout mit linkem/rechtem Panel entwerfen
- Hover-Effekte auf Karten testen und Feedback geben

### Pair Programming Sessions
- 1–2x pro Woche zusammen programmieren (jeweils 2h)
- Screenshare via Discord/Meet
- Abwechselnd Code schreiben (sie: HTML/CSS-Teile, du: Elm-Logik)

---

## Woche 4–5: UI + SVG

- Gemeinsam das SVG-Diagramm designen und besprechen
- Partnerin: Bulma-Komponenten einbauen, Farben testen
- Partnerin: Alle Routen manuell durchklicken und Fehler melden
- GitHub Issues / GitLab Boards für Aufgaben nutzen

---

## Woche 6: Präsentation üben

- Partnerin: 2–3 Folien selbst erstellen (z.B. UI-Design, Ziel der App)
- Beide: 10-minütigen Vortrag durchspielen
- Wer sagt was? Aufteilung der Redezeit
- Partnerin kann die UI/UX-Entscheidungen erklären (Farbwahl, Layout, Bulma)

---

## Wichtige Links

| Ressource | URL |
|---|---|
| Elm Guide | https://guide.elm-lang.org/ |
| Ellie (Online-Editor) | https://ellie-app.com |
| Elm Packages | https://package.elm-lang.org/ |
| Bulma Framework | https://bulma.io/ |
| Bulma Dokumentation | https://bulma.io/documentation/ |
| Bulma Components | https://bulma.io/documentation/components/ |
| GitLab Lehre | https://gitlab-lehre.informatik.uni-halle.de/ |
| Learn You an Elm | https://learnyouanelm.github.io/ |
