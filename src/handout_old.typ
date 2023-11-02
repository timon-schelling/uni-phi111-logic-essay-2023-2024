#let date = datetime.today().display()

#set text()

Timon Schelling #date

Tutorium Einführung in die Theoretische Philosophie (4.03.1101f) WiSe 2023/24

#text(2.2em, weight: 700, [
  Handout Essay Einführung in die Logik
])

= Einführung in die Logik am Beispiel politischer Argumente

#place(top + right, dy: 13em, [
  #import "@preview/cetz:0.1.2": canvas, draw, tree
  #import draw: *

  #let data = (
    [Argument], ([Gültig], ([Deduktiv], [Stichhaltig], [Nicht Stichhaltig]), ([Induktiv], [Stark], [Schwach])), [Ungültig]
  )

  #figure(
    table(inset: -0.7em)[
      #canvas(length: 1cm, {
        set-style(content: (padding: .5),
          fill: gray,
          stroke: gray)

        tree.tree(data, spread: 2.3, grow: 1.4, draw-node: (node, _) => {
          content((), node.content)
        }, draw-edge: (from, to, _) => {
          line((a: from, number: .6, abs: true, b: to),
              (a: to, number: .6, abs: true, b: from), mark: (end: ">"))
        })
      })
    ],
    caption: [Überblick Kategorisierung von Argumenten],
    supplement: [Abbildung]
  )
])

== Konzept

- Einleitung
- Grundbegriffe der Logik
  - Argumente
    - Prämissen
    - Konklusion
    - Standardform
  - Gültigkeit
    - Deduktiv
      - Stichhaltigkeit
      - Formal
      - Material
    - Induktiv
      - Stark
      - Schwach
- Beispiele
  - Textauszug 1 (erfüllt nicht die Anforderungen an ein Argument)
    - Versuchte Rekonstruktion des Arguments
  - Textauszug 2 (stichhaltiges Argument)
    - Rekonstruktion des Arguments
      - Identifikation von Prämissen und Konklusion
      - Übersetzung in Standardform
    - Bewertung des Arguments
      - Erklärung der deduktiven Gültigkeit
      - Erklärung der Stichhaltigkeit
  - Textauszug 3 (induktiv gültiges Argument)
    - Rekonstruktion des Arguments
    - Bewertung des Arguments
      - Erklärung der induktiven Gültigkeit
      - Anmerkung über Stärke der induktiven Gültigkeit
  - Textauszug 4 (ungültiges Argument)
    - Rekonstruktion des Arguments
    - Bewertung des Arguments
      - Erklärung der Ungültigkeit
- Fazit
- Literatur
