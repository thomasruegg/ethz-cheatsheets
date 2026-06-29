#import "config.typ": *

= Mehrere Zufallsvariablen

#mainbox()[
  Die *gemeinsame Verteilungsfunktion* von $n$ Zufallsvariablen $X_1, ..., X_n$ (stetig oder diskret) ist die Abbildung $F: RR^n -> [0,1]$:
  $ F(x_1, ..., x_n) := P(X_1 <= x_1, ..., X_n <= x_n) $
]

== Diskreter Fall - Gewichtsfunktion
Für $n$ diskrete ZV $X_1, ..., X_n$ definieren wir ihre *gemeinsame Gewichtsfunktion* $p: RR^n -> [0,1]$ durch:
$ p(x_1, ..., x_n) := P(X_1 = x_1, ..., X_n = x_n) $
Dann ist die *gemeinsame Verteilungsfunktion*:
$
  F(x_1, ..., x_n) & = P(X_1 <= x_1, ..., X_n <= x_n) \
                   & = sum_(y_1 <= x_1, ..., y_n <= x_n) p(y_1, ..., y_n)
$

#subbox(title: "Verteilung des Bildes")[
  Sei $n >= 1$, $phi: RR^n -> RR$, $X_1, ..., X_n$ *diskrete* ZV mit Werten in $W_1, ..., W_n$. Dann ist $Z = phi(X_1, ..., X_n)$ diskret mit Werten in $W = phi(W_1 times ... times W_n)$. Die Verteilung von $Z$ für $z in W$ ist:
  $ P(Z = z) = sum_(x_1 in W_1, ..., x_n in W_n \ phi(x_1, ..., x_n)=z) P(X_1 = x_1, ..., X_n = x_n) $
]

*Randdichte/Randgewicht.* Seien $X_1, ..., X_n$ diskrete ZV mit gemeinsamer Gewichtsfkt. $p$. Für jedes $k in {1, ..., n}$ und jedes $x in W_k$ gilt:
$ P(X_k = x) = sum_(x_ell in W_ell \ ell in {1, ..., n} without {k}) p(x_1, ..., x_(k-1), x, x_(k+1), ..., x_n) $

*Der Erwartungswert des Bildes der Funktion* $phi: RR^n -> RR$ ist:
$ E(phi(X_1, ..., X_n)) = sum_(x_1, ..., x_n) phi(x_1, ..., x_n) p(x_1, ..., x_n) $

Seien $X_1, ..., X_n$ diskrete ZV mit gemeinsamer Verteilung ${p(x_1, ..., x_n)}_(x_1 in W_1, ..., x_n in W_n)$. Dann ist *äquivalent*:
- (i) $X_1, ..., X_n$ sind unabhängig,
- (ii) für alle $x_1 in W_1, ..., x_n in W_n$ gilt:
  $ p(x_1, ..., x_n) = P(X_1 = x_1) · ... · P(X_n = x_n) $

== Stetiger Fall - Gemeinsame Dichte
#mainbox(title: "Gemeinsame Dichte")[
  Falls die gemeinsame Verteilungsfunktion von $n$ Zufallsvariablen $X_1, ..., X_n$ sich schreiben lässt als:
  $ F(x_1, ..., x_n) = integral_(-oo)^(x_1) ... integral_(-oo)^(x_n) f(t_1, ..., t_n) dif t_n ... dif t_1 $
]

*Randverteilung.* Haben $X, Y$ die gemeinsame Verteilungsfunktion $F_(X,Y)$, so ist $F_X: RR -> [0,1]$:
$ F_X (x) := P(X <= x) = P(X <= x, Y <= oo) = lim_(y -> oo) F_(X,Y)(x,y) $
die Vertsfkt. der Randverteilung von $X$. _Analog für $F_Y$._

*Randdichte.* Seien $X, Y$ ZV mit gemeinsamer Dichte $f(x,y)$:
$ f_X (x) = integral_(-oo)^oo f(x,y) dif y quad "bzw." quad f_Y (y) = integral_(-oo)^oo f(x,y) dif x $

Seien $X_1, ..., X_n$ ZV mit Dichten $f_(X_1), ..., f_(X_n)$.\
Dann sind folgende Aussagen *äquivalent*:
- (i) $X_1, ..., X_n$ sind unabhängig,
- (ii) $X_1, ..., X_n$ sind gemeinsam stetig mit gemeinsamer Dichte $f: RR^n -> RR_+$, d.h. die gemeinsame Dichtefunktion $f$ ist das Produkt der einzelnen Randdichten $f_(X_k)$, also:
  $ f(x_1, ..., x_n) = f_(X_1)(x_1) dot ... dot f_(X_n)(x_n) $

#subbox(title: "Beispiel Randdichten")[
  Rechteck $R = [-1, 1] times [0, 4]$. Seien $X, Y$ ZV mit gemeinsamer Dichte $f: RR^2 -> RR_+$:
  $
    f(x,y) = 1/8 dot bb(1)_(x in [-1,1]) dot bb(1)_(y in [0,4]) = cases(
      1/8 & "falls" (x,y) in R,
      0 & "falls" (x,y) in.not R.
    )
  $

  Randdichte von $X$ bzw. $Y$:
  $
    f_X (x) = integral_(-oo)^oo f(x,y) dif y
    = integral_0^4 1/8 dot bb(1)_(x in [-1,1]) dif y
    = 1/2 dot bb(1)_(x in [-1,1])
    \
    f_Y (y) = integral_(-oo)^oo f(x,y) dif x
    = integral_(-1)^1 1/8 dot bb(1)_(y in [0,4]) dif x
    = 1/4 dot bb(1)_(y in [0,4])
  $
]

== Stetiger Fall - Bedingte Dichte
Seien $X,Y$ ZV auf $(Omega, cal(F), PP)$ mit gemeinsamer Dichte $f_(X,Y)(x,y)$ und Randdichte $f_Y (y) != 0$. Dann ist die bedingte Dichte von $X$ bedingt durch $Y$:
$ f_(X|Y)(x|y) = (f_(X,Y)(x,y))/(f_Y (y)) $
