#import "config.typ": *

= Tests

#subbox()[
  Die *Nullhypothese* $H_0$ und die *Alternativhypothese* $H_A$ sind zwei Teilmengen $Theta_0 subset.eq Theta, Theta_A subset.eq Theta$ wobei $Theta_0 inter Theta_A = empty$.

  Falls keine explizite Alternativhypothese spezifiziert ist, so hat man $Theta_A = Theta without Theta_0$.

  Eine Hypothese heisst _einfach_, falls die Teilmenge aus einem einzelnen Wert besteht; sonst _zusammengesetzt_.
]

#mainbox(title: "Definition Test")[
  Ein Test ist ein Paar $(T, K)$, wobei:
  - $T = t(X_1, ..., X_n)$ die Teststatistik ist, mit einer messbaren Funktion $t: RR^n -> RR$.
  - $K subset.eq RR$ der kritische Bereich oder Verwerfungsbereich ist.
]

Wir wollen nun anhand der Daten $(X_1 (omega), ..., X_n (omega))$ entscheiden, ob die Nullhypothese akzeptiert oder verworfen wird. Zuerst berechnen wir die Teststatistik $T(omega) = t(X_1 (omega), ..., X_n (omega))$ und gehen dann wie folgt vor:
- Die Hypothese $H_0$ wird *verworfen*, falls $T(omega) in K$.
- Die Hypothese $H_0$ wird *akzeptiert*, falls $T(omega) in.not K$.

#subbox()[
  Ein *Fehler 1. Art* ist, wenn $H_0$ fälschlicherweise verworfen wird, obwohl sie richtig ist.
  $ P_theta (T in K), quad theta in Theta_0 $
  Ein *Fehler 2. Art* ist, wenn $H_0$ fälschlicherweise akzeptiert wird, obwohl sie falsch ist.
  $ P_theta (T in.not K) = 1 - P_theta (T in K), quad theta in Theta_A $
]

*Bemerkung:* Da $T$ eine ZV und somit bezüglich dem Mass $P_theta : cal(F) -> [0,1]$ messbar ist, gilt ${T in K} in cal(F)$ und somit ist $P_theta (T in K)$ wohldefiniert.

== Signifikanzniveau und Macht
Ein Test hat Signifikanzniveau $alpha in [0,1]$ falls:
$ forall theta in Theta_0 quad P_theta (T in K) <= alpha $
Es ist meist unser primäres Ziel, die Fehler 1. Art zu minimieren.

Das sekundäre Ziel ist, Fehler 2. Art zu vermeiden. Hierfür definieren wir die Macht eines Tests als Funktion:
$ beta : Theta_A -> [0,1], quad theta |-> P_theta (T in K) $
Zu beachten ist, dass eine kleine Wahrscheinlichkeit für einen Fehler 2. Art einem *grossen* $beta$ entspricht.

== Konstruktion von Tests
Wir nehmen an, dass $X_1, ..., X_n$ diskret oder gemeinsam stetig unter $P_(theta_0)$ und $P_(theta_A)$ sind, wobei $Theta_0 inter Theta_A = empty$ einfach sind ($theta_0 in Theta_0 and theta_A in Theta_A$).

Der Likelihood-Quotient ist somit wohldefiniert:
$ R(x_1, ..., x_n) = L(x_1, ..., x_n; theta_A) / L(x_1, ..., x_n; theta_0) $
(Falls $L(x_1, ..., x_n; theta_0) = 0$ setzen wir $R(x_1, ..., x_n) = +oo$.)

Für zusammengesetzte $Theta_0$ und $Theta_A$ können wir den verallgemeinerten Likelihood-Quotient definieren:
$ R(x_1, ..., x_n) := (sup_(theta in Theta_A) L(x_1, ..., x_n; theta)) / (sup_(theta in Theta_0) L(x_1, ..., x_n; theta)) $

Wenn $R >> 1$, so gilt $H_A > H_0$ und analog $R << 1 => H_A < H_0$.

#subbox()[
  Der *Likelihood-Quotient-Test (LQ-Test)* mit Parameter $c >= 0$ ist definiert durch:
  $ T = R(X_1, ..., X_n) quad "und" quad K = (c, oo] $
]

