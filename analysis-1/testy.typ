#set page(paper: "a4", margin: 2.5cm)
#set text(font: "New Computer Modern", size: 10pt, lang: "de")
#set par(justify: true)
#set enum(numbering: "1.")

#align(center)[
  #text(size: 16pt, weight: "bold")[Prüfungstraining: Analysis I] \
  #text(size: 11pt)[Basierend auf der Zusammenfassung] \
  #v(0.5cm)
]

= Teil 1: Multiple Choice \
#v(0.3cm)

== Folgen und Reihen \

+ Sei $(a_n), (b_n)$ zwei Folgen, welche Aussagen sind korrekt? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $a_n <= b_n$ für alle $n in NN$ $(a_n)$ konvergent ist, so ist auch $(b_n)$ konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $0 <= b_n <= a_n^3$ für alle $n in NN$ und $a_n -> 0$ für $n -> oo$, dann konvergiert auch $(b_n)$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $|a_n - b_n| <= 1/n$ für alle $n in NN$ dann konvergieren beide Folgen. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $(b_n^2)$ konvergiert, dann konvergiert auch $(b_n)$. \

+ Seien $(a_n), (b_n)$ Folgen. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $(a_n)$ konvergiert und $(b_n)$ nicht, so ist $(a_n + b_n)$ nicht konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Ist $(a_n)$ beschränkt und $(b_n)$ nicht konvergent, so ist $(a_n - b_n)$ nicht konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $(a_n)$ beschränkt und $lim_(n->oo) b_n = 0$ so folgt, dass $lim_(n->oo) a_n b_n = 0$. \

+ Sei $f: RR -> [0, oo]$, so dass $lim_(x->0) f(x) != 0$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $exists epsilon > 0, exists delta > 0$, so dass $0 < |x| < delta => f(x) > epsilon$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Es existiert eine Folge $(x_n)$ mit $lim_(n->oo) x_n = 0$ und ein $epsilon$, so dass $|f(x_n)| > epsilon, n in NN$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Für $x in RR$ gilt $f(x) > 0$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Für jede Folge $(x_n)$ mit $x_n = 0$ gilt $lim_(n->oo) f(x_n) != 0$. \

+ Seie $sum_(k=1)^oo a_n$ eine Reihe. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $forall epsilon > 0, exists N >= 1$, so dass $sum_(k=n)^(n+100) |a_k| < epsilon, forall n >= N$ dann ist die Reihe konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls die Reihe konvergiert, so folgt $forall epsilon > 0, exists N >= 1$ gilt $sum_(k=n)^(n+100) |a_k| < epsilon, forall n >= N$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls die Reihe $sin(a_k)$ absolut konvergiert, so konvergiert die ursprüngliche Reihe. \

+ Seien $c_n$ und $alpha > 0, a_n = c_n alpha^n$ und $b_n = n c_n alpha^(n-1)$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $lim sup_(n->oo) |a_n|^(1/n) > lim sup_(n->oo) |b_n|^(1/n)$ \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $lim sup_(n->oo) |a_n|^(1/n) < lim sup_(n->oo) |b_n|^(1/n)$ \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $lim sup_(n->oo) |a_n|^(1/n) = lim sup_(n->oo) |b_n|^(1/n)$ \

+ Die Potenzreihe $sum_(n=1)^oo 2^n / (n sqrt(n)) * z^n$ ist auf dem Rand ihres Konvergenzkreises... \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) überall absolut konvergent \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) überall konvergent, aber nicht absolut konvergent \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) überall konvergent, aussert in unendlich vielen Punkten \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) nirgendwo konvergent \

+ Sei $phi$ eine Abbildung einer Reihe $sum_(k=1)^oo a_k$ und $b_n = a_(phi(n))$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn die Reihe konvergiert und $phi$ surjektiv ist, dann ist die Reihe mit $b_n$ auch konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn die Reihe konvergiert und $phi$ injektiv ist, dann ist die Reihe mit $b_n$ auch konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn die Reihe absolut konvergiert und $phi$ surjektiv ist, dann ist die Reihe mit $b_n$ auch konvergent. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn die Reihe absolut konvergiert und $phi$ injektiv ist, dann ist die Reihe mit $b_n$ auch konvergent. \

+ Sei $sum_(k=1)^oo a_k$ absolut konvergent, dann gilt für die Reihe $sum_(k=1)^oo |a_k|^2$: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) konvergiert nicht unbedingt \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) konvergiert immer absolut \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) konvergiert immer, aber nicht absolut \

#v(0.3cm)
== Funktionen \

