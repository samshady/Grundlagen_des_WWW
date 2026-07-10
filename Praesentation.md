---
marp: true
theme: unihalle
paginate: true
header: "Martin-Luther-Universität Halle-Wittenberg"
footer: "Grundlagen des WWW | SS-26 | Al-Shoumi & Rana"
---

<style>
section {
  background-image: url("uni_halle_logo.jpg") !important;
  background-repeat: no-repeat;
  background-position: right 40px top 15px;
  background-size: 100px auto;
}

header, footer { font-size: 10pt; }

pre {
  background: #F5F5F2 !important;
  color: #282828 !important;
  border: 1px solid #DADDD8 !important;
  border-left: 3px solid #295A97 !important;
  border-radius: 5px !important;
  padding: 10px 14px !important;
  line-height: 1.35 !important;
  font-family: "Consolas", "Monaco", "Courier New", monospace !important;
  font-size: 11pt !important;
}

pre code {
  background: transparent !important;
  color: #282828 !important;
  padding: 0 !important;
  font-size: inherit !important;
  font-family: inherit !important;
}

code {
  background: #EFF5E5 !important;
  color: #295A97 !important;
  padding: 2px 6px !important;
  border-radius: 4px !important;
  font-size: 11pt !important;
}

.title-row {
  display: flex; align-items: center; justify-content: center; gap: 20px; margin-bottom: 0.3em;
}
.title-row h1 { font-size: 2.2em; color: #9FBF47; margin: 0; }
.title-sub { color: #295A97 !important; font-weight: 600; font-size: 0.8em; }
.title-line { border-top: 3px solid #9FBF47; width: 80px; margin: 0.5em auto; }
.title-team { font-size: 0.7em; }
.title-meta { color: #928781; font-size: 0.55em; }

.card-list { list-style: none; padding: 0 0 0 6px; margin: 4px 0 0 0; text-align: left; }
.card-list li { padding: 2px 0; font-size: 0.9em; line-height: 1.35; }
.card-list li::before { content: "▸ "; color: #295A97; font-weight: 700; }
</style>

<!-- _class: title -->

<section>

<div class="title-row">
  <img src="app-icon.png" width="80" style="border-radius:16px;" />
  <h1>Smart Wardrobe Planner</h1>
</div>

<p class="title-sub">Digitaler Kleiderschrank & Outfit-Bewertung</p>

<div class="title-line"></div>

<p class="title-team">Doaa Al-Shoumi & Sameer Rana</p>
<p class="title-meta">
  Grundlagen des World Wide Web · SS 2026<br>
  Betreuer: PD Dr. Alexander Hinneburg
</p>

</section>

---

<!-- SLIDE 2: Problem & Lösung -->

## Problem & Lösung

<div class="card-row">

<div class="card card-alert">
<img src="icons/mdi_alert-outline.svg" class="card-icon" />
<h3>Problem</h3>
<ul class="card-list">
<li>Jeden Morgen die Frage: Was ziehe ich an?</li>
<li>Unklar, was gut zusammen aussieht</li>
<li>Kein Überblick über Kombinationen</li>
<li>Zeitaufwändiges manuelles Zusammenstellen</li>
</ul>
</div>

<div class="card card-green">
<img src="icons/mdi_brain.svg" class="card-icon" />
<h3>Idee</h3>
Ein digitaler Kleiderschrank, der Outfits bewertet und die Entscheidung erleichtert.
</div>

</div>

<div class="flow-arrow">↓</div>

<p class="section-label">App auf einen Blick</p>

<div class="btm-row">

<div class="mini-card">
<img src="icons/ph_t-shirt-fill.svg" class="mini-icon" />
Alle Kleidungsstücke digital verwalten
</div>

<div class="mini-card">
<span class="num">★</span>
Multi-Select für beliebige Kombinationen
</div>

<div class="mini-card">
<span class="num">↻</span>
Radar-Chart bewertet jedes Outfit
</div>

<div class="mini-card">
<span class="num">⇄</span>
Outfit-URLs zum Teilen speichern
</div>

</div>

<style scoped>
section { display: block; }
.card-row { display: flex; gap: 14px; width: 100%; margin-top: 18px; }
.card {
  flex: 1 1 0; min-width: 0;
  background: #F5F5F2; border-left: 4px solid #295A97; border-radius: 6px;
  padding: 16px; font-size: 0.75em; line-height: 1.5; text-align: center;
}
.card-green { background: #EFF5E5; border-left-color: #9FBF47; }
.card-alert { background: #FFF0EE; border-left-color: #CC4444; }
.card-alert h3 { color: #CC4444; }
.card h3 { font-size: 1em; font-weight: 700; color: #295A97; margin: 0 0 6px 0; }
.card-icon { width: 36px; height: 36px; display: block; margin: 0 auto 6px auto; }
.mini-card {
  flex: 1; text-align: center;
  background: #F5F5F2; border: 1px solid #DADDD8; border-radius: 8px;
  padding: 14px; font-size: 0.65em; line-height: 1.4;
}
.mini-icon { width: 28px; height: 28px; display: block; margin: 4px auto 0 auto; }
.num { display: block; font-size: 1.5em; font-weight: 700; color: #295A97; line-height: 1; margin-bottom: 2px; }
.btm-row { display: flex; gap: 14px; width: 100%; margin-top: 10px; }
.flow-arrow { text-align: center; font-size: 1.8em; color: #295A97; line-height: 1; margin: 8px 0 2px 0; }
.section-label { text-align: center; font-size: 0.65em; color: #928781; font-weight: 600; margin: 0 0 4px 0; text-transform: uppercase; letter-spacing: 0.08em; }
</style>

---

<!-- SLIDE 3: Architektur -->

## App-Architektur

<div class="card-row">

<div class="card card-green">
<img src="icons/material-symbols_code.svg" class="card-icon" />
<h3>Daten aus JSON</h3>
<ul class="card-list">
<li>63 Kleidungsstücke aus JSON per HTTP</li>
<li>Wechsel zwischen Main- und Sommer-Schrank</li>
</ul>
</div>

<div class="card">
<img src="icons/material-symbols_route.svg" class="card-icon" />
<h3>Hash-basiertes Routing</h3>
<ul class="card-list">
<li>Home, Closet, About via #-Fragment</li>
<li>Vor-/Zurück-Navigation</li>
<li>Serverunabhängig</li>
</ul>
</div>

</div>

<div class="card-row">

<div class="card card-green">
<img src="icons/mdi_target.svg" class="card-icon" />
<h3>Filter & Tags</h3>
<ul class="card-list">
<li>Dynamische Tag-Filter-Leiste</li>
<li>Outfit-URLs zum Teilen (#/closet/id1+id2)</li>
</ul>
</div>

<div class="card">
<img src="icons/mdi_puzzle.svg" class="card-icon" />
<h3>Elm-Architektur</h3>
<ul class="card-list">
<li>Model/Update/View strikt getrennt</li>
<li>Interaktives SVG-Radar aus elm/svg</li>
<li>Live-Neuberechnung bei jeder Auswahl</li>
</ul>
</div>

</div>

<div class="tech-bar">
<span class="gear">⚙</span>
<span>Elm 0.19.1</span>
<span>elm/svg</span>
<span>HTTP/JSON</span>
<span>GitLab Pages</span>
<span>Hash-Routing</span>
</div>

<style scoped>
section { display: block; }
.card-row { display: flex; gap: 14px; width: 100%; margin-top: 14px; }
.card {
  flex: 1 1 0; min-width: 0;
  background: #F5F5F2; border-left: 4px solid #295A97; border-radius: 6px;
  padding: 14px; font-size: 0.7em; line-height: 1.5; text-align: center;
}
.card-green { background: #EFF5E5; border-left-color: #9FBF47; }
.card h3 { font-size: 1em; font-weight: 700; color: #295A97; margin: 0 0 4px 0; }
.card-icon { width: 36px; height: 36px; display: block; margin: 0 auto 6px auto; }
.tech-bar {
  display: flex; justify-content: space-evenly; gap: 4px; margin-top: 14px; padding: 10px 14px;
  background: #F5F5F2; border-radius: 8px; color: #444444; font-size: 0.65em;
  align-items: center;
}
.tech-bar .gear { font-size: 1.3em; color: #295A97; }
</style>

---

<!-- SLIDE 4: Daten-Features (Filter, Wardrobes, JSON) -->

## Daten & Interaktion

<div class="card-row">

<div class="card card-green">
<img src="icons/mdi_code-tags.svg" class="card-icon" />
<h3>JSON & Tag-Filter</h3>
<pre class="code-card">
{ "id":"black-dress", "name":"Black Midi Dress",
  "scoreStyle":85, "scoreComfort":40,
  "scoreFormal":90, "scoreDurable":70,
  "tags":["elegant","evening","black"] }

filtered = List.filter (\item ->
    List.any (\f ->
        List.member f item.tags)
        activeFilters) items
</pre>
</div>

<div class="card">
<img src="icons/mdi_wardrobe-outline.svg" class="card-icon" />
<h3>Daten-Handling</h3>
<ul class="card-list">
<li><strong>Zwei JSON-Dateien</strong><br><code>/items.json</code> (63) · <code>/summer.json</code> (21)</li>
<li><strong>HTTP-Ladung</strong><br>SwitchWardrobe lädt neue JSON + resetSelections</li>
<li><strong>Typsicherer Decoder</strong><br>Decode.map7 wandelt JSON in WardrobeData</li>
<li><strong>Dynamische Tags</strong><br>collectAllTags extrahiert Tags aus allen Items</li>
</ul>
</div>

</div>

<style scoped>
section { display: block; }
.card-row { display: flex; gap: 14px; width: 100%; margin-top: 12px; }
.card {
  flex: 1 1 0; min-width: 0;
  background: #F5F5F2; border-left: 4px solid #295A97; border-radius: 6px;
  padding: 14px; font-size: 0.7em; line-height: 1.4; text-align: center;
}
.card-green { background: #EFF5E5; border-left-color: #9FBF47; }
.card h3 { font-size: 1em; font-weight: 700; color: #295A97; margin: 0 0 6px 0; }
.card-icon { width: 32px; height: 32px; display: block; margin: 0 auto 6px auto; }
.code-card {
  background: #F5F5F2 !important; color: #282828 !important;
  border: 1px solid #DADDD8 !important; border-left: 3px solid #295A97 !important;
  border-radius: 5px !important; padding: 8px !important;
  font-size: 0.6em !important; line-height: 1.3 !important;
  text-align: left; margin: 4px 0 0 0;
}
.bullet-list { text-align: left; margin-top: 4px; }
.bullet-list p { margin: 0 0 8px 0; font-size: 0.85em; line-height: 1.35; }
.bullet-list code { font-size: 0.9em; }
</style>

---

<!-- SLIDE 5: Radar -->

## So funktioniert das Radar-Diagramm

Ein Radar-Diagramm zeigt auf einen Blick, wie gut ein Outfit in verschiedenen Kategorien abschneidet - je großer die Fläche, desto ausgewogener das Outfit.

<div class="code-layout">

<div class="code-left">
<h3>Definition der Scores</h3>
<pre>
type alias Scores =
    { style : Int, comfort : Int
    , formal : Int, durable : Int }
</pre>

<h3>Berechnung (Maximum pro Kategorie)</h3>
<pre>
combineScores items =
    Scores (maxOf .style items)
           (maxOf .comfort items)
           (maxOf .formal items)
           (maxOf .durable items)

maxOf accessor list =
    List.maximum (List.map accessor list)
        |> Maybe.withDefault 0
</pre>
</div>

<div class="code-right">
<h3>Umwandlung in SVG</h3>
<pre>
dataPolygon cx cy r axes =
    polygon [ points pts
            , fill "#6b4c3b"
            , fillOpacity "0.35"
            , stroke "#6b4c3b"
            , strokeWidth "2" ] []
</pre>

<h3>Vier Achsen, 90°-Winkel</h3>
<pre>
axes =
    [ ("Style",  deg 270, style)
    , ("Comfort", deg 0,   comfort)
    , ("Formal",  deg 90,  formal)
    , ("Durable", deg 180, durable) ]
</pre>
</div>

</div>

<style scoped>
section { display: block; }
p { font-size: 0.65em; line-height: 1.4; margin: 0 0 10px 0; }
.code-layout { display: flex; gap: 16px; width: 100%; }
.code-left, .code-right { flex: 1; }
.code-left h3, .code-right h3 {
  font-size: 0.7em; font-weight: 700; color: #295A97; margin: 0 0 4px 0;
}
.code-left pre, .code-right pre {
  margin: 0 0 10px 0; font-size: 0.5em; padding: 8px 10px;
}
</style>

---

<!-- SLIDE 6: Ergebnis -->

## Ergebnis & Ausblick

<div class="card-row">

<div class="card">
<img src="icons/mdi_function.svg" class="card-icon" />
<h3>Elm als Basis</h3>
<ul class="card-list">
<li>Typensicherheit verhindert Laufzeitfehler</li>
<li>Saubere Trennung von Zustand, Logik und Darstellung</li>
</ul>
</div>

<div class="card card-green">
<img src="icons/mdi_checkbox-marked-circle.svg" class="card-icon" />
<h3>Erreichte Ziele</h3>
<ul class="card-list">
<li>Voll funktionsfähiger Prototyp mit 3 Routen</li>
<li>63 Items in 7 Kategorien</li>
<li>Tag-Filter · Outfit-URLs zum Teilen</li>
<li>Kleiderschrank-Wechsel (Main/Summer)</li>
<li>Multi-Select Accessoires · SVG-Radar</li>
</ul>
</div>

</div>

<div class="card-row">

<div class="card">
<img src="icons/mdi_progress-check.svg" class="card-icon" />
<h3>Optimierung</h3>
<ul class="card-list">
<li>CSS-Styling aufwändiger</li>
<li>Früher mit Datenstruktur beginnen</li>
<li>Elm-Paketdokumentation gewöhnungsbedürftig</li>
</ul>
</div>

<div class="card card-green">
<img src="icons/mdi_trending-up.svg" class="card-icon" />
<h3>Ausblick</h3>
<ul class="card-list">
<li>Wetter-API für Vorschläge</li>
<li>Outfits als JSON exportieren</li>
<li>Filter nach Anlass (Uni, Party, Business)</li>
<li>Outfit-Bewertung speichern</li>
</ul>
</div>

</div>

<style scoped>
section { display: block; }
.card-row { display: flex; gap: 14px; width: 100%; margin-top: 14px; }
.card {
  flex: 1 1 0; min-width: 0;
  background: #F5F5F2; border-left: 4px solid #295A97; border-radius: 6px;
  padding: 16px; font-size: 0.7em; line-height: 1.5; text-align: center;
}
.card-green { background: #EFF5E5; border-left-color: #9FBF47; }
.card h3 { font-size: 1em; font-weight: 700; color: #295A97; margin: 0 0 6px 0; }
.card-icon { width: 36px; height: 36px; display: block; margin: 0 auto 6px auto; }
</style>
