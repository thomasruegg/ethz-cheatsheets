#import "config.typ": *
#import "@preview/cetz:0.4.2"

= Tabellen & Diverses

== Grenzwerte
#align(center)[
  #table(
    columns: (1fr, 1fr),
    align: horizon + left,
    stroke: none,
    fill: none,
    [$limxi e^x/x^m = oo$], [$limxn x e^x = 0$],
    [$limxi (1+x)^(1/x) = 1$], [$limxo (1+x)^(1/x) = e$],
    [$limxi (1+1/x)^b = 1$], [$limxi n^(1/n) = 1$],
    [$limxo (e^x-1)/x = 1$], [$limxi (1-1/x)^x = 1/e$],
    [$lim_(x -> plus.minus oo) (1 + k/x)^(m x) = e^(k m)$], [$limxi (x/(x+k))^x = e^(-k)$],
    [$limxo (log(1-x))/x = -1$], [$limxo x log(x) = 0$],
    [$limxo (e^(a x)-1)/x = a$], [$limxo ln(x+1)/x = 1$],
    [$lim_(x -> 1) ln(x)/(x-1) = 1$], [$limxi log(x)/x^a = 0$],
  )
]

#mainbox(title: "Partielle Integration")[
  $ integral f'(x) g(x) dif x = f(x) g(x) - integral f(x) g'(x) dif x $
]
- Meist gilt: Polynome ableiten ($g(x)$), wo das Integral periodisch ist ($sin, cos, e^x, ...$) integrieren ($f'(x)$).
- Teils: mit $1$ multiplizieren, um partielle Integration anwenden zu können (z.B. im Fall von $integral log(x) dif x$).

#mainbox(title: "Substitution")[
  Um $integral_a^b f(g(x)) dif x$ zu berechnen: Ersetze $g(x)$ durch $u$ und integriere $integral_(g(a))^(g(b)) f(u) dif u / g'(x)$.
]
- $g'(x)$ muss sich herauskürzen, sonst nutzlos.
- Grenzen substituieren nicht vergessen.
- Man kann auch das Theorem in die andere Richtung anwenden:
  $ integral_a^b f(u) dif u = integral_(g^(-1)(a))^(g^(-1)(b)) f(g(x)) g'(x) dif x $
- Sei $cal(X), Y$ kompakt, $f: Y subset.eq RR^n -> RR$ stetig. Sei $gamma: cal(X) -> Y$ mit $cal(X) = cal(X)_0 union B$, $Y = Y_0 union C$ ($B, C$ Rand von $cal(X), Y$).
  Wenn $gamma: cal(X)_0 -> Y_0$ bijektiv und $C^1$ mit $det(J_gamma (x)) != 0, forall x in cal(X)_0$, dann gilt:
  $ integral_Y f(y) dif y = integral_(cal(X)) f(gamma(x)) |det(J_gamma (x))| dif x $

#align(center)[
  #table(
    columns: 3,
    align: horizon + center,
    stroke: 0.5pt + luma(150),
    table.cell(colspan: 3, fill: luma(240))[*Polarkoordinaten*],
    [$x = r cos theta$],
    [$0 <= r < oo$],
    [
      $dif x dif y = r$ #text(fill: luma(120))[$dif r dif theta$]
    ],
    [$y = r sin theta$], [$0 <= theta < 2 pi$], [],
    [$x^2 + y^2 = r^2$], [], [],
  )
]

#subbox(title: "Gamma-Verteilung")[
  Die Gamma-Verteilung ist eine stetige Verteilung mit der Dichtefunktion:
  $ f(z) = 1 / Gamma(alpha) lambda^alpha z^(alpha-1) e^(-lambda z) quad "für" z >= 0, alpha > 0, lambda > 0 $
  + Wir schreiben $Z ~ Ga(alpha, lambda)$ für eine gamma-verteilte ZV $Z$ mit Parametern $alpha$ und $lambda$.
  + Die Summe von $n in NN$ unabhängigen $Exp(lambda)$-verteilten Zufallsvariablen ist $Ga(n, lambda)$-verteilt.
  + Die $chi^2$-Verteilung mit $k$ Freiheitsgraden ist $Ga(k/2, 1/2)$-verteilt.
]

