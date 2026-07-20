// TODO: Alle Fotos kurz prüfen.

#import "@preview/mannot:0.3.0": markhl


#set page(
  paper: "a4",
  flipped: true,
  margin: 0.5cm,
  numbering: "1 / 1",
  number-align: center,
)

#set text(size: 8pt, lang: "de")
#set heading(numbering: "1.1")
#set par(justify: true) // TODO: Does that make sense?
#set list(marker: ([•], [◦]))

// 1. Globale vertikale Abstände minimieren
#set par(spacing: 0.4em)
#set block(spacing: 0.4em)
#set list(tight: true) // Zieht Listenpunkte näher zusammen
#show math.equation.where(block: true): set block(above: 0.3em, below: 0.3em) // Formel-Abstände

// 2. Überschriften enger fassen (ersetzt deine auskommentierten Zeilen)
#show heading: set block(above: 0.6em, below: 0.3em)

#let basebox(title: "", body, color) = block(
  width: 100%,
  fill: color.lighten(85%),
  radius: 1pt,
  clip: true,
  [
    #show table: set block(above: 0pt, below: 0pt)
    #if title != "" [
      #block(
        fill: color.lighten(60%),
        width: 100%,
        inset: 0.25em, // <--- HIER reduziert, vorher 0.5em
        radius: (top: 1pt, bottom: 0mm),
        below: 0pt,
        strong(title),
      )
    ]#block(
      width: 100%,
      inset: (top: 0.25em, right: 0.25em, bottom: 0.4em, left: 0.25em), // <--- HIER reduziert, vorher 0.5em
      above: 0pt,
      body,
    )
  ],
)

#let myblue = rgb(87, 178, 255)
#let mybluecontrary = myblue.rotate(180deg).darken(20%)
#let mygreen = rgb(51, 255, 102)
#let mygreencontrary = mygreen.rotate(180deg).darken(20%)
#let mypurple = rgb(255, 76, 255)
#let mypurplecontrary = mypurple.rotate(180deg).darken(20%)
#let mysub = rgb(204, 204, 204)
#let mytitlebg = rgb(230, 230, 230)

#let minitext(body, color: luma(40%)) = { text(size: 7pt, body, fill: color) }

#let mainbox(title: "", body) = basebox(title: title, body, myblue)
#let howtobox(title: "", body) = basebox(title: title, body, mygreen)
#let bspbox(title: "", body) = basebox(title: title, body, mypurple)
#let subbox(title: "", body) = basebox(title: title, body, mysub)

// Math settings
#let limn = $lim_(n->oo)$
#let limxo = $lim_(x->markhl(0))$
#let limxi = $lim_(x->oo)$
#let limxn = $lim_(x->-oo)$
#let sumk = $sum_(k=1)^oo$
#let sumn = $sum_(n=0)^oo$
#let dx = $" d"x$
#let N = $NN$
#let R = $RR$
#let Z = $ZZ$
#let Q = $QQ$
#let C = $CC$
#let implies = $==>$
#let notimplies = $cancel(==>)$
#let notimpliedby = $cancel(<==)$

#show: rest => columns(3, gutter: 0.5cm, rest)

= Analysis 1, 26FS, thruegg
#grid(
  columns: (auto, 1fr, 1fr, 1fr, 1fr),
  gutter: 3pt,
  align: horizon,
  [Legende:], mainbox("Fakten"), howtobox("Rezept"), bspbox("Beispiele"), subbox("Subtopics"),
)

#howtobox(title: "Generelles Vorgehen")[
  Funktion vorstellen. Dann einige positive & negative Werte ausprobieren.
  + Bestandteile der Aufgabe erkennen.
  + Zugehörige Teile des Spicks lesen: \ $exists$ Fakt den ich nutzen kann? $exists$ Beispielbeweis?
  + Referenzfolgen und Tabellen prüfen.
]

== Archimedisches Prinzip
+ Für $x in RR$ und $y > 0$ existiert $n in NN$ mit $n dot y > x$.
+ Für jedes $epsilon > 0$ existiert $n in NN$ mit $1/n < epsilon$.
#minitext[$==>$ Die natürlichen Zahlen sind unbeschränkt in den Reellen Zahlen.]

== Intervalle
$]a,b[ = (a,b) = {x in RR | a < x < b}$ #minitext[offenes Intervall] \
$[a,b[ = [a,b) = {x in RR | a <= x < b}$ #minitext[halb-offenes Intervvall] \
$]a,b] = (a,b] = {x in RR | a < x <= b}$ #minitext[halb-offenes Intervall] \
$[a,b] = [a,b] = {x in RR | a <= x <= b}$ #minitext[abgeschlossenes Intervall] \
Abgeschlossenes Intervall: $I in RR$ ist abgeschlossen, wenn $forall$ konvergenten Folgen $(a_n)_(n >= 1)$ auch Grenzwert $limn (a_n) in I$.

== Beschränktheit, Schranken
$x$ ist die obere/untere Schranke. $A in RR$ heisst
- (n.o.b) nach oben beschränkt: $exists x in RR$ s.t. $x >= a$ $forall a in A$.
- (n.u.b) nach unten beschränkt: $exists x in RR$ s.t. $x <= a$ $forall a in A$.
- beschränkt: (n.o.b) und (n.u.b)

== Minimum, Maximum
Minimum: $x in A$ ist und $x$ untere Schranke \
Maximum: $x in A$ ist und $x$ obere Schranke

== Infimum & Supremum
#mainbox[
  #grid(
    columns: (1.5fr, 1fr),

    [
      Sei $A subset RR$, $A != diameter$
      - Infimum: grösste untere Schranke \ $R := inf A$ (falls $A$ n.u.b). \
        #minitext[$forall a in A : R <= a quad forall epsilon > 0, limits(exists) a in A : a < R + epsilon$]
      - Supremum: kleinste obere Schranke \ $R := sup A$ (falls $A$ n.o.b). \
        #minitext[$forall a in A : a <= R quad forall epsilon > 0, limits(exists) a in A : a > R - epsilon$]
    ],
    image("img/infimumsupremum.jpeg", width: 100%),
  )
]

- Wenn $x = sup A$, so gilt $x >= a, forall a in A$ und all $y < x$ sind keine oberen Schranken. Falls $A$ ein Maximum hat, gilt $max A = sup A$.
- Wenn $A subset B subset R$ und $B$ beschränkt ist, so ist $A$ beschränkt und $sup A <= sup B$, $inf A >= inf B$.
- Für $A != diameter$ und nicht n.o.b. definieren wir \
  $sup A = oo$, falls nicht n.u.b. $inf A = -oo$.

= Folgen
== Grundlagen
*Folge* (reeler Zahlen) ist eine Abbildung $a: NN^* -> RR$. \
$(a_n)_(n>=1)$ = Folge, $quad a_n$ = Element einer Folge \
#minitext[
  Bsp. $(a_n)_(n>=1) = 1/n: quad a_1 = 1/1, quad a_2 = 1/2, quad a_3 = 1/3, ...$
]

== Vorgehen
#howtobox(title: "Grenzwerte berechnen bei Folgen")[
  #set enum(numbering: "1.")
  + Grenzwert durch simple Operationen und Umformen berechnen.
  + Trick anwenden (Limes binom, - substitution, - log).
  + Grenzwert von Brüchen mit $n -> oo$: \
    Grösste Potenz von $n$ ausklammern und kürzen. Alle übrigen Brüche der Form $a/n^s$ oder $i/n^s$ streichen, da sie gegen 0 gehen für $n -> oo$.
  + Grenzwert von Wurzel $plus.minus$ smth. im Nenner berechnen. \
    Multipliziere mit inversen des Nenners (oben & unten).
  + Berechne Grenzwert mit Sandwhich-Theorem.
  + Rekursive Folge? Siehe Absatz Rekursive Folgen.
]

#howtobox(title: "Konvergenzanalyse bei Folgen (Konv.? Div.?)")[
  #set enum(numbering: "1.")
  + Abschätzen: Nur grösste Terme prüfen.
  + Grenzwert zeigen per Definition der Konvergenz. (Vor allem für formale Beweise)
  + Suchen eines konvergenten Majorant
  + Cauchy-Kriterium
]

== Konvergente Folge & Limes
Folge konvergiert wenn die Differenz zwischen Folgegliedern und Grenzwert immer kleiner wird.
#mainbox(title: "Konvergente Folge & Limes")[
  - Folge $(a_n)_(n >= 1)$ ist konvergent $<==> exists l in RR$ s.t. $forall epsilon > 0$ die Menge ${n in NN^*: a_n in.not quad (l - epsilon, l + epsilon)}$ endlich ist. $l = lim a_n$. \
    #minitext[
      Eine Folge ist konvergent wenn egal welchen Abstand $epsilon$ man wählt, nach endlichen Ausnahmeindizes $N$ alle weiteren Folgengliedern weniger als Abstand $epsilon$ vom Grenzwert $l$ entfernt sind.
      Also im Intervall $(l - epsilon, l + epsilon)$.
    ]
  - $(a_n)_(n >= 1) "konvergiert gegen" l = limn (a_n) <==> forall epsilon > 0, exists N >= 1, "so dass" |a_n - l| < epsilon quad forall n >= N$ \
    #minitext[
      Folge konvergiert weil man Differenz zwischen Folgegliedern & Grenzwert beliebig klein machen kann in dem man $n$ gross genug wählt.
      $->$ Es gibt immer einen Index $N$, ab welchem keine Ausnahmeindizes mehr auftreten.
    ]
]
- konvergent $==>$ beschränkt, aber $notimpliedby$
- Reihenfolge hat keinen Einfluss auf Konvergenz. Tatsache, dass sich Glieder einem bestimmten Wert annähern, bleibt unverändert.

#bspbox(title: $epsilon$ + "-Konvergenzbeweis")[
  #minitext[
    Ab Index N sind alle Glieder $(a_n)$ näher als $epsilon$ am Grenzwert.
  ] \
  Wähle beliebig kleines $epsilon$ und zeige $N = N(epsilon) in NN$ existiert, so dass $forall n >= N$ gilt:
  $|a_n - limn (a_n)| = dots < epsilon$ \
  Löse nach $n$ auf und wähle $N := ceil(n)$. Somit gilt $forall n >= N$, \ dass $|a_n - limn (a_n)| <= epsilon$ (def $limn$).
]

#bspbox(title: "Divergenz von Folgen")[
  Divergente Folge = nicht konvergent = kein Grenzwert.
  #set enum(numbering: "1.")
  + Suchen eines divergenten Minorant.
  + *Alternierende Folgen:* Zeige, dass
    $limn (a_("p1"(n))) != limn (a_("p2"(n)))$, \ z.B. bei einer Folge der Form $(-1)^n dot f(x)$.
]

== Rechenregeln zu Konvergenz & Grenzwert
Sei $(a_n)_(n >= 1)$ und $(b_n)_(n >= 1)$ konvergente Folgen mit $limn (a_n) = a$ und $limn (b_n) = b$.
- dann $(a_n + b_n)_(n >= 1)$ konvergent & $limn (a_n + b_n) = a + b$
- dann $(a_n dot b_n)_(n >= 1)$ konvergent & $limn (a_n dot b_n) = a dot b$
- wenn $b_n != 0, forall n >= 1 "und" b != 0$ dann ist $(a_n/b_n)_(n >= 1)$ konvergent und $limn (a_n/b_n) = a/b$

== Monotone Folgen
- monoton wachsend: $forall n in NN$ gilt, dass $a_n <= a_(n + 1)$
- streng monoton wachsend: $forall n in NN$ gilt, dass $a_n < a_(n + 1)$
- monoton fallend: $forall n in NN$ gilt, dass $a_n >= a_(n + 1)$
- streng monoton fallend: $forall n in NN$ gilt, dass $a_n > a_(n + 1)$

#bspbox(title: "Monotonie prüfen durch Ableitung")[
  Ersetze $n$ durch $x$ und berechne die Ableitung nach $x$.\ $a'(x) >= 0 ==>$ monoton wachsend, $a'(x) <= 0 ==>$ monoton fallend.
]
Kann auch durch Induktionsbeweis gezeigt werden. Siehe "Grenzwert rekursiver Folgen berechnen".

== Sandwhich Theorem
Grenzwert von Folge bestimmen, wenn sie zwischen zwei anderen Folgen mit gleichem, bereits bekannten Grenzwert liegt.
#mainbox(title: "Sandwich-Theorem")[
  Sei $limn (a_n) = alpha$, $limn (b_n) = alpha$ und \
  $a_n <= c_n <= b_n$, $forall n >= k$, dann gilt $limn (c_n) = alpha$.
]

== Weierstrass // TODO: COMPACT
Grenzwert von monotonen, beschränkten Folgen berechnen. Weierstrass darf auch angewendet werden, wenn Folge erst nach einem Index $N$ monton wachsend/fallend ist.

#mainbox(title: "Weierstrass (Monotoner Konvergenzsatz)")[
  - Folge $(a_n)$ monoton wachsend & nach oben beschränkt \
    $==> limn (a_n) = sup{a_n: n >= 1}$ \
    #minitext[
      Grenzwert ist Supremum des Intervalls der Folge $a_n$
    ]
  - Folge $(a_n)$ monoton wachsend & nach oben #emph[un]beschränkt \
    $==> limn (a_n) = oo$
  - Folge $(a_n)$ monoton fallend & nach unten beschränkt \
    $==> limn (a_n) = inf{a_n: n >= 1}$ \
    #minitext[
      Grenzwert ist Infimum des Intervalls der Folge $a_n$
    ]
  - Folge $(a_n)$ monoton fallend & nach unten #emph[un]beschränkt \
    $==> limn (a_n) = -oo$
]


== Limes Inferior/Superior
Um Verhalten von nicht konvergenten Folgen zu analysieren durch definieren zweier monotonen Folgen welche zum kleinsten bzw. grössten Häufungspunkt konvergieren.

#mainbox(title: "Limes Inferior/Superior")[
  - Lim Inferior (unterer Häufungspunkt an den sich Folge annähert): \
    #text(size: 8pt)[$limn inf(a_n) := limn inf{ a_k | k >= n} = sup_(n in NN)(inf{ a_k | k >= n})$]
  - Lim Superior (oberer Häufungspunkt an den sich Folge annähert): \
    #text(size: 7.8pt)[$limn sup(a_n) := limn sup{ a_k | k >= n} = inf_(n in NN)(sup{ a_k | k >= n})$]
  Beispiel: $a_n = (-1)^n + 1/n, quad n >= 1$
  #import "img/limes-inferior-superior-diagram.typ": limes-inf-sup-diagram
  #v(6pt)
  #limes-inf-sup-diagram(mybluecontrary, mypurple, limn)
]

- $limn inf(a_n) > -oo <==> (a_n)_(n >= 1)$ nach unten beschränkt
- $limn sup(a_n) < oo <==> (a_n)_(n >= 1)$ nach oben beschränkt
- $limn inf(a_n) = oo <==> (a_n)_(n >= 1)$ konvergiert gegen $oo$
- $limn sup(a_n) = -oo <==> (a_n)_(n >= 1)$ konvergiert gegen $- oo$
- Sei $(a_n)_(n >= 1)$ beschränkt. Dann $forall epsilon > 0: N in NN$ s.t. $forall n <= N: a_n in (limn inf a_n - epsilon , limn sup a_n + epsilon)$

== Cauchy-Kriterium/Cauchy-Folge
Konvergenz einer Folge prüfen, ohne Grenzwert zu kennen.

#mainbox(title: "Cauchy-Kriterium")[
  Folge $(a_n)$ konvergiert $<==> (a_n)_(n >= 1)$ beschränkt und $limn inf(a_n) = limn sup(a_n)$
  #minitext[
    Folge konvergiert weil die Differenz zwischen Folgegliedern mit wachsendem Index immer kleiner wird.
  ]
]

#mainbox(title: "Cauchy-Folge")[
  $(a_n)$ heisst Cauchy-Folge falls \
  $forall epsilon > 0, limits(exists) N in NN: |a_n - a_m| < epsilon quad forall m,n >= N$ \
  #minitext[
    Bei einer _Cauchy-Folge_ ist egal welchen Abstand $epsilon$ man wählt, nach endlichen Ausnahmeindizes $N$ ist der Abstand zwischen *_beliebigen_* Folgengliedern trotzdem kleiner als $epsilon$. Daher ist sie konvergent.
  ]
]
- $(a_n)$ Cauchy-Folge $==> (a_n)$ beschränkt
- $(a_n)$ konvergent $<==> (a_n)$ Cauchy-Folge
- $(a_n)$ nicht Cauchy-Folge $==> (a_n)$ divergent

== Teilfolge
#mainbox(title: "Teilfolge")[
  Teilfolge $(b_n)_(n >= 1)$ von $(a_n)_(n >= 1)$ ist $b_n = a_(l(n))$. \
  $l(n)$ ist Indexfunktion mit Eigenschaft: $l(n) < l(n + 1)$ \
  #minitext[
    Bsp: $a_n = (-1)^n + 1/n$. Sei $l(n) = 2n$. Teilfolge: $b_n = a_(2n) = (-1)^(2n) + 1/(2n) = 1 + 1/(2n)$
  ]
]
- Entsteht durch weglassen von Folgengliedern.
- $(a_n)_(n in NN)$ konvergent $==> (a_l(n))_(n in NN)$ konvergent $forall$ Teilfolgen.

== Bolzano Weierstrass
#mainbox(title: "Bolzano Weierstrass")[
  Jede beschränkte Folge besitzt eine konvergente Teilfolge.
]
- $(a_n)_(n in NN)$ beschränkt $==>$ für jede beschränkte Teilfolge $(b_n)_(n in NN)$ gilt:\ $lim_(n -> oo) inf a_n <= lim_(n -> oo) b_n <= lim_(n -> oo) sup a_n$
- Es gibt je eine Teilfolge von $(a_n)_(n in NN)$ die $lim_(n -> oo) inf a_n$ resp. $lim_(n -> oo) sup a_n$ als Limes annehmen.

== Rekursive Folgen (Induktiv definierte)
Folgen können rekursiv definiert werden. Sei Folge \ $(a_k)_(k >= 1): a_1 = c, quad a_(k+1) = f(a_k), quad k >= 1$
#bspbox(title: "Grenzwert Rekursiver Folgen berechnen")[
  Sei Folge $(a_k)_(k >= 1): a_1 = c, a_(k+1) = sin(a_k), k >= 1$
  #set enum(numbering: "1.")
  + Monotonie beweisen per Induktion:
    $a_1 = c "und" c in [0, pi] ==> a_1 in [0, pi]$ \
    $sin(x) <= x quad forall x >= 0 ==> a_(k+1) <= a_k ==>$ monoton fallend
  + Beschränktheit zeigen \
    $sin(x) >= 0 quad forall x in [0, pi] ==> a_k >= 0, forall k >= 1 ==>$ n.u.b
  + Weierstrass Monoton Konvergenzsatz \
    $1. "und" 2. ==> a_k$ monoton fallend & n.u.b \
    $==> limn (a_n) = inf(a_k : k >= 1) = 0$
]

== Grenzwert Tricks
- *Limes Binom:* Berechne Grenzwert gegeben Summe von Wurzeln: \
  $lim_(x -> +oo) (sqrt(e^x + x) - sqrt(e^x - x)) = lim_(x -> +oo) (sqrt(e^x + x) - sqrt(e^x - x))/1 dot (sqrt(e^x+x) + sqrt(e^x - x))/(sqrt(e^x + x) + sqrt(e^x - x)) = lim_(x -> +oo) ((e^x + x) - (e^x - x))/(sqrt(e^x + x) + sqrt(e^x - x)) = lim_(x -> +oo) (2x)/(sqrt(e^x + x) + sqrt(e^x - x))$
  Dividiere durch $sqrt(x^2) ==> lim_(x -> +oo) 2/(sqrt(e^x/x^2 - 1/x) + sqrt(e^x/x^2 - 1/x)) = 0$. \ Weil: $e^x/x^2 -> oo$ und $1/x -> 0 ==>$ Nenner geht gegen $oo$
- *Limes Substitution:* $lim_(markhl(x -> oo)) (x^2(1 - cos(1/x)))$, $u = 1/x$ \
  $lim_(markhl(u -> 0)) (1 - cos(u))/u^2 =^"l'Hospital" lim_(markhl(u -> 0)) sin(u)/(2u) = lim_(markhl(u -> 0)) cos(u)/2 = 1/2$
- *Limes Log:* Limes der Form $oo^0$ oder $1^oo$ kann man mit $f(x)^g(x) = e^(g(x) dot ln(f(x)))$ lösen. Dann l'Hospital ($e$ ist stetig, daher betrachten wir nur den Exponenten) anwenden oder vereinfachen.

#bspbox(title: "Grenzwert berechnen mit Fixpunktgleichung")[
  Sei $(x_n)_(n >= 1)$ rekursiv gegeben durch $x_1 = 1 "und" x_(n+1) := 1+ 1/x_n quad forall n >= 1$. Berechne den Grenzwert $g$. \
  Für genug grosse $n$ gilt irgendwann $x_n = x_(n+1)$. Grenzwerte einsetzen und auflösen ergibt Grenzwert. \
  $x_n = x_(n+1) -> g = 1 + 1/g -> g^2 - g - 1 = 0 -> g = (1 plus.minus sqrt(5))/2$
]

= Reihen
== Grundlagen
- $S_n$ ist *Partialsumme*. Die _endliche_ Summe der ersten $n$ Glieder der Folge: $S_n = sum_(k=1)^n a_k = a_1 + a_2 + ... + a_n$ \
  *Folge aller Partialsummen*: $(S_n)_(n >= 1) = S_1, ..., S_n$ \
  #minitext[
    $S_1 = a_1, S_2 = a_1 + a_2, S_3 = a_1 + a_2 + a_3, ..., S_n = a_1 + a_2 + ... + a_n = sum_(k=1)^n a_k$ \
    Bsp. divergent: Sei $a_n = 1/n$, dann $S_1 = 1/1 = 1, S_2 = 1/1 + 1/2 = 1.5, S_3 = 1/1 + 1/2 + 1/3 = 1.833, ...$ \
    Bsp. konvergent: Sei $a_n = (1/2)^n$, dann $S_1 = (1/2)^1 = 0.5, S_2 = (1/2)^1 + (1/2)^2 = 0.75, S_3 = (1/2)^1 + (1/2)^2 + (1/2)^3 = 0.875, ...$
  ]
- $sumk a_k$ ist *Reihe*. Die _unendliche_ Summe der Folge $(a_n)_(n >= 1)$. \
  Symbol unendliche Summe repräsentiert für:
  #list(
    [divergente Reihe: $sumk a_k$ = divergente Folge $(S_n)_(n >= 1)$],
    [konvergent Reihe: $sumk a_k$ = Grenzwert $limn (S_n)_(n >= 1)$],
  )

