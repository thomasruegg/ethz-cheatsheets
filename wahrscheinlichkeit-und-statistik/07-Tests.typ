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
  $ PP_theta (T in K), quad theta in Theta_0 $
  Ein *Fehler 2. Art* ist, wenn $H_0$ fälschlicherweise akzeptiert wird, obwohl sie falsch ist.
  $ PP_theta (T in.not K) = 1 - PP_theta (T in K), quad theta in Theta_A $
]

*Bemerkung:* Da $T$ eine ZV und somit bezüglich dem Mass $PP_theta : cal(F) -> [0,1]$ messbar ist, gilt ${T in K} in cal(F)$ und somit ist $PP_theta (T in K)$ wohldefiniert.

== Signifikanzniveau und Macht
Ein Test hat Signifikanzniveau $alpha in [0,1]$ falls:
$ forall theta in Theta_0 quad PP_theta (T in K) <= alpha $
Es ist meist unser primäres Ziel, die Fehler 1. Art zu minimieren.

Das sekundäre Ziel ist, Fehler 2. Art zu vermeiden. Hierfür definieren wir die Macht eines Tests als Funktion:
$ beta : Theta_A -> [0,1], quad theta |-> PP_theta (T in K) $
Zu beachten ist, dass eine kleine Wahrscheinlichkeit für einen Fehler 2. Art einem *grossen* $beta$ entspricht.

== Konstruktion von Tests
Wir nehmen an, dass $X_1, ..., X_n$ diskret oder gemeinsam stetig unter $PP_(theta_0)$ und $PP_(theta_A)$ sind, wobei $Theta_0 inter Theta_A = empty$ einfach sind ($theta_0 in Theta_0 and theta_A in Theta_A$).

Der Likelihood-Quotient ist somit wohldefiniert:
$ R(x_1, ..., x_n) = L(x_1, ..., x_n; theta_A) / L(x_1, ..., x_n; theta_0) $
(Falls $L(x_1, ..., x_n; theta_0) = 0$ setzen wir $R(x_1, ..., x_n) = +oo$.)

Für zusammengesetzte $Theta_0$ und $Theta_A$ können wir den verallgemeinerten Likelihood-Quotient definieren:
$
  R(x_1, ..., x_n) := (sup_(theta in Theta_A) L(x_1, ..., x_n; theta)) / (sup_(theta in Theta_0) L(x_1, ..., x_n; theta))
$

Wenn $R >> 1$, so gilt $H_A > H_0$ und analog $R << 1 => H_A < H_0$.

#subbox()[
  Der *Likelihood-Quotient-Test (LQ-Test)* mit Parameter $c >= 0$ ist definiert durch:
  $ T = R(X_1, ..., X_n) quad "und" quad K = (c, oo] $
]

*Neyman-Pearson-Lemma*

Sei $Theta_0 = {vartheta_0}$ und $Theta_A = {vartheta_A}$. Sei $(T, K)$ ein Likelihood-Quotienten-Test mit Parameter $c$ und Signifikanzniveau $alpha^* := PP_(vartheta_0)[T in K]$. Ist $(T', K')$ ein anderer Test mit Signifikanzniveau $alpha := PP_(vartheta_0)[T' in K'] <= alpha^*$, so gilt:
$ PP_(vartheta_A)[T' in K'] <= PP_(vartheta_A)[T in K] . $
Das bedeutet, jeder andere Test mit kleinerem Signifikanzniveau hat auch geringere Macht bzw. eine größere Wahrscheinlichkeit für einen Fehler 2. Art.

== Konkrete Tests
=== z-Test / Gauss-Test
*Sample i.i.d. normalverteilt, Test für $mu$; $sigma^2$ bekannt* \
$mu$-Schätzer: $overline(X)_n = 1/n sum_(i=1)^n X_i$ \
+ Modell: $X_1, ..., X_n ~ cal(N)(mu, sigma^2)$ i.i.d. unter $PP_mu$
+ Hypothesen: $H_0: mu = mu_0$ gegen $H_A: mu != mu_0$ ($mu < mu_0$ oder $mu > mu_0$) mit Signifikanzniveau $alpha$.
+ Teststatistik $T := (overline(X)_n - mu_0)/(sigma / sqrt(n)) ~ cal(N)(0,1)$ unter $PP_(mu_0)$
+ Kritischer Bereich $K$: Ansatz für $c$ finden, sodass $PP_(mu_0)[T in K] = alpha$ gilt.
  - *Linksseitig* ($H_A: mu < mu_0$): Ansatz $K = (-infinity, c_<)$ für ein $c_< in RR$.
    Finde $c_<$ s.t. $PP_(mu_0)[T < c_<] = alpha$ \
    $=> c_< = z_alpha = -z_(1-alpha) => K = (-infinity, -z_(1-alpha))$
  - *Rechtsseitig* ($H_A: mu > mu_0$): Ansatz $K = (c_>, infinity)$ für ein $c_> in RR$.
    Finde $c_>$ s.t. $PP_(mu_0)[T > c_>] = alpha$ \
    $=> 1 - PP_(mu_0)[T <= c_>] = alpha => PP_(mu_0)[T <= c_>] = 1 - alpha => c_> = z_(1-alpha) => K = (z_(1-alpha), infinity)$
  - *Zweiseitig* ($H_A: mu != mu_0$): Ansatz $K = (-infinity, -c_=) union (c_=, infinity)$ für ein $c_= in RR$
    Finde $c_=$ s.t. \ $PP_(mu_0)[T in K] = alpha \
    => PP_(mu_0)[-c_= < T < c_=] = 1 - alpha => 2 Phi(c_=) - 1 = 1 - alpha \
    => Phi(c_=) = 1 - alpha/2 => c_= = z_(1-alpha/2) \
    => K = (-infinity, -z_(1-alpha/2)) union (z_(1-alpha/2), infinity)$
