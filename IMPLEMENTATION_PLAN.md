# Implementation Plan — Elm Web App (Project TBD)

> Elm web app for Grundlagen des WWW (SS26) — Projektvorstellung: 16. Juli 2026
> Project idea not yet finalized. This plan outlines the general structure; specifics will be filled in once the project is approved by Hinneburg.

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
| `/` | Home | Landing page / hero |
| `/search?q=...` | SearchResults | Search results |
| `/item/:id` | Detail | Detail view with SVG |
| ... | ... | Project-specific routes |

---

## Phases

### Phase 0: Environment Setup ✅ (24–28 May)

- [x] Read all course materials
- [x] Install Elm (npm) + verify compilation
- [x] Initialize git repo + push to GitHub
- [x] Set up `pokedex-browser/` Elm project scaffold
- [x] Install Elm packages (browser, http, json, url, svg)
- [x] Create dev docs: AGENTS.md, ENVIRONMENT_SETUP.md, IMPLEMENTATION_PLAN.md

### Phase 1: Elm Grundlagen (24–31 May)

- [ ] Elm Guide: core language, types, TEA
- [ ] `elm repl` practice
- [ ] Custom types, pattern matching, list operations
- [ ] Ellie app: Aufgaben 01–03 (Adresse, Imagemap, Bulma)
- [ ] Ellie app: Aufgabe 04 (SVG interaktiv)
- [ ] **Erfolgskriterium**: Lauffähiges Elm-Programm mit SVG + Bulma

### Phase 2: Project Selection + Proposal (1–7 Jun)

- [ ] Finalize project idea with partner
- [ ] 3–4 sentence description
- [ ] Submit proposal in StudIP wiki (Hinneburg approval)
- [ ] Set up GitLab repo (if required for deployment)
- [ ] Onboard partner to git basics

### Phase 3: Elm Scaffolding + Routing (8–14 Jun)

- [ ] `Main.elm` — `Browser.application` entry point
- [ ] `Types.elm` — all type aliases, custom types, Route type
- [ ] `Url.Parser` based route matching (project-specific routes)
- [ ] Navigation: `LinkClicked` + `UrlChanged` handlers
- [ ] Basic placeholder views for each route
- [ ] `public/index.html` with Bulma CDN + Elm mount point
- [ ] Verify: navigating between routes updates URL and view

### Phase 4: HTTP + JSON Decoders (8–14 Jun)

- [ ] `Api.elm` — all HTTP request functions
- [ ] JSON decoder(s) for chosen API
- [ ] Error handling: `Result Http.Error` → user-friendly messages
- [ ] Loading states: show progress indicator during requests

### Phase 5: Views with Bulma (15–21 Jun)

- [ ] Home view with hero/search
- [ ] List/card view for search results
- [ ] Detail view (two-column: info + SVG)
- [ ] Bulma navbar, cards, grid, modals
- [ ] Responsive layout
- [ ] Empty/error states

### Phase 6: Interactive SVG (22–28 Jun)

- [ ] SVG component that responds to model state
- [ ] Mouse events (hover, click) on SVG elements
- [ ] Responsive via `viewBox`
- [ ] Color mapping tied to data

### Phase 7: Polish + Error Handling (29 Jun – 6 Jul)

- [ ] Loading spinner for all HTTP requests
- [ ] Notification for all error states
- [ ] URL history: browser back/forward works correctly
- [ ] 404 route → "Not Found" view
- [ ] Mobile responsive
- [ ] Accessibility: alt texts, ARIA labels

### Phase 8: Deployment (29 Jun – 6 Jul)

- [ ] GitLab Pages CI/CD (`.gitlab-ci.yml`) — if course requires
- [ ] GitHub Pages alternative (optional)
- [ ] Production build: `elm make --optimize`

### Phase 9: Presentation Prep (7–15 Jul)

- [ ] 2–5 PDF slides:
  1. Title + Motivation
  2. Architecture (TEA diagram)
  3. Interesting technical detail (JSON decoder, SVG, routing)
  4. Demo walkthrough
- [ ] Code walkthrough (explain every function)
- [ ] Demo rehearsal with timer (10 min)
- [ ] Slides uploaded to StudIP

---

## File Structure (Template — adjust per project)

```
pokedex-browser/            # Elm project directory
├── elm.json
├── src/
│   ├── Main.elm            # Browser.application entry point
│   ├── Types.elm           # Model, domain types, Route type
│   ├── Api.elm             # HTTP requests + JSON decoders
│   ├── View.elm            # Main view router
│   ├── Views/
│   │   ├── Home.elm        # Home page
│   │   ├── Search.elm      # Search / list results
│   │   └── Detail.elm      # Detail view with SVG
│   ├── Svg/
│   │   └── Chart.elm       # Interactive SVG component
│   └── Styles.elm          # Bulma CSS helpers
├── public/
│   └── index.html          # HTML shell
└── README.md
```

## Dependencies (Elm packages)

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
| 7 Jun | Project approved + repo ready | ☐ |
| 21 Jun | MVP deployed | ☐ |
| 6 Jul | Project finished + tested | ☐ |
| 15 Jul | Slides uploaded | ☐ |
| **16 Jul** | **Projektvorstellung** | ☐ |
| August | Mündliche Prüfung | ☐ |

---

## Key Technical Decisions (to be refined per project)

1. **Client-side vs server-side search**: Depends on API
2. **SVG type**: Radar chart, bubble chart, network graph, etc. — depends on data
3. **API selection**: Finalized after project approval
4. **JS interop via ports**: Only if absolutely necessary (optional features)
5. **Deployment target**: GitLab Pages (course requirement) or GitHub Pages

---

## Project Ideas (from Plan/02_Project_Ideas.md — under consideration)

| Idea | API | SVG | Wow Factor |
|---|---|---|---|
| Pokédex Browser | PokéAPI (free, no key) | Radar chart | ⭐⭐⭐⭐⭐ |
| Space Explorer | NASA APIs (free key) | Solar system | ⭐⭐⭐⭐⭐ |
| NutriScanner | Open Food Facts (free) | Pie/bar chart | ⭐⭐⭐⭐ |
| GitStash | GitHub API (rate-limited) | Bubble chart | ⭐⭐⭐ |
| Movie Night Planner | OMDb API (free key) | Ring chart | ⭐⭐⭐ |

**→ Final decision pending partner discussion + Hinneburg approval**