== Vorgehen
Abschätzen durch nur schnellstwachsende Terme prüfen.

#howtobox(title: "Konvergenzanalyse Reihen " + $sum a_n$ + " Step-by-Step")[
  1. *Nullfolgenkriterium:* Gilt $limn a_n != 0$? $==>$ *Divergent!* (Falls $=0$, weitergehen). Nullfolgenkrit. für Konv. notwendig, aber nicht ausreichend.
  2. *Strukturanalyse (Form von $a_n$ bestimmt das Tool):*
    - Enthält $n!$ oder Mix aus $x^n$ und Polynomen? $==>$ *Quotientenkriterium*
    - Gesamter Term in $n$-ter Potenz: $(dots)^n$? $==>$ *Wurzelkriterium*
    - Reiner rationaler Bruch (z.B. $n^a / n^b$)? $==>$ *Majoranten-/Minorantenkriterium* mit $sum 1/n^s$ (Quot./Wurzel versagen hier!).
  3. *Vorzeichen prüfen:* Bei $(-1)^n$ zuerst absolute Konv. prüfen (Minus killen). Falls diese divergent, dann $==>$ *Leibnizkriterium* für bedingte Konvergenz.
]

== Konvergente Reihe
#mainbox(title: "Konvergente Reihe")[
  Folge aller Partialsummen $(S_n)_(n >= 1)$ konvergiert \
  $<==>$ Reihe $sum_(k=1)^oo a_k$ konvergiert.
]
*Achtung!* Grenzwert ändert sich wenn wir bei *Reihen* Glieder weglassen. *Konvergenz* bleibt aber unverändert.
#minitext[
  Bsp: $sum_(k=0)^oo (1/2)^k = 2$ aber $sum_(k=3)^oo (1/2)^k = sum_(k=0)^oo (1/2)^k - (1 + 1/2 + (1/2)^2) = 2 - (1 + 1/2 + 1/4) = 0.25$
]

- Für $a_k >= 0$: Reihe $sumk a_k$ konvergent $<==>$ Folge $(S_n)_(n >= 1)$ n.o.b.
- *Reihe* bleibt konvergent/divergent bei Verschiebungen um $k$, so wie die Folgen (aber bei Folgen würde der auch noch Grenzwert gleich bleiben). #minitext[Falls *Folge* $(a_n)$ gegen $l$ konvergiert, so konvergiert auch $b_n := a_(n+k)$ gegen $l$.] // TODO: Weglassen?

#mainbox(title: "Cauchy-Kriterium")[
  Reihe $sumk a_k$ konvergent \
  $<==> forall epsilon > 0, exists N >= 1$ mit $|S_n - S_m| < epsilon, forall m >= n >= N$. \
  _Hinweis:_ $|S_n - S_m| = |sum_(k=n)^m a_k|$ \
  #minitext[
    Bei _Cauchy-Reihe_ ist egal welches $epsilon$ man wählt, nach endlichen Ausnahmeindizes $N$ ist die Summe der Folgengliedern unter $epsilon$. Reihe konvergiert weil Summe beliebig vieler aufeinanderfolgender Glieder immer kleiner wird. Daher ist sie konvergent.
  ]
]

#mainbox(title: "Nullfolgenkriterium (schnell prüfen, ob Reihe divergent ist)")[
  - Reihe $sum_(k=1)^oo a_k$ konvergent $==>$ dazugehörige Folge $(a_n)_(n >= 1)$ hat $limn a_n = 0$ (_ist Nullfolge_). \
    #minitext[
      Wenn Reihe konvergiert $==>$ Folge aller Partialsummen konvergiert $==>$ Partialsummen werden immer kleiner $==>$ $(a_n)$ konv. gegen 0.
    ]
  - Folge $(a_n)_(n >= 1)$ der Reihe hat $limn a_n != 0$ (_keine Nullfolge_) $==>$ Reihe $sumk a_k$ divergent \
    #minitext[
      Folge der Reihe konv. nicht gegen 0 $==>$ Partialsummen wachsen immer mindestens um Grenzwert $==>$ Folge aller Partialsummen divergiert $==>$ Reihe divergiert. (Ausnahme: harm. Reihe $sum_(n=1)^oo 1/n$)
    ]
]
Bsp. $sum_(n=1)^oo (-1)^n n^(1/n)$ divergiert, da $|a_n| = n^(1/n) ->_(n -> oo) 1 != 0$.

== Reihen Rechenregeln zu Konvergenz & GW
$sumk a_k$ & $sumk b_k$ #underline[konvergent]
- $==>$ $sumk (a_k + b_k)$ konvergent
- $==>$ $sumk (a_k + b_k) = (sumk a_k) + (sumk b_k)$
- $==>$ $sumk alpha dot a_k$ konvergent und $sumk alpha dot a_k = alpha dot sumk a_k$
_Hinweis:_ Funktioniert identisch für absolute Konvergenz!

== Vergleichssatz
Konv./absolute Konv./Divergenz durch Vergleich mit bekannter Reihe beweisen.
#mainbox(title: "Majoranten-/Minorantenkriterium (Vergleichssatz)")[
  Wenn $sumk a_k$ und $sumk b_k$ Reihen mit \
  $0 <= a_k <= b_k, forall k >= K >= 1$ sind, so gilt: \
  $sumk b_k " (absolut) konvergent" &implies sumk a_k " (absolut) konvergent" \
  sumk a_k " divergent" &implies sumk b_k " divergent"$
]

=== Referenz-Integrale (für Majoranten- / Minorantenkriterium)
- $integral_markhl(0)^markhl(1) 1/x^p d x = 1/(1-p)$ für $p < 1$, divergiert für $p >= 1$
- $integral_1^oo 1/x^p d x = 1/(p-1)$ für $p > 1$, divergiert für $p <= 1$
  - Falls $p = 1$: $integral_e^oo 1/(x^markhl(1) (ln x)^beta) d x$ konvergiert für $beta > 1$, divergiert für $beta <= 1$
- $integral_(-oo)^oo e^(-x^2) d x = sqrt(pi) quad$ (Gaußsches Integral)

=== Wachstumshierarchie für grosse $n$
$ ln(n) << n^epsilon << a^n << n! << n^n, forall epsilon >0 "und" a>1 $

=== Klassische Ungleichungen (für Abschätzungen)
- $ln(x) <= x - 1 < x quad$ ($forall x > 0$)
- $x/(1+x) <= ln(1+x) <= x quad$ (sehr nützlich, wenn Terme gegen $0$ gehen)
- $(1+x)^n >= 1+n dot x quad$ ($forall x > -1, n in NN$)

=== Young'sche Ungleichung
$ forall epsilon >0, forall x, y in RR, 2 dot |x y| <= epsilon x^2 + 1/epsilon y^2 $


== Absolute Konvergenz
#mainbox(title: "Absolute Konvergenz")[
  Reihe $sumk a_k$ ist _absolut konvergent_ \
  $<==>$ Reihe der Absolutbeträge $sumk |a_k|$ konvergent.
]
- $sumk |a_k|$ konvergent $==> sumk a_k$ konvergent. Aber! $notimpliedby$ \
  #minitext[
    Ex $notimpliedby$: Die altern. harmon. Reihe $sum_(k=1)^oo (-1)^(k+1)/k$ konvergiert, aber  $sum_(k=1)^oo 1/k$ divergiert.
  ]
- Beim Summieren spielt die Reihenfolge _keine_ Rolle (bei absolut).
- $|sumk a_k| <= sumk |a_k|$: Aus absoluter Konvergenz folgt immer die normale Konvergenz (absolut konvergiert $->$ aufgrund Majorantenkriterium muss nicht-absolute Reihe somit auch konvergieren).
- Falls Reihe der Absolutbeträge $sum_(k=1)^oo |a_k|$ divergent, dann kann sie nur gegen $+oo$ divergieren.

=== Satz Dirichlet (Umordnung)
Falls $sum_(k=1)^oo a_k$ *absolut konvergent*, dann konvergiert jede Umordnung der Reihe mit dem selben Grenzwert.

=== Satz Riemann (Umordnung)
Ist $sum_(k=1)^oo a_k$ jedoch *nur bedingt konvergent*, dann ist die Reihenfolge entscheidend! Zu jedem $A in R union {+-oo}$ existiert eine Umordnung, die gegen $A$ konvergiert, sowie eine Umordnung, die divergiert.

== Leibnizkriterium

#mainbox(title: "Leibnizkriterium (Alternierende Reihen)")[
  #grid(
    columns: (1.5fr, 1fr),
    gutter: 0.5em,
    [
      Für Reihen  $sum (-1)^n a_n$ oder $sum (-1)^(n+1) a_n$:
      - *Voraussetzungen:* $a_n >= 0$, $(a_n)$ ist monoton fallend, und $limn a_n = 0$.
      - *Folgerung:* #underline()[Reihe konvergiert] gegen $S$, mit $a_1 - a_2 <= S <= a_1$.

    ],
    [
      #v(-10pt)
      #image("img/leibniz.png", width: 100%)
    ],
  )
  - *Fehlerabschätzung:* $|S - s_N| <= a_(N+1)$
    #minitext[
      Der Abbruchfehler nach $N$ Summanden ist höchstens so gross wie das erste vernachlässigte Folgeglied.
    ]
]

#bspbox(title: "Beispiel Leibnizkriterium")[
  Gegeben: $sumn (-1)^(n+1)(sqrt(n+1) - sqrt(n))$ \
  $a_n = sqrt(n+1) - sqrt(n) = ((sqrt(n+1) - sqrt(n))(sqrt(n+1) + sqrt(n))) / (sqrt(n+1) + sqrt(n)) = 1 / (sqrt(n+1) + sqrt(n))$ \
  $==> a_n$ ist monoton fallend und $limn a_n = 0$
]

#highlight()[== Wurzel- & Quotientenkriterium]
Prüfe ob Reihe divergent oder absolut konvergent ist. \
Wurzelkriterium versagt $==>$ Quotientenkriterium versagt auch. \
$notimpliedby$ Gibt Bsp. wo Wurzelk. funktioniert & Quotientenk. nicht.

#mainbox(title: "Quotientenkriterium (bei " + $!, x^n, ...$ + ")")[
  Sei $(a_n)_(n >= 1)$ die Folge der Glieder mit $a_n != 0 quad forall n >= 1$
  $
    limn(| a_(n+1)/a_n |) = cases(
      < 1 & "absolute Konvergenz",
      = 1 & "keine Aussage",
      > 1 & "Divergenz"
    )
  $
  Falls Grenzwert unbekannt:
  $limn markhl(sup) |a_(n+1)/a_n| < 1 ==> "konvergiert absolut", quad limn markhl(inf) |a_(n+1)/a_n| > 1 ==> "divergiert"$
]

#bspbox(title: "Beispiel Quotientenkriterium")[
  $sum_(k=1)^oo n!/n^n$ konvergiert. Beweis: \
  $limn |a_(n+1)/a_n| = limn |(n+1)!/(n+1)^(n+1) dot n^n/n!| = limn |((n+1)!)/n! dot (n/(n+1))^n dot 1/(n+1)| = limn |(n+1) dot (n/(n+1))^n dot 1/(n+1)| = limn |(n/(n+1))^n| = limn |1/((n+1)/n)^n| = limn |1/(1 + 1/n)^n| = 1/e < 1$
]

#mainbox(title: "Wurzelkriterium (bei " + $(...)^n, x^n, !, ...$ + " )")[
  Sei $(a_n)_(n >= 1)$ die Folge der Glieder
  $
    limn root(n, |a_n|) = cases(
      < 1 & "absolute Konvergenz",
      = 1 & "keine Aussage",
      > 1 & "Divergenz"
    )
  $

  Falls Grenzwert unbekannt:
  $limn markhl(sup) root(n, |a_n|) < 1 ==> "konvergiert absolut", quad limn markhl(sup) root(n, |a_n|) > 1 ==> "divergiert"$
]

#bspbox(title: "Beispiel Wurzelkriterium")[
  $sum_(k=1)^oo ((5n + 2n^3)/(6n^3 + 5))^k$
  $==> a_n = ((5n + 2n^3)/(6n^3 + 5))^n$ \
  $==> |a_n|^(1/n) = |(5n + 2n^3)/(6n^3 + 5)|^(n dot 1/n) ==> limn(|(5n + 2n^3)/(6n^3 + 5)|) =2/6$ \
  $==> limn root(n, |a_n|) = 1/3 < 1 ==> "konvergiert absolut"$
]

== Doppelreihen Satz
#subbox(title: "Doppelreihen Satz (Cauchy)")[
  Falls $exists B > 0$ sodass $sum_(j=0)^m sum_(i=0)^m |c_(i j)| >= B quad forall m >= 0$.
  Dann ist jede lineare Anordnung der Doppelreihe $sum_(i, j) c_(i j)$ _absolut konvergent_ und es gilt: \
  $sum_(j=0)^oo sum_(i=0)^oo |c_(i j)| = sum_(i=0)^oo sum_(j=0)^oo |c_(i j)|$
]

== Cauchy-Produkt
#minitext[
  *Hinweis*: Cauchy Produkt von 2 divergenten Reihen kann konvergent sein. Dann kann keine Aussage über ihre Konvergenz basierend auf den Reihen $a_n$ und $b_n$ gemacht werden.
]
#subbox(title: "Cauchy-Produkt (Reihen multiplizieren)")[
  Das Cauchy-Produkt von zwei Reihen $sum_(i=0)^oo a_i$ und $sum_(j=0)^oo b_j$ ist definiert als:
  $sum_(n=0)^oo sum_(j=0)^n (a_(n-j) dot b_j) = a_0 b_0 + (a_1 b_0 + a_0 b_1) + (a_2 b_0 + a_1 b_1 + a_0 b_2) +dots$ \
  Es konvergiert, falls beide Reihen _absolut_ konvergieren.
]

= Stetige Funktionen
== Reelwertige Funktionen
Sei $DD subset.eq RR$ eine beliebige Menge. Eine reellwertige Funktion ist eine Abbildung $f: DD -> RR$.
Die Menge aller auf $DD$ definierten Funktionen: $RR = {f: DD -> RR | f " eine Funktion"}$.
$forall x in DD$: $(RR^DD, +, dot)$ ist ein Vektorraum.

- *Addition*: $(f+g)(x) = f(x) + g(x)$
- *Skalare Multiplikation*: $(lambda f)(x) = lambda dot f(x)$
- *Nullfunktion*: $0(x) = 0 quad forall x in DD$ #minitext[Entspricht Nullvektor in $RR^DD$.]
- *Produkt von Funktionen*: $(f dot g)(x) = f(x) dot g(x)$
- *Konstante Funktion*: $(f dot 1)(x) = f(x)$ #minitext[Entspricht dem Einheitsvektor in $RR^DD$.]
- *Quotient von Funktionen*: Sei $f, g: DD -> RR$ und $tilde(DD) = {x in DD | g(x) != 0}$. $(f/g)(x) = f(x)/g(x)$
- *Komposition: Verkettung von Funktionen*: Zuerst $f$, dann $g$. Sei $f: DD -> RR$ & $g: E -> RR ==> g compose f: DD -> RR$ mit $(g compose f)(x) = g(f(x))$.

== Beschränktheit // TODO: weglassen?
$f: DD -> RR$ ist:
- *nach oben beschränkt*: falls Resultat von $f(DD) subset RR$ n.o.b.
- *nach unten beschänkt*: falls Resultat von $f(DD) subset RR$ n.u.b.
- *beschränkt*: falls Resultat von $f(DD) subset RR$ n.o.b & n.u.b.

== Kompaktes Intervall
Ist ein Intervall $I subset RR$ falls $I = [a, b], a <= b$.
- Für $(x_n)_(n in NN), lim_(n -> oo) x_n in RR, a <= b$. \
  ${x_n | n >= 1} subset [a, b] ==> lim_(n -> oo) x_n in [a, b]$. \
  #minitext[
    Jede konvergente Folge die immer im Intervall $[a, b]$ liegt, hat ihren Grenzwert in $[a, b]$.
  ]

== Monotonie von Funktionen // TODO: weglassen?
#mainbox(title: $f$ + " ist monoton")[
  $f: DD -> RR, DD subset RR, forall x, y in DD$ ist:
  - *monoton wachsend* falls $x <= y ==> f(x) <= f(y)$.
  - *streng monoton wachsend:* falls $x < y ==> f(x) < f(y)$.
  - *monoton fallend:* falls $x >= y ==> f(x) >= f(y)$.
  - *streng monoton fallend:* falls $x > y ==> f(x) > f(y)$.
]
- *monoton:* falls mono. wachsend oder mono. fallend.
- *streng monoton:* falls streng monoton wachsend oder streng monoton fallend.
- Symmetrische Funktionen sind nie monoton.
- $f$ streng mono. wachsend $==>$ $f$ injektiv

== Definition Stetigkeit von $f$
#grid(
  columns: (1.5fr, 1fr),
  gutter: 0.5em,
  [
    Kleine Änderung im Argument \ $==>$ kleine Änderung im Funktionswert. \
    Keine sprunghafte Änderungen. \
    Sei $DD subset.eq RR^d$ und $f: DD -> RR^d, x -> f(x)$ eine Funktion:
  ],
  image("img/stetignichtstetig.png", width: 100%),
)

#mainbox(title: $f$ + " stetig in " + $x_0$ + " (punktweise) (" + $epsilon$ + "-Kriterium)")[
  #grid(
    columns: (4fr, 1fr),
    gutter: 0.5em,
    [
      Funktion $f$ stetig in $x_0 in DD$, falls: \
      $
        forall x_0, forall epsilon > 0, exists delta > 0, forall x: \
        |x - x_0| < delta ==> |f(x) - f(x_0)| < epsilon
      $
    ],
    [
      #v(-10pt)
      #image("img/punktweise_stetigkeit.jpeg", width: 100%)
    ],
  )
]


#mainbox(title: $f$ + " stetig in " + $x_0$ + " (punktweise) (Folgenkriterium)")[
  - $f$ stetig in $x_0 <==> forall (a_n)_(n in NN)$ in $DD:$ \
    $ lim_(n -> oo) a_n = x_0 quad ==> quad lim_(n -> oo) f(a_n) = f(x_0) $
    #minitext[
      $f$ stetig in $x_0 <==> forall$ Folge $(a_n)$ konv. gegen $x_0$, $quad$Bildfolge $f(a_n)$ konv. gegen $f(x_0)$.
    ]
  - $f$ stetig in $x_0 <==> forall (a_n)_(n in NN)$ in $DD:$
    $lim_(n -> oo) f(a_n) = f(lim_(n -> oo) a_n)$. \
    #minitext[
      Anwendung: Operation "Funktion" & "Grenzwert" können vertauscht werden.
    ]
]

#mainbox(title: $f$ + " stetig in " + $x_0$ + " (punktweise) (Grenzwert-Kriterium)")[
  $f$ stetig in $x_0 <==> lim_(x -> x_0) f(x) = f(x_0)$
]
#mainbox(title: $f$ + " stetig")[
  $f$ ist für alle $x_0 in DD$ punktweise stetig.
]
- Für nicht-kompaktes Intervall $DD = (a, b)$ : \
  Punktweise stetig $==>$ stetig im Intervall.
- Für kompaktes Intervall $DD = [a, b]$ :
  Punktweise stetig + Beweis stetig in Randpunkten $==>$ stetig im Intervall. \
  #minitext[
    Für die Randpunkte zeigen dass $lim_(x -> a^+) f(x) = f(a)$ und $lim_(x -> b^-) f(x) = f(b)$.
  ]
- $f$ stetig $notimplies$ $f$ differenzierbar
- $f$ stetig auf _kompaktem Intervall_ $==>$ $f$ beschränkt

#mainbox(title: $f$ + " gleichmässig stetig")[
  Stärkere Form der Stetigkeit. $forall$ Punktepaare im Definitionsbereich der Funktion *existiert gemeinsames $delta$*. \
  $
    forall epsilon > 0, exists delta > 0, forall x, y in DD: \
    |x - y| < delta ==> |f(x) - f(y)| < epsilon
  $
]
- gleichmässig stetig $==>$ stetig $==>$ in $x_0$ stetig
- $f: [a, b] -> RR$ stetig im Kompakten Intervall $==>$ $f$ ist in $[a, b]$ gleichmässig stetig.

=== Polynomiale Funktionen
Polynomiale Funktionen $P(x)$ sind auf ganz $RR$ stetig. \
$P(x) = a_n x^n + a_(n-1) x^(n-1) + ... + a_1 x + a_0$

=== Rechenregeln stetige Funktionen
Für $x_0 in DD subset RR, lambda in RR, f: DD -> RR, g: DD -> RR$ und $f$ und $g$ stetig in $x_0$
- $==> f + g, f + (-g), lambda dot f, f dot g$ stetig in $x_0$.
- $==> f/g: DD' -> RR, x -> f(x)/g(x), DD' = {x in DD | g(x) != 0}, g(x_0) != 0$, ist stetig in $x_0$.

Für $DD_1, DD_2 subset RR, f: DD_1 -> DD_2, g: DD_2 -> RR, x_0 in DD_1$:
- Falls $f$ in $x_0$ und $g$ in $f(x_0)$ stetig $==> g compose f: DD_1 -> RR$ ist in $x_0$ stetig.
- Falls $f$ auf ganz $DD_1$ und $g$ auf ganz $DD_2$ stetig $==> g compose f$ auf $DD_1$ stetig.

Für $DD subset RR, f, g: DD -> RR, x_0 in DD$.
- Falls $f, g$ stetige Funktionen $==> |f|, (max{f, g}), (min{f, g})$ stetig in $x_0$.
  #minitext[
    Bsp: $(max{f, g})(x) = max{f(x), g(x)} quad forall x in DD$
  ]

== Zwischenwertsatz
#minitext[
  Anwendung: Zeigen, das eine Funktion einen gewissen Wert annimmt. \
  Anwendung: Zeigt, dass eine Funktion $f$ jeden Wert zwischen $f(a)$ und $f(b)$ annimmt.
]
#mainbox(title: "Zwischenwertsatz")[
  #grid(
    columns: (4fr, 1fr),
    gutter: 0.5em,
    [
      Sei $f: [a, b] --> RR$ eine stetige (inklusive Rand!) Funktion und sei $f(a) <= c <= f(b)$. Dann gibt es ein $x in [a, b]$ mit $f(x) = c$.
    ],
    [
      #v(-10pt)
      #image("img/zwischenwertsatz.png")
    ],
  )
]
- Daraus folgt, dass ein Polynom mit ungeradem Grad mindestens eine Nullstelle in $RR$ besitzt.
- Nullstellenmove: stetige Funktion $f$ an einem Punkt kleiner und einem Punkt grösser als 0 $==> f(x) = 0$ an mindestens einem Punkt.
- $x, y in RR, x <= y$, $c$ liegt *zwischen* $x$ und $y$ falls $c in [x, y]$.
- Für $f: [a, b] -> RR$ stetig und $f(a) dot f(b) < 0 ==> exists c in (a, b): f(c) = 0$.