*Neyman-Pearson-Lemma*

Sei $Theta_0 = {vartheta_0}$ und $Theta_A = {vartheta_A}$. Sei $(T, K)$ ein Likelihood-Quotienten-Test mit Parameter $c$ und Signifikanzniveau $alpha^* := P_(vartheta_0)[T in K]$. Ist $(T', K')$ ein anderer Test mit Signifikanzniveau $alpha := P_(vartheta_0)[T' in K'] <= alpha^*$, so gilt:
$ P_(vartheta_A)[T' in K'] <= P_(vartheta_A)[T in K] . $
Das bedeutet, jeder andere Test mit kleinerem Signifikanzniveau hat auch geringere Macht bzw. eine größere Wahrscheinlichkeit für einen Fehler 2. Art.

== Konkrete Tests
=== z-Test / Gauss-Test
*Sample i.i.d. normalverteilt, Test für $mu$, $sigma^2$ bekannt* \
$mu$-Schätzer: $mu = overline(X)_n = 1/n sum_(i=1)^n X_i$ \
+ Modell: $X_1, ..., X_n ~ cal(N)(theta, sigma^2)$ i.i.d. unter $PP_theta$
+ Teststatistik $T := (overline(X)_n - mu)/(sqrt(sigma^2 / n)) ~ cal(N)(0,1)$ unter $PP_(theta_0)$

=== t-Test
*Sample i.i.d. normalverteilt, Test für $mu$, $sigma^2$ UNbekannt* \
Parameter $arrow(theta) = (mu, sigma^2)$ ist zweidimensional! \
$mu$-Schätzer: $overline(X)_n = 1/n sum_(i=1)^n X_i$ \
$sigma^2$-Schätzer: $S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X)_n)^2 $ \
+ Modell: $X_1, ..., X_n ~ cal(N)(theta, sigma^2)$ i.i.d. unter $PP_arrow(theta)$
+ Hypothesen: $Theta_0 = ({mu_0} text(" oder ") {mu <= mu_0} text(" oder ") {mu >= mu_0}) times (0, infinity)$ #text(fill: luma(50%))[$<- "weil" arrow(theta) = (mu, sigma^2)$]
+ Teststatistik $T := (overline(X)_n - mu_0)/(sqrt(S^2 / n)) ~ t_(n-1)$ unter $PP_(theta_0)$
+ Kritischer Bereich $K$: Ansatz für $c$ finden, sodass $PP_(mu_0)[T in K] = alpha$ gilt.
  - *Linksseitig* ($H_A: mu < mu_0$): Ansatz $K = (-infinity, c_<)$ für ein $c_< in RR$ \
    Finde $c_<$ s.t. $PP_(mu_0)[T < c_<] = alpha$ \
    $=> c_< = t_(n-1, alpha) = -t_(n-1, 1-alpha)$ \
    $=> K = (-infinity, -t_(n-1, 1-alpha))$
  - *Rechtsseitig* ($H_A: mu > mu_0$): Ansatz $K = (c_>, infinity)$ für ein $c_> in RR$ \
    Finde $c_>$ s.t. $PP_(mu_0)[T > c_>] = alpha$ \
    $=> 1 - PP_(mu_0)[T <= c_>] = alpha \
     => PP_(mu_0)[T <= c_>] = 1 - alpha => c_> = t_(n-1, 1-alpha)$ \
    $=> K = (t_(n-1, 1-alpha), infinity)$
  - *Zweiseitig* ($H_A: mu != mu_0$): Ansatz $K = (-infinity, -c_=) union (c_=, infinity)$ für ein $c_= in RR^+$ \
    Finde $c_=$ s.t. $PP_(mu_0)[|T| > c_=] = 2 dot PP_(mu_0)[T > c_=] = alpha$ \
    $=> PP_(mu_0)[T > c_=] = alpha/2 \
     => PP_(mu_0)[T <= c_=] = 1 - alpha/2 => c_= = t_(n-1, 1-alpha/2)$ \
    $=> K = (-infinity, -t_(n-1, 1-alpha/2)) union (t_(n-1, 1-alpha/2), infinity)$

