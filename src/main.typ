#import "template.typ": *

#show: project.with(
  title: "Title",
  authors: (
    "Timon Schelling",
  ),
  date: "27. April 2023",
)

= Einleitung <test>

#lorem(20)
@beckmann2015a[vgl.|345]@beckmann2015b[vgl.|345]
#lorem(20)
@hazewinkel1993[vgl.|386-389]@beckmann2015a[vgl.|498]
#lorem(20)
@metzsch2011
#lorem(50)
@roux2013[437]

#cite(<beckmann2015a>, supplement: "test|test", style: auto)

= Hauptteil

#lorem(100)

== Thema 1

#lorem(300)

=== Thema 1

#lorem(180)

=== Thema 2

#lorem(150)

== Thema 2

#lorem(400)

= Fazit

#lorem(200)

= Ausblick

#lorem(200)