#mainbox(title: "Beweis Zwischenwertsatz (via Supremum)")[
  // TODO: weglassen?
  _Voraussetzung:_ $f: [a,b] -> RR$ stetig, o.B.d.A. $f(a) < c < f(b)$. \
  _Ziel:_ Zeigen, dass ein $x = sup(X)$ existiert mit $f(x) = c$.

  #set enum(numbering: "1.")
  + *Menge & Supremum definieren:* \
    Sei $X := {t in [a,b] | f(t) <= c}$. \
    $X$ ist nicht leer (da $a in X$) und beschränkt ($X subset [a,b]$). \
    Nach dem Vollständigkeitsaxiom existiert somit das Supremum $x := sup(X)$.

  + *Zeige $f(x) <= c$ (Folgenstetigkeit):* \
    Da $x = sup(X)$ ist, existiert eine Folge $(x_n) in X$ mit $limn x_n = x$. \
    Wegen der Stetigkeit von $f$ konvergiert die Bildfolge: $limn f(x_n) = f(x)$. \
    Da für alle Folgenglieder $f(x_n) <= c$ gilt (da sie in $X$ liegen), muss logischerweise auch der Grenzwert $f(x) <= c$ sein.

  + *Zeige $f(x) = c$ (per Widerspruch):* \
    Annahme: $markhl(f(x) < c)$. (Daraus folgt sofort $x < b$, da $c <= f(b)$). \
    Wir wählen den Abstand $epsilon = c - f(x) > 0$. Wegen der Stetigkeit von $f$ existiert nun ein $delta > 0$, sodass sich $f$ im Bereich $[x, x+delta]$ um weniger als $epsilon$ verändert. \
    Es gilt dort also: $markhl(f(y) < f(x) + epsilon = c)$. \
    Das bedeutet, das Intervall $(x, x+delta) inter [a,b]$ liegt komplett in $X$. \
    *Widerspruch!* Wir hätten Elemente in $X$ gefunden, die echt grösser als unser definiertes Supremum $x$ sind. \
    $==>$ Die Annahme ist falsch, es muss zwingend $f(x) = c$ gelten.
]

#bspbox(title: "Beispiel Zwischenwertsatz (Nullstellenmove)")[
  #minitext[
    Hilfsfunktion & Nullstellenmove zeigen, dass stetige Funktion $f$ den Wert $e^x$ annimmt.
  ] \
  _Zu beweisen:_ Wenn $f$ stetig ist, $f(0) < 1$ & $f(1) > e$, dann $exists x in [0, 1]$ s.t. $f(x) = e^x$. \
  _Proof:_ Definiere Hilfsfunktion $g(x) = f(x) - e^x$. \
  $g(x)$ ist stetig, da die Differenz stetiger Funktionen stetig ist. \
  Es gilt: $g(0) = f(0) - e^0 < 1 - 1 = 0 ==> g(0) < 0$. \
  Es gilt: $g(1) = f(1) - e^1 > e - e = 0 ==> g(1) > 0$. \
  $==> exists x in (0, 1)$ s.t. $g(x) = 0 ==> f(x) - e^x = 0 ==> f(x) = e^x$.
]

== Stetige Funktion auf kompaktem Intervall
#minitext[
  Anw.: kompaktes Intervall & $f$ stetig $==>$ Bild $f(x)$ beschränkt. \
  Anw.: kompaktes Intervall & $f$ stetig $==>$ Bild hat min/max & $inf f(x)$ / $sup f(x)$.
]
#mainbox(title: "Min-Max-Satz")[
  Sei $f: I = [a, b] -> RR$ eine stetige Funktion und sei $I$ kompakt. \
  Dann ist $f$ beschränkt und $f$ nimmt sein Min und Max auf $I$ an. \
  $==> exists u, v in I$ mit glob Min $f(u) <= f(x) <= f(v) "glob Max", forall x in I$. \
  $quad quad quad quad quad <==> f([a, b])$ ist beschränkt. $f([a, b]) = [f(u), f(v)]$ \
  $==>$ $exists "Minimum" ==> f(u) = inf{f(x) | x in I}$ \
  $==>$ $exists "Maximum" ==> f(v) = sup{f(x) | x in I}$
]

== Umkehrabbildung
Sei $f: I -> RR$ stetig und streng monoton. Dann ist $f^(-1): J -> I$ stetig und streng monoton wobei $J = f(I) subset RR$. \
#minitext[
  Wenn $f$ stetig, dann Umkehrfunktion $f^(-1)$ stetig. \
  Wenn $f$ streng monoton, dann Umkehrfunktion $f^(-1)$ streng monoton.
]

#import "@preview/cetz:0.4.0": canvas
#import "@preview/cetz-plot:0.1.2": plot

== Exponentialfunktion Rechenregeln
#grid(
  columns: (2fr, 1fr),
  gutter: 0.5em,
  [
    Exponentialfunktion $exp: RR -> (0, +oo)$. \
    $e^(x) = sum_(k=0)^oo x^k / k! = 1 + x + x^2 / 2! + ... >= 1$ \
    $e^x$ ist streng monoton wachsend, stetig, surjektiv ($==>$ bijektiv)
    - $e^(x + y) = e^(x) dot e^(y) quad quad forall x, y in CC$
    - $e^(x - y) = e^(x) / e^(y) quad quad quad quad forall x, y in CC$
    - $e^(-x) = 1 / e^x quad quad quad quad forall x in CC$
    - $(e^x)^y = e^(x dot y) quad quad quad forall x, y in RR$
    - $(a dot e^x)^y = a^y dot e^(x dot y), markhl(lim_(x->plus.minus oo) (1 + k/x)^(m x) = e^(k m))$
    - $e^(x) > 0 quad forall x in RR quad e^(x) > 1 quad forall x > 0$
    - $e^(x) > e^(y) quad forall x > y quad markhl(e^(x) >= 1 + x) quad forall x in RR$
  ],
  image("img/exponentialfunktion.png"),
)

== Natürlicher Logarithmus
#grid(
  columns: (2fr, 1fr),
  gutter: 0.5em,
  [
    Umkehrfkt. von $e^x$ ist $ln(x): (0, +oo) -> RR$ \
    $ln(x)$ ist streng mon. wachsend, stetig, bijektiv
    - $ln(1) = 0, quad ln(e) = 1$
    - $ln(e^x) = x, quad e^(ln(x)) = x quad quad forall x > 0$
    - $ln(a dot b) = ln(a) + ln(b) quad forall a, b > 0$
    - $ln(a / b) = ln(a) - ln(b) quad quad forall a, b > 0$
    - $ln(a^x) = x dot ln(a)$
    - $x^a = e^(ln(x^a)) = e^(a dot ln(x))$
    - $log_b(x) = ln(x) / ln(b)$ #minitext[(Basiswechsel)] $forall x, b > 0, b != 1$
  ],
  image("img/lnfunktion.png", width: 100%),
)

== Konvergenz der Funktionenfolge
Sei *Funktionenfolge* $(f_n)_(n >= 1)$ Abbildung $NN -> {f: DD -> RR}$ \
$quad (f_n)_(n >= 1) = {f_1, f_2, ..., f_n}$ \
Sei $f_n$ eine der Funktionen für ein $n$, also die Abbildung: $n -> f_n: DD -> RR$ \
#minitext[
  Beispiel: $f_n(x) = n x: f_1(x) = x, f_2(x) = 2x$, etc.
] \
Sei $f(x) = limn f_n (x)$ die *Grenzwertfunktion* von $(f_n)$. Sie gibt für jedes $x$ den Grenzwert der Funktionenfolge an. \
#image("img/funktionenfolgenundgrenzwertfunktion.jpg", width: 50%)


#mainbox(title: $(f_n)_(n >= 1)$ + " konvergiert punktweise (" + $epsilon$ + "-Kriterium)")[
  Funktionenfolge $(f_n)_(n >= 1)$ konvergiert punktweise gegen Funktion \ $f: DD -> RR <==>$
  $markhl(forall x in DD", " forall epsilon > 0", " exists N in NN " s.t. " forall n >= N): |f_n (x) - f(x)| < epsilon$. \
  #minitext[
    Die Schranke $N$ darf sowohl von $epsilon$ als auch von $x$ abhängen.
    Konv. punktweise $<==>$ Für jedes $x$ gibt es ein Ausnahmeindizes $N$ nach welchem die Funktionswerte aller folgenden Funktionen $f_n (x)$ in einer $epsilon$-Umgebung der Grenzfunktion $f(x)$ liegen.
  ]
]

#mainbox(title: $(f_n)_(n >= 1)$ + " konvergiert punktweise (Folgenkriterium)")[
  Funktionenfolge $(f_n)_(n >= 1)$ konvergiert punktweise gegen Funktion $f: DD -> RR <==> forall x in DD: f(x) = limn f_n(x)$. \
  #minitext[
    Konv. punktweise $<==>$ Für jedes $x$ konv. die Funktionenfolge $f_n (x)$ gegen  Grenzfkt $f(x)$.
  ]
]
#minitext[
  Beispiel: Sei $f_n (x) = x/n$ und Grenzfunktion $f(x) = 0$ \
  $x = 3: f_1(3) = 3/1, f_2(3) = 3/2, f_3(3) = 3/3, f_4(3) = 3/4, ... quad f(3) = 0$ \
  $x = 4: f_1(4) = 4/1, f_2(4) = 4/2, f_3(4) = 4/3, f_4(4) = 4/4, ... quad f(4) = 0$ \
  $x = 5: f_1(5) = 5/1, f_2(5) = 5/2, f_3(5) = 5/3, f_4(5) = 5/4, ... quad f(5) = 0$
]

#mainbox(title: $(f_n)_(n >= 1)$ + " konvergiert gleichmässig")[
  Funktionenfolge $(f_n)_(n >= 1)$ konvergiert gleichmässig gegen Funktion $f: DD -> RR <==> markhl(forall epsilon > 0 ", " exists N in NN ", " "s.t." forall n >= N ", " forall x in DD) : |f_n (x) - f(x)| < epsilon$.
  #minitext[
    Das $N$ darf nicht mehr vom Punkt $x$ abhängen, sondern nur noch von $epsilon$! Konv. gleichmässig $<==>$ Es gibt ein Ausnahmeindizes $N$ nach welchem die Funktionswerte aller folgenden Funktionen $f_n (x)$ für jedes $x$ in derselben $epsilon$-Umgebung der Grenzfunktion $f(x)$ liegen.
    $<==>$ Für jedes $x$ konvergiert die Funktionenfolge $f_n (x)$ _gleich schnell_ gegen die Grenzfunktion $f(x)$.
  ]
]
#minitext[
  Beispiel: Sei $f_n (x) = x + 1/n$ und Grenzfunktion $f(x) = x$ \
  $x = 3: f_1(3) = 3 + 1/1, f_2(3) = 3 + 1/2, f_3(3) = 3 + 1/3, f_4(3) = 3 + 1/4, ... quad f(3) = 3$ \
  $x = 4: f_1(4) = 4 + 1/1, f_2(4) = 4 + 1/2, f_3(4) = 4 + 1/3, f_4(4) = 4 + 1/4, ... quad f(4) = 4$ \
  $x = 5: f_1(5) = 5 + 1/1, f_2(5) = 5 + 1/2, f_3(5) = 5 + 1/3, f_4(5) = 5 + 1/4, ... quad f(5) = 5$
]

- Für $DD subset RR$ und Funktionenfolge $(f_n): DD -> RR$ bestehend aus in $DD$ stetigen Funktionen die gleichmässig gegen Funktion $f(x): DD -> RR$ konvergieren $==> f(x)$ ist in $DD$ stetig $notimplies f(x)$ ist differenzierbar.
- Falls $f_n$ gleichmässig zu $f$ konvergiert \
  $quad ==> lim_(n -> oo) sup |f_n(x) - f(x)| = 0, x in DD$.
- Für Folge $(f_n) "stetig differenzierbar", \f_n ->^"konv." f, f^'_(n) ->^"konv."_"glm." g ==> f "stetig differenzierbar und" f^' = g$

#mainbox(title: "Cauchy Kriterium für Gleichmässige Konvergenz")[
  $f_n: DD -> RR$ ist gleichmässig konvergent $<==> forall epsilon > 0 ", " exists N in NN: markhl(forall n", " m) >= N ", " forall x in DD: |f_markhl(n) (x) - f_markhl(m) (x)| < epsilon$.
]


#bspbox(title: "Punktweise vs. gleichmässige Konvergenz")[
  Sei $f_n (x) = x/n$ eine Funktionenfolge.
  $ | f_n (x) - f (x)| = | x/n - 0 | = x/n < epsilon <==> n > x/epsilon $

  *Punktweise konvergenz* \
  Sei $x in [0, oo) ==>$ konv. punktweise gegen $f(x) = 0$. \
  Wenn wir $N$ wählen wollen, hängt es aber von $x$ ab!
  _Nicht gleichmässig konv._ weil wenn $x$ grösser wird, konvergiert Funktion langsamer gegen 0.

  *Gleichmässig konvergent* \
  Sei $x in [0, 1] ==>$ konv. gleichmässig gegen $f(x) = 0$. \
  Bei gleichmässiger Konvergenz hängt die Konvergenzgeschwindigkeit nicht von $x$ ab.
  Da $x <= 1$, wissen wir, dass $x/n <= 1/n < epsilon$. Wir können $N := ceil(1/ epsilon)$ wählen (unabhängig von $x$).
]

#howtobox(title: "Konvergenz von Funktionenfolgen")[
  *1. $f(x)$ finden durch punktweiser Limes von $f_n$* \
  Punktw. Limes von $f_n$ auf Definitionsbereich $Omega$ finden. Für fixes, beliebiges $x$ ($n$ ist Variable): $lim_(n -> oo) f_n (x) = f(x)$. \
  *2. $f$ konvergiert gleichmässig prüfen* \
  *A)* Indirekte Methode:
  - $f$ unstetig $==>$ keine gleichmässige Konvergenz
  - $f$ stetig, monoton wachsend, ($f_n(x) <= f_(n+1), forall x in Omega$) und $Omega$ ist kompakt, also $Omega$ abgeschlossen & beschränkt (e.g. $[a,b]$) $==>$ gleichmässige Konvergenz
  *B)* Direkte Methode:
  #set enum(numbering: "1.")
  + Berechne $sup_(x in Omega) |f_n (x) - f(x)|$ (entweder man sieht Maximum direkt oder man rechnet die Ableitung von $|f_n (x) - f(x)|$ und setzt sie gleich 0).
  + Limes für $n -> oo$ von $sup_(x in Omega) |f_n (x) - f(x)|$ berechnen. Wenn Limes $= 0 ==> f_n$ auf $Omega$ gleichmässig konvergent.
]

#bspbox(title: "Beweis Gleichmässig Konvergent (Supremums-Kriterium)")[
  Sei $DD = [0, 1)$ und $f_n (x) = x/n^2 + x + 1$.
  #set enum(numbering: "1.")
  + *Grenzfunktion $f(x)$ finden (punktweiser Limes):* \
    $f(x) = lim_(n->oo) (x/n^2 + x + 1) = 0 + x + 1$
  + *Gleichmässige Konvergenz zeigen (Supremum gegen 0):* \
    + *Maximalen Abstand bestimmen (Supremum) auf $DD$:* \
      $sup_(x in [0, 1)) |f_n (x) - f(x)| = sup_(x in [0, 1)) |x/n^2 + x + 1 - (x + 1)| = sup_(x in [0, 1)) x/n^2 = 1/n^2$
      _Hinweis:_ $markhl("Supremum" != "Maximum")$. Intervall ist bei 1 zwar offen aber weil Supremum dürfen wir den Rand auch einsetzen. \
    + *Limes bilden*:
      $lim_(n -> oo) ( sup_(x in DD) |f_n (x) - f(x)| ) = lim_(n -> oo) 1/n^2 = 0$ \
  Da der GW des max. Abstands $0$ ist, konvergiert $f_n$ auf $[0, 1)$ gleichmässig.
]

== Reihe der Funktionenfolge
*Reihe der Funktionenfolge* $sum_(k=0)^oo f_k (x)$ ist unendliche Summe der Funktionenfolge $(f_n)_(n >= 1)$.
#mainbox(title: $sum_(k=0)^oo f_k (x)$ + " konvergiert gleichmässig")[
  Funktionenfolge ihrer Partialsummen $S_n (x) := sum_(k=0)^n f_k (x)$ konvergiert gleichmässig
  $==>$ Reihe $sum_(k=0)^oo f_k (x)$ konvergiert gleichmässig
]
- *Majorantenkriterium:* Für $DD subset RR$, Folge stetiger Funktionen $f_n: DD -> RR$:
  Falls $|f_n (x)| <= c_n quad forall x in DD$ und $sum_(n=0)^oo (c_n)$ konvergent \
  $==> sum_(n=0)^oo f_n (x)$ gleichmässig konvergent in $DD$ und Grenzwert $f(x) := sum_(n=0)^oo f_n (x)$ ist in $DD$ stetig.

== Potenzreihen
#mainbox(title: "Potenzreihe")[
  Die Potenzreihe $sum_(n=0)^oo a_n x^n$ mit Entwicklungspunkt $x_0$ ist als $sum_(n=0)^oo a_n (x - x_0)^n$ definiert.
]
- Folge der Partialsummen $S_n (x)$ ist Funktionenfolge.
- Folge der Partialsummen $S_n (x)$ einer Potenzreihe ist definiert als: $S_n (x) = sum_(k=0)^n c_k x^k$.
- Potenzreihe $sum_(n=0)^oo a_n x^n$ konv. gleichmässig $==>$ Folge der Partialsummen $S_n (x)$ konv. gleichmässig

#mainbox(title: $sum_(n=0)^oo a_n x^n$ + " Konvergenzradius um " + $x_0$)[
  #grid(
    columns: (2.8fr, 1fr),
    gutter: 0.5em,
    [
      Konvergenzradius der Potenzreihe $sum_(n=0)^oo markhl(a_n) x^n$ um Entwicklungspunkt $x_0$ ist grösste Zahl $r$, s.t. die Potenzreihe $forall x$ mit $|x - x_0| < r$ konvergiert. Falls die Reihe für alle alle $x$ konvergiert, ist der Konvergenzradius $r$ unendlich. Sonst:
    ],
    [
      #v(-10pt)
      #image("img/konvergenzradius.jpeg", width: 100%)
    ],
  )
  #v(-10pt)
  $ r = limn |markhl(a_n)/a_(n+1)| =^"oder" 1/(limn sup root(n, |a_n|)) quad quad quad $
  _Hinweis:_ Konvergenzradius hängt nur von $markhl(a_n)$ ab, nicht von $x^n$. \
  _Hinweis:_ Konvergenzverhalten jedes Randpunkts $|x - x_0| = r$ muss einzeln untersucht werden. \
  *🚨 Falle falls $x^(k n)$ steht:* Formeln oben berechnen  Radius $R$ für $(x^k)^n$. Echter Konvergenzradius für $(root(k, x^k))^n=x^n$ ist dann $r = root(k, R)$ (e.g. $x^(2n) implies r = root(2, R)$).
]

#minitext[
  Sei Potenzreihe: $sumn x^k/k^2$. Dann $r = 1/(lim sup root(n, a_n)) = 1/(lim sup root(k, 1/k^2)) = 1/(lim sup 1/root(k, k^2)) = 1/(1/1) = 1$
]

- *Gleichmässige Konvergenz im Innern:* Eine Potenzreihe $sum_(n=0)^oo a_n x^n$ mit Konv.radius $r > 0$ konvergiert für jedes feste $r$ mit $0 <= markhl(rho < r)$ auf dem kompakten Teilintervall $[markhl(-rho", " rho)]$ gleichmässig.
- *Stetigkeit:* Jede Potenzreihe stellt im Innern ihres Konvergenzbereichs $(-r, r)$ eine stetige Funktion dar.


== Grenzwert von Funktionenfolgen
=== Häufungspunkt und Grenzwert
#mainbox(title: $x_0$ + " ist Häufungspunkt")[
  $x_0 in RR$ ist ein Häufungspunkt der Menge $DD$ falls \
  $forall delta > 0: ((x_0 - delta, x_0 + delta) backslash {x_0}) inter DD != diameter$.
  #minitext[
    $x_0$ ist Häufungspunkt, wenn sich in jeder Umgebung von $x_0$ mindestens ein Punkt aus $DD$ befindet.
  ]
]
#grid(
  columns: (2fr, 1fr),
  [
    #minitext[
      Bsp: $DD = (1, 2) union (4, 5) union {6}$, Häufungspunkte: $DD' = [1, 2] union [4, 5]$
      Wäre 6 auch ein Häufungspunkt? $x_0 = 6, "mit" delta = 1/2$
      $==> ((5.5, 6.5) backslash {6}) inter DD =^↯ diameter -->$ Nein.
    ]
  ],
  image("img/haeufungspunkt.jpeg", width: 100%),
)

#mainbox(title: "Grenzwert in Häufungspunkt " + $x_0$ + " (" + $epsilon$ + "-Kriterium)")[
  #grid(
    columns: (4.3fr, 1fr),
    [
      Sei $x_0$ Häufungspunkt von $DD$ und $f: DD -> RR$: \
      $A = lim_(x -> x_0) f(x) <==> forall epsilon > 0, exists delta > 0$ s.t. \
      $forall x in DD inter ((x_0 - delta, x_0 + delta) backslash {x_0}): |f(x) - A| < epsilon$.
    ],
    [
      #v(-10pt)
      #image("img/grenzwerthäufungspunkt.jpeg", width: 100%)
    ],
  )
]

#grid(
  columns: (6fr, 1fr),
  [
    #minitext[
      Bsp:
      Grenzwert existiert, aber $f$ nicht stetig in $x_0 = 1$. \
      Sei $f: RR backslash {(0.8, 1.2)}$. \
      Grenzwert ungleich Funktionswert: \ $lim_(x -> 1) f = 1 != f(1)$
    ]
  ],
  image("img/funktionenfolge_grenzwert.jpeg", width: 100%),
)

