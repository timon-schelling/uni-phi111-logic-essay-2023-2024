#let project(
  title: "",
  authors: (),
  date: none,
  bib: "refs.bib",
  numbering-skip-outline: false,
  body,
) = {
  set document(author: authors, title: title)
  set text(font: "Calibri", lang: "de")
  set heading(numbering: "1.1")
  set page(numbering: if numbering-skip-outline { none } else { "1" })

  // Custom citation style
  set cite(style: "chicago-author-date")
  show ref: it => {
    let citation = it.citation
    if citation == none {
      return it
    }
    let ret = ""
    ret += "("
    ret += cite(..citation.keys, style: citation.style, brackets: false)
    if citation.supplement != none {
      ret += ": " + citation.supplement
    }
    ret += ")"
    ret
  }

  // Title page
  {
    text(1.1em, date)
    v(1.2em, weak: true)
    text(2em, weight: 700, title)
  
    // Authors
    pad(
      top: 0.7em,
      right: 20%,
      grid(
        columns: (1fr,) * calc.min(3, authors.len()),
        gutter: 1em,
        ..authors.map(author => align(start, strong(author))),
      ),
    )
    pagebreak()
  }

  // Table of contents.
  {
    outline(depth: 5, indent: true)
    pagebreak()
  }
  

  // Page numbering
  set page(numbering: "1")
  if numbering-skip-outline {
    counter(page).update(1)
  }

  // Main body
  {
    set par(justify: true)
    body
  }
  

  // Display the bibliography, if any is given
  if bib != none {
     show bibliography: it => {
      set heading(numbering: "1.1")
      show heading: it => {
        show "Bibliographie": "Literatur"
        it
      }
      it
    }
    pagebreak()
    bibliography(bib, style: "chicago-author-date")
  }
}