=== Gepaarter Zweistichprobentest
Sei $X_1,...,X_n ~ cal(N)(mu_X, sigma^2)$ i.i.d. und $Y_1,...,Y_n ~ cal(N)(mu_Y, sigma^2)$, wobei $X_i, Y_i$ unabhängig. \ 
Dann ist für $Z_i := X_i - Y_i$ die ZV $Z_1,...,Z_n ~ cal(N)(mu_X - mu_Y, 2 sigma^2)$. \ 
Falls $sigma$ bekannt $=>$ z-Test auf $Z_i$ \ 
Falls $sigma$ unbekannt $=>$ t-Test auf $Z_i$ 

=== Ungepaarter Zweistichprobentest
Sei $X_1,...,X_n ~ cal(N)(mu_X, sigma^2)$ und $Y_1,...,Y_m ~ cal(N)(mu_Y, sigma^2)$, wobei $m != n, X_i$ und $Y_j$ paarweise unabhängig für $i in [n], j in [m]$
- *$sigma^2$ bekannt*, z-Test mit: \
 $ T := ((overline(X)_n - overline(Y)_m) - (mu_X - mu_Y))/(sigma sqrt(1/n + 1/m)) ~ cal(N)(0,1) $ 
- *$sigma^2$ unbekannt*, t-Test mit: \
 Empirische Varianz der einzelnen beiden Datensätzen \ 
 $S_X^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X)_n)^2$ und \ $S_Y^2 = 1/(m-1) sum_(i=1)^m (Y_i - overline(Y)_m)^2 $
 werden zu einer empirischen Varianz kombiniert: \ 
 $ S^2 := (1)/(m + n - 2) ((n-1)S^2_X + (m-1)S^2_Y) $
 $ T := ((overline(X)_n - overline(Y)_n) - (mu_X - mu_Y))/(S sqrt(1/n + 1/m)) ~ t_(m+n-2) $

/*=== T-Test / Gauss-Test
Zuerst berechnen wir $T$:
$ T = (overline(X)_n - theta_0) / sqrt(sigma^2 / n) ~ cal(N)(0, 1) $
mit dem erwartungstreuen Schätzer:
$ overline(X)_n = 1/n sum_(i=1)^n X_i $

Dann unterscheiden wir zwischen den folgenden Fällen:
+ *Einseitiger Test* $H_A$: $theta > theta_0$
  - Obere Grenze: $c = Phi^(-1)(1 - alpha)$
  - Verwerfungsbereich: Verwerfe $H_0$ falls $T > c$
+ *Einseitiger Test* $H_A$: $theta < theta_0$
  - Untere Grenze: $c = Phi^(-1)(alpha)$
  - Verwerfungsbereich: Verwerfe $H_0$ falls $T < c$
+ *Beidseitiger Test* $H_A$: $theta != theta_0$
  - Untere Grenze: $c_1 = Phi^(-1)(alpha / 2)$\
    Obere Grenze: $c_2 = Phi^(-1)(1 - alpha / 2)$
  - Verwerfungsbereich: Verwerfe $H_0$ falls $T < c_1$ oder $T > c_2$

_Notiz: Restliche Tests nicht in Vorlesung behandelt (siehe Nicolas Wehrli's Cheat Sheet)._
*/

== p-Wert
#mainbox(title: "Definition p-Wert")[
  Sei $H_0 : theta = theta_0$ eine einfache Nullhypothese. Sei $(T, K_t)_(t >= 0)$ eine geordnete Familie von Tests. Der p-Wert ist definiert als ZV $G(omega)$, wobei $ G : Omega |-> [0,1], space space space space G(omega) = PP_(theta_0)[T in K_(t(X_1(omega),...,X_n(omega)))] $
]
*Intuitiv*: Kleinstes Signifikanzniveau $p$, bei welchem die Nullhypothese verworfen wird (anhand der Teststatistik mit effektiver Realisation $omega$). *Ansatz*: Berechne kleinsten Verwerfungsbereich $K$, sodass $T in K$ und löse $PP_(theta_0)[T in K] >= 1 - alpha$ auf.