#mainbox(title: "Grenzwert in Häufungspunkt " + $x_0$ + " (Folgenkriterium)")[
  Sei $x_0$ Häufungspunkt von $DD$ und $f: DD -> RR$: \
  $A = lim_(x -> x_0) f(x) <==> forall (a_n)_(n >= 1) in DD backslash {x_0}$ mit $lim_(n -> oo) a_n = x_0$ folgt $lim_(n -> oo) f(a_n) = A$. \
  #minitext[
    Für jede Folge mit Grenzwert $x_0$ ist Grenzwert der Bildfolge $A = lim_(x -> x_0) f(x)$.
  ]
]
- $f$ muss am Grenzwert $x_0$ nicht zwingend definiert sein.
- $f$ ist stetig in $x_0 in DD <==> lim_(x -> x_0) f(x) = f(x_0)$.

== Rechenregeln für Grenzwerte
- Für $f, g: DD -> RR$ und falls $exists lim_(x -> x_0) f(x)$ und $lim_(x -> x_0) g(x)$
  - $==>$ $lim_(x -> x_0) (f + g)(x) = lim_(x -> x_0) f(x) + lim_(x -> x_0) g(x)$
  - $==>$ $lim_(x -> x_0) (f dot g)(x) = lim_(x -> x_0) f(x) dot lim_(x -> x_0) g(x)$
- Für $f, g: DD -> RR, f <= g$ und beide Grenzwerte existieren \ $==> lim_(x -> x_0) f(x) <= lim_(x -> x_0) g(x)$.
- Für $f, g_1, g_2: DD -> RR$, falls $g_1 <= f <= g_2$ und $lim_(x -> x_0) g_1(x) = lim_(x -> x_0) g_2(x) => exists lim_(x -> x_0) f(x)$ & $lim_(x -> x_0) f(x) = lim_(x -> x_0) g_1(x)$.
- *Variablenwechsel/GW von Kompositionen* (falls $f$ in $b$ stetig): \ $lim_(x -> markhl(a, color: mygreen)) g(x) = markhl(b)$ und $lim_(x -> markhl(b)) f(x) = c ==> lim_(x -> markhl(a, color: mygreen)) f(g(x)) = c$.
- *Exponentenregel:* Falls $f, g$ stetig in $x_0$ mit $f(x_0) > 0 ==> lim_(x -> x_0) f(x)^(g(x)) = f(x_0)^(g(x_0))$.

=== Links- und rechtsseitige Grenzwerte
#grid(
  columns: (1fr, 3fr),
  gutter: 1em,
  align: left,
  image("img/linksrechtsseitigergrenzwert.jpeg"),
  [
    #text(fill: mygreen.darken(40%))[
      \
      $cases(
        reverse: #true,
        lim_(x -> x_0^+) f(x) = 15,
        lim_(x -> x_0^-) f(x) = 15,
      )
      "gleich" ==> exists lim_(x -> x_0) f(x)$
    ]

    #text(fill: myblue.darken(25%))[
      $cases(
        reverse: #true,
        lim_(x -> x_0^+) g(x) = 10,
        lim_(x -> x_0^-) g(x) = 1,
      )
      "ungleich" ==> exists.not lim_(x -> x_0) g(x)$
    ]
  ],
)

#howtobox(title: "Grenzwert widerlegen (Folgenkriterium)")[
  *Theorie:* $lim_(x -> a) f(x) = A <==>$ für _jede_ Folge $(x_n)$ in $DD backslash {a}$ mit $limn x_n = a$ gilt $limn f(x_n) = A$. \
  *Praxis:* Wir können die Existenz eines Grenzwertes widerlegen, indem wir zwei clevere Folgen $(a_n)$ und $(b_n)$ finden, für die gilt:
  $ limn a_n = a quad "und" quad limn b_n = a, quad "aber" quad limn f(a_n) != limn f(b_n) $
]

=== Grenzwerte: Varianten & Definitionen
- *Rechtsseitig ($lim_(x -> x_0^+) f(x) = L$):* \
  $forall epsilon > 0, exists delta > 0: x in bb(DD)(f) inter (x_0, x_0 + delta) ==> |f(x) - L| < epsilon$
- *Linksseitig ($lim_(x -> x_0^-) f(x) = L$):* \
  $forall epsilon > 0, exists delta > 0: x in bb(DD)(f) inter (x_0 - delta, x_0) ==> |f(x) - L| < epsilon$
- *$x$ ist im Unendlichen ($lim_(x -> oo) f(x) = L$):* \
  $forall epsilon > 0 exists M > 0: x in bb(D)(f) inter (M, oo) ==> |f(x) - L| < epsilon$ \
  _(Analog für $-oo$: $x in bb(D)(f) inter (-oo, -M)$)_
  #image("img/unendlichergrenzwert.jpeg", width: 50%)
#grid(
  columns: (3fr, 1fr),
  gutter: 0.5em,
  [
    - *Uneigentlich ($lim_(x -> x_0) f(x) = oo$):* \
      $forall N > 0 exists delta > 0: x in bb(D)(f) inter (x_0 - delta, x_0 + delta)$ \ $==> f(x) >= N quad quad$
      _(Analog für $-oo$: $f(x) <= -N$)_

  ],
  [
    #v(-40pt)
    #image("img/linksrechtsseitigergrenzwerterweitert.jpeg")
  ],
)

== Trigonometrische Funktionen
$sin: RR -> RR "stetig", quad sin(z) &= z - z^3/3! + z^5/5! - ... = sum_(n=0)^oo ((-1)^n z^(2n markhl(+1)))/((2n markhl(+1))!) \
cos: RR -> RR "stetig", quad cos(z) &= 1 - z^2/2! + z^4/4! - ... = sum_(n=0)^oo ((-1)^n z^(2n))/((2n)!)$

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: horizon + center,
  stroke: 0.5pt + luma(150),
  inset: 0.5em,
  fill: (x, y) => if y == 1 {
    rgb("ffcccc")
  } else if y == 2 {
    rgb("#d5d8fb")
  } else if y == 3 {
    rgb("ccffcc")
  } else {
    none
  },
  [], [*$0° = 0$*], [*$30° = pi/6$*], [*$45° = pi/4$*], [*$60° = pi/3$*], [*$90° = pi/2$*],
  [*#text(fill: rgb("#fa0064"))[$sin(x)$]*], [$0$], [$1/2$], [$sqrt(2)/2$], [$sqrt(3)/2$], [$1$],
  [*#text(fill: rgb("#0c2896"))[$cos(x)$]*], [$1$], [$sqrt(3)/2$], [$sqrt(2)/2$], [$1/2$], [$0$],
  [*#text(fill: rgb("#0c6400"))[$tan(x)$]*], [$0$], [$sqrt(3)/3$], [$1$], [$sqrt(3)$], [$(plus.minus oo)$],
)

#import "@preview/cetz:0.4.2"

#align(center)[
  #cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    // Draw grid
    grid(
      (-7, -3),
      (7, 3),
      stroke: 0.25pt + luma(230),
    )

    // Draw axes
    line((-7.5, 0), (7.5, 0), mark: (end: ">"), stroke: 0.5pt + luma(120))
    line((0, -3.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt + luma(120))

    // Draw tick labels
    for y in (-2, -1, 1, 2) {
      line((-0.1, y), (0.1, y))
      content((-0.4, y), text(10pt)[#y])
    }

    for (x, label) in (
      (-2 * calc.pi, [$-2 pi$]),
      (-calc.pi, [$-pi$]),
      (-calc.pi / 2, [$-pi / 2$]),
      (calc.pi / 2, [$pi / 2$]),
      (calc.pi, [$pi$]),
      (2 * calc.pi, [$2 pi$]),
    ) {
      line((x, -0.1), (x, 0.1))
      content((x, 0.4), text(10pt)[#label])
    }

    // Plot sin and cos
    let sin-pts = ()
    let cos-pts = ()
    for i in range(120) {
      let x = -6.5 + 13.0 * i / 120
      sin-pts.push((x, calc.sin(x)))
      cos-pts.push((x, calc.cos(x)))
    }

    line(..sin-pts, stroke: 1pt + rgb("#fa0064"))
    line(..cos-pts, stroke: 1pt + rgb("#0c2896"))

    // Plot tan (avoiding asymptotes by splitting into segments)
    for k in (-2, -1, 0, 1, 2) {
      let tan-pts = ()
      for i in range(50) {
        let x = k * calc.pi - 1.3 + 2.6 * i / 49
        tan-pts.push((x, calc.tan(x)))
      }
      line(..tan-pts, stroke: 1pt + rgb("#0c6400"))
    }

    content((3, 1.2), text(10pt, fill: rgb("#fa0064"))[$sin(x)$])
    content((3.3, -1.5), text(10pt, fill: rgb("#0c2896"))[$cos(x)$])
    content((2.2, 2.5), text(10pt, fill: rgb("#0c6400"))[$tan(x)$])
  })
]

- *Eulersche Formeln:* \
  $e^(i x) = cos(x) + i sin(x)$ \
  $sin(x) = (e^(i x) - e^(-i x))/(2i), quad cos(x) = (e^(i x) + e^(-i x))/2$
- *Pythagoreische Identitäten:* \
  $sin^2(x) + cos^2(x) = 1, quad 1/(cos^2(x)) = 1 + tan^2(x)$
- *Symmetrie (Negative Winkel):* \
  $sin(-x) = markhl(-)sin(x), quad cos(-x) = cos(x), quad tan(-x) = -tan(x)$
- *Additionstheoreme:* \
  $sin(x plus.minus y) = sin(x) cos(y) plus.minus cos(x) sin(y)$ \
  $cos(x plus.minus y) = cos(x) cos(y) minus.plus sin(x) sin(y)$ \
  $tan(x plus.minus y) = (tan(x) plus.minus tan(y))/(1 minus.plus tan(x) tan(y))$
#grid(
  columns: (1fr, 1fr),
  [
    - *Doppelwinkel:* \
      $sin(2x) = 2 sin(x) cos(x)$ \
      $cos(2x) = cos^2(x) - sin^2(x) = 2 cos^2(x) - 1 = 1 - 2 sin^2(x)$ \
      $tan(2x) = (2 tan(x))/(1 - tan^2(x))$

  ],
  [
    - *Dreifachwinkel:* \
      $sin(3x) = 3 sin(x) - 4 sin^3(x)$ \
      $cos(3x) = 4 cos^3(x) - 3 cos(x)$ \
      $tan(3x) = (3 tan(x) - tan^3(x))/(1 - 3 tan^2(x))$
  ],
)
- *Halbwinkel / Quadrate:* \
  $sin^2(x/2) = (1 - cos(x))/2, quad cos^2(x/2) = (1 + cos(x))/2, quad tan^2(x/2) = (1 - cos(x))/(1 + cos(x))$ \
  *(Alternativ mit Doppelwinkel:* $sin^2(x) = (1 - cos(2x))/2, quad cos^2(x) = (1 + cos(2x))/2$ *)*
- *Summe zu Produkt (Faktorzerlegung):* \
  $sin(x) + sin(y) = 2 sin((x+y)/2) cos((x-y)/2)$ \
  $sin(x) - sin(y) = 2 cos((x+y)/2) sin((x-y)/2)$ \
  $cos(x) + cos(y) = 2 cos((x+y)/2) cos((x-y)/2)$ \
  $cos(x) - cos(y) = -2 sin((x+y)/2) sin((x-y)/2)$

== Kreiszahl $pi$
#text(size: 8.4pt)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    [
      $e^(i pi) = -1$ \
      $sin(x + pi/2) = cos(x)$ \
      $sin(pi/2 - x) = cos(x)$ \
      $sin(x + pi) = -sin(x)$ \
      $sin(x + 2 pi) = sin(x)$ \
      $sin(pi - x) = sin(x)$ \
    ],
    [
      $e^(2 pi i) = 1$ \
      $cos(x + pi/2) = -sin(x)$ \
      $cos(pi/2 - x) = sin(x)$ \
      $cos(x + pi) = -cos(x)$ \
      $cos(x + 2 pi) = cos(x)$ \
      $cos(pi - x) = -cos(x)$ \
    ],
    [
      $tan(pi) = 0$ \
      $tan(x + pi/2) = -1/tan(x)$ \
      $tan(pi/2 - x) = 1/tan(x)$ \
      $tan(x + pi) = tan(x)$ \
      $tan(x + 2 pi) = tan(x)$ \
      $tan(pi - x) = -tan(x)$ \
    ],
  )
]

// - Nullstellen von $sin(x) = {k dot pi | k in ZZ}$ \
//   - $sin(x) > 0, quad forall x in (2k pi, (2k+1) pi)$
//   - $sin(x) < 0, quad forall x in ((2k+1) pi, (2k+2) pi)$
// - Nullstellen von $cos(x) = {pi/2 + k dot pi | k in ZZ}$
//   - $cos(x) > 0, quad forall x in (-pi/2 + 2k pi, pi/2 + 2k pi)$
//   - $cos(x) < 0, quad forall x in (pi/2 + 2k pi, 3pi/2 + 2k pi)$

/ Tangens: $tan(z) := sin(z)/cos(z), z in.not {pi/2 + k dot pi}$
/ Cotangens: $cot(z) := cos(z)/sin(z), z in.not {k dot pi}$

== Abbildungseigenschaften
#image("img/injectivityAndSurjectivity.png")
- *$f$ Injektiv*, $f: X -> Y$ \
  Keine $2$ versch. Elemente in $X$ haben gleichen Funktionswert in $Y$. \
  $forall x_1, x_2 in X: x_1 != x_2 ==> f(x_1) != f(x_2)$
- *$f$ Surjektiv*, $f: X -> Y$ \
  Jedes Element in $Y$ wird mind. einmal angenommen. \
  $forall y in Y, exists x in X: f(x) = y$ (für mindestens ein $x$)
- *$f$ Bijektiv (= Injektiv & Surjektiv)*, $f: X -> Y$ \
  Jedes Element aus $X$ ist genau einem Element aus $Y$ zugeordnet. \
  $forall y in Y, exists x in X: f(x) = y$ (für genau ein $x$, perfekte Paarung)

#bspbox(title: "Zeige Funktion ist injektiv")[
  $f$ ist injektiv $<==> f$ streng monoton $<==> f' > 0$ oder $f' < 0$.
]

#bspbox(title: "Zeige Funktion ist surjektiv")[
  Mit Zwischenwertsatz: Sei die Zielmenge $(a, b)$ und $f$ eine *stetige* Funktion.
  #set enum(numbering: "1.")
  + Grenzwerte zeigen: $lim_(x -> -oo) f(x) = a$ und $lim_(x -> oo) f(x) = b$ \
    *(oder genau umgekehrt)*.
  + Sei nun $c in (a, b)$ beliebig. Wegen der Grenzwerte von $f$ existieren $x_1, x_2 in RR$ mit $f(x_1) < c < f(x_2)$.
  + Da $f$ stetig ist, gilt nach dem Zwischenwertsatz: \
    $exists y$ zwischen $x_1$ und $x_2$ mit $f(y) = c$. Da $c$ beliebig gewählt war, wird jeder Wert der Zielmenge angenommen. Somit ist $f$ surjektiv.
]

= Differentialrechnung (Ableiten)

== Definition Differenzierbarkeit von $f$
Funktion ist differenzierbar $<==> forall x_i$ eine Tangente gelegt werden kann
#mainbox(title: $f "in" x_0 "differenzierbar"$)[
  $f$ ist in $x_0$ differenzierbar wenn Grenzwert $f'(x_0)$ existiert:$ lim_(x -> x_0) (f(x) - f(x_0))/(x - x_0) = lim_(h -> 0) (f(x_0 + h) - f(x_0))/h = f'(x_0) $
]
- $f$ in $x_0$ differenzierbar, dann $f$ linear durch Tangente annäherbar
- $f$ differenzierbar in $x_0 ==> f$ stetig in $x_0$. Achtung! $notimpliedby$

#mainbox(title: $f$ + " ist differenzierbar")[
  $f$ differenzierbar $<==> f$ für jedes $x_0 in DD$ differenzierbar.
]

// TODO: darf man weglassen? Ist glaub ich eigentlich nur 1. Taylorpolynom?
// === Differenzierbarkeit nach Weierstrass
// #subbox(title: "Differenzierbarkeit nach Weierstrass")[
//   Sei $f: D -> RR, x_0 in D$ ein Häufungspunkt von $D$. Dann gilt: $f$ ist in $x_0$ differenzierbar $<==>$ Es gibt $c in RR$ und $r: D -> RR$ mit:
//   #set enum(numbering: "1.")
//   + $f(x) = f(x_0) + c(x - x_0) + r(x)(x - x_0)$
//   + $r(x_0) = 0$ und r stetig in $x_0$
//   Falls dies zutrifft ist $c = f'(x_0)$ eindeutig bestimmt.
// ]

// Same here:
// === Alternative Differenzierbarkeit ohne Limes
// Sei $Phi(x) = f'(x_0) + r(x)$:
// - $f: D -> RR$ ist in $x_0$ differenzierbar $<==> exists Phi: D -> RR$ welche
//   #set enum(numbering: "1.")
//   + In $x_0$ stetig ist
//   + $f(x) = f(x_0) + Phi(x)(x - x_0) quad forall c in D$.
//   + In diesem Fall $Phi(x_0) = f'(x_0)$
// - Für $f: D -> RR$ und $x_0 in D$ Häufigkeitspunkt von D. f in $x_0$ differenzierbar $==> f$ ist in $x_0$ stetig.

== Rechenregeln Ableitung
Für $DD subset RR$, Häufungspunkt $x_0 in DD$ und $f, g: DD -> RR$ in $x_0$ differenzierbar:
- $bold((f + g)'(x_0)) = f'(x_0) + g'(x_0)$.
- $bold((f g)'(x_0)) = f'(x_0)g(x_0) markhl(+) f(x_0)g'(x_0)$.
- $bold((f/g)'(x_0)) = (f'(x_0)g(x_0) markhl(-) f(x_0)g'(x_0)) / g(x_0)^2, quad g(x_0) != 0$.
- $bold((g compose f)'(x_0)) = (g(f(x)))' = g'(f(x_0)) dot f'(x_0)$ \
  Für $f: DD -> E, g: E -> RR, DD, E subset RR$, Häufungspunkt $x_0 in DD$ und $f$ differenzierbar in $x_0$ und $g$ differenzierbar in $f(x_0)$.
- $bold((f^(-1))'(y_0)) = 1/(f'(x_0)) = 1/(f'(f^(-1)(y_0)))$ \
  Für $f: DD -> E$ bijektiv, $x_0$ Häufungspunkt, $f$ in $x_0$ differenzierbar, $f'(x_0) != 0, f^(-1)$ in $y_0 = f(x_0)$ stetig $==> y_0$ ist ein Häufungspunkt von E und $f^(-1)$ ist in $y_0$ differenzierbar.
- $bold((c dot f)'(x_0)) = c dot f'(x_0)$.
  #minitext[
    Konstante bleibt beim Ableiten erhalten.
  ]

#bspbox(title: "Beweis: Ableitung der Umkehrfunktion" + $f^(-1) (y)$)[
  Ausgangspunkt ist die fundamentale Identität der Umkehrfunktion:
  $f(f^(-1)(y)) = y ==>^("nach "y" ableiten") f'(f^(-1)(y)) dot (f^(-1))'(y) & = 1 \
  (f^(-1))'(y) & = 1/(f'(f^(-1)(y))) \
  ("weil" f^(-1)(y) = x) quad quad quad (f^(-1))'(y) & = 1/(f'(x))$
]

== L'Hospital Bernoulli
Grenzwerte von Funktionen berechnen die auf einen unbestimmten Ausdruck führen: $0/0, oo/oo, 0 dot oo, oo - oo, 0^0, oo^0, 1^oo$.
*Wichtig:* Direkte Anwendung ist strikt *nur* bei $0/0$ und $oo/oo$ erlaubt! Dann gilt:
#v(-10pt)
$
  quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad lim_(x -> x_0) f(x)/g(x) = lim_(x -> x_0) (f'(x)) / (g'(x))
$

*🚨 ACHTUNG: Fallen & Umformungen*
- *Verbotene Ausdrücke:* Bei $c/0$ (z.B. $2/0$) oder $oo/0$ divergiert der Grenzwert (Ergebnis geht gegen $plus.minus oo$). *Kein L'Hospital anwenden!*
- *Umformung zwingend:* Andere unbestimmte Ausdrücke ($0 dot oo, oo - oo, 0^0, oo^0, 1^oo$) müssen *zuerst* algebraisch in $0/0$ oder $oo/oo$ überführt werden (z.B. durch Kehrwert im Nenner $A=1/(1/A)$ oder $f(x)^(g(x)) = e^(g(x) ln(f(x)))$), bevor abgeleitet werden darf.

#bspbox(title: "Grenzwert mit doppelter l'Hospital Anwendung")[
  $lim_(x -> 0) (cos(x) - 1)/x^2 =^(0/0) lim_(x -> 0) (-sin(x))/(2x) =^(0/0) lim_(x -> 0) (-cos(x))/2 = (-cos(0))/2 = -1/2$
]

== Konvexität
#image("img/konvexkonkav.jpeg", width: 100%)
Für Intervall $I subset RR$ und $f: I -> RR$. $f$ ist:
/ Konvex: auf $I$ falls $forall x_0, x_1 in I, x_0 <= x_1, lambda in [0, 1]$ \
  #h(1em) #text(fill: blue, [ $f(lambda x_1 + (1- lambda)x_0)$ ]) $<=$ #text(
    fill: red,
    [ $lambda f(x_1) + (1 - lambda) f(x_0)$ ],
  )
/ Streng Konvex: falls $forall x_0, x_1 in I, x_0 < x_1, lambda in (0, 1),$ \
  #h(1em) #text(fill: blue, [ $f(lambda x_1 + (1- lambda)x_0)$ ]) $<$ #text(
    fill: red,
    [ $lambda f(x_1) + (1 - lambda) f(x_0)$ ],
  )
/ Konkav: auf $I$ falls $forall x_0, x_1 in I, x_0 <= x_1, lambda in [0, 1],$ \
  #h(1em) #text(fill: green, [ $f(lambda x_1 + (1- lambda)x_0)$ ]) $>=$ #text(
    fill: red,
    [ $lambda f(x_1) + (1 - lambda) f(x_0)$ ],
  )
/ Streng Konkav: auf $I$ falls $forall x_0, x_1 in I, x_0 < x_1, lambda in [0, 1],$ \
  #h(1em) #text(fill: green, [ $f(lambda x_1 + (1- lambda)x_0)$ ]) $>$ #text(
    fill: red,
    [ $lambda f(x_1) + (1 - lambda) f(x_0)$ ],
  )

