#import "config.typ": *

= Zufallsvariablen

Sei $(Omega, cal(F), P)$ ein Wahrscheinlichkeitsraum. Eine (reellwertige) *Zufallsvariable* ist eine Abbildung $X: Omega -> RR$, sodass für alle $x in RR$ gilt:
$ {omega in Omega | X(omega) <= x} in cal(F) . $

Eine Funktion $X$ ist *messbar* (Zufallsvariablen sind messbar), wenn:
$ X^(-1)(B) := {omega in Omega | X(omega) in B} in cal(F) "für alle" B in cal(B)(RR), $
wobei $cal(B)(RR)$ die *Borelsche $sigma$-Algebra* auf $RR$ bezeichnet. Beispiele:
- Alle offenen, abgeschlossenen und kompakten Mengen in $RR$.
- Alle Intervalle der Form $(a, b)$, $[a, b]$, $(a, b]$, $[a, b)$, $(-oo, b)$, $(-oo, b]$, $(a, oo)$ und $[a, oo)$ für $a, b in RR$.

== Verteilungsfunktion
Die *Verteilungsfunktion* ist die Abbildung $F_X : RR -> [0,1]$ definiert durch:
$ F_X (t) := PP(X <= t), quad forall t in RR $

Die Funktion erfüllt folgende Eigenschaften:
+ $F_X$ ist monoton wachsend
+ $F_X$ ist rechtsstetig, d.h. $lim_(h -> 0^+) F_X (x+h) = F_X (x)$
+ $lim_(x -> -oo) F_X (x) = 0$ und $lim_(x -> oo) F_X (x) = 1$

=== Rechenregeln für Intervalle (Verteilungsfunktion)
$bb(P)[a <= X <= b] = bb(P)[X <= b] - bb(P)[X < a] = F_X (b) - F_X (a^-)$ \
_(Ausgefüllter Punkt bei b, offener Punkt bei a)_

$bb(P)[a < X <= b] = bb(P)[X <= b] - bb(P)[X <= a] = F_X (b) - F_X (a)$ \
_(Ausgefüllter Punkt bei b, ausgefüllter Punkt bei a)_

$bb(P)[a <= X < b] = bb(P)[X < b] - bb(P)[X < a] = F_X (b^-) - F_X (a^-)$ \
_(Offener Punkt bei b, offener Punkt bei a)_

$bb(P)[a < X < b] = bb(P)[X < b] - bb(P)[X <= a] = F_X (b^-) - F_X (a)$ \
_(Offener Punkt bei b, ausgefüllter Punkt bei a)_

*Linksstetigkeit:* Die Verteilungsfunktion ist nicht immer linksstetig.
Sei $F_X (a^-) := lim_(h -> 0^+) F_X (a-h)$ für beliebige $a in RR$.
Dann gilt:
$ PP(X = a) = F_X (a) - F_X (a^-) $

Intuitiv folgt daraus:
- Wenn $F_X$ im Punkt $a in RR$ nicht stetig ist, dann ist die "Sprunghöhe" $F_X (a) - F_X (a^-)$ gleich der Wahrscheinlichkeit $PP(X = a)$.
- Wenn $F_X$ stetig im Punkt $a in RR$ ist, dann gilt $PP(X = a) = 0$.

#mainbox()[
  Seien $X_1, ..., X_n$ Zufallsvariablen auf einem Wahrscheinlichkeitsraum $(Omega, cal(F), P)$. Dann heissen $X_1, ..., X_n$ *unabhängig*, falls $forall x_1, ..., x_n in RR$:
  $ PP(X_1 <= x_1, ..., X_n <= x_n) = PP(X_1 <= x_1) · ... · PP(X_n <= x_n) . $
]

== Diskrete Zufallsvariablen
Sei $A in cal(F)$ ein Ereignis.\
Wir sagen $A$ tritt *fast sicher (f.s.)* ein, falls $PP(A) = 1$.\
Seien $X, Y: Omega -> RR$ Zufallsvariablen: $X <= Y "f.s." <=> PP(X <= Y) = 1$

