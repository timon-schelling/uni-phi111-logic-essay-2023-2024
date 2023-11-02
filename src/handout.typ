#let date = datetime.today().display()

#set heading(numbering: "1.1")
#set par(justify: true, leading: 0.4em)

Timon Schelling #date

Tutorium Einführung in die Theoretische Philosophie (4.03.1101f) WiSe 2023/24

Handout Essay Einführung in die Logik

#text(2.2em, weight: 700, [
  Einführung in die Logik am Beispiel politischer Argumente
])

// #place(top + right, dy: 13em, [
//   #import "@preview/cetz:0.1.2": canvas, draw, tree
//   #import draw: *

//   #let data = (
//     [Argument], ([Gültig], ([Deduktiv], [Stichhaltig], [Nicht Stichhaltig]), ([Induktiv], [Stark], [Schwach])), [Ungültig]
//   )

//   #figure(
//     table(inset: -0.7em)[
//       #canvas(length: 1cm, {
//         set-style(content: (padding: .5),
//           fill: gray,
//           stroke: gray)

//         tree.tree(data, spread: 2.3, grow: 1.4, draw-node: (node, _) => {
//           content((), node.content)
//         }, draw-edge: (from, to, _) => {
//           line((a: from, number: .6, abs: true, b: to),
//               (a: to, number: .6, abs: true, b: from), mark: (end: ">"))
//         })
//       })
//     ],
//     caption: [Überblick Kategorisierung von Argumenten],
//     supplement: [Abbildung]
//   )
// ])

#text(1.6em, weight: 700, [
  Gliederung
])

= Einleitung

= Begriff des Arguments

- Argumente
  - Prämissen
    - Ein oder mehrere Aussagesätze, aus denen die Konklusion folgt
    - Prämissen sind die Gründe, die für die Konklusion sprechen
  - Konklusion
    - Folgt aus den Prämissen
    - Die Konklusion ist die Aussage, die durch die Prämissen gestützt wird
  - Formale Schreibweise
    - Prämissen werden als $P_1$ bis $P_n$ notiert
    - Konklusion wird als $K$ notiert

- Erstes Beispiel eines politischen Arguments (erfüllt *nicht* die Anforderungen an ein Argument)
  - Versuchte Rekonstruktion des Arguments
    - Identifikation von Prämissen
    - *fehlende* Konklusion

- Standardform
  - $A$ ist ein Standardargument $arrow.l.r$ $A$ ist eine Folge von ein oder mehreren Prämissen, gefolgt vom Separator „Also“ und genau einer Konklusion
  - Prämissen hier als $P_1$ bis $P_n$ notiert
  - Konklusion als $K$ notiert

#pad(left: 1.2em, table(stroke: gray)[
  $
    & P_1 \
    & dots.v \
    & P_n \
    & text("Also: ")K \
  $
])

= Deduktive gültige Argumente

- Einführung des Begriffs der Deduktiven Gültigkeit
  - Ein Argument ist deduktiv gültig, wenn die Konklusion aus den Prämissen folgt

- Zweites Beispiel eines politischen Arguments (deduktiv gültiges Argument)
  - Rekonstruktion des Arguments
    - Identifikation von Prämissen und Konklusion
    - Übersetzung in Standardform
  - Bewertung des Arguments
    - Erklärung der deduktiven Gültigkeit

#pagebreak()

- Einführung der Stichhaltigkeit
  - Ein Argument ist stichhaltig, wenn es deduktiv gültig ist und die Prämissen wahr sind
  - Referenz auf das zweite Beispiel
    - Erklärung warum das Argument aus dem zweiten Beispiel nicht Stichhaltig ist
    - Umformulierung des Arguments zu einem Stichhaltigen Argument, durch Änderung der Konklusion

= Induktive gültige Argumente

- Einführung des Begriffs der Induktiven Gültigkeit
  - Ein Argument ist induktiv gültig, wenn die Konklusion aus den Prämissen folgt und die Prämissen die Konklusion stützen (d.h. die Prämissen machen die Konklusion wahrscheinlicher als ihre Negation)

- Drittes Beispiel eines politischen Arguments (induktiv gültiges Argument)
  - Rekonstruktion des Arguments
    - Identifikation von Prämissen und Konklusion
    - Übersetzung in Standardform
  - Bewertung des Arguments
    - Erklärung warum das Argument nicht Deduktiv gültig ist
    - Erklärung der induktiven Gültigkeit des Arguments
    - Anmerkung über Stärke der induktiven Gültigkeit

= Ungültige Argumente durch logischen Fehlschluss (Optionale Erweiterung, wenn Platz bleibt)

- Viertes Beispiel eines politischen Arguments (ungültiges Argument)
  - Rekonstruktion des Arguments
    - Identifikation von Prämissen und Konklusion
    - Übersetzung in Standardform
  - Bewertung des Arguments
    - Erklärung warum das Argument nicht gültig ist
    - Anmerkung über weitere Logische Fehlschlüsse

= Fazit

- Zusammenfassung der Ergebnisse mit Hilfe von Schaubild

#align(left, [
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



= Literatur
