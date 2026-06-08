#set page(
  paper: "a4",
  flipped: true,
  margin: 0.5cm,
  numbering: "1 / 1",
  number-align: center,
)
#set text(10pt, lang: "de")
#set heading(numbering: "1.1")
#set par(justify: true)
#set list(marker: ([•], [◦]))

#columns(3, gutter: 1cm)[
  #include "01-Grundbegriffe.typ"
  #include "02-Zufallsvariablen.typ"
  #include "03-Erwartungswert.typ"
  #include "04-Mehrere-Zufallsvariablen.typ"
  #include "05-Grenzwertsaetze.typ"
  #include "06-Schaetzer.typ"
  #include "07-Tests.typ"
  #include "07a-Konfidenzintervalle.typ"
  #include "08-Aufgaben.typ"
  #include "09-Tabellen.typ"
]

#pagebreak()

#include "10-Verteilungen.typ"
