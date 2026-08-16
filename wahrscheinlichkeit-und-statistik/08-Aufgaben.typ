#import "config.typ": *

= Aufgaben

*Integrale(r) Ratgeber:*
- _Complete The Square_, z.B. umgekehrtes Binomial-Theorem, evtl. notwendig um nächsten Punkt zu erreichen.
- Integral über Dichtefunktion: $integral_(-oo)^oo f_X (x) dif x = 1$
- Gausssche Glockenkurve
- Substitution
- Partielle Integration

*Häufige Formen:*
$
  PP(a < X <= b) & = PP(X <= b) - PP(X <= a) = F_X (b) - F_X (a) \
       PP(X > Y) & = sum_(i=1)^n PP(X > Y | Y = i) PP(Y = i) \
                 & = integral_(-oo)^oo PP(X > Y | Y = y) f_Y (y) dif y
$

$
  PP(max(X, Y) <= z) & = PP(X <= z, Y <= z) \
                     & = F_X (z) · F_Y (z) quad (X, Y " unabh.") \
  PP(min(X, Y) <= z) & = 1 - PP(min(X, Y) > z) \
                     & = 1 - PP(X > z, Y > z) \
                     & = 1 - PP(X > z) PP(Y > z) quad (X, Y " unabh.") \
                     & = 1 - (1 - F_X (z)) (1 - F_Y (z))
$

$ PP(X + Y = t) = integral_0^t f_X (k) f_Y (t - k) dif k quad (t >= 0) $

Für $L = min(X_1, ..., X_n)$ und $M = max(X_1, ..., X_n)$:
$
  PP(M < m, L <= l) & = PP(M < m) - PP(M < m, L > l) \
                    & = PP(M < m) - PP(l < X_1 < m, ..., l < X_n < m) \
                    & = (PP(X_1 < m))^n - (PP(l < X_1 < m))^n quad ("iid.")
$

Sei $X_1, ..., X_n$ i.i.d. mit $X_1 ~ cal(U)([a,b])$:
$ PP(X_1 > X_2, X_1 > X_3, ..., X_1 > X_n) = ((n-1)!) / (n!) $

== Evgeny 🐐
=== Aufgabe 2
=== Aufgabe 3
=== Aufgabe 4

== Quantile der Standard-Normalverteilung
Beantworten die Frage: "Welcher Wert hat einen Anteil $p$ der Daten unter sich?". \Ist $F$ die Verteilungsfunktion (CDF) einer Zufallsvariablen $X$, dann ist das $p$-Quantil definiert als $F^(-1)(p)$.

*Quantile der Standardnormalverteilung ($Z ~ cal(N)(0,1)$)* \
- $bb(P)[Z <= c] = alpha ==> c = z_alpha$ ($alpha$-Quantil der Standardnormalverteilung)
- $Phi(c) = alpha <=> c = Phi^(-1)(alpha)$ (Inverse der CDF)
- *Symmetrie-Eigenschaft:* \
  $bb(P)[Z <= -c] = 1 - bb(P)[Z <= c] = alpha <=> markhl(Phi(-c) = 1 - Phi(c) = alpha)$ \
  Daraus folgt die wichtige Identität: $z_alpha = -z_{1-alpha}$

*Quantile einer allgemeinen Normalverteilung ($X ~ cal(N)(mu, sigma^2)$)* \
Das $p$-Quantil von $X$ ist gegeben durch: $mu + sigma z_p$

*Herleitung durch Standardisierung:*
$
  bb(P)[X <= c] = p & <=> bb(P)[(X-mu)/sigma <= (c-mu)/sigma] = p \
                    & <=> bb(P)[Z <= (c-mu)/sigma] = p \
                    & <=> (c-mu)/sigma = z_p \
                    & <=> c = sigma z_p + mu
$