+ *Dualität zum Konfidenzintervall (zweiseitig):* \
  Die Nullhypothese wird genau dann *nicht* verworfen, wenn $T in K^c$, also:
  $ |T| <= z_(1-alpha/2) <=> |(overline(X)_n - mu_0)/(sigma / sqrt(n))| <= z_(1-alpha/2) $
  $ <=> -z_(1-alpha/2) dot sigma/sqrt(n) <= overline(X)_n - mu_0 <= z_(1-alpha/2) dot sigma/sqrt(n) $
  $ <=> overline(X)_n - z_(1-alpha/2) dot sigma/sqrt(n) <= mu_0 <= overline(X)_n + z_(1-alpha/2) dot sigma/sqrt(n) $
  Das Intervall $I = [overline(X)_n - z_(1-alpha/2) dot sigma/sqrt(n), overline(X)_n + z_(1-alpha/2) dot sigma/sqrt(n)]$ enthält genau alle hypothetischen Werte $mu_0$, die mit den Beobachtungen kompatibel sind (95%-KI für $alpha = 0.05$).

=== t-Test
*Sample i.i.d. normalverteilt, Test für $mu$; $sigma^2$ UNbekannt* \
Parameter $arrow(theta) = (mu, sigma^2)$ ist zweidimensional! \
$mu$-Schätzer: $overline(X)_n = 1/n sum_(i=1)^n X_i$ \
$sigma^2$-Schätzer: $S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X)_n)^2$ \
+ Modell: $X_1, ..., X_n ~ cal(N)(mu, sigma^2)$ i.i.d. unter $PP_arrow(theta)$
+ Hypothesen: $Theta_0 = ({mu_0} text(" oder ") {mu <= mu_0} text(" oder ") {mu >= mu_0}) times (0, infinity)$ #text(fill: luma(50%))[$<- "weil" arrow(theta) = (mu, sigma^2)$]
+ Teststatistik $T := (overline(X)_n - mu_0)/(sqrt(S^2 / n)) ~ t_(n-1)$ unter $PP_(mu_0)$
+ Kritischer Bereich $K$: Ansatz für $c$ finden, sodass $PP_(mu_0)[T in K] = alpha$ gilt.
  - *Linksseitig* ($H_A: mu < mu_0$): Ansatz $K = (-infinity, c_<)$ für ein $c_< in RR$.
    Finde $c_<$ s.t. $PP_(mu_0)[T < c_<] = alpha => c_< = -t_(n-1, 1-alpha) => K = (-infinity, -t_(n-1, 1-alpha))$
  - *Rechtsseitig* ($H_A: mu > mu_0$): Ansatz $K = (c_>, infinity)$ für ein $c_> in RR$.
    Finde $c_>$ s.t. $PP_(mu_0)[T > c_>] = alpha => c_> = t_(n-1, 1-alpha) => K = (t_(n-1, 1-alpha), infinity)$
  - *Zweiseitig* ($H_A: mu != mu_0$): Ansatz $K = (-infinity, -c_=) union (c_=, infinity)$ für ein $c_= in RR^+$ \
    Finde $c_=$ s.t. $PP_(mu_0)[ |T| > c_=] = alpha => c_= = t_(n-1, 1-alpha/2) \
    => K = (-infinity, -t_(n-1, 1-alpha/2)) union (t_(n-1, 1-alpha/2), infinity)$
+ *Dualität zum Konfidenzintervall (zweiseitig):* \
  Äquivalent zum z-Test durch Umformen von $|T| <= t_(n-1, 1-alpha/2)$ nach $mu_0$:
  $ overline(X)_n - t_(n-1, 1-alpha/2) dot sqrt(S^2/n) <= mu_0 <= overline(X)_n + t_(n-1, 1-alpha/2) dot sqrt(S^2/n) $
  $==>$ $I = [overline(X)_n - t_(n-1, 1-alpha/2) dot sqrt(S^2/n), overline(X)_n + t_(n-1, 1-alpha/2) dot sqrt(S^2/n)]$

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
  $S_X^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X)_n)^2$ und \ $S_Y^2 = 1/(m-1) sum_(i=1)^m (Y_i - overline(Y)_m)^2$
  werden zu einer empirischen Varianz kombiniert: \
  $ S^2 := (1)/(m + n - 2) ((n-1)S^2_X + (m-1)S^2_Y) $
  $ T := ((overline(X)_n - overline(Y)_n) - (mu_X - mu_Y))/(S sqrt(1/n + 1/m)) ~ t_(m+n-2) $