Sei $(X_i)_(i >= 1) ~ cal(N)(0,1)$ i.i.d. eine Folge von Zufallsvariablen.
+ $sum_(i=1)^n X_i^2 ~ chi_n^2$
+ $1/n sum_(i=1)^n X_i ~ chi_1^2$ (as in original LaTeX)
+ $X_1^2 + X_2^2 ~ Exp(1/2)$
+ Sei $Y ~ chi_m^2$ unabhängig von $cal(N)(0,1)$. Dann gilt: $X / sqrt(1/m Y) ~ t_m$
+ Es gilt $lim_(m -> oo) t_m ~ cal(N)(0,1)$ verteilt, für endliche $m$ ist $t_m$ langschwänziger als $cal(N)(0,1)$.

Seien $X_1, ..., X_n$ i.i.d. $~ cal(N)(mu, sigma^2)$. Wir erinnern uns an die Notationen für Stichprobenmittel $overline(X)_n$ und Stichprobenvarianz $S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X)_n)^2$.
+ $(n-1)/sigma^2 S^2 ~ chi_(n-1)^2$
+ $overline(X)_n$ und $S^2$ sind unabhängig.
+ $ (overline(X)_n - mu) / (S / sqrt(n)) = ((overline(X)_n - mu) / (sigma / sqrt(n))) / sqrt(S^2 / sigma^2) ~ t_(n-1) $

== MLE Schätzer <sec:mle-schaetzer>
- $X_1, ..., X_n ~ Exp(theta)$ i.i.d.: $T = n / sum_(i=1)^n X_i = 1 / overline(X)_n$
- $X_1, ..., X_n ~ Geo(theta)$ i.i.d.: $T = n / sum_(i=1)^n X_i = 1 / overline(X)_n$
- $X_1, ..., X_n ~ Bin(N, theta)$ i.i.d.: $T = 1/N (sum_(i=1)^n X_i) / n$
- $X_1, ..., X_n ~ Ber(p)$ i.i.d.: $T = (sum_(i=1)^n X_i) / n$
- $X_1, ..., X_n ~ Poisson(theta)$ i.i.d.: $T = (sum_(i=1)^n X_i) / n = overline(X)_n$
- $X_1, ..., X_n ~ cal(U)([theta_1, theta_2])$ i.i.d.: $T_(theta_1) = max(X_i)$, $T_(theta_2) = min(X_i)$
- $X_1, ..., X_n ~ cal(N)(theta_1, theta_2)$ i.i.d.: $T_(theta_1) = overline(X)_n$, $T_(theta_2) = S^2$

#mainbox(title: "Wichtige Werte")[
  #align(center)[
    #table(
      columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
      align: horizon + center,
      stroke: none,
      fill: none,
      [deg], [$0°$], [$30°$], [$45°$], [$60°$], [$90°$], [$180°$],
      table.hline(stroke: 0.5pt + luma(0)),
      [rad], [$0$], [$pi/6$], [$pi/4$], [$pi/3$], [$pi/2$], [$pi$],
      [cos], [$1$], [$sqrt(3)/2$], [$sqrt(2)/2$], [$1/2$], [$0$], [$-1$],
      [sin], [$0$], [$1/2$], [$sqrt(2)/2$], [$sqrt(3)/2$], [$1$], [$0$],
      [tan], [$0$], [$1/sqrt(3)$], [$1$], [$sqrt(3)$], [$+oo$], [$0$],
    )
  ]
]

