#import "config.typ": *

= Schätzer

Wir treffen folgende Annahmen:
- Parameterraum $Theta subset.eq RR^m$
- Familie von Wahrscheinlichkeitsmassen $(P_vartheta)_(vartheta in Theta)$ auf $(Omega, F)$; für jedes Element im Parameterraum existiert ein Modell / Wahrscheinlichkeitsraum $(Omega, F, P_vartheta)$.
- Zufallsvariablen $X_1, ..., X_n$ auf $(Omega, F)$

Wir nennen die Gesamtheit der beobachteten Daten $x_1, ..., x_n$ (wobei $x_i = X_i (omega)$) und die ZV $X_1, ..., X_n$ *Stichprobe*.

#mainbox()[
  Ein *Schätzer* ist eine Zufallsvariable der Form:
  $ T_ell = t_ell (X_1, ..., X_n) $
  Die *Schätzfunktionen* $t_ell : RR^n -> RR$ müssen gewählt werden. Einsetzen von Daten $x_k = X_k (omega), k=1, ..., n$, liefert *Schätzwerte* $T_ell (omega) = t_ell (x_1, ..., x_n)$ für $vartheta_ell , ell=1, ..., m$. Kurz: $T=(T_1, ..., T_m)$ und $vartheta=(vartheta_1, ..., vartheta_m)$.
]

Ein Schätzer $T$ ist *erwartungstreu*, falls für alle $vartheta in Theta$ gilt:
$ E_vartheta [T] = vartheta $

Sei $vartheta in Theta$ und $T$ ein Schätzer. Der *Bias* (erwartete Schätzfehler) von $T$ im Modell $P_vartheta$ is definiert als:
$ E_vartheta [T] - vartheta $

Der mittlere quadratische Schätzfehler (MSE) von $T$ im Modell $P_vartheta$ ist definiert als:
$
  "MSE"_vartheta [T] & = E_vartheta [(T - vartheta)^2] \
                     & = Var_vartheta (T) + (E_vartheta [T] - vartheta)^2
$

Eine Folge von Schätzern $T^((n)), n in NN$, heisst *konsistent* für $vartheta$, falls $T^((n))$ für $n -> oo$ in $P_vartheta$-Wahrscheinlichkeit gegen $vartheta$ konvergiert, d.h. für jedes $vartheta in Theta$ und jedes $epsilon > 0$ gilt:
$ lim_(n -> oo) P_vartheta (|T^((n)) - vartheta| > epsilon) = 0 $

== Maximum-Likelihood-Methode
=== Likelihood-Funktion, ML-Schätzer
Die Likelihood-Funktion ist definiert als:
$
  L(x_1, ..., x_n; vartheta) = cases(p(x_1, ..., x_n; vartheta) & "falls diskret", f(x_1, ..., x_n; vartheta) & "falls stetig")
$

Wenn $X_k$ unter $P_vartheta$ i.i.d. sind (analog mit $f_bold(arrow(x))$ und $f_X$):
$ p_bold(arrow(x)) (x_1, ..., x_n; vartheta) = product_(k=1)^n p_X (x_k; vartheta) $

Für jedes $x_1, ..., x_n in W$ sei $t_("ML")(x_1, ..., x_n)$ der Wert, welcher die Funktion $vartheta |-> L(x_1, ..., x_n; vartheta)$ maximiert. Ein Maximum-Likelihood-Schätzer ist dann definiert als:
$ T_("ML") = t_("ML")(X_1, ..., X_n) in limits(op("arg max"))_(vartheta in vartheta) L(X_1, ..., X_n; vartheta) $
*Notiz:* Nicht vergessen zu zeigen, dass es ein *Maximum* ist.

=== Anwendung der Methode
Die Maximum-Likelihood-Methode ist ein Weg, um systematisch einen Schätzer zu bestimmen:
+ Gemeinsame Dichte/Verteilung der ZV finden.
+ Bestimme davon die Log-Likelihood-Funktion: $f(vartheta) := ln(L(x_1, ..., x_n; vartheta))$.
+ $f(vartheta)$ nach $vartheta$ ableiten.
+ Nullstelle von $f'(vartheta)$ finden.
+ $f''(vartheta) < 0$ oder anderes Argument, dass wir das Maximum gefunden haben (evtl. Randstellen überprüfen!).