- $f: I -> RR$ ist konvex $<==> forall x_0 < x < x_1 in I, (f(x) - f(x_0))/(x - x_0) <= (f(x_1) - f(x))/(x_1 - x_0)$ \
  #minitext[
    konvex $<==>$ Sekante zwischen $(x_0, f(x_0))$ & $(x, f(x))$ hat kleinere Steigung als zwischen $(x, f(x))$ & $(x_1, f(x_1))$.
  ]
- Summe von zwei konvexen(/konkaven) Funktionen ist konvex(/konkav).
- Für $f: (a, b) -> RR$ in $(a, b)$ differenzierbar. \
  $f$ ist (streng) konvex $<==> f'$ (streng) mon. wachsend \
  $f$ ist (streng) konkav $<==> f'$ (streng) mon. fallend
- Für $f: (a, b) -> RR$ zwei mal differenzierbar. \
  $f''(x) >= 0 <==> f$ ist (streng) konvex

== Höhere Ableitungen, Definition $f$ Glatt
#mainbox(title: "Höhere Ableitungen")[
  #set enum(numbering: "1.")
  + Für $n >= 2$ ist $f$ $n$-mal differenzierbar in $DD$ falls $f^((n-1))$ in $DD$ differenzierbar ist. $n$-te Ableitung ist: $f^((n)) = (f^((n-1)))'$.
  + $f$ ist $n$-mal stetig differenzierbar in $DD$, falls sie $n$-mal differenzierbar ist und $f^((n))$ stetig in $DD$ ist.
  + $f$ ist *glatt* in $DD$, falls $f$ $oo$-mal in $DD$ differenzierbar ist.
    #minitext[
      $f in C^oo$.
    ]
  Eine $n$-mal differenzierbare Funktion ist ($n$-1)-mal stetig differenzierbar.
]

=== Glatte Funktionen $f in C^oo$
$exp(x), sin(x), cos(x), sinh(x), cosh(x), tanh(x), ln(x),$ \ $arcsin(x), arccos(x), "arccot"(x), arctan(x)$ & Polynome sind glatt. \ $tan(x)$ ist auf $RR backslash {pi/2 + k pi}, cot(x)$ auf $RR backslash {k pi}$ glatt.

=== Rechenregeln Höhere Ableitungen
Für $f, g: DD -> RR quad n$-mal differenzierbar:
- *$f + g$:* ist $n$-mal diff. und $(f + g)^((n)) = f^((n)) + g^((n))$.
- *$f dot g$:* ist $n$-mal diff. und $(f dot g)^((n)) = sum_(k=0)^n binom(n, k) f^((k)) g^((n-k))$.
- *$f / g$:* ist $n$-mal diff. falls $g(x) != 0 med forall x in DD$.
- *$g compose f$:* ist $n$-mal diff. und $(g compose f)^((n))(x) = sum_(k=1)^n A_(n,k)(x) (g^((k)) compose f)(x), A_(n,k)$ ist ein Polynom.

== Potenzreihen Ableitungsregeln
- *Allgemeine Funktionenfolgen:* Für eine Folge $(f_n) in C^1$ mit $f_n ->_"glm." f$ und $f'_n ->_"glm." g$ auf $(a, b)$ gilt:
  $f in C^1$ und $f' = g$.
- *Potenzreihen:* Für eine Potenzreihe $f(x) = sum_(k=0)^oo c_k (x - x_0)^k$ mit Konvergenzradius $rho > 0$ gilt:
  - $f$ ist auf $(x_0 - rho, x_0 + rho)$ glatt ($f in C^oo$).
    #minitext[
      Durch Potenzreihe gegebene Funktion ist im Konvergenzbereich gliedweise differenzierbar.
    ]
  - Die 1. Ableitung lautet: \
    $f'(x) = sum_(k=1)^oo k c_k (x - x_0)^(k-1) quad forall x in (x_0 - rho, x_0 + rho)$
  - Für die $j$-te Ableitung gilt:
    $f^((j))(x) = sum_(k=markhl(j))^oo c_k (k!)/((k-j)!) (x - x_0)^(k-j)$
- *Zusammenhang mit Taylor-Reihen:* \
  Da eine Potenzreihe auf ihrem Konvergenzbereich immer eine glatte Funktion $f$ erzeugt, entsprechen ihre Koeffizienten exakt den Taylor-Koeffizienten:
  $c_j = (f^((j))(x_0))/(j!)$

== Sattelpunkt und Wendepunkt
#grid(
  columns: (4fr, 1fr),
  [
    Stelle $x_0$ wo $f'(x_0) = 0$, aber kein Extremum.
    #grid(
      columns: (1fr, 1fr),
      [
        / Wendepunkt:
          - $f'(x_0) markhl(!=) 0$
          - $f''(x_0) = 0$
      ],
      [
        / Sattelpunkt:
          - $f'(x_0) markhl(=) 0$
          - $f''(x_0) = 0$
      ],
    )
  ],
  [
    #v(-15pt)
    #image("img/satelpunktwendepunkt.jpeg", width: 100%)
  ],
)

== Extremalstellen
#minitext[Voraussetzung: $f$ ist auf $[a, b]$ stetig und im Inneren $(a,b)$ $(n+1)$-mal stetig differenzierbar.]
Sei $f$ an der Stelle $x_0 in (a, b)$ sehr flach, d.h. die ersten $n$ Ableitungen verschwinden:
$f'(x_0) = f''(x_0) = ... = f^((n))(x_0) = 0$.
Die erste Ableitung ungleich 0, sei die $(n+1)$-te Ableitung. Dann gilt:
- *Ist $(n+1)$ ungerade* ($n$ ist gerade): *Sattelpunkt* (kein Extremum).
- *Ist $(n+1)$ gerade* ($n$ ist ungerade): *Extremum*.
  - $f^((n+1))(x_0) > 0 ==> x_0$ = striktes lokales *Minimum* $union$
  - $f^((n+1))(x_0) < 0 ==> x_0$ = striktes lokales *Maximum* $inter$
_Hinweis: Der klassische Test mit der 2. Ableitung ist der Spezialfall $n=1$._

=== Korrolar Implikationen der Ableitung
Seien $f, g: [a, b] -> RR$ stetig und in $(a, b)$ differenzierbar und *für alle* $xi in [a, b]$ gilt. (gilt für alle $x, x_1, x_2 in [a, b]$)
- $f'(xi) = 0$, dann ist $f$ konstant.
- $f'(xi) = g'(xi)$, dann gibt es $c in RR$ mit $f(x) = g(x) + c$
- $f'(xi) > 0$, dann ist $f$ auf $[a, b]$ streng mon. wachsend.
- $f'(xi) >= 0$, dann ist $f$ auf $[a, b]$ monoton wachsend.
- $f'(xi) < 0$, dann ist $f$ auf $[a, b]$ streng mon. fallend.
- $f'(xi) <= 0$, dann ist $f$ auf $[a, b]$ monoton fallend.
- $exists M >= f'(xi)$, dann gilt $|f(x_1) - f(x_2)| <= M |x_1 - x_2|$. \
  #minitext[
    Wenn Ableitung obere Schranke M hat, dann ist der Abstand der Funktionswerte immer kleiner als $M dot "Abstand der Argumente"$.
  ]


== Implikationen der Ableitungen
#table(
  columns: (auto, auto, auto, auto, 1fr),
  align: (center, center, center, center, left),
  stroke: 0.5pt,
  inset: 0.4em,
  [*$f(x)$*], [*$f'(x)$*], [*$f''(x)$*], [*$f'''(x)$*], [*Eigenschaft*],
  [$= 0$], [], [], [], [Nullstelle],
  [$= 0$], [$= 0$], [$!= 0$], [], [2-fache Nullstelle],
  [], [$> 0$], [], [], [Strikt Monoton Steigend],
  [], [$< 0$], [], [], [Strikt Monoton Fallend],
  [], [$= 0$], [$< 0$], [], [Lokales Maximum],
  [], [$= 0$], [$> 0$], [], [Lokales Minimum],
  [], [$!= 0$], [$= 0$], [$> 0$], [Wendepunkt r $->$ l],
  [], [$!= 0$], [$= 0$], [$< 0$], [Wendepunkt l $->$ r],
  [], [$= 0$], [$= 0$], [$> 0$], [Sattelpunkt r $->$ l],
  [], [$= 0$], [$= 0$], [$< 0$], [Sattelpunkt l $->$ r],
  [], [], [$> 0$], [], [Streng Konvex],
  [], [], [$< 0$], [], [Streng Konkav],
)

#mainbox(title: "Satz von Rolle")[
  #grid(
    columns: (4fr, 1fr),
    gutter: 0.5em,
    [
      Sei $f: [a, b] -> RR$ stetig und in $(a, b)$ differenzierbar. Wenn $f(a) = f(b)<==> exists thin xi in (a, b)$ mit $f'(xi) = 0$. \
      I.e. wenn differenzierbare Funktion an Punkten $a$ und $b$ denselben Wert annimmt, dann muss es Punkt dazwischen geben wo $f'(xi) = 0$.
    ],
    [
      #v(-10pt)
      #image("img/satzvonrolle.jpeg")
    ],
  )
]

#mainbox(title: "Mittelwertsatz (Lagrange)")[
  #grid(
    columns: (2.2fr, 1fr),
    gutter: 0.5em,
    [
      Sei $f: [a, b] -> RR$ stetig und in $(a, b)$ differenzierbar. Dann gibt es $xi in (a, b)$ mit $f(b) - f(a) &= f'(xi)(b - a) \
      (f(b) - f(a))/(b - a) &= f'(xi)$
    ],
    [
      #v(-10pt)
      #image("img/mittelwertsatz.jpeg")
    ],
  )
  #minitext[ In $(a, b)$ ex. mind. ein Punkt, wo Tangente parallel zur Sekante durch $a$ und $b$ ist. ]
]

== Taylor Approximation
Annäherung glatter Funktionen als Potenzreihen am Entwicklungspunkt $a$.
#mainbox(title: $T_n$ + " Taylor-Polynom vom Grad " + $n$)[
  Sei $f: I -> RR in CC^oo quad (n+1)$-mal differenzierbar.
  Das $n$-te Taylor-Polynom $T_n f(x; a)$ an einer Entwicklungspunkt $a$ ist:
  $
    T_(n f)(x; a) : & = sum_(k=0)^n (f^((k))(a))/(k!) dot (x - a)^k \
                    & = f(a) + f'(a) dot (x - a) + (f''(a))/(2!) dot (x - a)^2 + ...
  $
  #minitext[
    Hinweis: $f^((k))(a)$ = $k$-te Ableitung von $f$ an der Stelle a.
  ] // TODO: weglassen?
]
- Entwicklungspunkt $a$ ist Punkt wo die Annäherung startet.
- $x$ ist der Punkt welchen man annähern möchte.
- Für $c < a < d, forall x in [c, d] quad exists xi$ zwischen $x$ & $a$ oder $a$ & $x$: \
  $
    f(x) &= underbrace(sum_(k=0)^n (f^((k))(a))/(k!)(x - a)^k, T_n (f, x, a)) + underbrace((f^((n+1))(xi))/((n+1)!)(x - a)^(n+1), R_n (f, x, a))
  $

  #minitext[
    Restglied $R_n$ ist der Fehler der Approximation.
  ]

#bspbox(title: "Beispiel Taylor Approximation " + $f(x) = sin(x)$)[
  #grid(
    columns: (5fr, 1fr),
    [
      $T_(1 sin)(x; 0) \= sum_(k=0)^1 (f^((k))(a))/(k!) = (f^((0))(0))/(0!) dot (x - 0)^0 + (f^((1))(0))/(1!) dot (x - 0)^1 = 0 dot 1 + cos(0) dot x^1 = x$ \ \
      $T_(3 sin)(x; 0) = sum_(k=0)^3 (f^((k))(a))/(k!) = (f^((0))(0))/(0!) dot x^0 + (f^((1))(0))/(1!) dot x^1 + (f^((2))(0))/(2!) dot x^2 + (f^((3))(0))/(3!) dot x^3 = (-cos(0))/(3!) dot x^3 + (-sin(0))/(2!) dot x^2 + (cos(0))/1 dot x^1 + 0 = -1/3! dot x^3 + 0 + 1 dot x^1 = -x^3/(3!) + x$
    ],
    [
      #v(-10pt)
      #image("img/tayplorpolynome.jpg", width: 100%)
    ],
  )
]

#mainbox(title: "Taylorreihe von " + $f$ + " an Stelle " + $a$)[
  $f in CC^oo$ kann auch als unendliche Reihe dargestellt werden: \
  $T_(oo, f)(x; a) := sum_(k=0)^oo (f^((k))(a))/(k!) dot (x - a)^k$
]
- Taylorreihe von $f in C^oo$ ist Potenzreihe mit Konvergenzradius $rho$.
- Taylorreihe konvergent $notimplies T_oo (x, a)$ konvergent gegen $f$. \
  #minitext[
    Implikation gilt nicht, da Taylorreihe nur lokales Wissen am Entwicklungspunkt sammelt und deshalb bei manchen Funktionen zwar mathematisch konvergiert, abseits dieses Punktes aber gegen einen völlig falschen Wert konvergieren kann.
  ]

== #highlight[Wichtige Taylorreihen ("Maclaurin-Reihen")]
=== Standardreihen mit Entwicklungspunkt $a=0$)
- $sin(x) = sum_(n=0)^oo (-1)^n 1/((2n+1)markhl(!)) x^(2n+1) = x - x^3/(3!) + x^5/(5!) - x^7/(7!) + ... quad$ #text(
    fill: luma(120),
  )[$(forall x in RR)$]
- $cos(x) = sum_(n=0)^oo (-1)^n 1/((2n)markhl(!)) x^(2n) = 1 - x^2/(2!) + x^4/(4!) - x^6/(6!) + ... quad$ #text(
    fill: luma(120),
  )[$(forall x in RR)$]
- $e^x = sum_(n=0)^oo x^n/(n!) =1+x+x^2/(2!)+x^3/(3!)+x^4/(4!)+... quad$ #text(fill: luma(120))[$(forall x in RR)$]
- $e^(-x) = sum_(n=0)^oo (-1)^n x^n/(n!) = 1 - x + x^2/(2!) - x^3/(3!) + x^4/(4!) - ... quad$ #text(
    fill: luma(120),
  )[$(forall x in RR)$]
- $ln(1+x) = sum_(n=1)^oo (-1)^(n-1) 1/n x^n = x-x^2/2+x^3/3-x^4/4+...$ #text(size: 7pt, fill: rgb(
    255,
    0,
    0,
  ))[$markhl("für "(-1 < x < 1))$]
- $arctan(x) = sum_(n=0)^oo (-1)^n x^(2n+1)/(2n+1) = x-x^3/3+x^5/5-... quad$ #text(size: 7pt, fill: rgb(
    255,
    0,
    0,
  ))[$markhl("für "(-1 < x < 1))$]

=== Geometrische & Binomische Reihen mit Entwicklungspkt $a=0$
- $1/(1-x)=sum_(n=0)^oo x^n=1+x+x^2+x^3+... quad$ #text(size: 7pt, fill: rgb(255, 0, 0))[$markhl("für "(-1 < x < 1))$]
- $1/(1+x)=sum_(n=0)^oo (-1)^n x^n=1-x+x^2-x^3+... quad$ #text(size: 7pt, fill: rgb(
    255,
    0,
    0,
  ))[$markhl("für "(-1 < x < 1))$]
- $(1+x)^p = sum_(n=0)^oo binom(p, n) x^n = 1 + p x + (p(p-1))/(2!) x^2 + ... quad$ #text(size: 7pt, fill: rgb(
    255,
    0,
    0,
  ))[$markhl("für "(-1 < x < 1))$]

#howtobox(title: "Herleitung: Taylorreihe von " + $f(x) = (1+x)^p$)[
  Wir suchen die dazugehörige Taylorreihe um den Entwicklungspunkt $x_0 = 0$ (Maclaurin-Reihe).

  + *Ableitungen bilden & bei $x=0$ auswerten:*
    $
        f(0) & = (1+0)^p = 1^p             &      = 1 \
       f'(0) & = p(1+x)^(p-1) |_(x=0)      &      = p \
      f''(0) & = p(p-1)(1+x)^(p-2) |_(x=0) & = p(p-1)
    $

  + *Allgemeines Muster für die $n$-te Ableitung erkennen:*
    $ f^((n))(0) = p(p-1)(p-2) dots.c (p-n+1) $

  + *In allgemeine Taylor-Formel einsetzen:*
    Setzen wir $f^((n))(0)$ in Standardformel $sum_(n=0)^oo (f^((n))(0))/(n!) x^n$ ein, erhalten wir (mit $binom(p, 0) = 1$) die Taylorreihe:
    $
      T_(oo, f)(x; 0) = sum_(n=0)^oo (p(p-1) dots.c (p-n+1))/(n!) x^n = sum_(n=0)^oo p!/(n! (p-n)!) x^n = sum_(n=0)^oo binom(p, n) x^n quad
    $

  #minitext[
    *Warum ist diese Herleitung wichtig?* Sie zeigt, dass der verallgemeinerte Binomialkoeffizient keine Hexerei ist, sondern einfach nur das "Abfallprodukt" der Kettenregel ist, wenn man Terme wie $(1+x)^p$ unendlich oft ableitet und durch $n!$ teilt!
  ]
]

#howtobox(title: "Rezept: Taylorpolynom durch Standardreihen (Substitution)")[
  *Wann?* Bei Funktionen der Form $x^m dot g(x^k)$ (z.B. $x cos(x^3)$). Viel schneller und weniger fehleranfällig als direktes, mehrfaches Ableiten!

  + #highlight[*Standardreihe notieren:*] Schreibe Maclaurin-Reihe der bekannten "Basis-Funktion" $g(z)$ bis zur gesuchten Ordnung auf.
    #minitext[E.g. $cos(z)$: $quad 1 - z^2/(2!) + z^4/(4!) - ...$]
  + *Substitution:* Ersetze das $z$ in Reihe durch das eigentliche innere Argument (z.B. $z = x^3$).
    #minitext[E.g. $cos(x^3)$: $quad 1 - (x^3)^2/2 + ... = 1 - x^6/2 + ...$]
  + *Multiplizieren:* Multipliziere äussere Faktoren (z.B. $x$) in gesamte Reihe. \
    #minitext[E.g. $x dot cos(x^3)$: $quad x dot (1 - x^6/2) = x - x^7/2 + ...$]
  + *Koeffizient ablesen:* Vergleiche fertige Polynom mit allgemeiner Form $sum alpha_n x^n$. Der Faktor vor dem $x^n$ ist dein $alpha_n$.
    #minitext[E.g. $f(x) = alpha_0x^0 + alpha_1 x^1+ alpha_2 x^2+ ...$. Gesucht $alpha_3$: Da im Polynom $x - x^7/2$ kein $x^3$ vorkommt, ist $alpha_3 = 0$.]
]

#bspbox(title: "Taylor Approximation für " + $f(x) = x^x$)[
  Sei $f(x) = x^x$, der Grad $N = 3$, Entwicklungspunkt $x_0 = 1$. \
  Gesucht: Approx. für $(7/5)^(7/5)$, also werten wir Polynom an $x = 7/5$ aus.

  + *Ableitungen im Punkt $x_0 = 1$ berechnen:*
    $
         f(x) & = x^x                         &    ==> f(1) = 1 \
        f'(x) & = x^x (ln(x) + 1)             &   ==> f'(1) = 1 \
       f''(x) & = x^x (ln(x) + 1)^2 + x^(x-1) &  ==> f''(1) = 2 \
      f'''(x) & = ... "lange Ableitung" ...   & ==> f'''(1) = 3
    $
  + *Taylorpolynom $T_3(x; 1)$ aufstellen:*
    $
      T_3(x; 1) & = f(1) + f'(1)(x - 1) + (f''(1))/2 (x - 1)^2 + (f'''(1))/6 (x - 1)^3 quad \
                & = 1 + 1(x - 1) + 2/2 (x - 1)^2 + 3/6 (x - 1)^3 \
                & = 1 + (x - 1) + (x - 1)^2 + 1/2 (x - 1)^3
    $

  + *Wert $x = 7/5$ einsetzen* (beachte: $x - 1 = 7/5 - 1 = 2/5$): \
    $
      T_3(7/5; 1) = 1 + 2/5 + (2/5)^2 + 1/2 (2/5)^3
      = 1 + 2/5 + 4/25 + 4/125 = 199/125 = 1.592
    $
]

#howtobox(title: "Rezept: Approximiere Punkt")[
  // TODO: Weglassen?
  Approximiere $f$ mit Entwicklungspunkt $a$ an Stelle $x$ mit Taylor von Ordnung $n$:
  + Leite $f$ $n$-mal ab
  + Bilde Taylorpolynom durch Einsetzen von $a$ und $x$
]

#howtobox(title: "Rezept: Finde Fehler von Taylorpolynom")[
  Gegeben Taylorpolynom $T_(n f) (x; a)$ mit $n$-Ordnung.
  #set enum(numbering: "1.")
  + Leite $f^((n))$ ab (= rechne $f^((n+1))$ aus).
  + Bilde Restpolynom $R_N (f, x, a) = (f^((n+1))(xi))/((n + 1)!)(x - a)^(n + 1)$
  + Select $xi in (a, x]$ so das $R_N (f, x, a)$ maximal ist
]

#bspbox(title: "Fehlerabschätzung für " + $f(x) = e^x$)[
  Wir wollen $e^1$ (also $x=1$) mit Taylorpoly 2. Grades ($n=2$) am Entwicklungspunkt $a=0$ annähern. Wie gross ist maximaler Fehler?

  + *$(n markhl(+1))$-te Ableitung bilden:*
    $f(x) = e^x -> f^(markhl(3))(x) = e^x$.
  + *Restpolynom aufstellen:* \
    Wir setzen $n=2, a=0$ & $x=1$ in die Restglied-Formel ein: \
    $ R_2 = (f^((3))(xi))/(3!) (x - a)^3 = (e^xi)/(6) (1 - 0)^3 = (e^xi)/6 $
  + *Maximales $xi$ wählen (Worst-Case):*
    Das $xi$ ist irgendwo im Intervall $(a, x] = (0, 1]$.
    Wir wollen Fehler nach *oben* abschätzen (wann wird Fehlerterm $(e^xi)/6$ in diesem Intervall am grössten)?
    Da $e^x$ monoton wächst, ist Wert am rechten Rand $xi = 1$ am grössten.
    Wir setzen Worst-Case $xi = 1$ ein & schätzen ab ($e < 3$): \
    $ |R_2| <= (e^1)/6 < 3/6 = 1/2 = 0.5 $
  *Fazit:* Wenn wir $e^1$ nur mit einem simplen Polynom 2. Grades annähern, ist garantiert, dass Ergebnis höchstens um $0.5$ vom exakten Wert abweicht.
]