#align(center)[
  #cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    // Draw grid
    grid(
      (-7, -3),
      (7, 3),
      stroke: 0.25pt + luma(230),
    )

    // Draw axes
    line((-7.5, 0), (7.5, 0), mark: (end: ">"), stroke: 0.5pt + luma(120))
    line((0, -3.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt + luma(120))

    // Draw tick labels
    for y in (-2, -1, 1, 2) {
      line((-0.1, y), (0.1, y))
      content((-0.4, y), text(10pt)[#y])
    }

    for (x, label) in (
      (-2 * calc.pi, [$-2 pi$]),
      (-calc.pi, [$-pi$]),
      (-calc.pi / 2, [$-pi / 2$]),
      (calc.pi / 2, [$pi / 2$]),
      (calc.pi, [$pi$]),
      (2 * calc.pi, [$2 pi$]),
    ) {
      line((x, -0.1), (x, 0.1))
      content((x, 0.4), text(10pt)[#label])
    }

    // Plot sin and cos
    let sin-pts = ()
    let cos-pts = ()
    for i in range(120) {
      let x = -6.5 + 13.0 * i / 120
      sin-pts.push((x, calc.sin(x)))
      cos-pts.push((x, calc.cos(x)))
    }

    // Plot tan (avoiding asymptotes)
    let tan-pts = ()
    for i in range(50) {
      let x = -1.3 + 2.6 * i / 50
      tan-pts.push((x, calc.tan(x)))
    }

    line(..sin-pts, stroke: 1pt + rgb("#0c2896"))
    line(..cos-pts, stroke: 1pt + rgb("#fa0064"))
    line(..tan-pts, stroke: 1pt + rgb("#0c6400"))

    content((5.5, 1.2), text(10pt, fill: rgb("#0c2896"))[$sin(x)$])
    content((3.5, -1.5), text(10pt, fill: rgb("#fa0064"))[$cos(x)$])
    content((1.6, 2.0), text(10pt, fill: rgb("#0c6400"))[$tan(x)$])
  })
]

#colbreak()
#colbreak()
#colbreak()


== Ableitungen
#align(center)[
  #table(
    columns: (1.2fr, 1.2fr, 1.2fr),
    align: horizon + center,
    stroke: 0.5pt + luma(150),
    inset: 0.9em,
    [*$F(x)$*], [*$f(x)$*], [*$f'(x)$*],
    [$x^(-a+1) / (-a+1)$], [$1/x^a$], [$a / x^(a+1)$],
    [$x^(a+1) / (a+1)$], [$x^a (a != -1)$], [$a · x^(a-1)$],
    [$1/(k ln(a)) a^(k x)$], [$a^(k x)$], [$k a^(k x) ln(a)$],
    [$ln |x|$], [$1/x$], [$-1/x^2$],
    [$2/3 x^(3/2)$], [$sqrt(x)$], [$1/(2 sqrt(x))$],
    [$n/(n+1) x^(1/n + 1)$], [$root(n, x)$], [$1/n x^(1/n - 1)$],
    [$-cos(x)$], [$sin(x)$], [$cos(x)$],
    [$sin(x)$], [$cos(x)$], [$-sin(x)$],
    [$1/2 (x - 1/2 sin(2x))$], [$sin^2(x)$], [$2 sin(x) cos(x)$],
    [$1/2 (x + 1/2 sin(2x))$], [$cos^2(x)$], [$-2 sin(x) cos(x)$],
    [$-ln |cos(x)|$], [$tan(x)$], [$1/cos^2(x)$ \ $1 + tan^2(x)$],
    [$cosh(x)$], [$sinh(x)$], [$cosh(x)$],
    [$log(cosh(x))$], [$tanh(x)$], [$1/cosh^2(x)$],
    [$ln |sin(x)|$], [$cot(x)$], [$-1/sin^2(x)$],
    [$1/c · e^(c x)$], [$e^(c x)$], [$c · e^(c x)$],
    [$x(ln |x| - 1)$], [$ln |x|$], [$1/x$],
    [$1/2 (ln(x))^2$], [$ln(x)/x$], [$(1 - ln(x))/x^2$],
    [$x/ln(a) (ln |x| - 1)$], [$log_a |x|$], [$1/(ln(a) x)$],
  )
]

== Weitere Ableitungen
#align(center)[
  #table(
    columns: (1fr, 1fr),
    align: horizon + center,
    stroke: 0.5pt + luma(150),
    inset: 0.9em,
    [*$F(x)$*], [*$f(x)$*],
    [$1/(a (n+1)) (a x + b)^(n+1)$], [$(a x + b)^n$],
    [$arcsin(x)$], [$1/sqrt(1 - x^2)$],
    [$arccos(x)$], [$-1/sqrt(1 - x^2)$],
    [$arctan(x)$], [$1/(1 + x^2)$],
    [$arcsinh(x)$], [$1/sqrt(1 + x^2)$],
    [$arccosh(x)$], [$1/sqrt(x^2 - 1)$],
    [$arctanh(x)$], [$1/(1 - x^2)$],
    [$x^x (x > 0)$], [$x^x · (1 + ln x)$],
    [$log_a |x|$], [$1/(x ln a) = log_a(e) 1/x$],
    [$(a x + b)^(n+2) / (a^2 (n+1)(n+2))$], [$(a x + b)^(n+1) / (a (n+1))$],
    [$sqrt(1 - x^2) + x arcsin(x)$], [$arcsin(x)$],
    [$x arccos(x) - sqrt(1 - x^2)$], [$arccos(x)$],
    [$x arctan(x) - 1/2 log(x^2 + 1)$], [$arctan(x)$],
    [$x arcsinh(x) - sqrt(x^2 + 1)$], [$arcsinh(x)$],
    [$x arccosh(x) - sqrt(x^2 - 1) sqrt(x^2 + 1)$], [$arccosh(x)$],
    [$1/2 log(1 - x^2) + x arctanh(x)$], [$arctanh(x)$],
    [$alpha/gamma log|gamma x + beta|$], [$alpha / (gamma x + beta)$],
  )
]

