# Pokédex Browser — Projektplan (Referenz)

> Dies war eine ursprünglich empfohlene Projektidee. Nach weiterer Überlegung ist sie
> zurückgestellt — das finale Projekt wird mit der Partnerin abgestimmt.
> Diese Datei dient als **technische Referenz** für den Aufbau eines Elm-Projekts
> mit vergleichbarer Komplexität (4 Routen, externe API, HTTP + JSON, SVG-Chart).

---

## Kurzbeschreibung (für Proposal)

> Wir möchten einen Pokédex Browser als Elm-Web-App entwickeln. Die App lädt Pokémon-Daten von der freien PokéAPI und stellt sie übersichtlich dar. Nutzer können nach Pokémon suchen, sie nach Typ filtern und detaillierte Infos mit einem interaktiven SVG-Radardiagramm der Statuswerte anzeigen lassen. Die App nutzt Bulma für CSS, `Browser.application` für URL-Routing und HTTP-Anfragen zum Nachladen der JSON-Daten.

---

## Architektur

### Elm (TEA)

```
Browser.application
  ├── init        → Model + Cmd (Lade Startdaten)
  ├── view        → Html Msg (Bulma Cards + SVG)
  └── update      → Model + Cmd Msg
       ├── SearchQuery         → Query speichern
       ├── FetchPokemon        → HTTP-Request starten
       ├── GotPokemonList (Result) → Suchergebnisse oder Fehler
       ├── SelectPokemon       → Detail laden
       ├── GotPokemonDetail (Result) → Detail-Daten
       ├── FilterByType        → Type-Filter umschalten
       ├── LinkClicked         → URL-Navigation
       └── UrlChanged          → Route parsen
```

### Routes

| URL | View | Beschreibung |
|---|---|---|
| `/` | Home | Willkommensseite mit zufälligem Pokémon + Suchfeld |
| `/search?q=pikachu` | SearchResults | Suchergebnisse als Kartenraster |
| `/type/fire` | TypeFilter | Nach Pokémon-Typ gefiltert |
| `/pokemon/25` | Detail | Vollständige Details + SVG-Radar-Chart |

### Model

```elm
type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    , searchQuery : String
    , pokemonList : List PokemonSummary
    , selectedPokemon : Maybe PokemonDetail
    , typeFilter : Maybe PokemonType
    , loading : Bool
    , error : Maybe String
    }

type alias PokemonSummary =
    { id : Int
    , name : String
    , types : List PokemonType
    , spriteUrl : String
    }

type alias PokemonDetail =
    { id : Int
    , name : String
    , height : Int
    , weight : Int
    , types : List PokemonType
    , abilities : List String
    , stats : Stats
    , spriteUrl : String
    , description : String
    }

type alias Stats =
    { hp : Int
    , attack : Int
    , defense : Int
    , specialAttack : Int
    , specialDefense : Int
    , speed : Int
    }

type PokemonType
    = Normal | Fire | Water | Electric | Grass | Ice
    | Fighting | Poison | Ground | Flying | Psychic
    | Bug | Rock | Ghost | Dragon | Dark | Steel | Fairy
```

---

## API Integration

**Basis-URL**: `https://pokeapi.co/api/v2/`

| Funktion | Endpoint |
|---|---|
| Pokémon-Suche | `/pokemon?limit=100&offset=0` (dann filtern) |
| Pokémon by Name/ID | `/pokemon/{name or id}` |
| Typ-Liste | `/type/{type}` |
| Art-Beschreibung | `/pokemon-species/{id}` |

**JSON-Decoder** (verschachtelt):

```elm
-- PokéAPI liefert tiefe JSON-Strukturen, z.B.:
-- { "stats": [ { "base_stat": 35, "stat": { "name": "hp" } }, ... ]
--   "types": [ { "slot": 1, "type": { "name": "electric" } }, ... ]
--   "abilities": [ { "ability": { "name": "static" }, "is_hidden": false }, ... ] }

pokemonDetailDecoder : Decoder PokemonDetail
pokemonDetailDecoder =
    Decode.map8 PokemonDetail
        (Decode.field "id" Decode.int)
        (Decode.field "name" Decode.string)
        (Decode.field "height" Decode.int)
        (Decode.field "weight" Decode.int)
        (Decode.field "types" (Decode.list typeDecoder))
        (Decode.field "abilities" (Decode.list abilityDecoder))
        (statsDecoder)
        (Decode.field "sprites" (Decode.field "front_default" Decode.string))
        (Decode.succeed "") -- species description via 2nd HTTP call
```

Das ist ein guter Punkt für die Präsentation: **Wie man verschachtelte JSON-Decoder in Elm baut**.

---

## SVG-Komponente: Status-Radardiagramm

Ein hexagonales Radar-Chart in SVG, das die 6 Basis-Statuswerte visualisiert.

**Technische Umsetzung**:
- 6 Achsen (HP, Attack, Defense, Sp.Atk, Sp.Def, Speed) im 60°-Winkel
- Jeder Wert wird auf die Achse skaliert (max 255)
- Polygon verbindet die Werte → ergibt eine "Spinne"
- Farbe je nach primärem Pokémon-Typ (z.B. Rot für Fire, Blau für Water)
- Hover über einem Wert → Tooltip mit Zahlenwert
- Animation beim Laden (SVG mit CSS-Animation)

