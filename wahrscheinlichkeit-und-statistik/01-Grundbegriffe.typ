#import "config.typ": *

= Grundbegriffe

== Wahrscheinlichkeitsraum

#mainbox(title: "Axiome von Kolmogorov")[
  Das Tupel $(Omega, A, P)$ ist ein *Wahrscheinlichkeitsraum* mit
  + *Grundraum* $Omega$ mit $Omega != empty$, wobei $omega in Omega$ ein Elementarereignis ist.
  + *$sigma$-Algebra* $A subset.eq Pset(Omega)$ wobei gilt:
    + $Omega in A$
    + $A in A ==> A^c in A$
    + $A_1, A_2, ... in A ==> union.big_i A_i in A$
  + *Wahrscheinlichkeitsmass* $P$ auf $(Omega, A)$ ist eine Abbildung $P: A |-> [0,1]$, wobei gilt:
    + $P(Omega) = 1$
    + $A_1, A_2, ... in A, forall i != j: A_i inter A_j = empty \ ==> P(union.big_i A_i) = sum_(i=1)^oo P(A_i)$
]

*De-Morgan*

Sei $(A_i)_(i >= 1)$ eine Folge von beliebigen Mengen. Dann gilt
$ (union.big_(i=1)^oo A_i)^c = inter.big_(i=1)^oo A_i^c $

Daraus folgt
+ $A_1, A_2, ... in A => inter.big_(i=1)^oo A_i in A$
+ $A, B in A => (A union B), (A inter B) in A$

und für $A, B in A$:
+ $P(A^c) = 1 - P(A)$
+ $A subset.eq B => P(A) <= P(B)$
+ $P(A union B) = P(A) + P(B) - P(A inter B)$

Sei $A_1, A_2, ... in A$, dann gilt:\
*Union Bound*
$ P(union.big_(i=1)^oo A_i) <= sum_(i=1)^oo P(A_i) $
*Siebformel*
$ P(union.big_(i=1)^n A_i) = sum_(k=1)^n (-1)^(k+1) sum_(1 <= i_1 < ... < i_k <= n) P(inter.big_(j=1)^k A_(i_j)) $
Für $n=2$: $quad P(A union B) = P(A) + P(B) - P(A inter B)$

== Bedingte Wahrscheinlichkeiten

Sei $(Omega, A, P)$ ein Wahrscheinlichkeitsraum.

#mainbox(title: "Bedingte Wahrscheinlichkeit")[
  Sei $A, B in A$ und $P(B) > 0$, dann ist die *bedingte Wahrscheinlichkeit von $A$ gegeben $B$*
  $ P(A | B) = P(A inter B) / P(B) $
]

*Satz der totalen Wahrscheinlichkeit*

Sei $B_1, ..., B_N$ mit $P(B_n) > 0$ für jedes $1 <= n <= N$ eine Partition des Grundraums $Omega$, d.h. $union.big_(n=1)^N B_n = Omega$ mit $B_n inter B_m = empty$ für $n != m$. Dann gilt für alle $A in F$:
$ P(A) = sum_(n=1)^N P(A | B_n) P(B_n) = sum_(n=1)^N P(A inter B_n) $

*Satz von Bayes*

Aus der Definition der bedingten W'keit folgt sofort die Bayessche Formel, welche den Zusammenhang zwischen $P(A | B)$ und $P(B | A)$ beschreibt:
$ P(B | A) = (P(A | B) P(B)) / P(A) $
Mit dem _Satz der totalen W'keit_ erhalten wir:

Sei $B_1, ..., B_N in F$ eine *Partition* von $Omega$ mit $P(B_n) > 0$ für alle $n$. Für jedes Ereignis $A$ mit $P(A) > 0$ und jedes $n in {1, ..., N}$ gilt:
$ P(B_n | A) = (P(A | B_n) P(B_n)) / (sum_(k=1)^N P(A | B_k) P(B_k)) $

*Intuition Bayessche Statistik*

In dieser Form würde man $A$ als das *eingetretene Ereignis* und die $B_i$ als die verschiedenen *Hypothesen* verstehen.

In der Bayesschen Statistik versucht man die Hypothese zu finden, so dass $P(B_i | A)$ *maximiert* wird.

(Wurde in der Vorlesung nicht weiter behandelt)

== Unabhängigkeit

#mainbox()[
  Zwei Ereignisse $A, B in A$ heissen *(stochastisch) unabhängig*, wenn
  $ P(A inter B) = P(A) · P(B) $
]

Es gilt ($star$):
- $P(A) in {0, 1} => A$ zu jedem Ereignis unabhängig
- $A$ zu sich selbst unabhängig $=> P(A) in {0,1}$
- $A, B$ unabhängig $=> A, B^c$ unabhängig

Wenn $P(A) > 0, P(B) > 0$ gilt:\
$A, B$ unabh. $<=> P(A | B) = P(A) <=> P(B | A) = P(B)$

#mainbox()[
  Eine Kollektion von Ereignissen $(A_i)_(i in I)$ heisst *(stochastisch) unabhängig*, wenn
  $ J subset.eq I "endlich" => P(inter.big_(i in J) A_i) = product_(i in J) P(A_i) $
]