9. Seien $f: RR -> RR$ und $h: RR -> [0, oo]$, so dass $lim_(x->oo) f(x) = -oo, lim_(x->oo) h(x) = 0$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Ist $lim_(x->oo) f(x) h(x) = 0$ möglich? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Ist $lim_(x->oo) f(x) h(x) = oo$ möglich? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Ist $lim_(x->oo) f(x) h(x) = -oo$ möglich? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Ist $lim_(x->-oo) f(x) h(x) = oo$ möglich? \

10. Seien $f, g$ monoton wachsende Funktionen: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f * g$ monoton wachsend. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f/g$ ist monoton wachsend für $g(x) != 0$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f/g$ oder $g/f$ ist monoton wachsend für $f(x), g(x) != 0$. \

11. Seien $f: X -> Y, g: Y -> Z$ Funktionen, so dass $g(f(x)): X -> Z$ eine Bijektion ist. Welche Aussage ist richtig? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ ist injektiv, $g$ ist injektiv \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ ist injektiv, $g$ ist surjektiv \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ ist surjektiv, $g$ ist injektiv \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ ist surjektiv, $g$ ist surjektiv \

12. Sei $f: [a,b] -> RR$ eine Funktion. Sei $f_n$ eine Funktionenfolge, die gleichmässig gegen $f$ konvergiert. Es gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Sei $x_0 in [a,b]$. Falls $f_n$ für allen $n >= 1$ in $x_0$ differenzierbar ist, so ist $f$ in $x_0$ differenzierbar. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $f_n$ für alle $n >= 1$ auf $[a,b]$ beschränkt ist, so existiert für jede Partition $P$ der Grenzwert der Untersumme $lim_(n->oo) s(f_n, P) = s(f,P)$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $f_n$ für allen $n >= 1$ in $x_0$ stetig ist, so ist $f$ gleichmässig stetig. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $f_n$ für allen $n >= 1$ in $x_0$ konvex ist, so ist $f$ konvex. \

13. Sei $D subset.eq RR$ Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $D = emptyset$, dann besitzt $D$ einen Häufungspunkt. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $D subset.eq E$ und $x_0$ ein Häufungspunkt von $D$, so ist $x_0$ auch ein Häufungspunkt von $E$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $F subset.eq D$ und $x_0$ ein Häufungspunkt von $D$, so ist $x_0$ auch ein Häufungspunkt von $F$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $D$ endlich ist, gibt es keinen Häufungspunkt. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $D$ unendlich ist, gibt es mindestens einen Häufungspunkt. \

14. Sei $f_n: D -> RR$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f_n$ konvergiert punktweise, wenn $|f(x) - f_n(x)| -> 0$, für $n -> oo$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f_n$ konvergiert gleichmässig, wenn $forall epsilon > 0, forall x in D exists N > 0$, so dass $|f(x) - f_n(x)| < epsilon$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Gleichmässige konvergenz von $f_n$ impliziert punktweise konvergenz von $f_n$. \

15. Welche Aussagen sind richtig? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f: [0,1] -> RR$ beschränkt $=> f$ monoton. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f: [0,1] -> RR$ strikt monoton wachsend $=> f$ stetig. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f: [0,1] -> RR$ monoton $=> f$ beschränkt. \

16. Sei $f: [0,1] -> [0,1]$ stetig und nicht konstant. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Es gibt einen Punkt $x in [0,1]$, so dass $f(x) = x$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Es gibt einen Punkt $x in [0,1]$, so dass $f(x) = 1$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ hat eine eindeutige Maximalstelle. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Das Bild $f([0,1]) subset [0,1]$ ist ein abgeschlossenes Intervall. D.h. es gibt $a,b in [0,1]$ mit $a < b$, so dass $f([0,1]) = [a,b]$. \

17. Sei $f: RR -> RR$ stetig bei $x_0 = 0$, mit $f(x_0) > 0$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Es gilt $f(x) > 0$ für alle $x in RR$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Es existiert $epsilon, delta > 0$, so dass $f(x) > epsilon$ für alle $x in (-delta, delta)$ gilt. \

18. Sei $f: D -> RR$, welche Aussage ist äquivalent zur Stetigkeit von $f$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $forall x in D, forall epsilon > 0, exists delta > 0$, so dass für alle $z in D$ gilt: $z in (x-delta, x+delta) => f(z) in (f(x)-epsilon, f(x)+epsilon)$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $forall x in D, exists delta > 0, forall epsilon > 0$, so dass für alle $z in D$ gilt: $|z-x| < delta => |f(z)-f(x)| < epsilon$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $forall epsilon > 0, exists delta > 0$, so dass für alle $x,z in D$ gilt: $|z-x| < delta => |f(z)-f(x)| < epsilon$. \

