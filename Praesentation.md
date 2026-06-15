---
marp: true
theme: unihalle
paginate: true
header: "Martin-Luther-Universität Halle-Wittenberg"
footer: "Grundlagen des WWW | SS-26"
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

<!-- SLIDE 2: Problem -->

## Das Problem

<div class="card-row">

<div class="card card-green">
<img src="icons/mdi_brain.svg" class="card-icon" />
<h3>Idee</h3>
Jeden Morgen die Frage: Was ziehe ich an? Ein digitaler Kleiderschrank, der Outfits bewertet und die Entscheidung erleichtert.
</div>

<div class="card">
<img src="icons/mdi_tshirt-crew.svg" class="card-icon" />
<h3>Herausforderung</h3>
Kleidung ist über viele Kategorien verteilt · Kein Überblick über Kombinationen · Zeitaufwändiges manuelles Zusammenstellen
</div>

</div>

<div class="btm-row">

<div class="mini-card">
<span class="num">50+</span>
Kleidungsstücke mit echten Bildern
</div>

<div class="mini-card">
<span class="num">4</span>
Bewertungsdimensionen auf einen Blick
</div>

<div class="mini-card">
<span class="num">✓</span>
Live-Radar bei jeder Auswahl
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
.card h3 { font-size: 1em; font-weight: 700; color: #295A97; margin: 0 0 6px 0; }
.card-icon { width: 36px; height: 36px; display: block; margin: 0 auto 6px auto; }
.mini-card {
  flex: 1; text-align: center;
  background: #F5F5F2; border: 1px solid #DADDD8; border-radius: 8px;
  padding: 14px; font-size: 0.65em; line-height: 1.4;
}
.mini-icon { width: 28px; height: 28px; display: block; margin: 4px auto 0 auto; }
.num { display: block; font-size: 1.5em; font-weight: 700; color: #295A97; line-height: 1; margin-bottom: 2px; }
.btm-row { display: flex; gap: 14px; width: 100%; margin-top: 14px; }
</style>

---

<!-- SLIDE 3: Architektur -->

## App-Architektur

<div class="card-row">

<div class="card">
<img src="icons/material-symbols_route.svg" class="card-icon" />
<h3>Drei Seiten</h3>
Home, Closet und About - alle über die Browser-URL erreichbar mit Vor-/Zurück-Navigation
</div>

<div class="card card-green">
<img src="icons/material-symbols_code.svg" class="card-icon" />
<h3>Daten aus JSON</h3>
50+ Kleidungsstücke werden aus einer JSON-Datei geladen und typsicher in die App-Struktur übersetzt
</div>

</div>

<div class="card-row">

<div class="card card-green">
<img src="icons/mdi_draw.svg" class="card-icon" />
<h3>Interaktives SVG</h3>
Das Radar-Diagramm ist ein echtes SVG und zeichnet sich bei jeder Änderung der Auswahl automatisch neu
</div>

<div class="card">
<img src="icons/mdi_puzzle.svg" class="card-icon" />
<h3>Drei Schichten</h3>
Zustand (Model), Logik (Update) und Darstellung (View) sind strikt getrennt - wartbar und erweiterbar
</div>

</div>

<div class="tech-bar">
<span class="gear">⚙</span>
Elm · Bulma CSS (responsiv) · GitLab Pages
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
  display: flex; gap: 8px; margin-top: 14px; padding: 10px 14px;
  background: #295A97; border-radius: 8px; color: white; font-size: 0.65em;
  align-items: center;
}
.tech-bar .gear { font-size: 1.3em; }
</style>

---

<!-- SLIDE 4: Radar -->

## So funktioniert das Radar-Diagramm

Ein Radar-Diagramm zeigt auf einen Blick, wie gut ein Outfit in verschiedenen Kategorien abschneidet - je groser die Flache, desto ausgewogener das Outfit.

<div class="code-layout">

<div class="code-left">
<h3>Definition der Scores</h3>
<pre>
type alias Scores =
    { style : Int, comfort : Int
    , formal : Int, durable : Int }
</pre>

<h3>Berechnung des Mittelwerts</h3>
<pre>
combineScores items =
    Scores (average .style items)
           (average .comfort items)
           (average .formal items)
           (average .durable items)
</pre>
</div>

<div class="code-right">
<h3>Umwandlung in SVG</h3>
<pre>
dataPolygon cx cy r axes =
    polygon [ points pts
            , fill "#9FBF47"
            , fillOpacity "0.35" ] []
</pre>

<h3>Live-Update</h3>
<pre>
Jede Änderung der Auswahl löst
eine Neüberechnung aus:
Item wählen -> Model ändert sich
-> View rendert neu -> Polygon
aktualisiert sich automatisch
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

<!-- SLIDE 5: Ergebnis -->

## Ergebnis & Ausblick

<div class="card-row">

<div class="card card-green">
<img src="icons/mdi_function.svg" class="card-icon" />
<h3>Elm als Basis</h3>
Typensicherheit verhindert Laufzeitfehler · Saübere Trennung von Zustand, Logik und Darstellung
</div>

<div class="card card-green">
<img src="icons/mdi_checkbox-marked-circle.svg" class="card-icon" />
<h3>Erreichte Ziele</h3>
Voll funktionsfahiger Prototyp mit 3 Routen · HTTP-Ladung der JSON-Daten · Interaktives SVG-Radar in Echtzeit
</div>

</div>

<div class="card-row">

<div class="card">
<img src="icons/mdi_progress-check.svg" class="card-icon" />
<h3>Optimierung</h3>
CSS-Styling aufwändiger · Fruher mit Datenstruktur beginnen · Elm-Paketdokumentation gewöhnungsbedürftig
</div>

<div class="card card-green">
<img src="icons/mdi_trending-up.svg" class="card-icon" />
<h3>Ausblick</h3>
Wetter-API fur Vorschläge · Outfits als JSON speichern · Filter nach Anlass (Uni, Party, Business)
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
