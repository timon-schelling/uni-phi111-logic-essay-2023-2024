#let project(
  title: "",
  authors: (),
  date: datetime.today().display(),
  bib: "refs.yml",
  lang: "de",
  font: "Calibri",
  citation: "harvard",
  numbering-skip-outline: false,
  body,
) = {
  set document(author: authors, title: title)
  set text(font: font, lang: lang)
  set heading(numbering: "1.1")
  set page(numbering: if numbering-skip-outline { none } else { "1" })

  // // Custom citation style
  // if citation == "harvard" {
  //   set cite(style: citation)
  //   show cite: (key, supplement, form, style) => {
  //     if style != citation {
  //       return cite(key, supplement, form, style)
  //     }

  //   }
  // } else {
  //   set cite(style: citation)
  // }

  // show ref: it => {
  //   let citation = it.citation
  //   if citation == none {
  //     return it
  //   }
  //   let ret = ""
  //   ret += "("
  //   ret += cite(..citation.keys, style: citation.style, brackets: false)
  //   if citation.supplement != none {
  //     ret += ": " + citation.supplement
  //   }
  //   ret += ")"
  //   ret
  // }

  // show ref: it => {
  //   let citation = it.citation
  //   if citation == none {
  //     return it
  //   }
  //   let ret = ""
  //   ret += "("
  //   ret += cite(..citation.key, style: citation.style, brackets: false)
  //   if citation.supplement != none {
  //     ret += ": " + citation.supplement
  //   }
  //   ret += ")"
  //   ret
  // }
  // show regex(`\)\(`.text): "test"

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
    pagebreak()
    bibliography(bib, title: if lang == "de" { "Literatur" } else { none }, style: "chicago-author-date")
  }
}

#let c(..keys) = {
  let ret = ""
  ret += "("
  ret += keys.pos().map(key => {
    let (key, supplement) = key.split("|")
    [
      #cite(key, style: "chicago-author-date", brackets: false)
      #if supplement != none { ": " + supplement } else { "" }
    ]
  }).join(", ")
  ret += ")"
  ret
}