19. Sei $f: RR -> RR$ stetig. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ hat eine Maximalstelle. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $f(1) = 2$ und $f(3) = -1$ dann gibt es ein $t in [1,3]$ mit $f(t) = 0$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $lim_(t->oo) f(t) = 0$ gilt, dann ist $f$ auf $[0, oo]$ begrenzt. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $f$ begrenzt ist, dann existiert $lim_(t->oo) f(t)$. \

20. Seien $(a_n), (b_n), (c_n)$ Folgen mit $c_n = a_n + b_n$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $lim_(n->oo) c_n$ existiert, existieren $lim_(n->oo) a_n$ und $lim_(n->oo) b_n$ und es gilt $lim_(n->oo) c_n = lim_(n->oo) a_n + lim_(n->oo) b_n$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $lim_(n->oo) c_n$ und $lim_(n->oo) b_n$ existieren, existiert $lim_(n->oo) a_n$ und es gilt $lim_(n->oo) a_n = lim_(n->oo) c_n - lim_(n->oo) b_n$. \

21. Seien $a < b, g: RR -> RR$ beschränkt und $f: [a,b] -> RR$ beschränkt mit $f(a) < f(b)$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls für jedes $c in [f(a), f(b)]$ ein $x in [a,b]$ mit $f(x) = c$ existiert, so folgt, dass $f$ stetig ist. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $g(f(x))$ und $g$ stetig sind, so ist auch $f$ stetig. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $f$ stetig ist, gibt es $x_0 in [a,b]$, so dass $integral_a^b x f(x) dif x = (f(x_0)/2) (b^2 - a^2)$. \

22. Sei $f: [0, oo] -> RR$ stetig. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Es gibt eine differenzierbare Funktion $F: [0, oo] -> RR$ mit $F'(t) = f(t)$ für alle $t in (0, oo)$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $f(t) >= 0$ für alle $t in [0,1]$ und $integral_0^1 f(t) dif t = 0$, dann gilt $f(t) = 0$ für alle $t in [0,1]$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $|f(t)| <= 1/(1+t)$ für alle $t in [0, oo]$ dann existiert $integral_0^oo f(t) dif t$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $sum_(n=1)^oo f(n)$ konvergiert, dann existiert $integral_0^oo f(t) dif t$. \

#pagebreak()
== Ableiten und Integrieren \

23. Seien $f(x) = sin(x) * e^(-1/x^2)$ mit $f(0) = 0$ und $a_k = integral_(2k pi)^(2(k+1)pi) f(x) dif x$. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ ist stetig aber nicht glatt. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ besitzt unendlich viele lokale Minimalstellen. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ besitzt ein lokales Maximum in $x=0$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $a_1 > 0$ \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $lim_(k->oo) a_k = 0$. \

24. Sei $f$ differenzierbar. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ ist stetig. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f'$ ist stetig. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $f'(x) = 0, forall x in D$, dann existiert $c in RR, f(x) = c, forall x in D$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Falls $D = (a,b), a < b$, dann ist obige Aussage wahr. \

25. Sei $f$ eine ungerade Funktion. Dann gilt: \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f^{(i)}(0) = 0$ für $i$ ungerade \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f^{(i)}(0) != 0$ für $i$ ungerade \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f^{(i)}(0) = 0$ für $i$ gerade \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f^{(i)}(0) != 0$ für $i$ gerade \

26. Welche der Implikationen sind wahr? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ differenzierbar $=> f$ stetig $=> f$ integrierbar \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ integrierbar $=> f$ differenzierbar $=> f$ stetig \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ stetig $=> f$ differenzierbar $=> f$ integrierbar \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) $f$ integrierbar $=> f$ stetig $=> f$ differenzierbar \

27. Sei $h(x) = g(f(x))$ und $f,g$ sind zwei nicht-negative Funktionen. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $f$ und $g$ streng konvex sind, ist auch $h$ konvex. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Wenn $integral_0^oo f(x) dif x, integral_0^oo g(x) dif x$ konvergieren, so konvergiert auch $integral_0^oo h(x) dif x$. \

28. Welche Aussage stimmt? \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Seien $f_n: [a,b] -> RR$ beschränkt und integrierbar. Dann gilt für $f(x) := lim_(n->oo) f_n(x): sum_(n=0)^oo integral_a^b f_n(x) dif x = integral_a^b sum_(n=0)^oo f_n(x) dif x$ \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Seien $f_n$ wie oben, aber zusätzlich konvergieren sie gleichmässig. Dann gilt: $lim_(n->oo) integral_a^b f_n(x) dif x = integral_a^b f(x) dif x$. \
  - #box(width: 1em, height: 1em, stroke: 0.5pt) Die Umkehrung der zweiten Aussage ist wahr. \

