#import "config.typ": *

= Konvergenz von Wahr'keiten

#mainbox(title: "Konvergenz in Verteilung")[
  Seien $(X_n)_(n in NN)$ und $X$ Zufallsvariablen mit Verteilungsfunktionen $(F_n)_(n in NN)$ und $F$. $(X_n)_(n in NN)$ konvergiert *in Verteilung* gegen $X$, geschrieben $X_n arrow.r^d X$ für $n -> oo$, falls für jeden Stetigkeitspunkt $x in RR$ von $F$ gilt:
  $ lim_(n -> oo) F_n (x) = P(X_n <= x) = F(x) $
  Notation: $X_n arrow.r^w X$ oder $X_n arrow.r^L X$, wobei $d, w, L$ für _convergence in distribution_, _weak convergence_ bzw. _convergence in law_ stehen. (Nicht in Vorlesung)
]

#mainbox(title: "Schwaches Gesetz der grossen Zahlen")[
  Sei $X_1, X_2, ...$ eine Folge von unabhängigen Zufallsvariablen mit gleichen Erwartungswerten $E[X_k] = mu$ und Varianzen $bb(V)[X_k] = sigma^2$. Sei
  $ overline(X)_n = 1/n S_n = 1/n sum_(i=1)^n X_i $
  Dann konvergiert $overline(X)_n$ für $n -> oo$ *in Wahrscheinlichkeit* gegen $mu = E(X_i)$, d.h. für jedes $epsilon > 0$ gilt:
  $ P(|overline(X)_n - mu| > epsilon) arrow.r^(n -> oo) 0 . $
]

#mainbox(title: "Starkes Gesetz der grossen Zahlen")[
  Sei $X_1, X_2, ...$ eine Folge von u.i.v. (unabhängig und identisch verteilten) Zufallsvariablen. Sei $E(|X_1|) < oo$ und $mu = E(X_1)$. Für
  $ overline(X)_n = 1/n S_n = 1/n sum_(i=1)^n X_i $
  gilt dann:
  $ overline(X)_n arrow.r^(n -> oo) mu quad P"-fast sicher," $
  das bedeutet:
  $ P({omega in Omega | overline(X)_n (omega) arrow.r^(n -> oo) mu}) = 1 . $
]

#subbox()[
  Sei $X$ eine nicht-negative Zufallsvariable. Dann gilt $E[X] >= 0$. Gleichheit gilt genau dann, wenn $X=0$ fast sicher gilt.\
  Also (aus Vorlesung):
  $
    E[X] >= 0 & <== X >= 0 "gilt immer" \
              & "und" \
     E[X] = 0 & <=> X = 0 "fast sicher, also" P(X != 0) = 0
  $
]