= Riemann Integral

#howtobox(title: "Bestimmtes Integral berechnen")[
  #set enum(numbering: "1.")
  + Bruch vereinfachen (Faktorisieren, Erweitern, etc.)
  + Bekannte Ableitungen einsetzen
  + Produkt von Funktionen? $->$ Partielle Integration
  + Verkettete Funktion? $->$ Substitution
]

== Riemann-Summe
#grid(
  columns: (4fr, 1fr),
  gutter: 0.5em,
  [
    Bestimmen der Fläche unter einer Kurve.
    - *Partition* $P$ ist eine endliche Teilmenge \ $P subset.neq [a, b], {a, b} subset.eq P$. \
      $P = {a = x_0 < x_1 < ... < x_n = b}$
    - *Feinheit:* $delta(P) := max_(1 <= i <= n) delta_i = max_(1 <= i <= n) (x_i - x_(i-1))$ \
      #minitext[
        \= länge des grössten Teilintervalls
      ]
    - *$P'$ ist Verfeinerung* von $P <==> P subset P'$. \
      #minitext[
        \= $P'$ enthält mehr Punkte $=>$ unterteilt in mehr Abschnitte $=>$ genauer
      ]
    - *Zwischenpunkte:* $xi_i in I_i = [x_(i - 1), x_i]$.
  ],
  image("img/riemann.jpeg", width: 100%),
)

#mainbox(title: "Riemann-Summe")[
  Sei $f$ stetig mit $f(x): [a, b] -> RR$. Sei $P$ in $n$ Teile und Stützstellen $xi$. \
  $S(f, P, xi) := sum_(i=1)^n f(xi_i) dot (x_i - x_(i-1))$
  #minitext[
    Summe vieler kleiner Rechtecke.
  ]
]

#subbox(title: "Ober- und Untersumme")[
  *Obersumme:* $overline(S)(f, P) := sum_(i=1)^n (x_i - x_(i-1)) dot sup_(x_(i-1) <= x <= x_i) f(x)$.\
  *Untersumme:* $underline(S)(f, P) := sum_(i=1)^n (x_i - x_(i-1)) dot inf_(x_(i-1) <= x <= x_i) f(x)$.
]
- $underline(S)(f) <= overline(S)(f)$.
- $underline(S)(f, P_1) <= overline(S)(f, P_2) quad forall P_1, P_2 subset I$. \
  #minitext[ Obersumme ist grösser als Untersumme für zwei beliebige Partitionen (=Verfeinerungen).]
- $underline(S)(f, P) <= underline(S)(f, P') <= overline(S)(f, P') <= overline(S)(f, P) quad forall P' subset P subset I$. \
  #text(
    size: 7pt,
    fill: luma(120),
  )[ Wenn $P'$ Verfeinerung von $P$, dann ist Untersumme von $P$ kleiner als Untersumme von $P'$ und Obersumme von $P'$ kleiner als Obersumme von $P$. ]

#subbox(title: "Oberes- & Unteres Integral")[
  *Oberes Integral:* $overline(S)(f) := inf_(P in PP(I)) overline(S)(f, P)$.
  #minitext[Alle Verfeinerungen vergleichen] \
  *Unteres Integral:* $underline(S)(f) := sup_(P in PP(I)) underline(S)(f, P)$.
]

== Riemann Integrierbar Kriterien
#mainbox(title: $f$ + " Riemann-integrierbar")[
  Beschränkte Funktion $f: [a, b] -> RR$ ist integrierbar
  - $<==> underline(S)(f) = overline(S)(f) =: integral_a^b f(x) d x$.
    #minitext[ ($delta_i = d x$) \
      Integrierbar, wenn Unter- und Obersumme gleich sind. ]
  - $<==> forall epsilon > 0, exists P in PP(I), overline(S)(f, P) - underline(S)(f, P) < epsilon$.
    #minitext[(spezielle Partition $P$ finden)]
  - $<==> forall epsilon > 0, exists delta > 0: forall P in PP_delta(I), overline(S)(f, P) - underline(S)(f, P) < epsilon$. #minitext[(Rechtecke kleiner)]
  - mit $A := integral_a^b f(x) d x <==> forall epsilon > 0, exists delta > 0: forall P in PP_delta(I), xi_i in [x_(i-1), x_i], |A - sum_(i=1)^n f(xi_i) delta_i| < epsilon$. #minitext[Wenn Feinheit klein genug, liegt jede beliebige Riemann-Summe nah am echten Integralwert A]
  - $<==> exists lim_(delta(P) -> 0) S(f, P, xi) =: integral_a^b f(x) d x$. #minitext[Integral ist Grenzwert der Riemann-Summen, wenn maximale Streifenbreite gegen 0 geht.]
]
- $f: [a, b] -> RR$ stetig $==> f$ auf $[a, b]$ integrierbar. \
  #minitext[ Jede stetige funktion auf kompaktem Intervall ist integrierbar. ]
- $f: [a, b] -> RR$ monoton $==> f$ auf $[a, b]$ integrierbar.
- $a < b < c, f: [a, c] -> RR$ beschränkt mit $f|_[a,b]$ und $f|_[b,c]$ integrierbar $==> f$ integrierbar und $integral_a^c f(x) d x = integral_a^b f(x) d x + integral_b^c f(x) d x$.
  #minitext[ Monotonie von Integralen ]
- $integral_a^a f(x) d x = 0, quad integral_a^b f(x) d x = -integral_b^a f(x) d x$
- Kompaktes Intervall $I=[a,b] subset RR$, Funktionen $f, g: I -> RR$ beschränkt, integrierbar & $alpha, beta in RR ==> integral_a^b (alpha f(x) + beta g(x)) d x = alpha integral_a^b f(x) d x + beta integral_a^b g(x) d x$ & $alpha f_1 + beta f_2$ integrierbar.
  #minitext[ Gebietsadditivität ]

=== Rechenregeln Integrierbare Funktionen
#subbox(title: "Weitere integrierbare Funktionen")[
  Wenn $f$, $g$ beschränkt und integrierbar sind, dann sind
  $f + g, lambda dot f, f dot g, |f|, max(f, g), min(f, g)$ integrierbar.
  _Achtung:_ $f/g$ ist nur integrierbar, falls $g$ strikt von Null weg bleibt ($|g(x)| >= c > 0$).
]

Für $f, g: [a, b] -> RR$ beschränkt und integrierbar:
- falls $f(x) <= g(x) quad forall x in [a, b] ==> integral_a^b f(x) d x <= integral_a^b g(x) d x$.
- $|integral_a^b f(x) d x| <= integral_a^b |f(x)| d x$.
- $|integral_a^b f(x)g(x) d x| <= sqrt(integral_a^b f^2(x) d x) sqrt(integral_a^b g^2(x) d x)$.
- #markhl(strong("Substitutionsregel:")) Für Intervall $I subset RR$ und $f: I -> RR$ stetig, $a, b, c in RR$:
  - Für Intervall $[a+c, b+c] in I ==> markhl(integral_(a+c)^(b+c) f(x) d x = integral_a^b f(t+c) d t)$.
  - Für $c != 0$, Intervall $[a dot c, b dot c] in I ==> markhl(integral_a^b f(c dot t) d t = 1/c integral_(a c)^(b c) f(x) d x)$.

== Unbestimmtes Integral
#mainbox(title: "Unbestimmtes Integral")[
  $integral f(x) d x = F(x) + C$ \
  #minitext[
    Menge aller Integrationen von $f$($x$) a.k.a. aller Stammfunkt. $C$ = Integrationskonstante.
  ]
]

== Bestimmtes Integral
Flächeninhalt unter der Kurve zwischen den Punkten $a$ und $b$
#mainbox(title: "Bestimmtes Integral")[
  $integral_a^b f(x) d x = limn sum_(i=1)^n f(xi_i) dot (x_i - x_(i-1)) = F(b) - F(a)$ \
  #minitext[
    Grenzwert der Riemann-Summe wenn Anzahl Teilintervalle $n$ gegen unendlich geht.
  ]
]

#bspbox(title: $integral_0^1 (x^2 - 6x + 8)/(x + 1) d x$ + " Bestimmtes Integral berechnen")[
  $integral_0^1 (x^2 - 6x + 8)/(x + 1) d x = integral_0^1 (((x + 1)(x - 7))/(x + 1) + 15/(x + 1)) d x = integral_0^1 (x - 7) d x + 15 dot integral_0^1 1/(x + 1) d x$ \
  Stammfunktion finden $==> [(1/2 (x - 7)^2)]_0^1 + [15 dot (ln|x + 1|)]_0^1$ \
  $= 1/2(1^2 - 14 + 49) - 1/2 dot 49 + 15(ln(2) - ln(0)) = 18 - 24.5 + 15 dot ln(2)$
]

== Mittelwertsatz für Integrale
#mainbox(title: "Mittelwertsatz")[
  #grid(
    columns: (6fr, 1fr),
    [
      $f: [a, b] -> RR$ stetig \
      $==> exists xi in [a, b]$ mit $integral_a^b f(x) d x = f(xi) (b - a)$. \
      Somit für $f, g: [a, b] -> RR$, $g$ beschränkt integrierbar und $g(x) >= 0$ \ $forall x in [a, b] ==> exists xi in [a, b], integral_a^b f(x)g(x) d x = f(xi) integral_a^b g(x) d x$.
    ],
    image("img/riemannmittelwertsatz.jpeg", width: 100%),
  )
]


== Stammfunktion
#subbox(title: "Stammfunktion F")[
  $F: [a, b] -> RR$ ist Stammfunktion von $f$ \
  $<==> markhl(F " (stetig) differenzierbar in" [a, b]) "und" F' = f$ in $[a, b]$.
]
"$f$ integrierbar" impliziert _nicht_, dass eine _Stammfunktion_ existiert. Beispiel:
$f(x) = cases(
  0 & "für" x <= 0,
  1 & "für" x > 0
) quad$ Weil Fkt an Stelle 0 Knick hat #markhl("kann man sie nicht ableiten").

== Hauptsatz Differential-/Integralrechnung
Für stetige Funktion existiert immer eine Stammfunktion.
#mainbox(title: "Hauptsatz Differential-/Integralrechnung")[
  $F(x) = integral_a^x f(t) d t$ ist Stammfunktion von $f$ in $[a, b]$. \
  $<==> F'(x) = f(x) quad forall x in [a, b]$. \
  _Untere Grenze $a$ egal_ weil $F'(x) = (integral_a^x f(t) d t)' = [F(x) - F(a)]' = f(x) - 0$ \
  #minitext[
    Hinweis: $f$ ist stetig und Stammfunktion $F$ ist in $[a, b]$ stetig differenzierbar.
  ]
]

== Fundamentalsatz der Analysis
Bestimmtes Integral von $f$ im Intervall $[a, b]$ berechnen:

$sum_a^b F'(x) Delta x =$
$integral_a^b f(x) d x = F(b) - F(a)$

== Integrale Berechnen
// #howtobox(title: "Vorgehen Teil 1")[
// + Verkettete Funktion? $->$ Substitution
// + Produkt von Funktionen? $->$ Partielle Integration. $sin, cos$ immer $g$' und e immer $f$.
// + Produkt von Funktionen mit $exp(x) = e^x, sin, cos$? $->$ (Mehrmals) Partielle Integration.
// + Uneigentliches Integral? $->$ nicht kompaktes Intervall Trick/unbeschränkte Funktion Trick mit anderen Werkzeugen kombinieren.
// + Umformen: Produktregel, Kettenregel, etc.
// + Bruchform: Vereinfachen bis Nenner von leicht integrierbaren Teilfunktionen. Partialbruchzerlegung. $(u')/(2 sqrt(u))$ oder $(u')/u$ erkennen ($sqrt(u) + C, log|u| + C$).
// + Komplizierter Ausdruck mit Potenzen
// + $integral_a^b (f(x))^c d x$ auflösen in $integral_a^b (f(x))^(c-1) dot f(x) d x$ um partielle Integration anzuwenden.
// + $integral_a^b (f(x))^c dot 1$ Trick anwenden um partielle Integration zu benutzen.
// + Exponentenform
//   + e / log Trick anwenden wenn Variable $x$ in Exponent ist.
//   + z.B. $3^x = e^(log(3) dot x)$
// + Summe im Integral: Summe aus dem Integral herausziehen. Die Reihe muss dazu gleichmässig konvergieren! \
// Bsp. $integral_0^oo sum_(n=0)^oo ((-1)^n t^(2n))/((2n+1)!) d t = sum_(n=0)^oo ((-1)^n)/((2n+1)!) integral_0^x t^(2n) d t = sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)!(2n+1))$
// ]

#howtobox(title: "Rezept: Integral-Checkliste (Schritt-für-Schritt)")[
  + *Umformen & Muster erkennen (Immer zuerst prüfen!)*
    - Kosmetik: Ausmultiplizieren, Brüche trennen, Exponenten umschreiben ($a^x = e^(ln(a) dot x)$).
    - Bruchform-Muster erkennen oder erschaffen: \ $(u'(x))/(u(x)) ==> ln|u(x)| + C, quad quad quad (u'(x))/(2 sqrt(u(x))) ==> sqrt(u(x)) + C$

  + *Verkettete Funktion? Substitution (Kettenregel rückwärts)*
    - Gibt es eine verkettete Funktion *und* steht ihre innere Ableitung (bis auf eine Konstante) als Faktor davor? $->$ $u$ substituieren.
    - *Trigonometrische Substitution:* Um hartnäckige Terme aufzulösen:
      - Muster $sqrt(a^2 - x^2) ==> x = a sin(u)$ (nutzt $sin^2(u) + cos^2(u) = 1$)
      - Muster $1/(a^2 + x^2) ==> x = a tan(u)$. Dann $dx/(dif u)$ rechnen, $x$ & $d x$ im $integral$ ersetzen, Grenzen anpassen ODER Rücksubstitution. Trick: $1 + tan^2(u) = 1/(cos^2(u))$ kürzt sich raus. $u = arctan(x/a)$.

  + *Produkt? Partielle Integration (Produktregel rückwärts)*
    - Bei Produkten von verschiedenen Funktionsklassen.
    - *Wahl von $f$ (wird abgeleitet):* Nutze die *ILATE*-Regel. Was weiter links steht, wird abgeleitet $(f)$:
      *I*\nverse Trig. (arctan) $->$ *L*\og. (ln) $->$ *A*\lgebraisch ($x^2$) $->$ *T*\rig. (sin) $->$ *E*\xponential ($e^x$).
    - *Der "1"-Trick:* $integral f(x) d x = integral 1 dot f(x) d x$. Super um $ln(x)$ oder $arctan(x)$ partiell zu integrieren.
    - *Potenz-Abspaltung:* $integral (f(x))^c d x = integral (f(x))^(c-1) dot f(x) d x$ (hilft z.B. bei $sin^3(x)$).

  + *Partialbruchzerlegung*: Wenn ein Bruch aus zwei Polys $P(x)/Q(x)$ besteht und Substitution (Schritt 2) nicht klappt. Falls Grad Zähler $>=$ Grad Nenner: Zuerst Polynomdivision (Terme sortieren, bei kleinerem Restgrad abbrechen)!

  + *Uneigentliche Integrale & Reihen (Meta-Tricks)*
    - *Uneigentlich:* Grenzen durch Limes ersetzen ($lim_(R -> oo) integral_a^R$) und Unbeschränktheiten isolieren.
    - *Reihen:* Integral und Summe vertauschen (z.B. Taylorreihen integrieren). \
      #minitext[Bedingung: Die Reihe muss auf dem Intervall gleichmässig konvergieren!]
      E.g. $integral_0^oo sum_(n=0)^oo ((-1)^n t^(2n))/((2n+1)!) d t = sum_(n=0)^oo ((-1)^n)/((2n+1)!) integral_0^x t^(2n) d t = sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)!(2n+1))$
]

#mainbox(title: "Partielle Integration")[
  Seien $f, g$ stetig differenzierbar.

  $ integral f'(x) g(x) d x = f(x) g(x) - integral f(x) g'(x) d x $

  Für ein Intervall $[a, b]$ gilt entsprechend:
  $ integral_a^b f'(x)g(x) d x = [f(x)g(x)]_a^b - integral_a^b f(x)g'(x) d x $
]


- Grundsätzlich leiten wir Polynome ab ($g(x)$) und sich wiederholende Funktionen ($sin, cos, e^x$ etc.) integrieren wir ($f'(x)$).
- Manchmal müssen wir künstlich mit 1 multiplizieren, um partielle Integration anwenden zu können (Bsp. $integral log(x) d x$)
- #highlight[Wenn wir durch mehrfache partielle Integration wieder beim ursprünglichen Integral landen, können wir die erhaltene Gleichung nach diesem Integral auflösen].

#bspbox(title: $I = integral_0^1 x e^x d x$ + " (bestimmt, partielle Integration)")[
  $I = integral_0^1 x e^x d x = [ f g ]_0^1 - integral_0^1 f' g dx$ \
  Wahl 1: $f(x) = x, g'(x) = e^x ==> [x e^x]_0^1 - integral_0^1 1 e^x dx quad quad$(einfach) \
  $= [x e^x]_0^1 - integral_0^1 e^x dx = [x e^x]_0^1 - [e^x]_0^1 = e - (e - 1) = 1$

  #minitext[
    Wahl 2: $f(x) = e^x, g'(x) = x ==> [x^2/2 e^x]_0^1 - integral_0^1 x^2/2 e^x dx$ (useless)
  ]
]

#bspbox(title: $I = integral log(x) dx$ + " (unbestimmt, partielle Integration)")[
  $I = integral ln(x) dx = integral ln(x) dot 1 dx$. Wahl: $f(x) = ln(x), g'(x) = 1$. \
  $==> integral ln(x) 1 dx = ln(x) x - integral 1/x x dx = x ln(x) - x markhl(+ C)$
]

#bspbox(title: $I = integral_(-oo)^0 x e^(3x) dx$ + " (uneigentlich, partielle Integration)")[
  $I &= integral_(-oo)^0 x e^(3x) dx => lim_(b -> oo) integral_(-b)^0 x e^(3x) dx quad "Wahl:" f(x) = e^(3x), g'(x) = x \
  &= [(1/2 x^2 e^(3x))]_(-oo)^0 - integral_(-oo)^0 (e^(3x) 1/2 x^2) = [(1/2 x^2 e^(3x))]_(-oo)^0 - [e^(3x) 1/6 x^3]_(-oo)^0 \
  &= lim_(b -> oo) [1/2 x^2 e^(3x)]_(-b)^0 - [e^(3x) 1/6 x^3]_(-b)^0 quad quad "(Uneigentlich Trick)" \
  &= lim_(b -> oo) 1/2 b^2 dot 1/(e^(3b)) - 1/(e^(3b)) dot 1/6 (-b)^3 = lim_(b -> oo) markhl(1/(e^(3b))) (b^2/2 dot 1 - (-b)^3/6 dot 1) = markhl(0)$
]

#mainbox(title: "Substitutionsregel")[
  Integral mit verketteten Funktionen vereinfachen. \
  Für $a < b, phi: [a, b] -> RR$ stetig differenzierbar, Intervall $I subset RR$ mit $phi([a, b]) subset I$ und $f: I -> RR$ stetig.
  Sei $F$ eine Stammfunktion von $f$ (d.h. $F' = f$):
  $
    #text(fill: luma(50%))[ $integral_a^b d/(d t) [F(phi(t))] d t &= integral_a^b F'(phi(t)) phi'(t) d t$]\
    &= integral_a^b f(phi(t)) phi'(t) d t = integral_(phi(a))^(phi(b)) f(x) d x
  $
]

#minitext[Wähle für $markhl(phi(t), color: mygreen)$ immer die komplette #markhl("innere Funktion", color: mygreen) (e.g. $e^(markhl((dots), color: mygreen)), ln(markhl(dots, color: mygreen)), sqrt(markhl(dots, color: mygreen)), 1/(markhl((dots), color: mygreen))$), solange deren Ableitung bis auf einen Zahlenfaktor bereits im Integral steht. Das Ableiten kürzt weg.]

- *2 Richtungen der Anwendung:*
  - *Vorwärts (Links nach Rechts):* Integral der Form $integral_a^b f(phi(t)) dot phi'(t) d t$. \
    Man sieht die innere Funktion und ihre Ableitung. \ Substitution: $x = phi(t), d x = phi'(t) d t$.
  - *Rückwärts (Rechts nach Links):* Integral der Form $integral_alpha^beta f(x) d x$. \
    Ersetzen der Variable durch eine neue Funktion, z.B. $x = phi(t)$ (oft bei trig. Substitution). Hier müssen zwingend neue Grenzen $t_0, t_1$ gefunden werden, sodass $phi(t_0) = alpha$ und $phi(t_1) = beta$.

- *Achtung bei den Grenzen!* Bei bestimmten Integralen müssen die Grenzen *immer* an die neue Variable angepasst werden. (Aus den alten $t$-Grenzen $a, b$ werden die neuen $x$-Grenzen $phi(a), phi(b)$).

- *Unbestimmtes Integral (ohne Grenzen):* Hier gibt es keine Grenzen zum Anpassen. Dafür muss am Ende zwingend *rücksubstituiert* werden!
  $integral f(phi(t)) phi'(t) d t = (integral f(x) d x) |_(x=phi(t)) = F(x)+C |_(x=phi(t)) = F(phi(t))+C$

// TODO: Hier irgendwo SADI Methode einfügen (Gilt nur für unbestimmte Integrale)

#bspbox(title: $integral_0^1(1+t^2)^2022 dot t dot d t$ + " mit Substitution (Links nach Rechts)")[
  #set enum(numbering: "1.")
  + Innere Funktion substituieren und $dx$ berechnen: \
    $phi(t) = 1+t^2 = x, quad phi'(t) = 2t = (d x)/(d t) ==> markhl(d x = 2t d t), quad f(x) = x^2022$
  + Erkenne Muster der linken Seite. $phi'(t) = 2t$ ist in $t$ versteckt: \
    $integral_0^1(1+t^2)^2022 dot t dot d t = integral_0^1(1+t^2)^2022 dot 1/2 markhl(underbrace(2t dot d t, dx))$
  + Substitutionsregel mit Grenzen für $x = phi(t)$ angepasst ($phi(0) = 1$ & $phi(1) = 2$):
    $==> 1/2 dot integral_(phi(0))^(phi(1)) x^2022 d x = 1/2 integral_1^2 x^2022 d x$
  + Wert des Integrals berechnen:
    $= 1/2 [x^2023/2023]_1^2 = [x^2023/(2 dot 2023)]_1^2 = 2^2022/2023 - 1/(2 dot 2023)$
]