#pagebreak()
= Teil 2: Weitere Aufgaben (Offene Fragen) \
#v(0.5cm)

=== Aufgabe 1 \
Sei $(a_n)$ eine induktive Folge mit $a_1 = sqrt(2), a_(n+1) = sqrt(2+a_n)$. Beweise, dass die Folge durch 2 von oben beschränkt ist und berechne den Grenzwert. \
#v(6cm)

=== Aufgabe 2 \
Zeige, dass $lim_(n->oo) product_(k=1)^n (1 + t/k^2)$ für jedes $t$ existiert. \
#v(6cm)

=== Aufgabe 3 \
Zeige mit der Def. des Grenzwertes, dass $lim_(n->oo) (sqrt(2n + cos(n)) - sqrt(2n+1)) = 0$. \
#v(6cm)

#pagebreak()
=== Aufgabe 4 \
Berechne den Grenzwert $lim_(x->1^+) (log(x) - sin(x pi)) / (sqrt(x-1))$. \
#v(6cm)

=== Aufgabe 5 \
Zeige, dass für alle $t in RR$ gilt: $lim_(n->oo) (cos(t/sqrt(n)))^n = e^(-t^2 / 2)$. \
#v(6cm)

=== Aufgabe 6 \
Berechne $lim_(x->0) (sin(x))/x$. \
#v(6cm)

#pagebreak()
=== Aufgabe 7 \
Für welche $x$ konvergiert die Reihe $sum_(k=1)^oo |x|^(n!)$? \
#v(6cm)

=== Aufgabe 8 \
Stelle $(1 + e^x)^3$ als Potenzreihe dar. \
#v(6cm)

=== Aufgabe 9 \
Zeige, dass das Cauchy Produkt der beiden divergenten Reihen $2 + 2 + 2^2 + ...$ und $-1 + 1 + 1 + ...$ absolut konvergiert. \
#v(6cm)

#pagebreak()
=== Aufgabe 10 \
Sei $sum_(k=1)^oo a_k$ absolut konvergent und $sum_(k=1)^oo b_k$ nur konvergent. Folgt daraus, dass $sum_(k=1)^oo b_k sin(a_k)$ konvergiert? \
#v(6cm)

=== Aufgabe 11 \
Zeige für alle $k in NN$ und $0 <= x <= sqrt((4k+5)(4k+6))$ gilt: \ \
$cos(x) >= 1 - x^2/(2!) + x^4/(4!) - ... - x^(2(2k+1))/((2k+1)!)$. \
#v(6cm)

=== Aufgabe 12 \
Konvergiert $f_n(x) = 2 n x$ falls $0 <= x < 1/(2n)$, $2 - 2 n x$ falls $1/(2n) <= x < 1/n$, $0$ falls $1/n <= x <= 1$ gleichmässig? \ \
Gilt $lim_(n->oo) integral_0^1 f_n(x) dif x = integral_0^1 f(x) dif x$? \
#v(6cm)

#pagebreak()
=== Aufgabe 13 \
Sei $x_0$ ein Häufungspunkt von $D section [x_0, oo[, D section ]-oo, x_0]$ mit der Eigenschaft $lim_(x->x_0^+) f(x) = +oo, lim_(x->x_0^-) f(x) = -oo$. Zeige, dass $lim_(x->x_0) 1/(1+f(x)^2) = 0$. \
#v(6cm)

=== Aufgabe 14 \
Bestimme die Konstanten $a, b$ so, dass die Funktion $f(x) = x^2 - a x + b$ falls $x <= -1$, $(a+b)x$ falls $-1 < x < 1$, $x^2 + a x - b$ falls $x >= 1$ auf ganz $RR$ stetig ist. \
#v(6cm)

=== Aufgabe 15 \
Sei $f(x) = (x^5 - 7x^2 + 1) / (x^8 + 1)$, zeige, dass $f$ auf ganz $RR$ stetig ist und min. eine Nullstelle besitzt. \
#v(6cm)

#pagebreak()
=== Aufgabe 16 \
Sei $f(x) = x$ für $x in QQ$ und $f(x) = 1-x$ sonst. Zeige, dass $x_0 = 1/2$ der einzige Stetigkeitspunkt ist. \
#v(6cm)