== $p$-Wert
#mainbox(title: "Definition " + $p$ + "-Wert")[
  Sei $H_0 : theta = theta_0$ eine einfache Nullhypothese. Sei $(T, K_t)_(t >= 0)$ eine geordnete Familie von Tests. Der $p$-Wert ist definiert als ZV $G(omega)$, wobei $ G : Omega |-> [0,1], space space space space G(omega) = PP_(theta_0)[T in K_(t(X_1(omega),...,X_n(omega)))] $
]
*Intuitiv*: Kleinstes Signifikanzniveau $p$, bei welchem die Nullhypothese verworfen wird (anhand der Teststatistik mit effektiver Realisation $omega$). *Ansatz*: Berechne kleinsten Verwerfungsbereich $K$, sodass $T in K$ und löse $PP_(theta_0)[T in K] >= 1 - alpha$ auf. Wie müsste ich mein Signifikanzniveau wählen, sodass mein beobachteter Wert $T$ exakt auf der Grenze von $K$ liegt?

- *Linksseitig:* $K=(-infinity, c) --> p = PP[Z <= T(omega)]$
- *Rechtsseitig:* $K=(c, infinity) --> p = PP[Z >= T(omega)]$
- *Zweiseitig:* $K=(-infinity, -c) union (c, infinity) --> p = PP[ |Z| >= |T(omega)| ] = 2 dot PP[Z >= |T(omega)| ] = 2 dot (1- PP[Z<= |T(omega)| ])$

#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot

#subbox(title: "Visualisierung: Strenges Niveau (" + $alpha=1%$ + ")")[
  Hier wird Grenze des Verwerfungsbereichs $K$ durch das tiefe Signifikanzniveau so weit nach rechts "gedrückt", dass die Realisation $T in K$ gerade noch ausreicht, um $H_0$ zu verwerfen ($alpha = 1%$).
  #v(-4em)
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *

      // Funktion hier definieren, bevor der Plot aufgerufen wird
      let gauss(x) = 1 / calc.sqrt(2 * calc.pi) * calc.exp(-calc.pow(x, 2) / 2)

      plot.plot(
        size: (8, 2), // <--- Auf 8cm verkleinert, damit es in die Spalte passt!
        x-tick-step: 1,
        x-min: -3.5,
        x-max: 3.5,
        y-tick-step: 0.2, // <--- Sichere Methode in cetz-plot, um Ticks auszublenden
        y-min: 0,
        y-max: 0.4,
        axis-style: "school-book", // <--- Sicherer Achsen-Stil für alle Versionen
        {
          // Verwerfungsbereich K (alpha = 1% -> z_0.99 = 2.326)
          plot.add(
            domain: (1.28, 3.5),
            gauss,
            style: (stroke: none, fill: rgb("#ceffcc")),
            fill: true,
          )

          plot.add(
            domain: (2.33, 3.5),
            gauss,
            style: (stroke: none, fill: rgb("ffcccc")),
            fill: true,
          )

          // Glockenkurve
          plot.add(
            domain: (-3.5, 3.5),
            gauss,
            style: (stroke: black + 1.2pt),
          )
          // Teststatistik T (Realisation)
          plot.add(
            ((2.33, 0), (2.33, 0.33)),
            style: (stroke: rgb("0055ff") + 1.5pt),
          )

          // Grenze von K (kritischer Wert)
          plot.add(
            ((1.28, 0), (1.28, 0.25)),
            style: (stroke: rgb("00ff00") + 1.5pt),
          )

          // Grenze von K (kritischer Wert)
          plot.add(
            ((2.33, 0), (2.33, 0.1)),
            style: (stroke: rgb("ff0000") + 1.5pt),
          )

          // Beschriftungen
          plot.annotate({
            content(
              (2.33, 0.4),
              text(fill: rgb("0055ff"), size: 8pt)[#align(center)[$T = 2.33$ \ $T in K$]],
            )
            content(
              (1.28, 0.33),
              text(fill: rgb("#009a00"), size: 8pt)[#align(center)[$z_(0.90) = 1.28$ \ Grenze K]],
            )
            content(
              (1.7, 0.04),
              text(fill: rgb("ff0000"), size: 12pt)[#align(center)[$-->$]],
            )
            content(
              (2.33, 0.17),
              text(fill: rgb("ff0000"), size: 8pt)[#align(center)[$z_(0.99) = 2.33$ \ Grenze $K$]],
            )
          })
        },
      )
    })
  ]
  #v(-1em)
]
