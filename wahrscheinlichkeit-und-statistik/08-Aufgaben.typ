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
  P(a < X <= b) & = P(X <= b) - P(X <= a) = F_X (b) - F_X (a) \
       P(X > Y) & = sum_(i=1)^n P(X > Y | Y = i) P(Y = i) \
       & = integral_(-oo)^oo P(X > Y | Y = y) f_Y (y) dif y
$

$
  P(max(X, Y) <= z) & = P(X <= z, Y <= z) \
                    & = F_X (z) · F_Y (z) quad (X, Y " unabh.") \
  P(min(X, Y) <= z) & = 1 - P(min(X, Y) > z) \
                    & = 1 - P(X > z, Y > z) \
                    & = 1 - P(X > z) P(Y > z) quad (X, Y " unabh.") \
                    & = 1 - (1 - F_X (z)) (1 - F_Y (z))
$

$ P(X + Y = t) = integral_0^t f_X (k) f_Y (t - k) dif k quad (t >= 0) $

Für $L = min(X_1, ..., X_n)$ und $M = max(X_1, ..., X_n)$:
$
  P(M < m, L <= l) & = P(M < m) - P(M < m, L > l) \
                   & = P(M < m) - P(l < X_1 < m, ..., l < X_n < m) \
                   & = (P(X_1 < m))^n - (P(l < X_1 < m))^n quad ("iid.")
$

Sei $X_1, ..., X_n$ i.i.d. mit $X_1 ~ cal(U)([a,b])$:
$ P(X_1 > X_2, X_1 > X_3, ..., X_1 > X_n) = ((n-1)!) / (n!) $

== Multiple Choice Aufgaben

Seien $X, Y$ zwei ZV mit gemeinsamer Dichte $f_(X,Y)$. Welche Aussage ist korrekt?
- [✓] $X, Y$ sind immer stetig.
- [□] Die ZV sind nicht notwendigerweise stetig.

Sei $Y$ eine stetige Zufallsvariable. Für alle $s, t in RR^+$:
$ exists lambda > 0. Y ~ "Exp"(lambda) <=> P(Y > s) = P(Y > s + t | Y > t) $
- [✓] wahr.
- [□] falsch.

Seien $(X_i)_(i=1)^n$ u.i.v. mit Verteilungsfunktion $F_(X_i) = F$. Was ist die Verteilungsfunktion von $M = max(X_1, ..., X_n)$?
- [✓] $F_M (a) = F(a)^n$
- [□] $F_M (a) = 1 - F(a)^n$
- [□] $F_M (a) = (1 - F(a))^n$

Seien $X, Y$ unabhängig und lognormalverteilt ($ln X, ln Y$ sind normalverteilt). Welche Aussage ist korrekt?
- [✓] $X Y$ ist lognormalverteilt.
- [□] $X Y$ ist normalverteilt.
- [□] $e^(X + Y)$ ist normalverteilt.

// *Tabelle der Standard-Normalverteilungsfunktion*\
// $Phi(z) = P(Z <= z)$ mit $Z ~ cal(N)(0, 1)$ und $Phi(-x) = 1 - Phi(x)$.

// #align(center)[
//   #table(
//     columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
//     align: horizon + center,
//     stroke: 0.5pt + luma(150),
//     inset: 0.35em,
//     [$z$], [.00], [.02], [.05], [.07], [.09],
//     [.0], [0.5000], [0.5080], [0.5199], [0.5279], [0.5359],
//     [.1], [0.5398], [0.5478], [0.5596], [0.5675], [0.5753],
//     [.2], [0.5793], [0.5871], [0.5987], [0.6064], [0.6141],
//     [.3], [0.6179], [0.6255], [0.6368], [0.6443], [0.6517],
//     [.4], [0.6554], [0.6628], [0.6736], [0.6808], [0.6879],
//     [.5], [0.6915], [0.6985], [0.7088], [0.7157], [0.7224],
//     [.6], [0.7257], [0.7324], [0.7422], [0.7486], [0.7549],
//     [.7], [0.7580], [0.7642], [0.7734], [0.7794], [0.7852],
//     [.8], [0.7881], [0.7939], [0.8023], [0.8078], [0.8133],
//     [.9], [0.8159], [0.8212], [0.8289], [0.8340], [0.8389],
//     [1.0], [0.8413], [0.8461], [0.8531], [0.8577], [0.8621],
//     [1.1], [0.8643], [0.8686], [0.8749], [0.8790], [0.8830],
//     [1.2], [0.8849], [0.8888], [0.8944], [0.8980], [0.9015],
//     [1.3], [0.9032], [0.9066], [0.9115], [0.9147], [0.9177],
//     [1.4], [0.9192], [0.9222], [0.9265], [0.9292], [0.9319],
//     [1.5], [0.9332], [0.9357], [0.9394], [0.9418], [0.9441],
//     [1.6], [0.9452], [0.9474], [0.9505], [0.9525], [0.9545],
//     [1.7], [0.9554], [0.9573], [0.9599], [0.9616], [0.9633],
//     [1.8], [0.9641], [0.9656], [0.9678], [0.9693], [0.9706],
//     [1.9], [0.9713], [0.9726], [0.9744], [0.9756], [0.9767],
//   )
// ]
