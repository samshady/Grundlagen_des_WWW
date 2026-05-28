# Mündliche Prüfung — Vorbereitung

> **Dauer**: ~35 Minuten  
> **Termin**: Letzte zwei August-Wochen 2026  
> **Stoff**: Vorlesungsfolien (Prof. Brass) + praktische Projektaspekte  
> **Anmeldung**: Rechtzeitig im Löwenportal

---

## Prüfungsstoff (VL-Folien)

| Folien | Thema | Wichtige Konzepte |
|---|---|---|
| **c1_inet.pdf** | Internet & Netzwerke | TCP/IP, OSI-Modell, Paketvermittlung, Router, IP-Adressen |
| **c2_dns.pdf** | Domain Name System | Hierarchie, Nameserver, Auflösung, DNS-Zonen |
| **c3_uri.pdf** | URI/URL | Syntax, Schemas, Fragmente, Relative/absolute URLs |
| **c4_sgml.pdf** | SGML Grundlagen | DTD, Elemente, Attribute, Entities |
| **c5_desdt.pdf** | (Dokumenten-Strukturen) | (siehe Folien) |
| **c6_xmlns.pdf** | XML Namespaces | Namensräume, Qualified Names, xmlns |
| **c7_html.pdf** | HTML Grundlagen | Elemente, Attribute, DOM, Block/Inline |
| **c8_htmlb.pdf** | HTML Vertiefung | Links, Images, Tables, Forms, Imagemaps |
| **c9_css.pdf** | CSS | Selektoren, Box-Modell, Flexbox, Positionierung, Animation |
| **ca_http.pdf** | HTTP | Methoden, Header, Statuscodes, MIME, Caching, Cookies |

---

## Prüfungsfragen (erwartet)

### Theoretische Fragen (VL-Stoff)

1. Erklären Sie den Ablauf einer DNS-Auflösung.
2. Was ist der Unterschied zwischen URI, URL und URN?
3. Beschreiben Sie das OSI-Modell und die Aufgabe jeder Schicht.
4. Was ist eine DTD und wozu dient sie?
5. Erklären Sie das CSS-Box-Modell.
6. Was bedeuten die HTTP-Statuscodes 200, 301, 404, 500?
7. Wie funktioniert TCP vs. UDP?
8. Was sind die wichtigsten HTTP-Methoden und ihre Eigenschaften?
9. Erklären Sie XML-Namespaces.
10. Wie funktioniert CSS-Spezifität?

### Praktische Fragen (Projekt)

1. Erklären Sie die Architektur Ihres Elm-Projekts (TEA).
2. Warum haben Sie Elm statt JavaScript verwendet?
3. Wie funktioniert der JSON-Decoder in Ihrem Projekt?
4. Wie haben Sie URL-Routing implementiert?
5. Wie laden Sie Daten per HTTP und wie gehen Sie mit Fehlern um?
6. Welche Typsicherheits-Vorteile bietet Elm?
7. Erklären Sie die `update`-Funktion und den Msg-Typ.
8. Wie haben Sie SVG interaktiv gemacht?
9. Wie funktioniert `Browser.application` vs `Browser.sandbox`?
10. Was sind Ports in Elm und wann braucht man sie?

---

## Lernplan

### Woche 1 (nach Projektabgabe, ~20. Juli)
- [ ] Alle VL-Folien einmal durchlesen (c1–ca)
- [ ] Pro Foliensatz 5 Kernkonzepte notieren

### Woche 2 (~27. Juli)
- [ ] Antworten auf theoretische Fragen formulieren
- [ ] Eigene Projekt-Code erklären können (jede Funktion)

### Woche 3 (~3. August)
- [ ] Mit Kommilitonen Prüfung simulieren (gegenseitig abfragen)
- [ ] Schwachstellen identifizieren und nachlernen

### Prüfungswoche (~August)
- [ ] Nur noch wiederholen, nichts Neues

---

## Projekt-Code (zum Erklären bereithalten)

```elm
-- Diese Stellen im eigenen Code genau verstehen:
-- 1. main-Definition (Browser.application)
main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }

-- 2. Model + Custom Types (type alias, type)
-- 3. update + case-Ausdrücke
-- 4. JSON-Decoder (Json.Decode.map, field, andThen)
-- 5. HTTP-Requests (Http.get, Http.expectJson)
-- 6. SVG-Elemente (Svg.svg, Svg.circle, ...)
-- 7. CSS + Bulma-Klassen
```
