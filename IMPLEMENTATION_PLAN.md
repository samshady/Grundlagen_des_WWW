# Implementation Plan — Elm Web App

> Elm web app for Grundlagen des WWW (SS26) — Projektvorstellung: 16. Juli 2026
> Project idea not yet finalized with partner. Plan stays adaptable until proposal is approved by Hinneburg.

---

## Design Principles

- **Clean, not complex**: A well-polished app with 3–4 routes beats a sprawling one
- **Fun but grounded**: Relatable topic, not trying to impress with complexity
- **Tastefully technical**: Demonstrates Elm concepts naturally, not forced
- **Partner-friendly**: Clear visual tasks (UI/Styling/Testing) for the newbie partner
- **Presentation-ready**: Enough material to fill 10 min talk + 5 min Q&A + 2–5 slides without overcomplicating

---

## Constraints (from course requirements)

| Component | Requirement |
|---|---|
| HTML | Standard structural elements |
| CSS | Bulma CSS Framework |
| SVG | Interactive SVG that changes with model state |
| **Elm** | Core logic in Elm (TEA). JS only for optional extras |
| **URL Navigation** | `Browser.application` with routing + browser history |
| **HTTP** | Data loaded via HTTP + JSON decoder |
| **Presentation** | 2–5 PDF slides, 10 min talk + 5 min Q&A |

---

## Architecture (TEA — The Elm Architecture)

```
Browser.application
  ├── init    → (Model, Cmd Msg)
  ├── view    → Model → Html Msg
  └── update  → Msg → Model → (Model, Cmd Msg)
```

### Typical Routes (adjust per project)

| Route | View | Description |
|---|---|---|
| `/` | Home | Landing page with search |
| `/search?q=...` | Results | Search results as card grid |
| `/item/:id` | Detail | Detail view with SVG chart |
| ... | ... | Optional project-specific routes |

---

## Phases

### Phase 0: Environment Setup ✅ (24–28 May)

- [x] Read all course materials
- [x] Install Elm (npm) + verify compilation
- [x] Initialize git repo + push to GitHub
- [x] Set up Elm project scaffold (`pokedex-browser/`)
- [x] Install Elm packages (browser, http, json, url, svg)
- [x] Create dev docs: AGENTS.md, ENVIRONMENT_SETUP.md, IMPLEMENTATION_PLAN.md

### Phase 1: Elm Grundlagen (24–31 May)

- [ ] Work through Elm Guide: core language, types, TEA
- [ ] `elm repl` practice
- [ ] Custom types, pattern matching, list operations
- [ ] Ellie app: Aufgaben 01–03 (Adresse, Imagemap, Bulma)
- [ ] Ellie app: Aufgabe 04 (SVG interaktiv)
- [ ] **Erfolgskriterium**: Lauffähiges Elm-Programm mit SVG + Bulma

### Phase 2: Project Selection + Proposal (1–7 Jun)

- [ ] Brainstorm with partner, pick an idea from the shortlist
- [ ] Write 3–4 sentence description
- [ ] Submit in StudIP wiki (wait for Hinneburg approval)
- [ ] Set up GitLab repo (if required for deployment)
- [ ] Onboard partner: git clone, basic add/commit/push

### Phase 3: Elm Scaffolding + Routing (8–14 Jun)

- [ ] `Main.elm` — `Browser.application` entry point
- [ ] `Types.elm` — model types, custom types, Route type
- [ ] `Url.Parser` based route matching (3–4 routes max)
- [ ] Navigation: `LinkClicked` + `UrlChanged` handlers
- [ ] Basic placeholder views for each route (plain text)
- [ ] `public/index.html` with Bulma CDN + Elm mount point
- [ ] Verify: clicking links updates URL bar and view

### Phase 4: HTTP + JSON Decoders (8–14 Jun)

- [ ] `Api.elm` — HTTP request functions for chosen API
- [ ] JSON decoder(s) for the API response
- [ ] Error handling: user-friendly messages on failure
- [ ] Loading states: Bulma progress indicator during requests

### Phase 5: Views with Bulma (15–21 Jun) ← Partner focus area

- [ ] Home view with hero section + search bar
- [ ] Card grid for search results (Bulma columns)
- [ ] Detail view (two-column: info panel + SVG area)
- [ ] Bulma navbar, cards, responsive grid, typography
- [ ] Empty state ("No results found")
- [ ] Consistent color scheme and spacing

