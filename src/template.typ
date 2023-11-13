#let cite_link(key, text) = {
  cite(key, supplement: text, style: "custom-only-supplement.csl")
}

#let ebd(pre, post: none) = {
  locate(loc => {
    let elems = query(selector(ref).before(loc), loc)
    if elems.len() == 0 {
      assert(false, message: "No reference found")
    }
    let elem = elems.at(-1)
    let cite = elem.citation
    if cite == none {
      assert(false, message: "Found reference but is not a citation")
    }
    if cite.key == none {
      assert(false, message: "No key found for citation ")
    }
    let key = cite.key
    let text = if pre != none { pre + " " } else { "" }
    text += "ebd."
    if post != none { text += ": " + post }

    cite_link(key, text)
  })
}

#let custom_cite(pre, key, post) = {
  let ret = pre
  ret += cite(key, style: "custom-no-brackets.csl")
  ret += if post != none { ": " + post } else { "" }
  cite_link(key, ret)
}

#let show_custom_cite(citation) = {
  if citation.supplement == none {
    return citation
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

  let s = to_string(citation.supplement).split("|")

  if s.len() == 1 {
    return custom_cite("", citation.key, s.at(0))
  }

  if s.len() > 1 {
    return custom_cite(s.at(0) + " ", citation.key, s.at(1))
  }

  citation
}

#let show_custom_ref(ref) = {
  if ref.citation == none {
    return ref
  }
  show_custom_cite(ref.citation)
}

#let project(
  title: "",
  authors: (),
  date: datetime.today().display(),
  bib: "refs.yml",
  lang: "de",
  font: "Calibri",
  numbering-skip-outline: false,
  body,
) = {
  set document(author: authors, title: title)
  set text(font: font, lang: lang)
  set heading(numbering: "1.1")
  set page(numbering: if numbering-skip-outline { none } else { "1" })

  // Set citation style for refs
  show ref: it => show_custom_ref(it)
  show cite.where(style: auto): it => show_custom_cite(it)

  // Title pager
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