#bspbox(title: $integral e^(1/t)/t^2 d t$ + " mit Substitution (Links nach Rechts)")[
  #set enum(numbering: "1.")
  + Innere Funktion substituieren und $dx$ berechnen: \
    $phi(t) = 1/t = x, quad phi'(t) = -1/t^2 = (d x)/(d t) ==> markhl(d x = -1/t^2 d t)$
  + Erkenne Muster der linken Seite. $phi'(t)$ ist in $1/t^2$ versteckt: \
    $integral e^(1/t) dot 1/t^2 d t = integral e^(1/t) dot (-1) dot markhl((-1/t^2) d t)$
  + Substitutionsregel & Rücksubstitution: \
    $= -1 dot integral e^x d x = -e^x + C = -e^(1/t) + C$
]



#bspbox(title: $integral_0^1 sqrt(1-x^2) d x$ + " mit trig. Substitution (Rechts nach Links)")[
  #set enum(numbering: "1.")
  + *Substitution & Ableitung ($d x$):*
    Wir wählen $x = sin(t)$ um die Wurzel später zu knacken.
    Ableiten liefert: $(d x)/(d t) = cos(t) ==> d x = cos(t) d t$.

  + *Neue Integralgrenzen berechnen:*
    Aus den alten $x$-Grenzen werden durch die Formel $x = sin(t)$ neue $t$-Grenzen: \
    $"Obere Grenze:" x &= 1 quad ==> quad sin(t) =^! 1 quad ==> quad t = pi/2 \
    "Untere Grenze:" x &= 0 quad ==> quad sin(t) =^! 0 quad ==> quad t = 0$

  + *Alles einsetzen:*
    $integral_(x=0)^(x=1) sqrt(1-x^2) d x = integral_(t=0)^(t=pi/2) sqrt(1-sin^2(t)) dot cos(t) d t$

  + *Wurzel auflösen (Trigo-Trick):*
    Mit der Eigenschaft $1-sin^2(t) = cos^2(t)$ vereinfacht sich die Wurzel $sqrt(1-sin^2(t))$ zu $sqrt(cos^2(t))$.
    #minitext[Da unsere neuen Grenzen $t in [0, pi/2]$ sind, ist der Cosinus dort garantiert positiv ($cos(t) >= 0$). Wir dürfen die Wurzel also einfach (ohne Betragsstriche) als $cos(t)$ auflösen!]

  + *Finales Integral:*
    $==> integral_0^(pi/2) cos(t) dot cos(t) d t = integral_0^(pi/2) cos^2(t) d t = ...$
]

== Integration konvergenter Folgen und Reihen
#mainbox(title: "Konvergente Folgen")[
  Sei $f_n : [a,b] -> RR$ eine Folge von beschränkten, integrierbaren Funktionen die *gleichmässig* gegen eine Funktion $f: [a,b] -> RR$ konvergieren. So ist $f$ beschränkt und integrierbar:
  $lim_(n -> oo) integral_a^b f_n (x) d x = integral_a^b f(x) d x$
]

#subbox(title: "Reihen: " + $integral$ + " und lim vertauschbar")[
  Sei $f_n : [a,b] -> RR$ eine Folge beschränkter und integrierbarer Funktionen, sodass die Reihe $sum_(n=0)^oo f_n$ auf $[a,b]$ gleichmässig konvergiert. Dann gilt:
  $sum_(n=0)^oo integral_a^b f_n (x) d x = integral_a^b ( sum_(n=0)^oo f_n(x) ) d x$
]

#subbox(title: "Integral durch Potenzreihen berechnen")[
  Sei $f(x) = sum_(n=0)^oo c_k x^k$ eine Potenzreihe mit positivem Konvergenzradius $p > 0$. Dann ist für jedes $0 <= r < p$, $f$ auf $[-r,r]$ integrierbar und es gilt \
  $forall x in (-p,p): integral_0^x f(t) d t = sum_(k=0)^oo c_k dot (x^(k+1))/(k+1)$ \
  #minitext[
    _Beispiel:_ Sei $f(x) = x^m$ auf dem Intervall $[0, 1]$. Dann gilt gliedweises Integrieren: \
    $integral_0^1 x^m d x = [x^(m+1)/(m+1)]_0^1 = 1/(m+1)$
  ]
]
- Potenzreihen können auf ihrem Konvergenzbereich gliedweise differenziert und integriert werden.

== Uneigentliche Integrale
- Integral berechnen für unbeschränkte Funktionen,
- oder nicht kompakte Intervalle (unendliche Grenzen).

#mainbox(title: "Uneigentliches Integral")[
  Sei $f: [a, oo) -> RR$ beschränkt & integrierbar auf $[a,b] quad forall a < b$.
  Falls $exists lim_(b -> oo) integral_a^b f(x) d x$, bezeichnen wir den Grenzwert mit
  $integral_a^oo f(x) d x$ und $f$ ist auf $[a, oo)$ integrierbar.
]

#bspbox(title: $integral_0^1 1/sqrt(x) d x$ + ": unbeschränkte Funktion")[
  Problematisches Integral, weil $1/sqrt(x)$ für $x=0$ undefiniert ist. \
  Wir ersetzen $0$ durch $epsilon$ und bilden den Limes: \
  $integral_0^1 1/sqrt(x) d x = lim_(epsilon -> 0) integral_epsilon^1 x^(-1/2) d x = lim_(epsilon -> 0) [2 sqrt(x)]_epsilon^1 = lim_(epsilon -> 0) (2 dot 1 - 2 sqrt(epsilon)) = 2$
]

#bspbox(title: $integral_1^oo x^(-2) d x$ + ": nicht kompaktes Intervall")[
  Problematisches Integral, weil das Intervall bis $oo$ geht.
  Wir ersetzen $oo$ durch $b$ und bilden den Limes:
  $integral_1^oo x^(-2) d x = lim_(b -> oo) integral_1^b x^(-2) d x = lim_(b -> oo) [-1/x]_1^b = lim_(b -> oo) (-1/b - (-1/1)) = lim_(b -> oo) (1 - 1/b) = 1$
]

=== Konverg./Diverg. von uneigentlichen Integralen
*Konvergent:* falls Integral existiert (d.h. Grenzwert $in RR$) \
*Divergent:* andernfalls

#mainbox(title: "Vergleichssatz (Majoranten-/Minorantenkriterium)")[
  $f,g: (a,b) -> RR$ stetig mit $0 <= f(x) <= g(x) quad forall x in (a,b)$
  - *Majorante:* $integral_a^b g(x) d x$ konvergent $==> integral_a^b f(x) d x$ konvergent
  - *Minorante:* $integral_a^b f(x) d x$ divergent $==> integral_a^b g(x) d x$ divergent
]

#mainbox(title: "Leibnitz-Kriterium")[
  #set enum(numbering: "1.")
  + *Schwingung bis Unendlich (Standard):* \
    Sei $f(x)$ auf $[a, oo)$ stetig, monoton fallend und $lim_(x -> oo) f(x) = 0$. \
    $==>$ Dann konvergieren $integral_a^oo f(x)sin(x) d x$ und $integral_a^oo f(x)cos(x) d x$.

  + *Gestauchte Schwingung an der Grenze $a$:* \
    Sei $f(x)$ auf $(a,b]$ stetig. Integrale der Form $integral_a^b f(x)sin(1/(x-a)) d x$ schwingen nahe $a$ unendlich dicht. \
    *Regel:* Ist die Dämpfung $f(x)(x-a)^2$ monoton wachsend (wachsend, da wir uns von rechts nach links an $a$ annähern) und gilt $lim_(x -> a^+) f(x)(x-a)^2 = 0$ $==>$ Dann konvergieren $integral_a^b f(x)sin(1/(x-a)) d x$ und $integral_a^b f(x)cos(1/(x-a)) d x$. \

    #minitext[
      *Herleitung aus 1):* Wir substituieren $t = 1/(x-a)$ um das Problem in den Standardfall (1) zu verwandeln. Umformen: $x = a + 1/t$. Ableiten: $(d x)/(d t) = -1/t^2 quad ==> quad d x = -1/t^2 d t$. Grenzen: $x -> a ==> t -> oo quad "und" quad x = b ==> t = 1/(b-a)$

      Wir setzen alles ein und nutzen das Minuszeichen des $d x$, um die Grenzen umzudrehen:
      $integral_a^b f(x) sin(1/(x-a)) d x &= integral_oo^(1/(b-a)) f(a + 1/t) sin(t) (-1/t^2) d t \
      &= integral_(1/(b-a))^oo [f(a + 1/t) dot 1/t^2] sin(t) d t$
      Damit dieses Integral nach Regel (1) konvergiert, muss der Term in den eckigen Klammern für $t -> oo$ gegen 0 gehen. Ersetzt man $t = 1/(x-a)$ zurück, entspricht exakt dieser Term $f(x)(x-a)^2$.
    ]
]

#mainbox(title: "Definition für halboffene Intervalle")[
  $f: (a,b] -> RR$. Ist $f$ für jedes $0 < epsilon$ im Intervall $[a + epsilon, b]$ beschränkt & integrierbar, dann ist $f$ integrierbar, falls $exists lim_(epsilon -> 0^+) integral_(a + epsilon)^b f(x) d x$. Dieser Grenzwert ist dann das Integral $integral_a^b f(x) d x$.
  #minitext[
    ex: $f(x) = 1/x$ auf $(0, 1]$. Nicht definiert in $x = 0$.
  ]
]

- $integral_1^oo 1/x^s d x = lim_(b -> oo) integral_1^b 1/x^s d x$
  - konvergiert (mit Grenzwert $1/(s-1)$) $<==> s > 1$.
  - divergiert $<==> s <= 1$.
- $integral_a^b |f(x)| d x$ konvergent $==> integral_a^b f(x) d x$ konvergiert (absolut konvergent).
- Für $f: [a, oo) -> [0, oo)$ stetig und monoton fallend gilt der Integraltest: \
  Reihe $sum_(n=a)^oo f(n)$ konvergiert $<==> integral_a^oo f(x) d x$ konvergiert. In diesem Fall liegt der Fehler zwischen $0 <= sum_(k=a)^oo f(k) - integral_a^oo f(x) d x <= f(a)$. \
  #minitext[
    _Geometrisch:_ Die Differenz zwischen der Reihe (Rechtecke) und dem Integral (Fläche) sind nur die kleinen "Überhänge", die zusammengeschoben alle in das erste Rechteck $f(a)$ passen.
  ]
  #minitext[
    *Beispiel:* Sei $0 < s in RR$. Wann konvergiert die Reihe $sum_(k=2)^oo 1/(k(log k)^s)$?
    Sei $f(x) = 1/(x(log x)^s)$. $f$ ist positiv, stetig und mon. fallend auf $[2, oo)$. \
    Wir nutzen Substitution: $u = log x ==> (d u)/(d x) = 1/x ==> d x = x d u$. \
    $==> lim_(b -> oo) integral_2^b 1/(x(log x)^s) d x = lim_(b -> oo) integral_(log 2)^(log b) 1/(x dot u^s) x d u = lim_(b -> oo) integral_(log 2)^(log b) 1/u^s d u$
    Das ist das Standard-Integral $integral 1/u^s$. Das Integral (und damit die Reihe) konvergiert also exakt für $s>1$.
  ]
- Für beidseitig offene Intervalle müssen wir die Grenzwerte unabhängig nehmen: $integral_(-oo)^oo f(x) d x = lim_(a -> -oo) integral_a^0 f(x) d x + lim_(b -> +oo) integral_0^b f(x) d x$.
- Gaus'sches Integral: $integral_(-oo)^oo e^(-x^2) d x = sqrt(pi)$.

#bspbox(title: $integral_(-oo)^oo sin(x) dot e^(-x^2) d x$ + ": Der Symmetrie-Trick")[
  #set enum(numbering: "1.")
  + *Problem:* $sin(x) dot e^(-x^2)$ besitzt keine elementare Stammfunktion. Von Hand integrieren ist unmöglich!
  + *Symmetrie prüfen:* Wir checken $f(-x)$: \
    $f(-x) = sin(-x) dot e^(-(-x)^2) = -sin(x) dot e^(-x^2) = -f(x)$ \
    $==> f(x)$ ist eine *ungerade* Funktion (punktsymmetrisch zum Ursprung).
  + *Fazit:* Bei einem symmetrischen Intervall von $-oo$ bis $oo$ heben sich die exakt gleich grossen neg. und pos. Flächenhälften gegenseitig auf (da $e^(-x^2)$ das Integral zum Konvergieren zwingt).
    $==> integral_(-oo)^oo sin(x) dot e^(-x^2) d x = 0$
]

== Partialbruchzerlegung
#mainbox(title: "Generic Partialbruchzerlegung " + $f(x) = 1/(4k^2 - 1)$)[
  #set enum(numbering: "1.")
  + Nenner faktorisieren $f(x) = 1/((2k-1)(2k+1))$.
  + Konstrukt der Dekomposition erstellen: $1/((2k-1)(2k+1)) = A/(2k-1) + B/(2k+1)$
  + A und B berechnen: $1 = A(2k+1)+B(2k-1)$ \
    Koeffizienzvergleich: $1=2k A + A + 2k B - B = 2k(A+B) + (A-B)$ \
    $A+B = 0$ (kein $k$ auf der LHS) \
    $A-B = 1$ (wenn $A+B = 0$, dann muss $A-B =^! 1$) \
    Addiert man beide Gleichungen, erhält man: \
    $2A = 1 ==> A = 1/2, quad quad 1/2 + B = 0 ==> B = -1/2$
  + A und B einfügen um Partialbruchzerlegung zu erhalten: \
    $f(x) = (1\/2)/(2k-1) - (1\/2)/(2k+1) = 1/(2(2k-1)) - 1/(2(2k+1))$
]

#mainbox(title: "Partialbruchzerlegung (PBZ) bei rationalen Funktionen")[
  Für Integrale der Form $integral p(x)/q(x) d x$.

  #set enum(numbering: "1.")
  + *Grad prüfen:* Ist $deg(p) >= deg(q)$? Wenn ja, zuerst *Polynomdivision* (beide Terme nach absteigendem Grad sortieren, sofort abbrechen wenn Grad vom Rest $<$ Grad vom Nenner).
  + *Nenner faktorisieren:* Finde alle reellen Nullstellen von $q(x)$. Nicht weiter zerlegbare quadratische Terme (wie $x^2+1$) bleiben als Block stehen.
  + *Ansatz aufstellen:* Pro Faktor im Nenner einen Bruch erstellen:
    - Einfache reelle NS: $x_1 -> A/(x - x_1)$
    - Mehrfache reelle NS: $(x-x_1)^n -> A_1/(x - x_1) + ... + A_n/((x-x_1)^n)$
    - Einfache komplexe NS: $x^2+p x+q -> (A x + B)/(x^2 + p x + q)$
  + *Parameter bestimmen:* Die gesamte Gleichung mit dem Hauptnenner durchmultiplizieren.
    - _Einsetzmethode:_ Nullstellen für $x$ einsetzen (sehr schnell, reicht aber bei komplexen NS oft nicht aus).
    - _Koeffizientenvergleich:_ Ausmultiplizieren, nach $x$-Potenzen sortieren und lineares Gleichungssystem lösen (funktioniert immer).
]

#mainbox(title: "Beispiel PBZ: " + $integral (x^2-1)/(x^3+x) d x$)[
  + *Faktorisieren:* $x^3 + x = x(x^2 + 1)$.
    Wir haben einen linearen Faktor ($x$) und einen irreduziblen quadratischen Faktor ($x^2+1$).
  + *Ansatz aufstellen:* $x^2+1$ erfordert einen linearen Zähler! \
    $(x^2 - 1)/(x(x^2 + 1)) = A/x + (B x + C)/(x^2 + 1)$
  + *Gleichung aufstellen:* Mit Hauptnenner $x(x^2+1)$ multiplizieren. \
    $x^2 - 1 = A(x^2 + 1) + (B x + C)x <==> x^2 - 1 = (A+B)x^2 + C x + A$
  + *Koeffizientenvergleich:* Linke Seite ($1x^2 + 0x - 1$) mit rechter Seite abgleichen. \
    - $x^2$: $1 = A + B$
    - $x^1$: $0 = C$
    - $x^0$: $-1 = A quad => quad 1 = -1 + B quad => quad B = 2$
  + *Integrieren:* Setze $A=-1, B=2, C=0$ in den Ansatz ein. \
    $integral (-1)/x + (2x)/(x^2 + 1) d x = -ln|x| + ln(x^2 + 1) + C$
]

= Differentialgleichungen (DGL)

== Grundlagen & Klassifizierung
#mainbox(title: "Definition und Typen")[
  Ist eine Gleichung, in welcher die gesuchte Funktion sowie deren Ableitungen auftreten.
  - *Ordnung:* Die höchste in der Gleichung vorkommende Ableitung.
  - *Linearität:* Eine DGL heisst linear, wenn sie sich in der Form $a_n(x)y^((n))(x) + ... + a_1(x)y'(x) + a_0(x)y(x) = s(x)$ schreiben lässt.
  - *Homogenität:* Störfunktion $s(x) = 0$ $->$ DGL homogen, sonst inhomogen.
  - *Konstante Koeffizienten:* Spezialfall, bei dem alle Vorfaktoren $a_i (x)$ konstante Zahlen sind.
]

#subbox(title: "Aufstellen von Differentialgleichungen")[
  Typische Situation: Es sind verschiedene Informationen gegeben und gesucht ist die Entwicklung einer bestimmten Grösse in einem kleinen Zeitintervall $Delta t$.
  - *Population:* $y'(t) = B(t) - T(t)$ (Geburtenrate minus Sterberate).
  - *Beschränktes Wachstum:* $u'(t) = k dot u(t) (1 - u(t)/L)$ (wobei L die Schranke ist). $bullet$ *Mechanische Probleme:* Nutzen oft die Formel für Kräfte \ $F = m dot y'' = m a$ nach Newton.
]

== DGL 1. Ordnung lösen

#mainbox(title: "Trennung der Variablen (führt direkt zur allgemeinen Lösung)")[
  Eignet sich besonders für DGLs der Form $y'(x) = f(x) dot g(y)$.
  *Grundidee:* Alle Ausdrücke mit der unabhängigen Variablen ($x$) auf eine Seite und alle Ausdrücke mit der abhängigen Variablen ($y$) auf die andere Seite bringen.
  $ (d y)/(d x) = f(x) dot g(y) ==> 1/g(y) d y = f(x) d x ==> integral 1/g(y) d y = integral f(x) d x $
  Anschliessend werden beide Seiten unbestimmt integriert $-->$ allg. Lösung
]

#mainbox(title: "Lineare Substitution")[
  Falls eine DGL die Form $y' = f(a x + b y + c)$ hat.
  Die lineare Substitution $u = a x + b y + c$ überführt die Gleichung in eine Differentialgleichung mit trennbaren Variablen.
]

#mainbox(title: "Variation der Konstanten")[
  Für lineare, inhomogene DGL 1. Ordnung, die sich auf die Standardform $y' + p(x)y = s(x)$ bringen lassen.
  + *Zuerst homogene Gleichung:* #minitext[
      *Prüfungs-Hack für homogene Lösung:* Man muss die Variablen nicht mühsam trennen! Die homogene Lösung lässt sich immer direkt ablesen durch die Formel: $markhl(y_h (x) = C dot e^(-integral p(x) d x))$
    ]
  + *Variation der Konstante:* In der Lösung der homogenen DGL ($y_h$) wird die auftretende Konstante $C$ durch eine Funktion $K(x)$ ersetzt. _Beispiel:_ Ist die homogene Lösung $y_h(x) = C e^x$, lautet der Ansatz $y_p (x) = K(x)e^x$.
  + *Einfügen in Aufgabengleichung:* Setzt man den Ansatz in die DGL ein (e.g. $y_p (x) = K(x)e^x ==> y_p^' (x) = K'(x)e^x + K(x)e^x$), erhält man eine Gleichung für $K'(x)$ #minitext[($K(x)$ muss sich wegkürzen!)]. Dann $K(x) = integral K'(x) d x$
    - Integriert man zu $K(x)$ *ohne* Integrationskonstante $+C$, erhält man nur $y_p$. Die Lösung ist dann $y = y_h + y_p$.
    - Integriert man zu $K(x)$ *mit* Integrationskonstante $+C$, liefert das Einsetzen in den Ansatz *direkt* die allgemeine Lösung $y(x)$!
]

== Lineare DGL beliebiger Ordnung
#subbox(title: "Superpositionsprinzip & Fundamentallösungen")[
  Sind $y_1(x)$ und $y_2(x)$ Lösungen einer linearen, homogenen DGL, so ist auch jede Linearkombination $C_1 y_1(x) + C_2 y_2(x)$ eine Lösung (Superpositionsprinzip).
  Eine homogene DGL der Ordnung $n$ besitzt $n$ sogenannte Fundamentallösungen ($y_1, ..., y_n$), aus denen sich die allgemeine Lösung zusammensetzt.
]

=== Homogene Lösung ($y_h$)
#mainbox(title: "Eulerscher Ansatz")[
  Für lineare, homogene DGL mit konstanten Koeffizienten verwenden wir den Eulerschen Ansatz $y(x) = e^(lambda x)$.
  Dies führt uns auf das *charakteristische Polynom*:
  $p(lambda) = a_n lambda^n + a_(n-1) lambda^(n-1) + ... + a_1 lambda + a_0 = 0$.
  Abhängig von den berechneten Nullstellen ($lambda$) ergeben sich folgende Fundamentallösungen:
  - *Einfache reelle Nullstelle* $lambda$: Liefert Lösung $C_1 e^(lambda x)$.
  - *Mehrfache reelle Nullstelle* ($k$-fache Vielfachheit): Liefert $k$ Lösungen: \ $C_1e^(lambda x) + C_2 x e^(lambda x) + ... + C_k x^(k-1) e^(lambda x)$.
  - *Einfache komplex konjugierte Nullstellen* $lambda_(1,2) = markhl(a) plus.minus i dot markhl(b, color: mygreen)$: Um reelle Lösung zu bekommen, Euler Formel nutzen: $e^(markhl(a) x)(C_1 cos(markhl(b, color: mygreen) x) + C_2 sin(markhl(b, color: mygreen) x))$.
  - *Mehrfache komplex konjugierte Nullstellen* ($k$-fach): Funktioniert analog zu reellen mehrfachen Nullstellen durch Multiplikation mit $x$: \ $e^(markhl(a) x)(C_1 cos(markhl(b, color: mygreen) x) + C_2 sin(markhl(b, color: mygreen) x)) + x e^(markhl(a) x)(C_3 cos(markhl(b, color: mygreen) x) + C_4 sin(markhl(b, color: mygreen) x)) + ...$
]