### Phase 6: Interactive SVG (22–28 Jun)

- [ ] SVG chart component that responds to model state
- [ ] Basic mouse interactivity (hover/click on SVG elements)
- [ ] `viewBox` for responsive scaling
- [ ] Colors tied to data (simple mapping)
- [ ] Keep the SVG clean — a donut/bar/radar chart is enough

### Phase 7: Polish + Error Handling (29 Jun – 6 Jul)

- [ ] Loading spinner for all HTTP requests
- [ ] Bulma notification for error states
- [ ] URL history: browser back/forward works correctly
- [ ] 404 route → clean "Not Found" view
- [ ] Mobile responsive for common screen sizes
- [ ] Minor accessibility (alt texts on images, readable contrast)

### Phase 8: Deployment (29 Jun – 6 Jul)

- [ ] GitLab Pages (if course requires it)
- [ ] Or GitHub Pages (simpler alternative)
- [ ] Production build: `elm make --optimize`

### Phase 9: Presentation Prep (7–15 Jul)

- [ ] 2–5 PDF slides:
  1. Title + Motivation (why this app, what problem does it solve)
  2. Architecture (TEA: Model/View/Update diagram)
  3. One interesting technical detail (JSON decoder, SVG, or routing)
  4. Demo (walk through the app live)
- [ ] Practice: run through the entire 10 min demo
- [ ] Slides uploaded to StudIP

---

## Partner Role: UI/Styling + Testing

Your partner (new to programming) will own:
- **Bulma styling**: colors, spacing, card layouts, responsive grid
- **HTML structure of views**: home page, search results, detail page
- **Testing**: manually click through routes, check error states, mobile view
- **Optional**: help with SVG color mapping (type → color as Elm function)

You handle: Elm architecture, HTTP/JSON, routing logic, SVG calculations, deployment.

---

## File Structure (Template — rename after project is chosen)

```
pokedex-browser/            # Elm project directory (will be renamed)
├── elm.json
├── src/
│   ├── Main.elm            # Browser.application entry point
│   ├── Types.elm           # Model, domain types, Route type
│   ├── Api.elm             # HTTP requests + JSON decoders
│   ├── View.elm            # Main view router
│   ├── Views/
│   │   ├── Home.elm        # Home page
│   │   ├── Search.elm      # Search results / list view
│   │   └── Detail.elm      # Detail view with SVG
│   ├── Svg/
│   │   └── Chart.elm       # Interactive SVG component
│   └── Styles.elm          # Bulma CSS class helpers
├── public/
│   └── index.html          # HTML shell
└── README.md
```

---

## Dependencies

### Elm packages

```bash
elm install elm/browser     # Browser.application
elm install elm/http        # HTTP requests
elm install elm/json        # JSON decoding
elm install elm/url         # URL parsing + routing
elm install elm/svg         # SVG rendering
```

### External (CDN)

- Bulma CSS 0.9.4 (via CDN in `index.html`)

---

## Timeline

| Date | Milestone | Status |
|---|---|---|
| 31 May | Elm Grundlagen sitzen | ☐ |
| 4 Jun | Project proposal submitted | ☐ |
| 7 Jun | Project approved + scaffold set up | ☐ |
| 21 Jun | MVP running on localhost | ☐ |
| 6 Jul | Project finished + tested | ☐ |
| 15 Jul | Slides uploaded | ☐ |
| **16 Jul** | **Projektvorstellung** | ☐ |
| August | Mündliche Prüfung | ☐ |

---

## Project Ideas (under consideration — to discuss with partner)

| Idea | API | SVG Angle | Partner Appeal |
|---|---|---|---|
| **Book Search** ⭐ | Open Library (free, no key) | Genre donut chart / reading timeline | Book lovers, pretty book card UI |
| **Makeup Shade Explorer** | Makeup API (free, no key) | Color swatch grid / price distribution | Fashion/skincare, visual + colorful |
| **Flashcard Study App** | Self-made or Open Trivia DB | Study progress chart | Useful for uni, student tool |
| **Grade Tracker** | No API (local data + HTTP for fun) | Grade distribution chart | Useful for uni, student tool |

**Not pursuing**: Pokédex (too game-y for your taste), Cocktail Explorer, Space Explorer (API key hassle), GitStash (rate limits), Movie Night (API key), NutriScanner (overly complex JSON), UniKino (scraping, not JSON).

→ **Final decision**: discuss with partner after the 4 June lecture, submit proposal by 7 June.
