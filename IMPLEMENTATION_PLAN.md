# Implementation Plan — Pokédex Browser

> Elm web app for Grundlagen des WWW (SS26) — Projektvorstellung: 16. Juli 2026

---

## Overview

A single-page Elm application that queries the PokéAPI, displays Pokémon with search/type filtering, and shows an interactive SVG radar chart for stats. Uses Bulma CSS, `Browser.application` routing, and HTTP JSON decoding.

---

## Architecture

```
Browser.application
  ├── init    → (Model, Cmd Msg)   # Load initial data
  ├── view    → Model → Html Msg   # Render UI
  └── update  → Msg → Model → (Model, Cmd Msg)
```

### Routes

| Route | View | Description |
|---|---|---|
| `/` | Home | Hero search + random Pokémon of the day |
| `/search?q=...` | SearchResults | Card grid of matching Pokémon |
| `/type/:type` | TypeFilter | Filtered by Pokémon type |
| `/pokemon/:id` | Detail | Full detail + SVG radar chart |

---

## Phases

### Phase 0: Environment Setup (today)

- [x] Read all course materials
- [x] Document setup in AGENTS.md / ENVIRONMENT_SETUP.md
- [ ] Install Elm globally via npm
- [ ] Initialize git repo + push to GitHub
- [ ] Create `pokedex-browser/` Elm project
- [ ] Install Elm packages (browser, http, json, url, svg, time)
- [ ] Verify `elm make` compiles a basic app

### Phase 1: Elm Scaffolding + Routing (Jun 8–14)

- [ ] `Main.elm` with `Browser.application` entry point
- [ ] `Types.elm` — all type aliases, custom types (PokemonType, Route, etc.)
- [ ] `Url.Parser` based route matching (Home, Search, TypeFilter, Detail)
- [ ] Navigation: link clicks update URL, `onUrlChange` re-parses route
- [ ] Basic views for each route (placeholder text)
- [ ] `public/index.html` with Bulma CDN + Elm mount point
- [ ] Verify: navigating between routes updates URL and view

### Phase 2: HTTP + JSON Decoders (Jun 8–14)

- [ ] `Api.elm` — all HTTP request functions
- [ ] JSON decoder for Pokémon list (`/pokemon?limit=100`)
- [ ] JSON decoder for single Pokémon detail (`/pokemon/{id}`)
- [ ] JSON decoder for species description (`/pokemon-species/{id}`)
- [ ] JSON decoder for type list (`/type/{type}`)
- [ ] Error handling: `Result Http.Error` → user-friendly messages
- [ ] Loading states: show progress indicator during requests
- [ ] Verify: console.log shows parsed data from PokéAPI

### Phase 3: Home + Search Views with Bulma (Jun 15–21)

- [ ] `Home.elm` — Hero section with search input
- [ ] Random Pokémon of the day (client-side from loaded list)
- [ ] `Search.elm` — search input → filter list → card grid
- [ ] Pokémon cards: sprite, name, type badges (colored)
- [ ] Type filter badge row (all 18 types, clickable)
- [ ] Responsive grid layout with Bulma columns
- [ ] Bulma navbar with active route highlighting
- [ ] Empty state: "No Pokémon found" message
- [ ] Verify: search filters, type badges filter, cards display

### Phase 4: Detail View (Jun 15–21)

- [ ] `Detail.elm` — two-column layout
- [ ] Left: large sprite, name, height/weight, type badges
- [ ] Right: placeholder for SVG chart
- [ ] Abilities list with hidden-ability indicator
- [ ] Species description (flavor text) from 2nd API call
- [ ] Back button → returns to previous search
- [ ] Error state: "Pokémon not found" via Bulma notification
- [ ] Verify: clicking a card navigates to `/pokemon/:id`

### Phase 5: SVG Radar Chart (Jun 22–28)