== Zentraler Grenzwertsatz
#mainbox(title: "Zentraler Grenzwertsatz")[
  Sei $(X_n)_(n in NN)$ eine Folge von i.i.d. Zufallsvariablen mit \ $markhl(E(X_i) = mu, color: #rgb("#ffff00")) < oo$ und $markhl(Var(X_i) = sigma^2, color: #rgb("#00ff00")) < oo$ ($EE$ und $VV$ sind _von der einzelnen Variable_ $X_i$). Dann gilt:
  $
    limn P((S_n - n dot markhl(mu, color: #rgb("#ffff00"))) / (sqrt(markhl(sigma^2, color: #rgb("#00ff00"))) dot sqrt(n)) markhl(<=) med x) = Phi(x) quad forall x in RR
  $
  #v(-12pt)
  also:
  #v(-10pt)
  $
    text(#rgb("#969696"), ((1/n S_n - markhl(mu, color: #rgb("#ffff00"))) / sqrt(markhl(sigma^2, color: #rgb("#00ff00")) / n) =)) (S_n - n dot markhl(mu, color: #rgb("#ffff00"))) / (sqrt(markhl(sigma^2, color: #rgb("#00ff00"))) dot sqrt(n)) arrow.r.long^d cal(N)(0, 1)
  $
]

*Bemerkungen:*

Man verwendet auch oft die Form für $overline(X)_n = 1/n S_n$ als:
$
  (overline(X)_n - markhl(mu, color: #rgb("#ffff00"))) / (sqrt(markhl(sigma^2, color: #rgb("#00ff00")) / n)) arrow.r.long^d cal(N)(0,1) #h(1fr) (star)
$
#v(-12pt)
beziehungsweise:
$
  S_n ~ cal(N)(n dot markhl(mu, color: #rgb("#ffff00")), n dot markhl(sigma^2, color: #rgb("#00ff00"))) " und " overline(X)_n ~ markhl(cal(N)(mu, 1/n sigma^2)) #h(1fr) (star)
$

*Generelles Standardisieren*:
Sei $T_n$ eine Summe oder skalierter Durchschnitt oder sonst irgendwas von $n$ verschiedenen i.i.d. Zufallsvariablen. Dann gilt:
$ (T_n - markhl(EE[T_n], color: #rgb("#ffff00"))) / sqrt(markhl("Var"(T_n), color: #rgb("#00ff00"))) arrow.r.long^d cal(N)(0,1) $

=== Beispielrechnung
Seien $(X_i)_(i >= 1)$, $(Y_i)_(i >= 1)$ und $(Z_i)_(i >= 1)$ Folgen von i.i.d. ZV mit:
$ P(X_1 = 1) = P(X_1 = -1) = 1/2 $
und analog für $Y_1$ und $Z_1$. Wir definieren:
$ S_n^((x)) := sum_(i=1)^n X_i, quad S_n^((y)) := sum_(i=1)^n Y_i, quad S_n^((z)) := sum_(i=1)^n Z_i $
Die Folge $((S_n^((x)), S_n^((y)), S_n^((z))))_(n >= 1)$ wird zufällige Irrfahrt in $ZZ^3$ genannt. Sei $alpha > 1/2$. Zeige, dass:
$ P(norm((S_n^((x)), S_n^((y)), S_n^((z))))_2 <= n^alpha) -> 1 " für " n -> oo, $
wobei $norm((x,y,z))_2 := sqrt(x^2 + y^2 + z^2)$ die euklidische Norm ist.

_Schritt 1:_ $forall alpha > 1/2$ zeigen wir $P(|S_n^((x))| <= n^alpha) arrow.r^(n -> oo) 1$.

Da $E(X_i) = 0$ und $Var(X_i) = 1$ folgt für beliebige $a in RR$ per ZGS:
$ P(S_n^((x)) <= a sqrt(n)) = P(S_n^((x)) / sqrt(n) <= a) arrow.r^(n -> oo) Phi(a) $
und somit auch:
$
  P(|S_n^((x))| <= a sqrt(n)) & = P(S_n^((x)) <= a sqrt(n)) - P(S_n^((x)) <= - a sqrt(n)) \
                              & arrow.r^(n -> oo) Phi(a) - Phi(-a) = 2 Phi(a) - 1
$
Sei $alpha = 1/2 + beta, beta > 0$. Dann instanziieren wir mit $a = n^beta$:
$ P(|S_n^((x))| <= n^alpha) = P(|S_n^((x))| <= n^beta sqrt(n)) -> limn (2 Phi(n^beta) - 1) = 1 $
Dies gilt analog für $S_n^((y))$ und $S_n^((z))$.

_Schritt 2:_ $forall alpha > 1/2, P(norm((S_n^((x)), S_n^((y)), S_n^((z))))_2 <= n^alpha) arrow.r^(n -> oo) 1$

Sei $alpha' in (1/2, alpha)$. Dann folgt:
$
  {|S_n^((x))| <= n^(alpha') and |S_n^((y))| <= n^(alpha') and |S_n^((z))| <= n^(alpha')} \ subset.eq {norm((S_n^((x)), S_n^((y)), S_n^((z))))_2 <= sqrt(3) · n^(alpha')}
$
Da $n^alpha >= sqrt(3) n^(alpha')$ für grosse $n$, folgt:
$
  & limn P(norm((S_n^((x)), S_n^((y)), S_n^((z))))_2 <= n^alpha) \
  & >= limn P(norm((S_n^((x)), S_n^((y)), S_n^((z))))_2 <= sqrt(3) · n^(alpha')) \
  & >= limn P(|S_n^((x))| <= n^(alpha'), |S_n^((y))| <= n^(alpha'), |S_n^((z))| <= n^(alpha')) = 1
$

#subbox(title: "Momenterzeugende Funktion")[
  Die momenterzeugende Funktion einer Zufallsvariablen $X$ ist für $t in RR$ definiert durch:
  $ M_X (t) = E[e^(t X)] = integral_(-oo)^oo e^(t x) f_X (x) dif x . $
  Immer wohldefiniert in $[0, oo]$, kann aber $+oo$ werden.
]

*Chernoff-Ungleichung*\
Seien $X_1, ..., X_n$ i.i.d. Zufallsvariablen, für welche $M_X (t)$ für alle $t in RR$ endlich ist. Für jedes $b in RR$ gilt:
$ P(S_n >= b) <= exp(inf_(t in RR) (n log M_X (t) - t b)) . $

*Chernoff-Schranke*\
Seien $X_1, ..., X_n$ unabhängig mit $X_k ~ "Ber"(p_k)$ und sei $S_n = sum_(k=1)^n X_k$, $mu_n = E[S_n] = sum_(k=1)^n p_k$ und $delta > 0$, dann gilt:
$ P(S_n >= (1 + delta) mu_n) <= (e^delta / (1+delta)^(1+delta))^(mu_n) . $