=== Partikuläre Lösung ($y_p$)
Für die Lösung einer #markhl("inhomogenen DGL") muss ein geeigneter Ansatz für die partikuläre Lösung gewählt werden. Der Ansatz richtet sich nach der Störfunktion $s(x)$ (der rechten Seite der DGL):


#howtobox(title: "Resonanzfall")[
  Liegt vor, wenn $s(x)$ (die rechte Seite) oder ein Teil davon in Form und Exponent bereits in der homogenen Lösung auftaucht.
  + *Bestimme die Nullstellen $lambda$ der homogenen Lösung*
  + *Finde das "versteckte $lambda$" der Störfunktion* \ Jede Störfunktion bringt ihren charakteristischen $lambda$-Wert mit:
    - *Polynom / Konstante* (z.B. $4, x, x^2$) $==> lambda=0$
    - *e-Funktion* (z.B. $e^(markhl(3) x)$) $==> lambda=markhl(3)$
    - *Trigonometrisch* (z.B. $sin(markhl(2, color: myblue) x), cos(markhl(2, color: myblue) x)$) $==> lambda= plus.minus markhl(2, color: myblue) i$
    - *Kombination* (z.B. $e^(markhl(3) x) sin(markhl(2, color: myblue) x)$) $==> lambda=markhl(3) plus.minus markhl(2, color: myblue) i$
  + *Sind gefundene Nullstellen ein "verstecktes $lambda$"?:*
    - *Nein:* Standardfall. Nimm Standardansatz aus Tabelle.
    - *Ja: RESONANZFALL!* Standardansatz mit $x^m$ multiplizieren ($m$ sei Vielfachheit der Nullstelle im char. Polynom).
]


#table(
  columns: (1fr, 1.2fr),
  align: (right + horizon, left + horizon),
  stroke: 0.5pt + luma(200),
  inset: 3pt,
  [*Rechte Seite* $s(x)$], [*Ansatz für* $y_p (x)$],
  [$C e^(a x)$], [$A e^(a x)$],
  [$C cos(b x)$], [$A sin(b x) + B cos(b x)$],
  [$C sin(b x)$], [$A sin(b x) + B cos(b x)$],
  [$C cos(b x) e^(a x)$], [$(A sin(b x) + B cos(b x)) e^(a x)$],
  [$C sin(b x) e^(a x)$], [$(A sin(b x) + B cos(b x)) e^(a x)$],

  [$a_n x^n + ... + a_1 x + a_0$], [$A_n x^n + ... + A_1 x + A_0$],
  [$(a_n x^n + ... + a_1 x + a_0) e^(a x)$], [$(A_n x^n + ... + A_1 x + A_0) e^(a x)$],

  [$(a_n x^n + ... + a_0) sin(b x)$],
  [
    $(A_n x^n + ... + A_0) sin(b x)$ \
    $+ (B_n x^n + ... + B_0) cos(b x)$
  ],

  [$(a_n x^n + ... + a_0) cos(b x)$],
  [
    $(A_n x^n + ... + A_0) sin(b x)$ \
    $+ (B_n x^n + ... + B_0) cos(b x)$
  ],

  [$(a_n x^n + ... + a_0) e^(a x) sin(b x)$],
  [
    $(A_n x^n + ... + A_0) e^(a x) sin(b x)$ \
    $+ (B_n x^n + ... + B_0) e^(a x) cos(b x)$
  ],

  [$(a_n x^n + ... + a_0) e^(a x) cos(b x)$],
  [
    $(A_n x^n + ... + A_0) e^(a x) sin(b x)$ \
    $+ (B_n x^n + ... + B_0) e^(a x) cos(b x)$
  ],
)
== Stationäre Lösung
Eine Gleichgewichtslösung (oder stationäre Lösung) ist ein Zustand, in dem sich ein System im Laufe der Zeit nicht mehr verändert ($==> y'(x) =^! 0$). Somit einfach $y'(x)$ auf 0 setzen und nach $y$ auflösen.

= Komplexe Zahlen $i = sqrt(-1)$
#mainbox(title: "Formen & Operationen")[
  $z = a + i b$ #minitext[ Kartesische Form ],
  $quad quad overline(z) = a - i b$  #minitext[ Konjugation ]\
  $|z| = sqrt(a^2 + b^2) = sqrt(z dot overline(z))$ \
  $z^(-1) = 1/z = 1/z dot overline(z)/overline(z) = overline(z)/(|z|^2), quad forall z != 0$
  #minitext[ Reziproke a.k.a. multiplikatives Inverses ]

  $z_1 plus.minus z_2 = (a_1 plus.minus a_2) + i dot (b_1 plus.minus b_2)$ \
  $z_1 dot z_2 = (a_1 + i b_1) dot (a_2 + i b_2) quad quad quad quad z_1/z_2 = (z_1 dot overline(z_2))/(|z_2|^2)$
]

#mainbox(title: "Konjugation")[
  $z = a + i b in CC -> overline(z) = a - i b in CC$ \
  Die Konjugation hat die folgenden Eigenschaften:
  - $z dot overline(z) = (a + i b) dot (a - i b) = a^2 - i^2 dot b^2 = a^2 + b^2 = |z|^2 \ ==> z^(-1) = overline(z)/(|z|^2), quad z != 0$
  - $overline((z_1 + z_2)) = overline(z_1) + overline(z_2)$
  - $overline((z_1 dot z_2)) = overline(z_1) dot overline(z_2)$
]

#mainbox(title: "Eigenschaften des Betrags")[
  #grid(
    columns: (1fr, 1.5fr),
    [
      - $|z dot w| = |z| dot |w|$
      - $|z/w| = (|z|)/(|w|), quad w != 0$
    ],
    [
      - $|z| = |overline(z)|$
      - $|z + w| <= |z| + |w|$ #minitext[ Dreiecksungleichung ]

    ],
  )
]

#mainbox(title: "Polarform")[
  #grid(
    columns: (1fr, 1.3fr),
    [
      Die Polarform von \
      $z = a + i b in CC quad \
      "mit" (phi in (- pi, pi])$ sei \
      $z = r dot markhl(e^(i dot phi))$ #minitext[ (Euler Form) ] \
      $z = r dot markhl((cos(phi) + i dot sin(phi)))$ #minitext[ (Trigo Form) ] \
      mit $r = |z| = sqrt(a^2 + b^2)$, \
      $a = r cos(phi), quad b = r sin(phi)$
    ],
    [$
      phi = cases(
        arctan(b/a) & a > 0,
        arctan(b/a) + pi quad & a < 0 "und" b >= 0,
        arctan(b/a) - pi & a < 0 "und" b < 0,
        pi/2 & a = 0 "und" b > 0,
        -pi/2 & a = 0 "und" b < 0,
        text("undefiniert") & a = 0 "und" b = 0
      )
    $],
  )
]

// TODO: ab hier fehler korrektur vornehmen!
= Tabellen
== Grenzwerte von Referenzfolgen
#minitext[
  Schreiben: "in der Vorlesung haben wir gesehen dass [Folge] gegen [Wert] konvergiert:"
]

#table(
  columns: (1fr, 1fr),
  align: left,
  stroke: none,

  [$limxi 1/(1+epsilon)^n = 0 quad forall epsilon > 0$], [$limxi (x/y)^n = 0 quad forall |x| < |y|$],
  [$limxi 1/x = 0$], [$limxi 1 + 1/x =limxi (n+1)/n= 1$],
  [$limxi e^x = oo$], [$limxn e^x = 0$],
  [$limxi e^(-x) = 0$], [$limxn e^(-x) = oo$],
  [$limxi e^x/x^m = oo$], [$limxn x e^x = 0$],
  [$limxi ln(x) = oo$], [$lim_(x->0^+) ln(x) = -oo$],
  [$limxi (1+x)^(1/x) = 1$], [$limxo (1+x)^(1/x) = e$],
  [$limxi (1+1/x)^b = 1$], [$markhl(limxi ((x+k)/x)^m x = e^(k m))$],
  [$lim_(x->plus.minus oo) (1 + 1/x)^x = e$], [$limxi (1-1/x)^x = 1/e$],
  [$markhl(lim_(x->plus.minus oo) (1 + k/x)^(m x) = e^(k m))$], [$limxi (x/(x+k))^x = e^(-k)$],
  [$limxo (a^x -1)/x = ln(a) quad forall a > 0$], [$limxi x^a q^x = 0 quad forall 0 <= q < 1$],
  [$limxo (sin x)/x = 1$], [$limxo (sin k x)/x = k$],
  [$limxo 1/cos x = 1$], [$limxo (cos x -1)/x = 0$],
  [$limxo ln(1 - x)/x = -1$], [$lim_(x->0^+) x ln(x) = 0$],
  [$limxo (1 - cos x)/x^2 = 1/2$], [$limxo (e^x-1)/x = 1$],
  [$limxo x/arctan x = 1$], [$limxi arctan x = pi/2$],
  [$limxo (e^(a x)-1)/x = a$], [$limxo ln(x+1)/x = 1$],
  [$lim_(x->1) ln(x)/(x-1) = 1$], [$limxi ln(x)/x^a = 0 quad forall a > 0$],
  [$limxi root(x, x) = 1$], [$limxi (2x)/2^x = 0$],
)

== Trivial stetige Funktionen
$f(x) = c$ ($c$ ist Konstante), $f(x) = x$, $f(x) = x^n$, $f(x) = a_n x^n + ... + a_1 x + a_0$, $f(x) = m x + b$, $f(x) = ln(x)$, $f(x) = exp(x)$

== Bekannte Reihen
#table(
  columns: (auto, auto, auto, auto, auto),
  align: center + horizon,
  stroke: 0.5pt,
  [*Reihe*], [*Terme*], [*Wert*], [*konv.*], [*div.*],

  table.cell(colspan: 5, fill: luma(240), align: left)[*Geometrische Reihe*],
  [$sum_(k=0)^oo q^k$], [$1 + q + q^2 + dots$], [$1/(1-q)$], [$|q| < 1$, abs], [$|q| >= 1$],

  table.cell(
    colspan: 5,
    fill: luma(240),
    align: left,
  )[*Harmonische Reihe (und $p$-Reihen)* #minitext()[Kehrwert der natürlichen Zahlen]],
  [$sum_(k=1)^oo 1/k$], [$1 + 1/2 + 1/3 + dots$], [$oo$], [], [ja],
  [$sum_(k=1)^oo 1/k^2$], [$1 + 1/4 + 1/9 + dots$], [$pi^2/6$], [ja, abs], [],
  [$sum_(k=1)^oo 1/k^4$], [$1 + 1/16 + 1/81 + dots$], [$pi^4/90$], [ja, abs], [],
  [$sum_(k=1)^oo 1/k^a$], [$1 + 1/2^a + 1/3^a + dots$], [siehe Ref.], [$a > 1$, abs], [$a <= 1$],

  table.cell(colspan: 5, fill: luma(240), align: left)[*Alternierende Harmonische Reihe*],
  [$sum_(k=1)^oo (-1)^(k+1)/k$], [$1 - 1/2 + 1/3 - dots$], [$ln 2$], [ja], [],
  [$sum_(k=1)^oo (-1)^(k+1)/k^2$], [$1 - 1/4 + 1/9 - dots$], [$pi^2/12$], [ja, abs], [],
  [$sum_(k=1)^oo (-1)^(k+1)/k^4$], [$1 - 1/16 + 1/81 - dots$], [$7pi^4/720$], [ja, abs], [],
  [$sum_(k=0)^oo (-1)^k/(2k + 1)$], [$1 - 1/3 + 1/5 - dots$], [$pi/4$], [ja], [],

  table.cell(colspan: 5, fill: luma(240), align: left)[*Teleskopreihe (Mengoli-Reihe)*],
  [$sum_(k=1)^oo 1/(k(k+1))$], [$1/2 + 1/6 + 1/12 + dots$], [$1$], [ja, abs], [],

  table.cell(colspan: 5, fill: luma(240), align: left)[*Exponential-, Trigonometrische & Hyperbolische Funktionen*],
  [$sum_(k=0)^oo z^k/(k!)$], [$1 + z + z^2/(2!) + dots$], [$e^(z)$], [ja, abs], [],
  [$sum_(k=0)^oo (-a)^k/(k!)$], [$1 - a + a^2/(2!) - dots$], [$e^(-a)$], [ja, abs], [],
  [$sum_(k=0)^oo (-1)^k x^(2k+1)/((2k+1)!)$], [$x - x^3/(3!) + x^5/(5!) - dots$], [$sin x$], [ja, abs], [],
  [$sum_(k=0)^oo (-1)^k x^(2k)/((2k)!)$], [$1 - x^2/2 + x^4/(4!) - dots$], [$cos x$], [ja, abs], [],
  [$sum_(k=0)^oo x^(2k+1)/((2k+1)!)$], [$x + x^3/(3!) + x^5/(5!) + dots$], [$sinh x$], [ja, abs], [],
  [$sum_(k=0)^oo x^(2k)/((2k)!)$], [$1 + x^2/2 + x^4/(4!) + dots$], [$cosh x$], [ja, abs], [],

  table.cell(colspan: 5, fill: luma(240), align: left)[*Logarithmus & Arkustangens Taylorreihen*],
  [$sum_(k=1)^oo (-1)^(k+1) x^k/k$], [$x - x^2/2 + x^3/3 - dots$], [$ln(1+x)$], [$-1 < x <= 1$], [sonst],
  [$sum_(k=0)^oo (-1)^k x^(2k+1)/(2k+1)$], [$x - x^3/3 + x^5/5 - dots$], [$arctan(x)$], [$|x| <= 1$], [sonst],
)

=== Arithmetische Reihe
Die Glieder haben immer denselben Abstand ($a_(k+1) = a_k + d$)
- Bildungsgesetz: $a_k = a_1 + (k-1)dot d$
- $S_n = n/2 (a_1 + a_n) = n/2(a_1 + [a_1+(n-1)d])= n/2 (2 a_1 + (n-1)dot d)$
- Unendliche Reihe divergiert immer, ausser für $a_1 = 0$ und $d = 0$.

=== Geometrische Reihe
Verhältnis $q$ zweier aufeinanderfolgender Glieder konstant ($a_(k+1) = a_k dot q$)

- *Endliche Partialsumme:* $s_n = sum_(k=0)^n q^k = (1-q^(n+1))/(1-q) quad$ (für $q != 1$)
- *Unendliche Reihe:* $sum_(k=0)^oo markhl(q)^k$:
  - $|markhl(q)| < 1$: konvergiert gegen $1/(1 - q) quad$ (Bsp: $sum_(k=0)^oo (1/2)^k = 1/(1-1/2) = 2$)
  - *Allgemein:* $sum_(k=0)^oo a_1 dot q^k = a_1/(1-q) quad$ (wobei $a_1$ das allererste Glied der Reihe ist)
  - $|markhl(q)| >= 1$: divergiert
    - für $markhl(q) >= 1$: divergiert *bestimmt* gegen $+oo$ (Bsp: $sum_(k=0)^oo 1 = oo$)
    - für $markhl(q) <= -1$: divergiert *unbestimmt* (Reihe oszilliert, z.B. $1 - 1 + 1 - 1 ...$)

=== Potenzreihe
Hängt von einer Variable $x$ ab. Verhält sich wie ein Polynom. \
$f(x) = sum_(k=0)^oo c_k (x - x_0)^k = c_0 + c_1(x-x_0) + c_2(x-x_0)^2 +dots$
- Konvergiert, wenn $|x - x_0| < R$ und divergiert, wenn $|x - x_0| > R$
- $R$ ist der Konvergenzradius. Bestimmt durch das Wurzelkriterium: $R = lim_(n->oo) |c_n/c_(n+1)|$ oder Quotientenkriterium $R = 1 / (lim_(n->oo) root(n, |c_n|))$.


=== Teleskopreihe
- $sum_(n=1)^oo (b_n - b_(n+1))$
  - Die Reihe konvergiert genau dann, wenn die Folge $(b_n)_(n >= 1)$ konvergiert. \
    #minitext[
      Die $N$-te Partialsumme ist $s_N = b_1 - b_(N+1)$. Alle mittleren Terme heben sich auf.
    ]
  - $sum_(n = 1)^oo (b_n - b_(n+1)) = b_1 - lim_(n->oo) b_n$ \
    #minitext[
      Bsp. Mengoli-Reihe: $sum_(n = 1)^oo 1/(n(n+1)) = sum_(n = 1)^oo (1/n - 1/(n+1))$.
      Hier ist $b_n = 1/n$. Die Partialsumme ist $s_N = (1/1 - 1/2) + (1/2 - 1/3) + ... + (1/N - 1/(N+1)) = 1 - 1/(N+1)$. \
      Grenzwert: $lim_(N->oo) s_N = 1 - 0 = 1$.
    ] \
    #minitext[
      Bsp. ab anderem Index: $sum_(n = 3)^oo (1/n - 1/(n+1)) = b_3 - lim_(n->oo) b_n = 1/3 - 0 = 1/3$.
    ]

=== Alternierende Reihe $==>$ siehe Leibniz-Kriterium

=== Basics
$
          1 + 2 + ... + n = sum_(i=1)^n i & = (n(n + 1))/2 space "For any n. n could be" sqrt(n), n^4 \
  1^2 + 2^2 + ... + n^2 = sum_(i=1)^n i^2 & = (n(n + 1)(2n + 1))/6 \
  1^3 + 2^3 + ... + n^3 = sum_(i=1)^n i^3 & = (n^2(n + 1)^2)/2^2 = (sum_(i=1)^n i)^2 \
$

== Ableitungen & Stammfunktionen
#minitext[
  Beim Integrieren die Konstante $+ C$ nicht vergessen! ($C' = 0$, Konstanten verschwinden beim Ableiten).
]

#table(
  columns: (auto, 1fr, auto),
  align: center + horizon,
  stroke: 0.5pt,
  [*$F(x)$*], [*$f(x)$*], [*$f'(x)$*],
  [$1/6 3x^3$], [$1/2 3x^2$], [$3x$],
  [$1/6 x^3$], [$1/2 x^2$], [$x$],
  [$-1/99 x^(-99)$], [$x^(-100)$], [$-100 x^(-101)$],
  [$x^(-a+1)/(-a+1)$], [$1/x^a$], [$-a/x^(a+1)$],
  [$x^(a+1)/(a+1)$], [$markhl(x)^a quad (a != -1)$], [$a dot x^(a-1)$],
  [$1/(k ln(a)) a^(k x)$], [$a^(k dot markhl(x))$], [$k a^(k x) ln(a)$],
  [---], [$x^x = e^(\x ln x) med (x>0)$], [$x^x (1+ln x)$ ],
  [$ln |x|$], [$1/x$], [$-1/x^2$],
  [$2/3 x^(3/2)$], [$sqrt(x)$], [$1/(2 sqrt(x))$],
  [$-cos(x)$], [$sin(x)$], [$cos(x)$],
  [$sin(x)$], [$cos(x)$], [$-sin(x)$],
  [$1/2(x - 1/2 sin(2x))$], [$sin^2(x)$], [$2 sin(x)cos(x)$],
  [$1/2(x + 1/2 sin(2x))$], [$cos^2(x)$], [$-2 sin(x)cos(x)$],
  [$-ln|cos(x)|$], [$tan(x)$], [$1/(cos^2(x)) = 1+tan^2(x)$],
  [$ln(cosh(x))$], [$tanh(x)$], [$1/(cosh^2(x))$],
  [$ln |sin(x)|$], [$cot(x)$], [$-1/(sin^2(x)) = -csc^2(x)$],
  [$ln |1/cos(x) + tan(x)|$], [$1/cos(x)=sec(x)$], [$sin(x)/cos^2(x)$],
  [$ln |1/sin(x) - cot(x)|$], [$1/sin(x)=csc(x)$], [$-cos(x)/sin^2(x)$],
  [$1/c dot e^(c x)$], [$e^(c x)$], [$c dot e^(c x)$],
  [$x(ln |x| - 1)$], [$ln |x|$], [$1/x$],
  [$1/2(ln(x))^2$], [$ln(x)/x$], [$(1 - ln(x))/x^2$],
  [$x/(ln(a)) (ln|x| -1)$], [$log_a |x|$], [$1/(x ln(a))$],
  [$x arcsin(x) + sqrt(1 - x^2)$], [$arcsin(x)$], [$1/sqrt(1 - x^2)$],
  [$x arccos(x) - sqrt(1 - x^2)$], [$arccos(x)$], [$-1/sqrt(1 - x^2)$],
  [$x arctan(x) - 1/2 ln(1 + x^2)$], [$arctan(x)$], [$1/(1 + x^2)$],
)

== Integrale
#minitext[
  Bei unbestimmten Integralen die Integrationskonstante $+ C$ nicht vergessen!
]

#table(
  columns: (1fr, 1.2fr),
  align: center + horizon,
  stroke: 0.5pt,
  [*Integral*], [*Stammfunktion $F(x)$*],

  [$integral f'(x) f(x) d x$], [$1/2(f(x))^2$],
  [$integral (f'(x))/f(x) d x$], [$ln|f(x)|$],
  [$integral (a x+b)^n d x$], [$1/(a(n+1))(a x+b)^(n+1) quad (n != -1)$],
  [$integral x(a x+b)^n d x$], [$(a x+b)^(n+2)/((n+2)a^2) - (b(a x+b)^(n+1))/((n+1)a^2) quad (n != -1, -2)$],
  [$integral (a x^p+b)^n x^(p-1) d x$], [$(a x^p+b)^(n+1)/(a p(n+1)) quad (n != -1)$],
  [$integral (a x^p + b)^(-1) x^(p-1) d x$], [$1/(a p) ln |a x^p + b|$],
  [$integral (a x+b)/(c x+d) d x$], [$(a x)/c - (a d-b c)/c^2 ln |c x +d|$],
  [$integral 1/(x^2+a^2) d x$], [$1/a arctan(x/a)$],
  [$integral 1/(x^2 - a^2) d x$], [$1/(2a) ln| (x-a)/(x+a) |$],
  [$integral 1/sqrt(a^2 - x^2) d x$], [$arcsin(x/a)$],
  [$integral sqrt(a^2+x^2) d x$], [$x/2 sqrt(a^2+x^2) + a^2/2 ln|x + sqrt(a^2+x^2)|$],
  [$integral sqrt(a^2-x^2) d x$], [$x/2 sqrt(a^2-x^2) + a^2/2 arcsin(x/a)$],
)

== Stirling-Formel $n! approx (sqrt(2 pi n) dot n^n)/e^n$ für grosse $n$.
