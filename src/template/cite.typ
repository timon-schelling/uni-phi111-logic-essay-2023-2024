#let cite_link(key, text) = {
  cite(key, supplement: text, style: "cite_styles/only-supplement.csl")
}

#let custom_cite_format(pre, post, body) = {
  let ret = ""
  ret += if pre != "" { pre + " " } else { "" }
  ret += body
  ret += if post != "" { ": " + post } else { "" }
  ret
}

#let custom_cite(key, pre, post, body) = {
  let text = custom_cite_format(pre, post, body)
  cite_link(key, text)
}

#let custom_cite_auto(key, pre, post) = {
  let ref = cite(key, style: "cite_styles/main-no-brackets.csl")
  custom_cite(key, pre, post, ref)
}

#let custom_cite_ebd(key, pre, post) = {
  custom_cite(key, pre, post, "ebd.")
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



  let str = to_string(citation.supplement)

  let s = str.split("&")

  let pre = ""
  let post = ""

  if s.len() == 1 {
    post = s.at(0)
  }
  if s.len() > 1 {
    pre = s.at(0)
    post = s.at(1)
  }

  let force = post.starts-with("!")
  if force {
    post = post.slice(1)
    return custom_cite_auto(citation.key, pre, post)
  }

  locate(loc => {
    let headings = query(selector(heading).before(loc), loc)
    let elems = if headings.len() >= 0 {
      query(selector(ref).after(headings.last().location()).before(loc, inclusive: false), loc)
    } else {
      query(selector(ref).before(loc, inclusive: false), loc)
    }
    let is_ebd = true
    if elems.len() <= 1 {
      is_ebd = false
    } else {
      let elem = elems.at(-2)
      let cite = elem.citation
      if cite == none or cite.key == none or cite.key != citation.key {
        is_ebd = false
      }
    }

    if is_ebd {
      custom_cite_ebd(citation.key, pre, post)
    } else {
      custom_cite_auto(citation.key, pre, post)
    }
  })
}

#let show_custom_ref(ref) = {
  if ref.citation == none {
    return ref
  }
  show_custom_cite(ref.citation)
}