#mainbox()[
  Eine Zufallsvariable $X: Omega -> RR$ heisst *diskret*, falls eine endliche oder abzählbare Menge $W subset.eq RR$ existiert, sodass:
  $ PP(X in W) = 1 $
  Falls $Omega$ endlich oder abzählbar ist, dann ist $X$ immer diskret.
]
Die *Verteilungsfunktion* einer diskreten ZV $X$:
$ F_X (x) = PP(X <= x) = sum_(y in W) p(y) · bb(1)_(y <= x) $
Die *Gewichtsfunktion* einer diskreten ZV $X$:
$ forall x in X(Omega): p(x) = PP(X=x) "wobei" sum_(x in X(Omega)) p(x) = 1 $

== Diskrete Verteilungen
*Bernoulli-Verteilung:* $X ~ "Ber"(p)$\
$X(Omega) = {0, 1}$ und die Gewichtsfunktion ist definiert durch:
$ p(1) := PP(X = 1) = p "und" p(0) := PP(X = 0) = 1 - p . $

*Binomialverteilung:* $X ~ "Bin"(n, p)$\
Wiederholung von $n$ unabhängigen Bernoulli-Experimenten mit gleichem Parameter $p$.
$ p(k) := PP(X = k) = binom(n, k) · p^k · (1-p)^(n-k) quad forall k in {0, 1, ..., n} $

*Geometrische Verteilung:* $X ~ "Geo"(p)$\
Warten auf den ersten Erfolg.
$ p(k) := PP(X = k) = (1-p)^(k-1) · p quad forall k in NN without {0} $

#mainbox(title: "Gedächtnislosigkeit")[
  Sei $T ~ "Geom"(p)$ mit $p in (0,1)$. Dann gilt für alle $n >= 0$ und alle $k >= 1$:
  $ PP(T >= n+k | T > n) = PP(T >= k) . $

  ($star$) Hält auch für $T ~ "Exp"(lambda)$.
]

*Poisson-Verteilung:* $X ~ "Poisson"(lambda)$\
Grenzwert der Binomialverteilung für grosse $n$ und kleine $p$.
$ p(k) := PP(X = k) = lambda^k / (k!) · e^(-lambda) quad forall k in NN_0, lambda > 0 $
+ ($star$) Für $X_n ~ "Bin"(n, lambda/n)$ gilt $lim_(n -> oo) PP(X_n = k) = PP(Y = k)$ wobei $Y ~ "Poisson"(lambda)$.
+ ($star$) Seien $X_1 ~ "Poisson"(lambda_1)$ und $X_2 ~ "Poisson"(lambda_2)$ unabhängig. Dann gilt $(X_1 + X_2) ~ "Poisson"(lambda_1 + lambda_2)$.

== Stetige Zufallsvariablen
#mainbox()[
  Eine Zufallsvariable $X: Omega -> RR$ heisst *stetig*, wenn ihre Verteilungsfunktion $F_X$ wie folgt geschrieben werden kann:
  $ F_X (x) = integral_(-oo)^x f_X (t) dif t quad "für alle" x in RR, $
  wobei $f_X: RR -> RR^+$ eine nicht-negative Funktion ist. $f_X$ wird dann als *Dichte* von $X$ bezeichnet.\
  Wenn $f_X: (RR, cal(B)) -> (RR, cal(B))$ messbar ist, ist die Zufallsvariable $X$ *absolut stetig*.
]
*Intuition:* $f_X (t) dif t$ ist die Wahrscheinlichkeit, dass $X in [t, t + dif t]$.

#subbox(title: "Prüfungs-Checkliste: Ist Funktion " + $f(x)$ + " eine gültige Dichte?")[
  Damit $f(x)$ eine Wahrscheinlichkeitsdichte sein darf, muss *beides*  erfüllt sein:
  + *Nicht-negativ:* $f(x) >= 0$ für alle $x$. (Wahrscheinlichkeiten können nicht negativ sein. Achtung: Wird bei Polynomen oft fies im Träger versteckt!)
  + *Normiert:* Integral über gesamten Träger muss 1 sein: $integral_(-oo)^oo f(x) dif x = 1$.
]

