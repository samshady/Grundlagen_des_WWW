# Projektideen — Eigenentwicklungen

> Alle Ideen hier sind original und nicht aus anderen Proposal-Vorschlägen übernommen.
> Kriterien: Alle Pflichtkomponenten abdeckbar, machbar in 5–6 Wochen, interessant für Präsentation.

---

## Idee 1: Pokédex Browser (⭐ Empfohlen)

**Beschreibung**: Eine Elm-Web-App, die Pokémon-Daten über die freie [PokéAPI](https://pokeapi.co/) lädt. Nutzer können nach Pokémon suchen, sie nach Typ filtern und detaillierte Infos anzeigen lassen. Ein interaktives **SVG-Radardiagramm** visualisiert die Statuswerte (KP, Angriff, Verteidigung, etc.) jedes Pokémon. Die App nutzt Bulma für das Styling und URL-Routing für die Navigation zwischen Suchergebnissen und Detailansichten.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Struktur (Search-Bar, Filter, Kartenansicht, Detail-View) |
| CSS | Bulma Cards, Navbar, Modals, Responsive Grid |
| SVG | **Status-Radardiagramm** pro Pokémon (Typ-abhängig eingefärbt) |
| Elm | Ganze Logik in Elm (TEA, Custom Types für Pokémon-Typen) |
| URL | `/`, `/search?q=...`, `/pokemon/:id`, `/type/:type` |
| HTTP | Fetch von PokéAPI + JSON-Decoder (verschachtelte JSON-Struktur) |

**Warum diese Idee**:
- ✅ Fantastische, freie API (kein API-Key nötig, gut dokumentiert)
- ✅ Visuell sehr ansprechend (Farben, Typ-Icons, SVG-Chart)
- ✅ Natürliche SVG-Nutzung: Radar-Chart ist perfekt für SVG
- ✅ Klares Routing: Suche → Liste → Detail
- ✅ Riesiger "Wow-Faktor" in der Präsentation
- ✅ Erweiterbar: Vergleich zweier Pokémon, Favoriten, Evolution-Chain

**JSON-Herausforderung** (guter Punkt für die Präsentation):
```elm
-- Verschachtelter Decoder für Pokémon-Status
type alias Stats =
    { hp : Int, attack : Int, defense : Int
    , specialAttack : Int, specialDefense : Int, speed : Int }
```

**Mögliche Erweiterungen**:
- Evolution-Chain als SVG-Baum
- Typ-Schwächen/Kräfte-Matrix
- Zufalls-Pokémon-Button
- Dark/Light Mode per CSS

---

## Idee 2: Space Explorer (NASA APIs)

**Beschreibung**: Eine Elm-App, die verschiedene NASA-APIs nutzt: **Astronomy Picture of the Day (APOD)** und **Mars Rover Photos**. Nutzer können APOD-Bilder nach Datum durchstöbern, Mars Rover-Fotos nach Sol (Marstag) filtern und eine interaktive **SVG-Ansicht des Sonnensystems** erkunden, in der Planeten positioniert und animiert sind.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Galerielayout, Detailseiten, Kalenderauswahl |
| CSS | Bulma für dark-theme Layout |
| SVG | **Sonnensystem-Visualisierung** (Planeten positioniert, skalierend, bei Klick Detailinfos) |
| Elm | State-Management für API-Responses, Filter, Caching |
| URL | `/`, `/apod?date=...`, `/mars?sol=...`, `/solarsystem` |
| HTTP | Mehrere NASA-Endpoints (APOD, Mars Photos) + JSON-Decoder |

**API-Key**: Kostenloser API-Key von https://api.nasa.gov/ (sofort, 1000 Req/h)

**Warum diese Idee**:
- ✅ Mehrere API-Endpunkte = reichhaltige HTTP-Nutzung
- ✅ SVG-Sonnensystem ist interaktiv + lehrreich
- ✅ Sehr visuell, toll für Präsentation
- ✅ URL-Routing zwischen verschiedenen "Welten" (APOD, Mars, Solar)
- ✅ Wissenschaftlicher Kontext kommt gut an

**Nachteile**:
- ⚠️ Benötigt API-Key (muss in Config, nicht committed werden)
- ⚠️ Bilder sind groß → Ladezeiten bedenken

---

## Idee 3: Rezept-NutriScanner

**Beschreibung**: Ein Tool, das Nährwertinformationen zu Lebensmitteln visualisiert. Nutzer geben eine Zutat oder ein Gericht ein, die App lädt Daten von der [Open Food Facts API](https://world.openfoodfacts.org/) (freie, offene Datenbank). Ein interaktives **SVG-Pie-Chart + Balkendiagramm** zeigt Makro- und Mikronährstoffe farblich an. Nutzer können mehrere Lebensmittel vergleichen und sehen, wie sie sich zu einer Mahlzeit summieren.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Suchmaske, Produktkarten, Vergleichsansicht |
| CSS | Bulma Cards, Progress-Bars für Nährstoffe |
| SVG | **Pie-Chart + gestapeltes Balkendiagramm** (responsive, interaktiv per Hover) |
| Elm | Komplexe JSON-Decoder (Open Food Facts hat tiefe JSON-Struktur) |
| URL | `/`, `/search?q=...`, `/product/:barcode`, `/compare` |
| HTTP | Open Food Facts API + Barcode-Suche |

**Warum diese Idee**:
- ✅ Open Food Facts ist komplett offen, kein API-Key
- ✅ Barcode-Daten sind real und interessant
- ✅ SVG-Charts sind präsentabel
- ✅ Gute Vergleichbarkeit (Nährwerte nebeneinander)
- ✅ Erweiterbar: Tagesplan, Nährstoffziele, Barcode-Scanner-Integration

**Besonderheit für die Prüfung**: Komplexe JSON-Decoder + geschachtelte Typen in Elm sind gute Prüfungsthemen.

---

## Idee 4: GitStash — GitHub Profil-Explorer

**Beschreibung**: Eine Elm-App, die GitHub-Profile und Repositories über die öffentliche GitHub API erkundet. Nutzer geben einen GitHub-Usernamen ein und sehen das Profil, eine Liste der Repos und Statistiken. Ein **interaktives SVG-Bubble-Chart** visualisiert die Sprachenverteilung aller Repos eines Users, wobei die Größe der Blasen die Anzahl der Projekte in einer Sprache repräsentiert.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Profilkopf (Avatar, Bio, Stats), Repo-Liste |
| CSS | Bulma mit GH-artigem Theme |
| SVG | **Bubble-Chart** der Sprachen (farbkodiert, klickbar → Filter) |
| Elm | Rate-Limit-Handling, Pagination, Error-Handling |
| URL | `/`, `/user/:username`, `/user/:username/repo/:repo` |
| HTTP | GitHub REST API v3 (Users, Repos, Languages) |

**Warum diese Idee**:
- ✅ Praktisch: Jeder kann sein eigenes Profil eingeben
- ✅ GitHub API ist stabil und gut dokumentiert
- ✅ Erweiterbar: Star-Historie, Contributor-Graphen
- ✅ Bubble-Chart als SVG ist technisch interessant

**Nachteile**:
- ⚠️ Rate-Limited (60 Req/h ohne Token, 5000 mit Token)
- ⚠️ Weniger visuell beeindruckend als Pokédex/Space

---

## Idee 5: Movie Night Planner

**Beschreibung**: Eine App, die Filme über die [OMDb API](http://www.omdbapi.com/) sucht und eine Watchlist verwaltet. Nutzer suchen Filme, sehen Details (Poster, Rating, Genre, Plot) und können sie zu einer persönlichen Watchlist hinzufügen. Ein **SVG-Jahresrad** (ring chart) zeigt die Verteilung der Filme nach Jahrzehnt oder Genre.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Suchfeld, Filmkarten, Watchlist |
| CSS | Bulma Cards + Modal für Details |
| SVG | **Ring-Chart** für Genre-Verteilung / Jahresverteilung |
| Elm | Watchlist-State (lokal), HTTP, Routing |
| URL | `/`, `/search?q=...`, `/movie/:id`, `/watchlist` |
| HTTP | OMDb/TMDB API + JSON-Decoder |

**Warum diese Idee**:
- ✅ Sehr intuitiv: Jeder kennt Filme
- ✅ OMDb ist simpel (1 Endpoint, einfaches JSON)
- ✅ Watchlist + SVG-Chart = State-Management + Visualisierung
- ✅ Klar strukturierte Views

---

## Entscheidungsmatrix

| Kriterium | Pokédex | Space Explorer | NutriScanner | GitStash | Movie Night |
|---|---|---|---|---|---|
| API-Qualität | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Kein API-Key nötig | ✅ | ❌ (NASA) | ✅ | ✅* | ❌ (OMDb) |
| Visueller Wow-Effekt | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| SVG-Komplexität | Mittel (Radar) | Mittel-Hoch | Mittel | Mittel | Einfach-Mittel |
| JSON-Decoder-Komplexität | Mittel | Mittel | **Hoch** | Mittel | Einfach |
| Präsentations-Eignung | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Erweiterbarkeit | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |

*\* GitHub mit Token (5000 Req/h) besser nutzbar*

**→ Empfehlung**: Pokédex Browser oder Space Explorer — beide haben hohen Wow-Faktor, gute APIs und natürliche SVG-Nutzung.

---

## Nächste Schritte

1. Mit Partner besprechen welche Idee am meisten begeistert
2. 3–4 Sätze Beschreibung formulieren
3. Im Wiki eintragen (bei Hinneburg zur Genehmigung)
4. Nach Genehmigung: loslegen!
