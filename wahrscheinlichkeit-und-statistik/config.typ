#let mainbox(title: "", body) = block(
  width: 100%,
  fill: rgb("#ECF7FF"),
  radius: 1pt,
  clip: true,
  [
    #show table: set block(above: 0pt, below: 0pt)
    #if title != "" [
      #block(
        fill: rgb("#D2EBFF"),
        width: 100%,
        inset: 0.5em,
        radius: (top: 1pt, bottom: 0mm),
        below: 0pt,
        strong(title),
      )
    ]#block(
      width: 100%,
      inset: 0.5em,
      above: 0pt,
      body,
    )
  ],
)

#let subbox(title: "", body) = block(
  width: 100%,
  fill: white,
  radius: 1pt,
  clip: true,
  [
    #show table: set block(above: 0pt, below: 0pt)
    #if title != "" [
      #block(
        fill: luma(87%),
        width: 100%,
        inset: 0.5em,
        radius: (top: 1pt, bottom: 0mm),
        below: 0pt,
        strong(title),
      )
    ]#block(
      fill: luma(94%),
      width: 100%,
      inset: 0.5em,
      above: 0pt,
      body,
    )
  ],
)

#let minitext(body, color: luma(40%)) = { text(size: 7pt, body, fill: color) }

// Math helpers
#let limn = $lim_(n -> oo)$
#let limxo = $lim_(x -> 0)$
#let limxi = $lim_(x -> oo)$
#let limxn = $lim_(x -> -oo)$
#let sumk = $sum_(k=1)^oo$
#let sumn = $sum_(n=0)^oo$
#let R = $RR$
#let C = $CC$
#let Q = $QQ$
#let N = $NN$
#let Z = $ZZ$
#let X = $cal(X)$
#let Pset = $cal(P)$
#let P = $bb(P)$
#let A = $cal(A)$
#let F = $cal(F)$
#let E = $bb(E)$
#let Var = $"Var"$
#let cov = $"cov"$
#let vartheta = $theta.alt$
#let empty = $nothing$
#let pdv(f, x) = $(partial #f) / (partial #x)$

// Distributions
#let Ber = $"Ber"$
#let Bin = $"Bin"$
#let Geo = $"Geo"$
#let Poisson = $"Poisson"$
#let Exp = $"Exp"$
#let Ga = $"Ga"$
#let NBin = $"NBin"$
#let Cauchy = $"Cauchy"$
#let H = $"H"$

// Hyperbolic inverses
#let arcsinh = $"arcsinh"$
#let arccosh = $"arccosh"$
#let arctanh = $"arctanh"$