#colbreak()

== Integrale
#align(center)[
  #table(
    columns: (1fr, 1fr),
    align: horizon + center,
    stroke: 0.5pt + luma(150),
    inset: 0.9em,
    [*$f(x)$*], [*$F(x)$*],
    [$integral f'(x) f(x) dif x$], [$1/2 (f(x))^2$],
    [$integral f'(x)/f(x) dif x$], [$ln|f(x)|$],
    [$integral_(-oo)^oo e^(-x^2) dif x$], [$sqrt(pi)$],
    [$integral (a x + b)^n dif x$], [$1/(a(n+1)) (a x + b)^(n+1)$],
    [$integral x (a x + b)^n dif x$], [$(a x + b)^(n+2) / ((n+2)a^2) - (b(a x + b)^(n+1)) / ((n+1)a^2)$],
    [$integral (a x^p + b)^n x^(p-1) dif x$], [$(a x^p + b)^(n+1) / (a p (n+1))$],
    [$integral (a x^p + b)^(-1) x^(p-1) dif x$], [$1/(a p) ln|a x^p + b|$],
    [$integral (a x + b) / (c x + d) dif x$], [$(a x)/c - (a d - b c)/c^2 ln|c x + d|$],
    [$integral 1/(x^2 + a^2) dif x$], [$1/a arctan(x/a)$],
    [$integral 1/(x^2 - a^2) dif x$], [$1/(2 a) ln|(x-a)/(x+a)|$],
    [$integral sqrt(a^2 + x^2) dif x$], [$x/2 f(x) + a^2/2 ln(x + f(x))$],
  )
]

== Definite Integrale
#align(center)[
  $ integral_0^(2 pi) sin(x) dif x = integral_0^(2 pi) cos(x) dif x = 0 $
  $ integral_0^(2 pi) sin^2(x) dif x = integral_0^(2 pi) cos^2(x) dif x = pi $
]

#subbox(title: "Gaußsche Glockenkurve")[
  Für das uneigentliche Integral über die _gaußsche Glockenkurve_ gilt:
  $ integral_(-oo)^oo e^(-x^2 / (2 sigma^2)) dif x = sqrt(2 pi sigma^2) $
]


