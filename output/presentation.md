---
marp: true
theme: default
paginate: true
header: "Martin-Luther-Universität Halle-Wittenberg"
footer: "Grundlagen des WWW | SS-26"
---

<style>
section {
  color: #282828;
  font-family: Helvetica, Arial, system-ui, sans-serif;
  padding: 50px;
}

header, footer {
  color: #928781;
  font-size: 10pt;
}

h1 {
  font-size: 34pt;
  font-weight: 700;
  margin-bottom: 0.15em;
  color: #9FBF47;
}

h2 {
  font-size: 24pt;
  font-weight: 600;
  color: #295A97;
  margin-top: 0.1em;
  margin-bottom: 0.2em;
}

h3 {
  font-size: 18pt;
  font-weight: 500;
  color: #282828;
  margin-bottom: 0.15em;
}

p {
  font-size: 18pt;
  line-height: 1.4;
  margin: 0.15em 0;
}

li {
  font-size: 18pt;
  line-height: 1.4;
}

code {
  font-size: 14pt;
  background: #F5F5F2;
  padding: 2px 6px;
  border-radius: 3px;
  color: #282828;
}

pre {
  background: #1e1e2e;
  color: #cdd6f4;
  padding: 8px 12px;
  border-radius: 6px;
  font-size: 12pt;
  line-height: 1.25;
  margin: 0.3em 0;
}

pre code {
  background: transparent;
  color: inherit;
  padding: 0;
  font-size: inherit;
}

table {
  font-size: 16pt;
  width: 100%;
  border-collapse: collapse;
}

th {
  background: #295A97;
  color: white;
  padding: 6px 10px;
  text-align: left;
  font-weight: 600;
}

td {
  padding: 5px 10px;
  border-bottom: 1px solid #DADDD8;
}

blockquote {
  font-size: 16pt;
  padding: 12px 18px;
  background: #F5F5F2;
  border-left: 6px solid #9FBF47;
  border-radius: 4px;
  margin: 0.5em 0;
  color: #282828;
}

strong {
  color: #295A97;
}

.card-row {
  display: flex;
  gap: 16px;
  margin-top: 8px;
}

.card {
  background: #F5F5F2;
  border-left: 5px solid #295A97;
  border-radius: 6px;
  padding: 14px 16px;
  flex: 1;
}

.card-highlight {
  background: #EFF5E5;
  border-left-color: #9FBF47;
}
</style>

<!-- _class: title -->
<style scoped>
section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

h1 {
  font-size: 44pt;
  color: #9FBF47;
  margin-bottom: 0.1em;
}

h2 {
  font-size: 20pt;
  color: #295A97;
  margin-top: 0;
  margin-bottom: 0.3em;
}

p {
  font-size: 18pt;
  color: #282828;
}
</style>

# Smart Wardrobe Planner

Digital Closet Management & Outfit Scoring

Doaa Al-Shoumi, Sameer Rana

Grundlagen des WWW · SS 2026

Betreuer: PD Dr. Alexander Hinneburg

---

<style scoped>
ul {
  padding-left: 24px;
}
li {
  margin-bottom: 12px;
}
.card-row {
  margin-top: 12px;
}
.card {
  font-size: 16pt;
  padding: 12px 14px;
}
.card-highlight {
  background: #EFF5E5;
  border-left-color: #9FBF47;
}
</style>

## Motivation & Uberblick

- Jeden Morgen das gleiche Problem: Was ziehe ich an?
- **Smart Wardrobe Planner** -- Kleidungsstucke digital verwalten, nach Kategorien filtern, Outfits interaktiv zusammenstellen
- **Live-Bewertung** des Outfits per SVG-Radar-Diagramm (Style, Comfort, Formal, Durability)

