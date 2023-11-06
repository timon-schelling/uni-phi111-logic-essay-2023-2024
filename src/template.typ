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

  // Table of contents
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
    let title = if lang == "de" { "Literatur" } else { none }
    show bibliography: it => {
      set heading(numbering: "1.1")
      it
    }
    bibliography(bib, title: title, style: "custom.csl")
  }
}

#let ref(pre, key, post) = {
  let ret = "("
  ret += pre
  ret += "" + {
    show cite:
    cite(key, style: "custom-no-brakets.csl")
  }
  ret += if post != none { ": " + post } else { "" }
  ret += post
  ret += ")"
  repr(ret)
  cite(key, supplement: ret, style: "custom-only-supplement.csl")
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
