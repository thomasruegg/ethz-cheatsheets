#import "config.typ": *

= Mehrere Zufallsvariablen

#mainbox()[
  Die *gemeinsame Verteilungsfunktion* von $n$ Zufallsvariablen $X_1, ..., X_n$ (stetig oder diskret) ist die Abbildung $F: RR^n -> [0,1]$:
  $ F(x_1, ..., x_n) := PP(X_1 <= x_1, ..., X_n <= x_n) $
]

== Diskreter Fall - Gewichtsfunktion
Für $n$ diskrete ZV $X_1, ..., X_n$ definieren wir ihre *gemeinsame Gewichtsfunktion* $p: RR^n -> [0,1]$ durch:
$ p(x_1, ..., x_n) := PP(X_1 = x_1, ..., X_n = x_n) $
Dann ist die *gemeinsame Verteilungsfunktion*:
$
  F(x_1, ..., x_n) & = PP(X_1 <= x_1, ..., X_n <= x_n) 
                   & = sum_(y_1 <= x_1, ..., y_n <= x_n) p(y_1, ..., y_n)
$

#subbox(title: "Verteilung des Bildes")[
  Sei $n >= 1$, $phi: RR^n -> RR$, $X_1, ..., X_n$ *diskrete* ZV mit Werten in $W_1, ..., W_n$. Dann ist $Z = phi(X_1, ..., X_n)$ diskret mit Werten in $W = phi(W_1 times ... times W_n)$. Die Verteilung von $Z$ für $z in W$ ist:
  $ PP(Z = z) = sum_(x_1 in W_1, ..., x_n in W_n \ phi(x_1, ..., x_n)=z) PP(X_1 = x_1, ..., X_n = x_n) $
]

*Randdichte/Randgewicht:* Seien $X_1, ..., X_n$ diskrete ZV mit gemeinsamer Gewichtsfunktion $p$. Für jedes $k in {1, ..., n}$ und jedes $x in W_k$ gilt:
#v(-1em)
$
  PP(X_k = x) = sum_(x_ell in W_ell \ ell in {1, ..., n} without {k}) p(x_1, ..., x_(k-1), underbrace(x, x_k "locked"), x_(k+1), ..., x_n)
$

*Der Erwartungswert des Bildes der Funktion* $phi: RR^n -> RR$ ist:
$ EE[phi(X_1, ..., X_n)] = sum_(x_1, ..., x_n) phi(x_1, ..., x_n) p(x_1, ..., x_n) $

Seien $X_1, ..., X_n$ diskrete ZV mit gemeinsamer Verteilung $p(x_1, ..., x_n)_(x_1 in W_1, ..., x_n in W_n)$. Dann ist *äquivalent*: \
$X_1, ..., X_n$ sind unabhängig $<==>$ für alle $x_1 in W_1, ..., x_n in W_n$ gilt:
  $ p(x_1, ..., x_n) = PP(X_1 = x_1) · ... · PP(X_n = x_n) $

== Stetiger Fall - Gemeinsame Dichte
#mainbox(title: "Gemeinsame Dichte")[
  Falls die gemeinsame Verteilungsfunktion von $n$ Zufallsvariablen $X_1, ..., X_n$ sich schreiben lässt als:
  #v(-1em)
  $ PP[X_1 <= x_1, dots.c , X_n <= x_n]=F(x_1, ..., x_n) = integral_(-oo)^(x_1) ... integral_(-oo)^(x_n) f(t_1, ..., t_n) dif t_n ... dif t_1 $
]

*Randverteilung.* Haben $X, Y$ die gemeinsame Verteilungsfunktion $F_(X,Y)$, so ist $F_X: RR -> [0,1]$:
$ F_X (x) := PP(X <= x) = PP(X <= x, Y <= oo) = lim_(y -> oo) F_(X,Y)(x,y) $
die Verteilungsfunktion der Randverteilung von $X$. _Analog für $F_Y$._

*Randdichte.* Seien $X, Y$ ZV mit gemeinsamer Dichte $f(x,y)$:
$ f_X (x) = integral_(-oo)^oo f(x,y) dif y quad "bzw." quad f_Y (y) = integral_(-oo)^oo f(x,y) dif x $