=== Aufgabe 17 \
Sei $f: [0, ln(2)] -> RR$ eine stetige Funktion. Zeigen Sie, dass es $eta in [0, ln(2)], f(eta) = 1/(e^2 - e) integral_0^(ln(2)) e^(e^x) e^x f(x) dif x$ gibt. \
#v(6cm)

=== Aufgabe 18 \
Sei $f_n: [0, 1] -> RR, x -> (n x) / (n^2 x^2 + 1)^2$. Zeige, dass $f(x) = lim_(n->oo) f_n(x)$. Konvergiert die Funktion gleichmässig? \ \
Gilt $lim_(n->oo) integral_0^1 f_n(x) dif x = integral_0^1 f(x) dif x$? \
#v(6cm)

#pagebreak()
=== Aufgabe 19 \
Zeige, dass $f: x -> x + e^x$ bijektiv von $RR$ nach $RR$ ist und die Inverse auf ganz $RR$ differenzierbar ist. \
#v(6cm)

=== Aufgabe 20 \
Zeige, dass $1 + x <= e^x, forall x in RR$. \
#v(6cm)

=== Aufgabe 21 \
Berechne die Minimal-/Maximalstellen von $f: x -> sqrt(1+x) - 1/2 sqrt(x), x in [0, 5]$. \
#v(6cm)

#pagebreak()
=== Aufgabe 22 \
Differenziere $f(x) = integral_(cos(x))^(e^x) cos(t) dif t$. \
#v(6cm)

=== Aufgabe 23 \
Sei $f$ differenzierbare mit $f(x_0) != 0$ für mindestens ein $x_0 in RR$. Weiter gilt $f(x+y) = f(x)f(y)$. Zeige $f(0) = 1$. \
#v(6cm)

=== Aufgabe 24 \
Sei $f(x) = x sin(1/x)$ mit $f(0) = 0$. Zeige, dass $f$ in $0$ nicht differenzierbar ist. \
#v(6cm)

#pagebreak()
=== Aufgabe 25 \
Sei $f$ eine Funktion, die in $x_0$ differenzierbar ist. Sei $n >= 2$, berechne $lim_(h->0) (f(x_0 + n h) - f(x_0 + (n-2)h)) / h$. \
#v(6cm)

=== Aufgabe 26 \
Zeige, dass $f$ gerade $=> f'$ ungerade. \
#v(6cm)

=== Aufgabe 27 \
Zeige, dass die Funktion $f: RR -> RR, x -> e^x - 1 - x$ nur für $x = 0$ verschwindet. \
#v(6cm)

#pagebreak()
=== Aufgabe 28 \
Zeige, dass für $f(x) = sin(x+a)$ gilt $f^((n))(x) = sin(x + a + (n pi)/2)$. \
#v(6cm)

=== Aufgabe 29 \
Gegeben die Funktion $f(x) = x^x$, benutze die Taylor Approximation im Punkt $x_0 = 1$ zur dritten Ordnung, um eine Approximation von $(7/5)^(7/5)$ anzugeben. \
#v(6cm)

=== Aufgabe 30 \
Sei $f(x) = integral_0^oo e^(-x y) cos(y) dif y$ auf $]0, oo[$, zeige, dass $f$ wohldefiniert ist. \
#v(6cm)

#pagebreak()
=== Aufgabe 31 \
Integriere $integral_0^1 t^2 cos(2t) dif t$. \
#v(6cm)

=== Aufgabe 32 \
Integriere folgende Funktion $f(t) = t / (t^3 + t^2 - t - 1)$. \
#v(6cm)

=== Aufgabe 33 \
Integriere folgendes uneigentliches Integral: $integral_1^oo 1/(x^3) sqrt(x/(x+1)) dif x$. \
#v(6cm)

#pagebreak()
=== Aufgabe 34 \
Integriere folgendes uneigentliches Integral: $integral_(-oo)^oo (e^(-1/|x|)) / x^2 dif x$. \
#v(6cm)

=== Aufgabe 35 \
Berechne für alle $m in NN^*$ den Wert des Integrals $integral_0^(pi/2) cos^m(x) dif x$. \
#v(6cm)

=== Aufgabe 36 \
Zeige, dass für jedes $c in RR$ die Funktion $exp(-t^2)$ auf $[-oo, c]$ integrierbar ist. \
#v(6cm)

#pagebreak()
=== Aufgabe 37 \
Sei $f: [0,1] -> RR$ mit $f(x) = 0$ für $x=0$ oder $x in RR backslash QQ$ und $1/q$ für $x = p/q$. Zeige, dass $f$ integrierbar ist. \
#v(6cm)