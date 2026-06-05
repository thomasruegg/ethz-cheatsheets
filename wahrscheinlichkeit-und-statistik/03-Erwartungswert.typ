#import "config.typ": *

= Erwartungswert

#mainbox(title: "Erwartungswert (Stetige ZV)")[
  Sei $X: Omega -> R$ eine stetige Zufallsvariable mit Dichte $f_X$. Sei $phi: R -> R$ eine Abbildung, sodass $phi(X)$ eine Zufallsvariable ist. Dann gilt:
  $ E[phi(X)] = integral_(-oo)^oo phi(x) f_X (x) dif x, $
  falls das Integral wohldefiniert ist (bei $phi = "id"$ absolut konvergent).\
  Sei $X$ eine stetige ZV mit $X >= 0$ f.s., dann gilt:
  $ E[X] = integral_0^oo (1 - F_X (x)) dif x $

  Der *Allgemeine Erwartungswert* für eine reellwertige ZV $X$ mit $E[|X|] < oo$ ist definiert als:
  $ E[X] &= E[X_+] - E[X_-] quad "mit" X_(plus.minus) = max(plus.minus X, 0) \
         &= integral_0^oo (1 - F_X (x)) dif x - integral_(-oo)^0 F_X (x) dif x $
]

#mainbox(title: "Erwartungswert (Diskrete ZV)")[
  Sei $X: Omega -> R$ eine diskrete Zufallsvariable, $W_X := X(Omega)$ und $phi: R -> R$ eine Abbildung. Falls die Summe wohldefiniert ist, gilt:
  $ E(phi(X)) := sum_(x in W_X) phi(x) · P(X = x) $
]

Sei $X$ eine nicht-negative Zufallsvariable. Dann gilt $E[X] >= 0$. Gleichheit gilt genau dann, wenn $X = 0$ fast sicher ist.
$ E[X] >= 0 &<== X >= 0 "immer" \
  E[X] = 0 &<=> X = 0 "fast sicher, d.h." P(X != 0) = 0 $

== Rechnen mit Erwartungswerten
*Linearität des Erwartungswertes*:

Seien $X, Y: Omega -> R$ ZV mit $lambda in R$. Falls die Erwartungswerte wohldefiniert sind, gilt:
$ E(lambda · X + Y) = lambda · E(X) + E(Y) $

Falls $X, Y$ *unabhängig* sind, dann gilt auch:
$ E(X · Y) = E(X) · E(Y) $

Generell: $X_1, X_2, ..., X_n$ unabhängig und endlich:
$ E[product_(k=1)^n X_k] = product_(k=1)^n E[X_k] $

== Ungleichungen
*Monotonie*\
Seien $X, Y$ ZV mit $X <= Y$ f.s., dann gilt:
$ E(X) <= E(Y) $

*Markow-Ungleichung*\
Sei $X$ eine ZV und ferner $g: X(Omega) -> [0, +oo)$ eine wachsende Funktion. Für jedes $c in R$ mit $g(c) > 0$ gilt dann:
$ P(X >= c) <= E(g(X)) / g(c) quad limits(==>)^(t > 0) quad P(X >= t) <= E(X) / t $

*Chebyshev-Ungleichung*\
Sei $Y$ eine ZV mit endlicher Varianz. Für jedes $b > 0$ gilt dann:
$ P(|Y - E(Y)| >= b) <= Var(Y) / b^2 $

*Jensen-Ungleichung*\
Sei $X$ eine ZV und $phi: R -> R$ eine konvexe Funktion, dann gilt:
$ phi(E(X)) <= E(phi(X)) $

== Varianz
#mainbox(title: "Varianz")[
  Sei $X$ eine ZV, sodass $E(X^2) < oo$. Die *Varianz* von $X$ ist definiert durch:
  $ bb(V)(X) = sigma_X^2 = E[(X - E[X])^2] = E[X^2] - E[X]^2 $
  wobei $m = E(X)$. Dabei wird $sigma_X$ als *Standardabweichung* von $X$ bezeichnet und beschreibt den Erwartungswert für die Distanz von $X$ zu $E(X)$.
]

+ Sei $X$ ein ZV, sodass $E(X^2) < oo$ und $a, b in R$:
  $ bb(V)(a · X + b) = a^2 · bb(V)(X) $
+ Seien $X_1, ..., X_n$ paarweise unabhängig. Dann gilt:
  $ bb(V)(X_1 + ... + X_n) = bb(V)(X_1) + ... + bb(V)(X_n) $

#mainbox(title: "Kovarianz")[
  Seien $X, Y$ ZV mit $E(X^2) < oo, E(Y^2) < oo$. Wir definieren die *Kovarianz* zwischen $X$ und $Y$ durch:
  $ cov(X,Y) &:= E[(X - E[X])(Y - E[Y])] \
              &= E(X Y) - E(X) E(Y) $
]
+ $cov(X,X) = bb(V)(X)$
+ $X, Y$ unabhängig $=> cov(X, Y) = 0$ ($arrow.not.l$)
+ $bb(V)(X plus.minus Y) = bb(V)(X) + bb(V)(Y) plus.minus 2 cov(X, Y)$
+ ($star$) $cov(sum_(i=1)^n X_i, sum_(j=1)^n Y_j) = sum_(i=1)^n sum_(j=1)^n cov(X_i, Y_j)$

*Korrelationen*
- $cov(X, Y) > 0 =>$ positiv korreliert
- $cov(X, Y) = 0 =>$ unkorreliert
- $cov(X, Y) < 0 =>$ negativ korreliert / antikorreliert

Es gilt: $X_i, X_j$ unabhängig $=> X_i, X_j$ unkorreliert.

*Eigenschaften der Kovarianz*\
Für $X, Y, Z$ mit $E[X_i^2] < oo$ und $a, b, c, d, e, f, g, h in RR$:
+ Positive Semidefinitheit: $cov(X, X) >= 0$
+ Symmetrie: $cov(X, Y) = cov(Y, X)$
+ Bilinearität: $cov(a X + b, c Y + d) = a c cov(X, Y)$ und $cov(X, (e Y + f) + (g Z + h)) = e cov(X, Y) + g cov(X, Z)$
