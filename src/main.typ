#import "template.typ": *

#show: project.with(
  title: "Title",
  authors: (
    "Timon Schelling",
  ),
)

= Zitate

== Direkte Zitate

"Das ist ein direktes Zitat". @roux2013[@!12]

== Indirekte Zitate

Das ist ein indirektes Zitat. @roux2013[vgl.@!12]

== Mehrere Quellen

Das ist ein Zitat mit mehreren Quellen. @roux2013[vgl@!12]@beckmann2015a[vgl.@!34]

== Zitate mit gleicher Quelle

Das ist ein Zitat. @roux2013[vgl.@!12]

Das ist ein Zitat mit gleicher Quelle. @roux2013[vgl.@34]

#pagebreak()

= Einleitung <test>

#lorem(20)
@beckmann2015a[vgl.@345]
#lorem(20)
@hazewinkel1993[vgl.@386-389]@beckmann2015b[vgl.@18-20]

= Hauptteil

#lorem(10)
@beckmann2015b[vgl.@35-38]
#lorem(20)
@roux2013[vgl.@3]@beckmann2015a[vgl.@239-241]
@beckmann2015a[vgl.@345]

== Thema

#lorem(20)
@metzsch2011[vgl.@75-78]
"#lorem(10)"
@roux2013[437]

=== Thema

#lorem(60)

=== Thema

#lorem(120)

= Fazit

#lorem(20)

= Ausblick

#lorem(20)
