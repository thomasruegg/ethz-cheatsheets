#set math.vec(delim: "[")
#set math.mat(delim: "[")
#set enum(indent: 0.2em, numbering: "(i)", number-align: start)
#set table(inset: 0.5em, align: horizon)
#set heading(numbering: "1.1.1")
#set block(above: 0.95em, below: 0.95em)

#set text(7pt)
#set page(paper: "a4", flipped: true, margin: 0.5cm)

#columns(4, gutter: 5pt)[
  #include "01-vectors.typ"
  #include "02-matrices.typ"
  #include "03-linear-equations.typ"
  #include "04-subspaces.typ"
  #include "05-orthogonality.typ"
  #include "06-projections.typ"
  #include "07-linear-regression.typ"
  #include "08-orthonormal-bases.typ"
  #include "09-pseudoinverses.typ"
  #include "10-certificates.typ"
  #include "11-determinants.typ"
  #include "12-eigenvalues-and-vectors.typ"
  #include "13-singular-value-decomposition.typ"
  #include "14-vector-and-matrix-norm.typ"
  #include "15-appendix.typ"
]