<div class="card-row">
  <div class="card-highlight">
    <strong>Elm 0.19.1</strong><br>
    TEA (Model / View / Update)
  </div>
  <div class="card">
    <strong>Bulma CSS</strong><br>
    Responsives Layout
  </div>
  <div class="card-highlight">
    <strong>elm/svg</strong><br>
    Radar-Diagramm
  </div>
  <div class="card">
    <strong>GitLab Pages</strong><br>
    CI/CD Deployment
  </div>
</div>

---

<style scoped>
.columns {
  display: flex;
  gap: 24px;
  margin-top: 8px;
}
.columns > div {
  flex: 1;
}
.arch-table {
  font-size: 14pt;
  margin-bottom: 10px;
}
.arch-table td {
  padding: 4px 8px;
}
.route-table {
  font-size: 14pt;
}
.route-table th, .route-table td {
  padding: 4px 8px;
}
ul {
  padding-left: 20px;
  font-size: 16pt;
}
li {
  margin-bottom: 6px;
}
.small {
  font-size: 14pt;
  color: #928781;
}
</style>

## Architektur: The Elm Architecture

<div class="columns">
<div>

### Kernkomponenten

| Komponente | Aufgabe |
|---|---|
| **Model** | Page, Items, Auswahl, Scores |
| **Update** | SelectDress, SelectJacket, u.a. |
| **View** | Bulma-HTML + SVG Radar |

### Routen

| Route | View |
|---|---|
| `/` | Home (Landing) |
| `/closet` | Kleiderschrank |
| `/about` | Info |

</div>
<div>

### Datenfluss

1. `init` ladt `items.json` per HTTP
2. JSON-Decoder parst `WardrobeData`
3. Nutzer wahlt Items aus
4. `combineScores` berechnet Mittelwerte
5. View rendert Bulma-Karten + SVG-Radar

<span class="small">Deployed auf GitLab Pages:</span>
<span class="small" style="color:#295A97;">ss26-sam-doaa-project-fefcf0.gpages-lehre.informatik.uni-halle.de</span>

</div>
</div>

---

<style scoped>
.columns {
  display: flex;
  gap: 20px;
  margin-top: 6px;
}
.columns > div {
  flex: 1;
}
pre {
  font-size: 11pt;
  line-height: 1.2;
  margin: 0.2em 0;
}
ul {
  padding-left: 18px;
  font-size: 16pt;
}
li {
  margin-bottom: 8px;
}
</style>

## Code-Detail: SVG-Radar-Diagramm

<div class="columns">

<div>

```elm
type alias Scores =
    { style : Int, comfort : Int
    , formal : Int, durable : Int }

-- Mittelwert berechnen
combineScores items =
    Scores (average .style actual)
           (average .comfort actual)
           (average .formal actual)
           (average .durable actual)

-- Polygon aus Scores
dataPolygon cx cy r axes =
    let pts = String.join " " (List.map
        (\(_, angle, val) ->
            let rr = r * (val / 100)
                (x, y) = polar rr angle
            in  formatPt (cx + x) (cy + y))
        axes)
    in  polygon [ points pts
                , fill "#9FBF47"
                , fillOpacity "0.35" ] []
```

</div>

<div>

- 4 Kategorien: **Style, Comfort, Formal, Durable** (0-100)
- Achsen im 90-Grad-Winkel, polar-Koordinaten
- `combineScores`: Durchschnitt aller ausgewahlten Items
- `dataPolygon`: Scores -> SVG-Polygon-Punkte
- **Live-Update** bei jeder Anderung der Auswahl

### Live-Demo

1. Home -> Closet -> Items auswahlen
2. Radar aktualisiert sich in Echtzeit
3. About Seite

### Nachste Schritte

- Filtern nach Anlass (Uni, Party, Business)
- Outfits speichern (JSON-Export/Import)
- Wetter-API fur Vorschlage

</div>
</div>

---

<style scoped>
section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

h1 {
  font-size: 40pt;
  color: #9FBF47;
  margin-bottom: 0.3em;
}

p {
  font-size: 20pt;
  color: #282828;
}
</style>

# Vielen Dank!

## Fragen?