== Momentenmethode /-schätzer
+ Sei $X_1, ..., X_n$ i.i.d. eine Stichprobe.
+ Sei $vartheta$ ein $m$-dimensionaler Parameterraum.
+ Stelle für $vartheta = (vartheta_1, ..., vartheta_m)$ ein Gleichungssystem auf, in dem das $k$-te empirische Moment dem $k$-ten theoretischen Moment gleichgesetzt wird:
  $ hat(m)_k (x_1, ..., x_n) = g_k (vartheta_1, ..., vartheta_m), quad k in {1, ..., m} $
+ Der Vektor $hat(vartheta)(X_1, ..., X_n)$ heisst *Momentenschätzer* des Parameters $vartheta$.

*Momentenschätzer.*
Der Schätzer $T = (T_1, T_2)$ ist allgemein in jedem Modell $P_vartheta$, in dem $X_1, ..., X_n$ i.i.d. sind, der sogenannte Momentenschätzer für:
$ (E_vartheta [X], bb(V)_vartheta [X]) $
Dieser Schätzer ist allerdings nicht erwartungstreu für $(E_vartheta [X], bb(V)_vartheta [X])$. Es gilt zwar:
$ E_vartheta [T_1] = E_vartheta [overline(X)_n] = E_vartheta [X] $
aber:
$ E_vartheta [(overline(X)_n)^2] = 1/n E_vartheta [X^2] + (n-1)/n E_vartheta [X]^2 $
Daraus folgt:
$ E_vartheta [T_2] = (n-1)/n dot bb(V)_vartheta [X] != bb(V)_vartheta [X] $

Um einen erwartungstreuen Schätzer $T'$ für $(E_vartheta [X], bb(V)_vartheta [X])$ zu erhalten, verwendet man:
$
  T'_(1) & = overline(X)_n \
  T'_(2) & = n/(n-1) dot T_2 = n/(n-1) dot 1/n sum_(k=1)^n (X_k - overline(X)_n)^2 \
         & = 1/(n-1) sum_(k=1)^n (X_k^2 - 2 X_k overline(X)_n + overline(X)_n^2) \
         & = 1/(n-1) ( sum_(k=1)^n X_k^2 - 2 n overline(X)_n^2+ overline(X)_n^2 ) \
         & = 1/(n-1) sum_(k=1)^n X_k^2 - n/(n-1) (overline(X)_n)^2
$
Für $T'_(2)$ schreibt man oft:
$ S^2 = 1/(n-1) sum_(k=1)^n (X_k - overline(X)_n)^2 $
Man nennt $S^2$ die (korrigierte) *empirische Varianz*.

#subbox(title: "Gammafunktion")[
  Die Funktion $Gamma$ nennt man (Eulersche) Gammafunktion und sie ist für $x >= 0$ definiert durch:
  $ Gamma(x) = integral_0^oo t^(x-1) e^(-t) dif t $
  $Gamma$ hat eine grundlegende Verbindung zur Fakultätsfunktion, denn:
  $ Gamma(n+1) = n! quad "für" n in NN_0 . $
]

*Studentsche $t$-Verteilung:* $X ~ t_m$\
Eine stetige Zufallsvariable $X$ heisst $t$-verteilt mit $m$ Freiheitsgraden, falls ihre Dichte für $x in RR$ gegeben ist durch:
$ f_X (x) = Gamma((m+1)/2) / (sqrt(m pi) Gamma(m/2)) (1 + x^2/m)^(- (m+1)/2) $

*Entstehung der $t$-Verteilung:* Sind $X ~ cal(N)(0,1)$ und $Y ~ chi_m^2$ unabhängig, so ist der Quotient:
$ X / sqrt(1/m Y) ~ t_m $
+ Für $m=1$ ergibt sich eine Cauchy-Verteilung.
+ Für $m -> oo$ erhält man asymptotisch eine $cal(N)(0,1)$-Verteilung.
+ Die $t$-Verteilung ist symmetrisch um 0, aber langschwänziger als die $cal(N)(0,1)$-Verteilung; die Dichte geht langsamer gegen 0, je kleiner $m$ ist.
