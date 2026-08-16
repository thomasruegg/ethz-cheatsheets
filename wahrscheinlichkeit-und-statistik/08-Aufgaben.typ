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
#subbox(title: "Gemeinsame Dichte")[
  *Gegeben:* $f_(X,Y)(x,y) = cases(c e^(-x) &"für" 0 < y < x, 0 &"sonst")$

  #set enum(numbering: "a)")
  + *Konstante $c$ bestimmen:*
    Doppelintegral über den gesamten Träger muss 1 ergeben. (Tipp: Skizziere $0 < y < x$). \
    $
      integral_0^oo integral_0^x c e^(-x) dif y dif x &= c integral_0^oo [y e^(-x)]_(y=0)^x dif x = c integral_0^oo x e^(-x) dif x \
      &= c [-x e^(-x) - e^(-x)]_0^oo = c (0 - (-1)) = c = 1 quad => c=1
    $

  + *Randdichten $f_X(x)$ und $f_Y(y)$ berechnen:*
    $x$ festhalten, über $y$ integrieren (innere Grenzen $0$ bis $x$): \
    $f_X (x) = integral_0^x e^(-x) dif y = [y e^(-x)]_0^x = x e^(-x) dot 11_(x>0) quad => X ~ "Gamma"(2,1)$ \
    $y$ festhalten, über $x$ integrieren (innere Grenzen $y$ bis $oo$): \
    $f_Y (y) = integral_y^oo e^(-x) dif x = [-e^(-x)]_y^oo = e^(-y) dot 11_(y>0) quad => Y ~ "Exp"(1)$

  + *Sind $X$ und $Y$ unabhängig?* \
    *Nein.* Es gibt zwei Begründungen (eine genügt in der Prüfung):
    + *Träger-Argument (schnellster Weg):* Der Träger ist kein Rechteck, da die Grenzen voneinander abhängen ($0 < y < x$). Dies schliesst Unabhängigkeit sofort aus.
    + *Rechnerisch:* $f_X (x) dot f_Y (y) = x e^(-x) dot e^(-y) != e^(-x) = f_(X,Y)(x,y)$

  + *Bedingte Dichte $f_(X|Y) (x|y)$ für $y>0$ und Verteilung erkennen:* \
    Bedingte Dichte = Gemeinsame Dichte geteilt durch Randdichte von $Y$.
    $f_(X|Y) (x|y) = (f_(X,Y) (x,y)) / (f_Y (y)) = e^(-x) / e^(-y) = e^(-(x-y)) dot 11_(x>y)$
    *Verteilung erkennen:* Substituieren wir $z = x - y > 0$, hat $z$ die Dichte $e^(-z)$.
    Das entspricht der Dichte einer $Exp(1)$-Verteilung in der Variablen $z$.
    *Fazit:* Gegeben $Y=y$ gilt $X - y ~ Exp(1)$, oder äquivalent: $X | (Y=y) ~ y + "Exp"(1)$.
]

=== Aufgabe 3
=== Aufgabe 4

#subbox(title: "ML-Schätzer & Erwartungstreue (Poisson)")[
  *Gegeben:* $X_1, ..., X_n ~ "Poi"(lambda)$ i.i.d. mit $p_X (x; lambda) = (lambda^x / x!) e^(-lambda)$

  #set enum(numbering: "a)")
  + *Likelihood-Funktion:*
    $L(x_1,...,x_n; lambda) = product_(i=1)^n lambda^(x_i)/(x_i !) e^(-lambda) = e^(-n lambda) dot (lambda^(sum_(i=1)^n x_i)) / (product_(i=1)^n x_i !)$

  + *Log-Likelihood-Funktion:* \ $l(lambda) = ln(L(lambda)) = -n lambda + (sum_(i=1)^n x_i) ln(lambda) - sum_(i=1)^n ln(x_i !)$

  + *Maximum-Likelihood-Schätzer $T_("ML")$ bestimmen:* \
    Ableiten & Null setzen: $(partial l) / (partial lambda) = -n + 1/lambda sum_(i=1)^n x_i =^! 0 quad => quad accent(lambda, hat) = 1/n sum_(i=1)^n x_i$ \
    *Prüfung auf Maximum:* $l''(lambda) = - 1/lambda^2 sum x_i < 0 quad =>$ Maximum. \
    *Schätzer (Zufallsvariable, Grossbuchstaben!):* $T_("ML") = 1/n sum_(i=1)^n X_i = overline(X)_n$

  + *Realisierter Schätzwert:*
    Werte einsetzen: $t_("ML") = accent(lambda, hat) = 1/10 (1+2+0+3+2+4+1+2+3+2) = 20/10 = 2$

  + *Zeige: $overline(X)_n$ ist erwartungstreu für $lambda$* \
    $EE[overline(X)_n] = EE[1/n sum_(i=1)^n X_i] = 1/n sum_(i=1)^n EE[X_i] = 1/n dot n dot lambda = lambda quad ✓$

  + *Zeige: $X_1^2 - X_1$ ist erwartungstreu für $lambda^2$* \
    *Weg 1: Der clevere Shortcut (über Varianz)*
    Wir wissen $EE[X_1] = lambda$ und $Var(X_1) = lambda$.
    Aus dem Verschiebungssatz $Var(X_1) = EE[X_1^2] - (EE[X_1])^2$ folgt:
    $EE[X_1^2] = Var(X_1) + (EE[X_1])^2 = lambda + lambda^2$. \
    $EE[X_1^2 - X_1] = EE[X_1^2] - EE[X_1] = (lambda + lambda^2) - lambda = lambda^2 quad ✓$

    *Weg 2: Der klassische Weg (Musterlösung über Summenformel)* \
    $EE[X_1^2 - X_1] &= EE[X_1(X_1 - 1)] \
    &= sum_(k=0)^oo k(k-1) lambda^k / (k!) e^(-lambda) quad ("Nutzt" EE[g(X)] = sum g(k) dot p(k)) \
    &= e^(-lambda) dot sum_markhl(k=2)^oo lambda^k dot k(k-1) / (k!) quad (k=0,1 "sind 0, starte bei k=2") \
    &= e^(-lambda) dot lambda^2 dot sum_(k=2)^oo lambda^(k-2) / ((k-2)!) \
    &= e^(-lambda) dot lambda^2 dot sum_markhl(j=0)^oo lambda^j / (j!) = e^(-lambda) dot lambda^2 dot e^(lambda) = lambda^2 quad ✓$
]

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
