#import "config.typ": *

= Erwartungswert

#mainbox(title: "Erwartungswert (Stetige ZV)")[
  Sei $X: Omega -> RR$ eine stetige Zufallsvariable mit Dichte $f_X$. Sei $phi: RR -> RR$ eine Abbildung, sodass $phi(X)$ eine Zufallsvariable ist. Dann gilt:
  $ EE[phi(X)] = integral_(-oo)^oo phi(x) f_X (x) dif x, $
  falls das Integral wohldefiniert ist (bei $phi = "id"$ absolut konvergent).\
  Sei $X$ eine stetige ZV mit $X >= 0$ f.s., dann gilt:
  $ EE[X] = integral_0^oo (1 - F_X (x)) dif x $

  Der *Allgemeine Erwartungswert* für eine reellwertige ZV $X$ mit $EE[ |X| ] < oo$ ist definiert als:
  $
    EE[X] & = EE[X_+] - EE[X_-] quad "mit" X_(plus.minus) = max(plus.minus X, 0) \
         & = integral_0^oo (1 - F_X (x)) dif x - integral_(-oo)^0 F_X (x) dif x
  $
]

#mainbox(title: "Erwartungswert (Diskrete ZV)")[
  Sei $X: Omega -> RR$ eine diskrete Zufallsvariable, $W_X := X(Omega)$ und $phi: RR -> RR$ eine Abbildung. Falls die Summe wohldefiniert ist, gilt:
  $ EE[phi(X)] := sum_(x in W_X) phi(x) · PP(X = x) $
]

Sei $X$ eine nicht-negative Zufallsvariable. Dann gilt $EE[X] >= 0$. Gleichheit gilt genau dann, wenn $X = 0$ fast sicher ist.
$
  EE[X] >= 0 & <== X >= 0 "immer" \
   EE[X] = 0 & <==> X = 0 "fast sicher, d.h." PP(X != 0) = 0
$

== Rechnen mit Erwartungswerten
*Linearität des Erwartungswertes*:

Seien $X, Y: Omega -> RR$ ZV mit $lambda in RR$. Falls die Erwartungswerte wohldefiniert sind, gilt:
$ EE[lambda · X + Y] = lambda · EE[X] + EE[Y] $

Falls $X, Y$ *unabhängig* sind, dann gilt auch:
$ EE[X · Y] = EE[X] · EE[Y] $

Generell: $X_1, X_2, ..., X_n$ unabhängig und endlich:
$ EE[product_(k=1)^n X_k] = product_(k=1)^n EE[X_k] $

== Ungleichungen
*Monotonie*\
Seien $X, Y$ ZV mit $X <= Y$ f.s., dann gilt:
$EE[X] <= EE[Y]$

*Markow-Ungleichung*\
Sei $X$ eine ZV und ferner $g: X(Omega) -> [0, +oo)$ eine wachsende Funktion. Für jedes $c in RR$ mit $g(c) > 0$ gilt dann:
$ PP(X >= c) <= EE[g(X)] / g(c) quad limits(==>)^(t > 0) quad PP(X >= t) <= EE[X] / t $

*Chebyshev-Ungleichung*\
Sei $Y$ eine ZV mit endlicher Varianz. Für jedes $b > 0$ gilt dann:
$ PP(|Y - EE[Y]| >= b) <= Var(Y) / b^2 $

*Chernoff-Ungleichung*\  //TODO: REDUNDANT! Siehe anderes Kapitel
Seien $X_1, ..., X_n$ unabhängig mit $X_k tilde "Ber"(p_k)$ und sei $S_n = sum_(k=1)^n X_k$. Sei $mu_n = EE[S_n] = sum_(k=1)^n p_k$ und $delta > 0$, dann gilt
$ bb(P)[S_n >= (1 + delta)mu_n] <= (e^delta / (1 + delta)^(1 + delta))^(mu_n) $


*Jensen-Ungleichung*\
Sei $X$ eine ZV und $phi: RR -> RR$ eine  Funktion, dann gilt:
#grid(
  columns: (1fr, 1fr),
  gutter: 0.5em,
  [
    falls $phi$ #markhl("konvex"): \ $phi(EE[X]) markhl(<=) EE[phi(X)]$
  ],
  [
    falls $phi$ #markhl("konkav", color: rgb("#00ff00")): \ $phi(EE[X]) markhl(>=, color: #rgb("#00ff00")) EE[phi(X)]$
  ],
)

Daraus folgt (e.g. im #markhl("konvexen") Fall): $|EE[X]| markhl(<=) EE[ |X| ]$ und
$
  (EE[ |X| ])^2 & markhl(<=) EE[( |X| )^2] \
  (EE[ |X| ])^2 & markhl(<=) EE[X^2] \
      EE[ |X| ] & markhl(<=) sqrt(EE[X^2])
$

== Varianz
#mainbox(title: "Varianz")[
  Sei $X$ eine ZV, sodass $EE[X^2] < oo$. Die *Varianz* von $X$ ist definiert durch:
  $ Var(X) = sigma_X^2 = EE[(X - EE[X])^2] = EE[X^2] - EE[X]^2 $
  wobei $m = EE[X]$. Dabei wird $sigma_X$ als *Standardabweichung* von $X$ bezeichnet und beschreibt den Erwartungswert für die Distanz von $X$ zu $EE[X]$.
]

+ Sei $X$ ein ZV, sodass $EE[X^2] < oo$ und $a, b in RR$:
  $ Var(a · X + b) = a^2 · Var(X) $
+ Seien $X_1, ..., X_n$ paarweise unabhängig. Dann gilt:
  $ Var(X_1 + ... + X_n) = Var(X_1) + ... + Var(X_n) $

#mainbox(title: "Kovarianz")[
  Seien $X, Y$ ZV mit $EE[X^2] < oo, space EE[Y^2] < oo$. Wir definieren die *Kovarianz* zwischen $X$ und $Y$ durch:
  $
    cov(X, Y) & := EE[(X - EE[X])(Y - EE[Y])] \
              & = EE[X Y] - EE[X] EE[Y]
  $
]
+ $cov(X, X) = Var(X)$
+ $X, Y$ unabhängig $=> cov(X, Y) = 0$ ($markhl(arrow.double.l.not)$)
+ $markhl(Var(X plus.minus Y) = Var(X) + Var(Y) plus.minus 2 cov(X, Y), color: #rgb("#ffff00"))$
+ ($star$) $cov(sum_(i=1)^n X_i, sum_(j=1)^n Y_j) = sum_(i=1)^n sum_(j=1)^n cov(X_i, Y_j)$

*Korrelationen*
- $cov(X, Y) > 0 =>$ positiv korreliert
- $cov(X, Y) = 0 =>$ unkorreliert
- $cov(X, Y) < 0 =>$ negativ korreliert / antikorreliert

Es gilt: $X_i, X_j$ unabhängig $=> X_i, X_j$ unkorreliert. \
Sowie: $X_i, X_j$ korreliert $=> X_i, X_j$ abhängig.

*Eigenschaften der Kovarianz*\
Für $X, Y, Z$ mit $EE[X_i^2] < oo$ und $a, b, c, d, e, f, g, h in RR$:
+ Positive Semidefinitheit: $cov(X, X) >= 0$
+ Symmetrie: $cov(X, Y) = cov(Y, X)$
+ Bilinearität: $cov(a X + b, c Y + d) = a c cov(X, Y)$ und \ $cov(X, (e Y + f) + (g Z + h)) = e cov(X, Y) + g cov(X, Z)$
