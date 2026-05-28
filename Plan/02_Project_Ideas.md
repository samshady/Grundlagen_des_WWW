# Projektideen — Brainstorming

> Alle Ideen hier sind original und nicht aus anderen Proposal-Vorschlägen übernommen.
> Kriterien: Alle Pflichtkomponenten abdeckbar, machbar in 5–6 Wochen, interessant für Präsentation.
>
> **Wichtig**: Clean > komplex. Lieber eine kleine, runde App als ein überladenes Projekt.
> Ziel ist eine saubere Präsentation, nicht ein "Advanced Project".

---

## Idee 1: Book Search & Reading List (⭐ Empfohlen)

**Beschreibung**: Eine Elm-Web-App, die Bücher über die [Open Library API](https://openlibrary.org/developers/api) sucht. Nutzer geben einen Titel oder Autor ein und erhalten eine Liste mit Ergebnissen. Jedes Buch zeigt Cover, Titel, Autor und Erscheinungsjahr. In der Detailansicht gibt es eine ausführliche Beschreibung und ein **interaktives SVG-Donut-Chart**, das die Verteilung der Genres oder Erscheinungsjahrzehnte visualisiert. Bücher können zu einer persönlichen Leseliste hinzugefügt werden.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Suchmaske, Buchkarten, Detailansicht, Leseliste |
| CSS | Bulma Cards, Navbar, Responsive Grid, Modal für Details |
| SVG | **Donut-/Ring-Chart** für Genre-Verteilung oder Lesestatistik |
| Elm | TEA, Route-Typen, Leseliste im Model |
| URL | `/`, `/search?q=...`, `/book/:key`, `/readinglist` |
| HTTP | Open Library Search API + Books API (kein API-Key!) |

**Warum diese Idee**:
- ✅ Open Library: frei, kein API-Key, gut dokumentiert, CORS-freundlich
- ✅ Bücher sind universell — jeder versteht das Thema sofort
- ✅ Klare Route-Struktur: Suche → Liste → Detail → Leseliste
- ✅ Natürliches SVG: Genre-Verteilung als Donut-Chart
- ✅ Partner kann sich an ansprechenden Buchkarten austoben
- ✅ Nützlich: eine Leseliste ist ein echtes Feature

**JSON-Beispiel** (tasteful technical depth):
```elm
-- Open Library JSON ist flach genug für einen sauberen Decoder
type alias Book =
    { key : String
    , title : String
    , author : Maybe String
    , coverUrl : Maybe String
    , firstPublishYear : Maybe Int
    }
```

---

## Idee 2: Makeup Shade Explorer

**Beschreibung**: Eine Elm-Web-App, die Makeup-Produkte über die [Makeup API](https://makeup-api.herokuapp.com/) durchsucht. Nutzer können nach Marke, Produkttyp (Lippenstift, Lidschatten, Foundation, etc.) und Farbe filtern. Ein **interaktives SVG-Farbfeld** zeigt verfügbare Farbtöne als klickbare Swatches. Die Detailansicht zeigt Preis, Bewertung, Produktbild und Beschreibung.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Such-/Filter-Maske, Produktkarten, Detailansicht |
| CSS | Bulma mit pastelligen/swatch-artigen Farbschemata |
| SVG | **Farb-Swatch-Raster** — klickbare Farbfelder, die nach Farbfamilie sortiert sind |
| Elm | Filter-Logik, State-Management für ausgewählte Produkte |
| URL | `/`, `/search?brand=...`, `/product/:id`, `/compare` |
| HTTP | Makeup API (frei, kein API-Key, einfaches JSON) |

**Warum diese Idee**:
- ✅ Partner-Thema: Makeup/Skincare ist nah an ihren Interessen
- ✅ API ist simpel: flaches JSON, kein API-Key
- ✅ SVG-Swatches sind visuell und interaktiv (klickbar = Filter)
- ✅ "Shade Finder" — nützliches Konzept (welcher Lippenstift passt zu mir?)
- ✅ Vergleichsfunktion ist eine nette Erweiterung

**API-Hinweis**: Die Makeup API liefert Produkte mit `product_colors` als Array von Hex-Farben — ideal für SVG-Swatch-Rendering.

---

## Idee 3: Flashcard Study App

**Beschreibung**: Eine Karteikarten-Lern-App in Elm. Nutzer können Kartensets zu verschiedenen Themen erstellen und durchgehen. Ein **SVG-Fortschrittsbalken** zeigt den Lernfortschritt an. Optional: Kartendaten über die [Open Trivia DB](https://opentdb.com/api_config.php) als JSON nachladen.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Karteneditor, Lernansicht, Set-Übersicht |
| CSS | Bulma Cards, Flip-Animation (CSS), Progress-Bar |
| SVG | **Fortschrittsbalken / Ring** — visuelles Lern-Feedback |
| Elm | Karten-State (gewusst/nicht gewusst), Session-Management |
| URL | `/`, `/sets`, `/sets/:id/learn`, `/sets/:id/edit` |
| HTTP | Optional: Open Trivia DB API für vorgefertigte Fragen |

**Warum diese Idee**:
- ✅ Super nützlich fürs Studium — jeder kann es brauchen
- ✅ Klare, einfache Datenstruktur (Liste von Karten mit Frage/Antwort)
- ✅ SVG-Fortschrittsanzeige ist simpel, aber effektiv
- ✅ Partner kann UI/UX gestalten (schöne Karten-Layouts)
- ✅ Ohne API-Key, ohne externe Abhängigkeiten
- ✅ Trivia-DB ist optionale Erweiterung (HTTP-Pflichtkomponente sichern)

**Einschränkung**: Ohne Open Trivia DB müsste die HTTP-Komponente anders erfüllt werden (z.B. JSON-Datei lokal laden oder eigene Mini-API).

---

## Idee 4: Grade Tracker (Notenrechner)

**Beschreibung**: Ein Tool zur Verwaltung und Visualisierung von Studienleistungen. Nutzer tragen Module, Credits und Noten ein. Die App berechnet den aktuellen Notenschnitt und zeigt mit einem **SVG-Balkendiagramm** die Notenverteilung über alle Module an.

**Pflichtkomponenten**:
| Komponente | Umsetzung |
|---|---|
| HTML | Modul-Liste, Noten-Formular, Statistik-Ansicht |
| CSS | Bulma mit cleanem, sachlichem Design |
| SVG | **Balkendiagramm** für Notenverteilung (interaktiv: hover zeigt Details) |
| Elm | Berechnungslogik, Filter (Semester, Fachbereich) |
| URL | `/`, `/grades`, `/grades/add`, `/stats` |
| HTTP | Noten aus einer JSON-Datei laden / Beispiel-Datensatz fetchen |

**Warum diese Idee**:
- ✅ Extrem nützlich — echter Mehrwert für den Studienalltag
- ✅ Keine externe API nötig → volle Kontrolle
- ✅ HTTP-Pflichtkomponente: Beispiel-Notenset von einer URL laden
- ✅ Partner kann saubere, übersichtliche UI gestalten
- ✅ Präsentationsthema: "Damit haben wir selbst im Studium zu tun"

**Einschränkung**: Die HTTP-Komponente müsste etwas konstruiert werden (Beispieldaten von GitHub Pages oder ähnlich hosten). Machbar, aber weniger elegant als eine echte API.

---

## Entscheidungsmatrix

| Kriterium | Book Search | Makeup Explorer | Flashcards | Grade Tracker |
|---|---|---|---|---|
| API-Qualität | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ (optional) | ⭐⭐⭐ (konstruiert) |
| Kein API-Key | ✅ | ✅ | ✅ (optional Trivia) | ✅ (selbst gehostet) |
| Partner-Appeal | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Natürliches SVG | ⭐⭐⭐⭐ (Donut) | ⭐⭐⭐⭐⭐ (Swatches) | ⭐⭐⭐ (Progress) | ⭐⭐⭐⭐ (Bar-Chart) |
| JSON-Komplexität | Mittel | Einfach | Einfach | Einfach |
| Präsentationseignung | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## Nächste Schritte

1. Mit Partner besprechen — welche Idee begeistert am meisten?
2. 3–4 Sätze Beschreibung formulieren
3. Im Wiki eintragen (bei Hinneburg zur Genehmigung)
4. Nach Genehmigung: loslegen!