```elm
-- SVG-Radar-Chart in Elm
radarChart : Stats -> PokemonType -> Svg Msg
radarChart stats primaryType =
    let
        center = 150
        radius = 120
        -- ... trigonometrische Berechnung der 6 Eckpunkte
    in
    svg [ width "300", height "300", viewBox "0 0 300 300" ]
        [ -- Hintergrund-Hexagon (Netzlinien)
          polygon [ fill "none", stroke "#ccc" ] [ ... ]
          -- Daten-Polygon (gefüllt mit Typ-Farbe, semi-transparent)
        , polygon [ fill typeColor, fillOpacity "0.3", stroke typeColor ] [ ... ]
          -- Achsenbeschriftungen
        , text' [ x "...", y "..." ] [ text "HP" ]
          -- ... weitere Labels
        ]
```

**Interaktivität**: Klick auf eine Status-Kategorie → zeigt Erklärung des Werts in einem Modal.

---

## UI-Design (Bulma)

- **Home**: Suchfeld (hero section) + zufälliges Pokémon als "Pokémon des Tages"
- **Search Results**: Card-Grid mit Sprite, Name, Typ-Badges
- **Type Filter**: Badge-Leiste mit allen 18 Typen (farbkodiert), klickbar
- **Detail**: Zwei Spalten: Links Sprite + Info, Rechts SVG-Radar-Chart
- **Loading**: Bulma Progress-Bar während HTTP-Requests
- **Error**: Bulma Notification bei Fehlern

---

## Aufgabenverteilung (2 Personen)

### Person A (Du — Erfahrung)
- Elm-Projekt-Struktur + `elm init`
- `Browser.application` + Routing (`Url.Parser`)
- HTTP-Requests + verschachtelte JSON-Decoder
- Pagination / API-Offset-Management
- Deployment (GitLab Pages)

### Person B (Partnerin — lernt)
- HTML-Views mit Bulma (Home, SearchResults, Detail)
- Typ-Badges + Farbzuordnung (Custom Types → CSS)
- SVG-Radar-Chart (Berechnung + Elm-SVG)
- Testen + Edge Cases (was wenn API fehlschlägt?)
- README + Wiki-Eintrag pflegen

### Gemeinsam
- Type-Filter-Logik
- Integration der Teile (Pair Programming)
- Feintuning + UI-Polish
- Präsentation üben

---

## Zeitplan (6 Wochen)

### Woche 1 (8.–14. Juni)
- [ ] Elm-Projekt initialisieren + Pakete installieren
- [ ] `Browser.application` mit 4 Routen
- [ ] Pokémon-Liste via HTTP laden + JSON-Decoder
- [ ] Basis-Views: Home + SearchResults

### Woche 2 (15.–21. Juni)
- [ ] Detail-View: Sprite, Typen, Fähigkeiten, Maße
- [ ] Suchfunktion (client-seitig filtern)
- [ ] Bulma-CSS: Cards, Grid, Navbar, Hero
- [ ] GitLab Pages Deployment

### Woche 3 (22.–28. Juni)
- [ ] SVG-Radar-Chart (Berechnung + Rendering)
- [ ] Typ-Filter (Badge-Leiste + Filter-Logik)
- [ ] Fehlerbehandlung + Loading-States

### Woche 4 (29. Juni – 6. Juli)
- [ ] Pokémon-Species-Beschreibung (2. HTTP-Call)
- [ ] Type-Color-Mapping auf SVG anwenden
- [ ] URL-History (Back/Forward) testen
- [ ] Polishing + Bugfixing

### Woche 5 (7.–13. Juli)
- [ ] Präsentationsfolien (2–5 PDF)
- [ ] Code-Dokumentation + README
- [ ] Demo durchspielen + Timer

### Woche 6 (14.–15. Juli)
- [ ] Letzter Feinschliff
- [ ] Deployment-Check
- [ ] Folien in StudIP hochladen

### Vorstellung: **16. Juli 2026**

---

## Proposal-Text (zum Kopieren)

> Wir möchten einen Pokédex Browser als Elm-Web-App entwickeln. Die App lädt Pokémon-Daten von der freien PokéAPI und stellt sie übersichtlich dar. Nutzer können nach Pokémon suchen, sie nach Typ filtern und detaillierte Infos anzeigen lassen. Ein interaktives SVG-Radardiagramm visualisiert die Statuswerte jedes Pokémon farbkodiert nach Typ. Die App nutzt Bulma für CSS, `Browser.application` für URL-Routing und HTTP-Anfragen zum Nachladen der JSON-Daten.

---

## Ressourcen

- **PokéAPI**: https://pokeapi.co/ (kein API-Key nötig!)
- **API Docs**: https://pokeapi.co/docs/v2
- **Elm HTTP Guide**: https://guide.elm-lang.org/effects/http.html
- **Elm JSON Guide**: https://guide.elm-lang.org/effects/json.html
- **Elm URL/Navigation Guide**: https://guide.elm-lang.org/webapps/navigation.html
- **Bulma**: https://bulma.io/
- **SVG Radar Chart Inspiration**: https://www.svggrenada.com/radar-chart
