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

Sei $X_1, X_2, ..., X_n$ i.i.d., und $Y = min(X_1, X_2, ..., X_n)$:
$
                      F_Y (y) & = PP[Y <= y] = 1 - PP[X_1 > y, ..., X_n > y] \
                              & #h(-2pt) =^"i.i.d." 1 - (PP[X_1 > y])^n = 1 - (1 - F_X (y))^n \
  EE[min(X_1, X_2, ..., X_n)] & = integral_(-oo)^oo y dot underbrace(n (1 - F_X (y))^(n-1) f_X (y), F'_Y (y) = f_Y (y)) dif y
$
#v(-1em)

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
  *Gegeben:* $f_(X,Y) (x,y) = cases(c e^(-x) &"für" 0 < y < x, 0 &"sonst")$

  #set enum(numbering: "a)")
  + *Konstante $c$ bestimmen:*
    Doppelintegral über den gesamten Träger muss 1 ergeben. (Tipp: Skizziere $0 < y < x$). \
    $
      integral_0^oo integral_0^x c e^(-x) dif y dif x &= c integral_0^oo [y e^(-x)]_(y=0)^x dif x = c integral_0^oo x e^(-x) dif x \
      &= c [-x e^(-x) - e^(-x)]_0^oo = c (0 - (-1)) = c = 1 quad => c=1
    $

  + *Randdichten $f_X (x)$ und $f_Y (y)$ berechnen:* #markhl("Träger nicht vergessen!", color: rgb("#ff0000")) \
    $x$ festhalten, über $y$ integrieren (innere Grenzen $0$ bis $x$): \
    $f_X (x) = integral_0^x e^(-x) dif y = [y e^(-x)]_0^x = x e^(-x) markhl(dot bb(1)_(x>0), color: #rgb("#ff0000")) quad => X ~ "Gamma"(2,1)$ \
    $y$ festhalten, über $x$ integrieren (innere Grenzen $y$ bis $oo$): \
    $f_Y (y) = integral_y^oo e^(-x) dif x = [-e^(-x)]_y^oo = e^(-y) markhl(dot bb(1)_(y>0), color: #rgb("#ff0000")) quad => Y ~ "Exp"(1)$

  + *Sind $X$ und $Y$ unabhängig?* \
    *Nein.* Es gibt zwei Begründungen (eine genügt in der Prüfung):
    + *Träger-Argument (schnell):* Der Träger ist kein Rechteck, da die Grenzen voneinander abhängen ($0 < y < x$). Dies schliesst Unabhängigkeit sofort aus.
    + *Rechnerisch:* $f_X (x) dot f_Y (y) = x e^(-x) dot e^(-y) != e^(-x) = f_(X,Y)(x,y)$

  + *Bedingte Dichte $f_(X|Y) (x|y)$ für $y>0$ und Verteilung erkennen:* \
    Bedingte Dichte = Gemeinsame Dichte durch Randdichte von $Y$. \
    $f_(X|Y) (x|y) = (f_(X,Y) (x,y)) / (f_Y (y)) = e^(-x) / e^(-y) = e^(-(x-y)) dot bb(1)_(x>y)$
    *Verteilung erkennen:* Substituieren wir $z = x - y > 0$, hat $z$ die Dichte $e^(-z)$.
    Das entspricht der Dichte einer $Exp(1)$-Verteilung in der Variablen $z$.
    *Fazit:* Gegeben $Y=y$ gilt $X - y ~ Exp(1)$, oder äquivalent: $X | (Y=y) ~ y + "Exp"(1)$.
]

#subbox(title: "Gemeinsame Dichte, Erwartungswert & Kovarianz")[
  *Gegeben:* $f(x,y) = cases(c(x+y) &"für" 0 < x < y < 1, 0 &"sonst")$

  #set enum(numbering: "a)")
  + *Konstante $c$ bestimmen:*
    _Pro-Tipp:_ Integriere zuerst nach $x$ (innere Grenzen $0$ bis $y$). Die untere Grenze $0$ spart viel Rechenarbeit!
    $integral_0^1 integral_0^y c(x+y) dif x dif y = c integral_0^1 [x^2/2 + x y]_(x=0)^(x=y) dif y = c integral_0^1 (y^2/2 + y^2) dif y = c integral_0^1 3/2 y^2 dif y = c [y^3/2]_0^1 = c/2 =^! 1 quad => quad c = 2$

  + *Randdichten $f_X$ und $f_Y$:*
    Für $f_X (x)$ halte $x$ fest, integriere $y$ von $x$ bis $1$:
    $f_X (x) = integral_x^1 2(x+y) dif y = [2x y + y^2]_x^1 = (2x + 1) - (2x^2 + x^2) = 2x + 1 - 3x^2 quad markhl(text("für ") x in (0,1), color: #rgb("#ff0000"))$ \
    Für $f_Y (y)$ halte $y$ fest, integriere $x$ von $0$ bis $y$:
    $f_Y (y) = integral_0^y 2(x+y) dif x = [x^2 + 2x y]_0^y = y^2 + 2y^2 - 0 = 3y^2 quad markhl(text("für ") y in (0,1), color: #rgb("#ff0000"))$

  + *Erwartungswerte $EE[X]$ und $EE[Y]$:*
    $EE[X] = integral_0^1 x dot f_X (x) dif x = integral_0^1 (2x^2 + x - 3x^3) dif x = [2/3 x^3 + 1/2 x^2 - 3/4 x^4]_0^1 = 2/3 + 1/2 - 3/4 = 5/12$ \
    $EE[Y] = integral_0^1 y dot f_Y (y) dif y = integral_0^1 3y^3 dif y = [3/4 y^4]_0^1 = 3/4$

  + *Kovarianz $cov(X, Y)$:*
    Berechne zuerst $EE[X Y]$. Auch hier wieder der Trick: Zuerst nach $x$ integrieren! \
    $EE[X Y] = integral_0^1 integral_0^y x y dot 2(x+y) dif x dif y = integral_0^1 2y integral_0^y (x^2 + x y) dif x dif y
    = integral_0^1 2y [x^3/3 + (x^2 y)/2]_(x=0)^(x=y) dif y = integral_0^1 2y (y^3/3 + y^3/2) dif y = integral_0^1 2y (5/6 y^3) dif y = integral_0^1 5/3 y^4 dif y = [1/3 y^5]_0^1 = 1/3$, \
    $cov(X, Y) = EE[X Y] - EE[X]EE[Y] = 1/3 - (5/12 dot 3/4) = 1/3 - 15/48 = 1/48$
]

=== Aufgabe 3

#subbox(title: "Chebyshev-Ungleichung & Stichprobenmittel")[
  *Gegeben:* $X_1, ..., X_n$ i.i.d., $E[X_i] = 72$, $Var(X_i) = 25$. \
  Stichprobenmittel: $overline(X)_n = 1/n sum_(i=1)^n X_i$.

  #set enum(numbering: "a)")

  + *Parameter des Stichprobenmittels:* \
    $EE[overline(X)_n] = 1/n dot n dot E[X_i] = 72 quad "und" quad Var(overline(X)_n) = 1/n^2 dot n dot Var(X_i) = 25/n$

  + *Untere Schranke von $P[ |overline(X)_625 - 72| < 1]$ mit Chebyshev:*
    Für eine ZV $Y$ mit $EE[Y]$ und Abweichung $b>0$ gilt:
    $PP[ |Y - EE[Y]| >= b] <= Var(Y) / b^2$. \
    $
      markhl(PP[ |overline(X)_625 - E[overline(X)_625]| >= 1]) & <= Var(overline(X)_625) / 1^2 = 25/625=0.04 \
                   markhl(1 - PP[ |overline(X)_625 - 72| < 1]) & <= 0.04 quad || -1 \
                             - PP[ |overline(X)_625 - 72| < 1] & <= -0.96 quad || dot (-1) "🚨 Zeichen dreht!" \
                               PP[ |overline(X)_625 - 72| < 1] & >= 0.96
    $

  + *Stichprobengrösse $n$ finden, sodass $PP[ |overline(X)_n - 72| < 0.5] >= 0.99$:*
    $
      markhl(PP[ |overline(X)_n - 72| >= 0.5]) &<= (Var(overline(X)_n)) / (0.5^2) &&= (25/n) / 0.25 = 100/n \
      markhl(1 - PP[ |overline(X)_n - 72| < 0.5]) &<= 100/n &&|| -1 \
      -PP[ |overline(X)_n - 72| < 0.5] &<= 100/n - 1 &&|| dot (-1) "🚨 Zeichen dreht!" \
      PP[ |overline(X)_n - 72| < 0.5] &>= 1 - 100/n &&>=^! 0.99 || -1, "dann" dot (-1) "🚨" \
      & quad quad quad 100 / n &&<= 0.01 \
      & quad quad 10'000 &&<= n
    $
  + *Schwaches Gesetz der grossen Zahlen:*
    Es besagt: $overline(X)_n limits(->)^PP EE[X_i]$ für $n -> oo$.
    Qualitativ: Bei steigendem $n$ rückt Durchschnitt $overline(X)_n$ immer näher an wahren Erwartungswert $EE[X_i]$. Wahrscheinlichkeit für eine Abweichung wird beliebig klein. Chebyshev-Rechnungen oben geben konkrete, konservative Zahlen für diesen Effekt.
]

#subbox(title: "Zentraler Grenzwertsatz (ZGS) für Summen (100 Teile in 1 Box)")[
  *Gegeben:* $X_1, ..., X_n$ i.i.d. mit $EE[X_i] = 8$ und $Var(X_i) = 1.44$. \
  Summe $S_n = sum_(i=1)^n X_i$ mit $n=100$.

  #set enum(numbering: "a)")
  + *Erwartungswert & Varianz der Summe:* \
    $EE[S_n] = n dot EE[X_i] = 100 dot 8 = 800,
    Var(S_n) = n dot Var(X_i) = 100 dot 1.44 = 144 quad => quad text("Standardabweichung ") sqrt(Var(S_n)) = sqrt(144) = 12$

  + *Wahrscheinlichkeit eines Intervalls (Standardisieren):* \
    $PP[788 <= S_n <= 824] &= PP[ markhl((788 - 800)/12, color: #rgb("#ff00ff")) <= underbrace((S_n - EE[S_n])/sqrt(Var(S_n)), Z) <= markhl((824 - 800)/12, color: #rgb("#00ff00")) ] \
    &= PP[markhl(-1, color: #rgb("#ff00ff")) <= Z <= markhl(2, color: #rgb("#00ff00"))] = PP[Z <= markhl(2, color: #rgb("#00ff00"))] - PP[Z >= markhl(-1, color: #rgb("#ff00ff"))] \ &= Phi(2) - Phi(1) = 0.8185$

  + *Wahrscheinlichkeit für "zu gross" (Gegenereignis):*
    $PP[S_n > 824] = 1 - PP[S_n <= 824] = 1 - PP[Z <= (824-800)/12] = 1 - Phi(2) = 0.0228$

  + *Rückwärts rechnen (Wert $r$ für gewünschte Wahrsch'keit finden):*
    Gesucht ist $r$ sodass

    $PP[S_n <= 800 + r] & approx 0.99 \ PP[ underbrace((S_n - 800)/12, Z) <= (800+r-800)/12 ] &approx 0.99 \
    Phi(r/12) &approx 0.99 \
    r/12 & approx Phi^(-1) (0.99) = 2.33 quad ==> r = 27.96$
]

=== Aufgabe 4
#subbox(title: "Gerätekalibration (ML-Schätzer für Geometrische Verteilung)")[
  *Geg.:* $X_1, ..., X_n ~ "Geo"(vartheta)$ i.i.d. mit $PP_vartheta [X=k] = vartheta (1-vartheta)^(k-1), vartheta in (0,1]$

  #set enum(numbering: "a)")
  + *Likelihood & Log-Likelihood:* \
    $L(vartheta) = product_(i=1)^n vartheta (1-vartheta)^(x_i - 1) = vartheta^n (1-vartheta)^(sum_(i=1)^n x_i - n) \ l(vartheta) = ln(L(vartheta)) = n ln(vartheta) + (sum_(i=1)^n x_i - n) ln(1-vartheta)$ \
    *Randpunkt $vartheta = 1$:* Jedes Gerät braucht zwingend genau 1 Kalibrierung (da $p=1$ beim 1. Versuch). Sobald ein $x_i > 1$ beobachtet wird, ist $L(1) = 0$ und $l(1)$ undefiniert.

  + *Maximum-Likelihood-Schätzer $T_("ML")$:*
    Ableiten & $=^! 0$:
    $l'(vartheta) = n/vartheta - (sum x_i - n)/(1-vartheta) &=^! 0 quad ==> quad
    n(1-vartheta) &= vartheta(sum x_i - n) quad ==> quad
    n - n vartheta &= vartheta sum x_i - n vartheta quad ==> quad
    n &= vartheta sum x_i quad ==> quad accent(vartheta, hat) = n / (sum_(i=1)^n x_i) quad ==> quad T_("ML") = n / (sum_(i=1)^n X_i)$

  + *Realisierter Schätzwert:*
    Für Daten $x = (3, 1, 4, 2, 2, 5)$ ist $n=6$ und $sum x_i = 17. quad quad quad t_("ML") = accent(vartheta, hat) = 6/17 approx 0.353$
]


#subbox(title: "Approximativer Z-Test für Bernoulli/Binomial")[
  *Gegeben:* $X_1, ..., X_72 ~ "Ber"(vartheta)$ i.i.d., $n=72$, beobachtet $s_72 = 32$. \
  *Hypothesen:* $H_0: vartheta = 1/3 quad "gegen" quad H_A: vartheta > 1/3 quad ("rechtsseitig")$

  #set enum(numbering: "a)")
  + *Geeignete Teststatistik (ZGS):*
    Da die Varianz unter $H_0$ *bekannt* ist ($vartheta_0 (1-vartheta_0)$), verwenden wir den Z-Test: \
    $T = (S_n - n vartheta_0) / sqrt(n vartheta_0 (1-vartheta_0)) = (S_72 - 72 dot 1/3) / sqrt(72 dot 1/3 dot 2/3) = (S_72 - 24) / sqrt(16) = (S_72 - 24) / 4$
    Unter $H_0$ ist $T$ approximativ standardnormalverteilt: $T ~ cal(N)(0,1)$.

  + *Realisierter Wert der Teststatistik:* \
    Werte einsetzen ($S_n = s_72 = 32$): $quad quad t = T(omega) = (32 - 24) / 4 = 8 / 4 = 2$

  + *Test auf Signifikanzniveau $alpha = 5%$:*
    Da $H_A: vartheta > 1/3$ (rechtsseitig), ist der kritische Bereich $K = (z_(1-alpha), oo)$.
    Mit $z_0.95 = 1.645$ folgt $K = (1.645, oo)$.
    *Entscheidung:* Da $t = 2 in K$ (weil $2 > 1.645$), $H_0$ verworfen.

  + *Approximativer p-Wert:*
    Für einen rechtsseitigen Test gilt: $p = PP[Z >= t] = 1 - Phi(t)$ für $Z ~ cal(N)(0,1)$. $p = 1 - Phi(2) approx 1 - 0.977 = 0.023$. Da $t=2$ hätte $K$ anstelle $(1.645, oo)$ auch nur $(2, oo)$ sein dürfen $=>$ tiefstes Signifikanzniveau um $T in K$ und $H_0$ noch verwerfen zu können ist $0.023$.

  + *Entscheidung in Worten:*
    Da der p-Wert ($0.023$) kleiner als $alpha = 0.05$ ist (bzw. die Teststatistik $t$ in $K$ liegt), wird $H_0$ auf dem 5%-Niveau signifikant verworfen. Die Daten deuten darauf hin, dass der Parameter $vartheta > 1/3$ ist.
]

#subbox(title: "ML-Schätzer & Erwartungstreue (Poisson)")[
  *Gegeben:* $X_1, ..., X_n ~ "Poi"(lambda)$ i.i.d. mit $p_X (x; lambda) = (lambda^x / x!) e^(-lambda)$

  #set enum(numbering: "a)")
  + *Likelihood-Funktion:*
    $L(x_1,...,x_n; lambda) = product_(i=1)^n lambda^(x_i)/(x_i !) e^(-lambda) = e^(-n lambda) dot (lambda^(sum_(i=1)^n x_i)) / (product_(i=1)^n x_i !)$

  + *Log-Likelihood-Funktion:* \ $l(lambda) = ln(L(lambda)) = -n lambda + (sum_(i=1)^n x_i) ln(lambda) - sum_(i=1)^n ln(x_i !)$

  + *Maximum-Likelihood-Schätzer $T_("ML")$ bestimmen:* \
    Ableiten & Null setzen: $(partial l) / (partial lambda) = -n + 1/lambda sum_(i=1)^n x_i =^! 0 quad => quad accent(lambda, hat) = 1/n sum_(i=1)^n x_i$ \
    *Prüfung auf Maximum:* $l''(lambda) = - 1/lambda^2 sum x_i < 0 quad =>$ Maximum. \
    *Schätzer (Zufallsvariable, Grossbuchst.!):* $T_("ML") = 1/n sum_(i=1)^n X_i = overline(X)_n$

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

*Herleitung durch Standardisierung:* \
$bb(P)[X <= c] = p & <==> bb(P)[(X-mu)/sigma <= (c-mu)/sigma] = p
<==> bb(P)[Z <= (c-mu)/sigma] = p \
& <==> (c-mu)/sigma = z_p
<==> c = sigma z_p + mu$