- [ ] `Svg/Chart.elm` — hexagonal radar chart component
- [ ] 6 axes (HP, Attack, Defense, Sp.Atk, Sp.Def, Speed) at 60° angles
- [ ] Background grid (hexagon rings)
- [ ] Data polygon filled with type color (semi-transparent)
- [ ] Axis labels (stat names)
- [ ] Value labels at each vertex
- [ ] Dynamic scaling: map stat (0–255) to chart radius
- [ ] Color mapping: each Pokémon type → specific hex color
- [ ] Verify: radar chart renders correctly for different Pokémon

### Phase 6: SVG Interactivity (Jun 22–28)

- [ ] Hover on stat vertex → show tooltip with value
- [ ] Click on stat → show modal with explanation
- [ ] Smooth entrance animation (CSS transition on polygon)
- [ ] Responsive: chart scales with viewport
- [ ] Verify: all interactions work in Chrome + Firefox

### Phase 7: Polish + Error Handling (Jun 29 – Jul 6)

- [ ] Bulma loading spinner during all HTTP requests
- [ ] Bulma notification for all error states
- [ ] Rate limiting: debounce search input (300ms)
- [ ] URL history: browser back/forward works correctly
- [ ] 404 route → dedicated "Not Found" view
- [ ] Mobile responsive: cards stack, chart resizes
- [ ] Accessibility: alt texts, ARIA labels, keyboard nav
- [ ] Verify: full user journey (search → filter → detail → back → etc.)

### Phase 8: Deployment (Jun 29 – Jul 6)

- [ ] GitLab Pages CI/CD (`.gitlab-ci.yml`) — if course requires
- [ ] GitHub Pages alternative (optional)
- [ ] Production build: `elm make --optimize`
- [ ] Verify: deployed app works at public URL

### Phase 9: Presentation Prep (Jul 7–15)

- [ ] 2–5 PDF slides
  1. Title + Motivation
  2. Architecture (TEA diagram)
  3. Interesting detail (JSON decoder, SVG chart, routing)
  4. Demo walkthrough
- [ ] Code walkthrough (be able to explain every function)
- [ ] Demo rehearsal with timer (10 min)
- [ ] Slides uploaded to StudIP

---

## File-by-File Implementation Order

```
Phase 0:
  pokedex-browser/elm init
  pokedex-browser/public/index.html
  pokedex-browser/README.md

Phase 1:
  src/Types.elm        — all types
  src/Main.elm         — Browser.application, routing skeleton

Phase 2:
  src/Api.elm          — HTTP + JSON decoders

Phase 3:
  src/Views/Home.elm   — home page
  src/Views/Search.elm — search + results
  src/View.elm         — main view router
  src/Styles.elm       — Bulma helpers

Phase 4:
  src/Views/Detail.elm — detail page

Phase 5–6:
  src/Svg/Chart.elm    — radar chart

Phase 7:
  polish in all files

Phase 8:
  .gitlab-ci.yml (optional)
```

---

## Dependencies

### Elm packages (in `elm.json`)

```json
{
  "elm/browser": "1.0.2",
  "elm/core": "1.0.5",
  "elm/http": "2.0.0",
  "elm/json": "1.1.3",
  "elm/url": "1.0.0",
  "elm/svg": "1.0.1",
  "elm/time": "1.0.0"
}
```

### External (CDN)

- Bulma CSS 0.9.4 (via CDN in `index.html`)

---

## Testing Strategy

| Test type | Method |
|---|---|
| Elm compilation | `elm make` succeeds |
| Routing | Click links, check URL bar |
| HTTP | PokéAPI responses in browser dev tools |
| SVG | Visual inspection of chart rendering |
| Responsive | Resize browser, check mobile view |
| Error handling | Disconnect network, check error UI |

---

## Key Technical Decisions

1. **Client-side search**: Load 100+ Pokémon on init, filter in Elm (no API search endpoint)
2. **Two HTTP calls for detail**: `/pokemon/{id}` for stats + `/pokemon-species/{id}` for description
3. **Type colors as Elm function**: `PokemonType -> String` mapping (no CSS class per type)
4. **SVG viewBox**: Use `viewBox="0 0 300 300"` for responsive chart scaling
5. **No Elm ports**: All JS interaction via CDN (Bulma modals via CSS classes only)
