#let c(pre, key, post) = {
  let ret = pre
  ret += cite(key, style: "custom-no-brackets.csl")
  ret += if post != none { ": " + post } else { "" }
  "(" + cite(key, supplement: ret, style: "custom-only-supplement.csl") + ")"
}

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

  show ref: it => {
    let ci = it.citation
    if ci == none or ci.supplement == none {
      return it
    }

    let to_string(content) = {
      if content.has("text") {
        content.text
      } else if content.has("children") {
        content.children.map(to_string).join("")
      } else if content.has("body") {
        to_string(content.body)
      } else if content == [ ] {
        " "
      }
    }

    let s = to_string(ci.supplement).split("|")

    if s.len() == 1 {
      return c("", ci.key, s.at(0))
    }

    if s.len() > 1 {
      return c(s.at(0) + " ", ci.key, s.at(1))
    }

    it
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

#let to_string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