Seien $X_1, ..., X_n$ ZV mit Dichten $f_(X_1), ..., f_(X_n)$.\
Dann sind folgende Aussagen *äquivalent*:
- (i) $X_1, ..., X_n$ sind unabhängig,
- (ii) $X_1, ..., X_n$ sind gemeinsam stetig mit gemeinsamer Dichte $f: RR^n -> RR_+$, d.h. die gemeinsame Dichtefunktion $f$ ist das Produkt der einzelnen Randdichten $f_(X_k)$, also:
  $ f(x_1, ..., x_n) = f_(X_1)(x_1) dot ... dot f_(X_n)(x_n) $

#subbox(title: "Beispiel Randdichten")[
  Rechteck $R = [-1, 1] times [0, 4]$. Seien $X, Y$ ZV mit gemeinsamer Dichte $f: RR^2 -> RR_+$:
  #v(-2em)
  $
    f(x,y) = 1/8 dot bb(1)_(x in [-1,1]) dot bb(1)_(y in [0,4]) = cases(
      1/8 & "falls" (x,y) in R,
      0 & "falls" (x,y) in.not R.
    )
  $
  #v(-1em)

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

#subbox(title: "🚨 Doppelintegrale mit abhängigen Grenzen")[
  Bei Berechnung von gemeinsamen Dichten oder Randdichten über Bereich mit *abhängigen* Variablen (z.B. $0 < y < x$) gilt die *Goldene Regel*:
  *Die Grenzen des äußersten Integrals müssen immer Konstanten (Zahlen oder $oo$) sein!* Nur innere Integrale dürfen Variablen in Grenzen haben, und zwar nur jene der äusseren Integrale.

  *E.g:* Bestimme $c$ für Dichte $f_(X,Y)(x,y) = c e^(-x)$ auf Bereich $0 < y < x$.

  *Weg 1: Zuerst nach $y$ integrieren (nimm das wo Grenzen öfters 0 sind)*
  - *Äußere Grenzen ($x$):* Welche Werte nimmt $x$ insgesamt an? $x in (0, oo)$.
  - *Innere Grenzen ($y$):* Für ein festes $x$, wo läuft $y$? Von $0$ bis $x$.
  $c integral_0^oo ( integral_0^x e^(-x) dif y ) dif x = c integral_0^oo [y e^(-x)]_0^x dif x = c integral_0^oo x e^(-x) dif x = 1 => c = 1$

  *Weg 2: Zuerst nach $x$ integrieren*
  - *Äußere Grenzen ($y$):* Welche Werte nimmt $y$ insgesamt an? $y in (0, oo)$.
  - *Innere Grenzen ($x$):* Für ein festes $y$, wo läuft $x$? Von $y$ bis $oo$ (da $y < x$).
  $c integral_0^oo ( integral_y^oo e^(-x) dif x ) dif y = c integral_0^oo [-e^(-x)]_y^oo dif y = c integral_0^oo e^(-y) dif y = 1 => c = 1$

  *Sanity Check für die Prüfung:* Wenn das finale Resultat eines bestimmten Doppelintegrals über den ganzen Bereich noch Variablen (wie $x$ oder $y$) enthält (z.B. $c = 1/x$), wurden die Grenzen falsch gesetzt!

  *Sind $X$ und $Y$ unabhängig?* Da der Träger der gemeinsamen Dichte $f_(X, Y) (x, y)$ nicht das kartesische Produkt der Träger der Randdichten ist (die Grenzen von $x$ hängen von $y$ ab: $0<y<x$ ), müssen $X$ und $Y$ *abhängig* sein.
]

== Stetiger Fall - Bedingte Dichte
Seien $X,Y$ ZV auf $(Omega, cal(F), PP)$ mit gemeinsamer Dichte $f_(X,Y)(x,y)$ und Randdichte $f_Y (y) != 0$. Dann ist die bedingte Dichte von $X$ bedingt durch $Y$:
$ f_(X|Y)(x|y) = (f_(X,Y)(x,y))/(f_Y (y)) $