== Stetige Verteilungen
#grid(
  columns: (2fr, 1fr),
  gutter: 1em,
  align: horizon,
  [
    *Gleichverteilung:* $X ~ cal(U)([a,b])$\
    Die Dichte ist auf dem Intervall $[a, b]$ konstant.
  ],
  [
    $ f_(a,b)(x) = cases(1/(b-a) quad & x in [a,b], 0 & x in.not [a,b]) $
  ],
)

#grid(
  columns: (2fr, 1fr),
  gutter: 1em,
  align: horizon,
  [
    *Exponentialverteilung:* $T ~ "Exp"(lambda)$\
    Lebensdauer oder Wartezeit eines allgemeinen Ereignisses (stetiges Äquivalent zur Geometrischen Verteilung).
  ],
  [
    $ f_lambda (x) = cases(lambda e^(-lambda x) quad & x >= 0, 0 & x < 0) $
  ],
)

#grid(
  columns: (2fr, 1fr),
  gutter: 1em,
  align: horizon,
  [
    *Normalverteilung:* $X ~ cal(N)(mu, sigma^2)$\
    Häufig verwendete Verteilung. \
    Undefiniert für $sigma = 0$. Dann $X = "Konstante" mu$.
  ],
  [
    $ f_(mu, sigma)(x) = 1 / sqrt(2 pi sigma^2) e^(- (x-mu)^2 / (2 sigma^2)) $
  ],
)

+ Seien $X_1, ..., X_n$ *unabhängige* normalverteilte ZV mit Parametern $(mu_1, sigma_1^2), ..., (mu_n, sigma_n^2)$, dann ist \
  $Z = mu_0 + lambda_1 X_1 + ... + lambda_n X_n$
  eine normalverteilte ZV mit Parametern \ $mu = mu_0 + lambda_1 mu_1 + ... + lambda_n mu_n$ und $sigma^2 = lambda_1^2 sigma_1^2 + ... + lambda_n^2 sigma_n^2$.

+ Sei $Z ~ cal(N)(0,1)$ eine *standardnormalverteilte* Zufallsvariable. Dann gilt für $X ~ cal(N)(mu, sigma^2)$:
  $X = mu + sigma dot Z$

+ Für $X ~ cal(N)(mu, sigma^2)$ gilt $(X-mu)/sigma ~ cal(N)(0,1)$, also:
  $ F_X (x) = PP(X <=x) =PP((X-mu)/sigma <= (x-mu)/sigma) = Phi((x-mu)/sigma) . $

+ $Phi(-x) = 1 - Phi(x)$

#subbox(title: "Gesetz der grossen Zahlen & Momente (Prüfungstrick)")[
  Oft wird nach dem Grenzwert eines Durchschnitts $limn 1/n sum_(k=1)^n g(X_k)$ gefragt.
  *Schritt 1:* Nach dem Gesetz der grossen Zahlen konvergiert das immer gegen den Erwartungswert $EE[g(X)]$. *Nicht integrieren!*

  *Momente der zentrierten Normalverteilung $X ~ cal(N)(0, sigma^2)$:*
  + *Ungerade Potenzen (Symmetrie):* \
    Da die Kurve symmetrisch um 0 ist, heben sich Plus und Minus exakt auf.
    $ EE[X] = 0, quad EE[X^3] = 0, quad EE[X^5] = 0, quad dots $

  + *Gerade Potenzen ("Produkt der ungeraden Zahlen"):*
    Multipliziere einfach alle ungeraden Zahlen, die kleiner als der Exponent sind.
    $
      EE[X^2] & = 1 dot sigma^2,                        && EE[X^6] = 5 dot 3 dot 1 dot sigma^6 = 15 sigma^6, \
      EE[X^4] & = 3 dot 1 dot sigma^4 = 3 sigma^4, quad && EE[X^8] = 7 dot 5 dot 3 dot 1 dot sigma^8 = 105 sigma^8
    $
]