# Elm Installation & Dev-Setup

---

## Elm installieren (lokal)

```bash
# Via npm (empfohlen, Node.js vorausgesetzt)
npm install -g elm

# Oder via Binary
# Siehe: https://guide.elm-lang.org/install.html
```

## Projekt initialisieren

```bash
mkdir uni-project
cd uni-project
elm init
```

Das erstellt:
- `elm.json` — Paket-Konfiguration
- `src/Main.elm` — Haupt-Datei

## Nötige Pakete installieren

```bash
elm install elm/browser
elm install elm/http
elm install elm/json
elm install elm/url
elm install elm/svg
```

## Kompilieren & Ausführen

```bash
# Einmalig kompilieren
elm make src/Main.elm --output=main.js

# Mit Reactor (Entwicklungsserver)
elm reactor
# → http://localhost:8000

# Für Produktion (minimiert)
elm make src/Main.elm --optimize --output=main.js
```

## Projekt-Struktur

```
uni-project/
├── elm.json
├── src/
│   ├── Main.elm         # Einstiegspunkt (Browser.application)
│   ├── Types.elm        # Model, Domain-Types, Route-Types
│   ├── Api.elm          # HTTP-Requests + JSON-Decoder
│   ├── View.elm         # Haupt-View mit Routing
│   ├── Views/
│   │   ├── Home.elm     # Startseite
│   │   ├── Closet.elm   # Garderoben-Ansicht
│   │   └── About.elm    # Projekt-Info
│   ├── Svg/
│   │   └── OutfitPreview.elm  # Outfit-Visualisierung
│   └── Styles.elm       # CSS-Klassen (Bulma)
├── public/
│   └── index.html       # HTML-Einstiegsseite
└── README.md
```

---

## GitLab Pages Deployment

### 1. Repo auf gitlab-lehre anlegen

Auf https://gitlab-lehre.informatik.uni-halle.de/ → New Project

### 2. `.gitlab-ci.yml` (CI/CD)

```yaml
image: node:latest

pages:
  stage: deploy
  script:
    - npm install -g elm
    - elm make src/Main.elm --optimize --output=public/main.js
  artifacts:
    paths:
      - public
  only:
    - main
```

### 3. HTML (`public/index.html`)

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Smart Wardrobe Planner</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<body>
  <div id="elm-app"></div>
  <script src="main.js"></script>
  <script>
    var app = Elm.Main.init({ node: document.getElementById('elm-app') });
  </script>
</body>
</html>
```

---

## Elm Basics (Cheat Sheet)

### TEA — The Elm Architecture

```elm
-- MODEL
type alias Model = { ... }

-- MSG
type Msg = ... | ...

-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )

-- VIEW
view : Model -> Html Msg
```

### Wichtige Funktionen

```elm
-- HTTP-Request
loadWardrobeData : Cmd Msg
loadWardrobeData =
    Http.get
        { url = "/items.json"
        , expect = Http.expectJson GotWardrobeData wardrobeDecoder
        }

-- JSON-Decoder mit andThen (für bedingte Decodierung)
wardrobeDecoder : Decoder WardrobeData
decoder =
    Decode.map2 WardrobeData
        (Decode.field "dresses" ...)
        (Decode.field "jackets" ...)

-- URL-Parsing
parseRoute : Url.Url -> Route
parseRoute url =
    case url.path of
        "/search" -> Search (url.query |> Maybe.withDefault "")
        _ -> Home
```

---

## Häufige Fehler & Lösungen

| Fehler | Lösung |
|---|---|
| `-- NO JS MODULE SYSTEM --` | Mit `--output=main.js` kompilieren |
| `Http.expectJson` erwartet `(Result Error a -> msg)` | `GotWardrobeData`-Msg muss `Result` wrappen |
| SVG-Klassen nicht sichtbar | `Svg.Attributes.class` statt `Html.Attributes.class` verwenden |
| CORS-Fehler in Ellie | Proxy `https://cors-anywhere.herokuapp.com/` nutzen |
| `Browser.application` braucht `key` im Model | `Nav.Key`-Feld im Model ergänzen |
