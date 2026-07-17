#import "config.typ": *

= Grundbegriffe

== Wahrscheinlichkeitsraum

#mainbox(title: "Axiome von Kolmogorov")[
  Das Tupel $(Omega, cal(F), P)$ ist ein *Wahrscheinlichkeitsraum* mit
  + *Grundraum* $Omega$ mit $Omega != empty$, wobei $omega in Omega$ ein Elementarereignis ist.
  + *$sigma$-Algebra* $cal(F) subset.eq Pset(Omega)$ wobei gilt:
    + $Omega in cal(F)$
    + $A in cal(F) ==> A^c in cal(F)$
    + $A_1, A_2, ... in cal(F) ==> union.big_i A_i in cal(F)$
  + *Wahrscheinlichkeitsmass* $P$ auf $(Omega, cal(F))$ ist eine Abbildung $P: cal(F) |-> [0,1]$, wobei gilt:
    + $P(Omega) = 1$
    + $A_1, A_2, ... in cal(F), forall i != j: A_i inter A_j = empty \ ==> P(union.big_i A_i) = sum_(i=1)^oo P(A_i)$
]

*De-Morgan*

Sei $(A_i)_(i >= 1)$ eine Folge von beliebigen Mengen. Dann gilt
$ (union.big_(i=1)^oo A_i)^c = inter.big_(i=1)^oo A_i^c $

Daraus folgt
+ $A_1, A_2, ... in cal(F) => inter.big_(i=1)^oo A_i in cal(F)$
+ $A, B in cal(F) => (A union B), (A inter B) in cal(F)$

und für $A, B in cal(F)$:
+ $PP(A^c) = 1 - PP(A)$
+ $A subset.eq B => PP(A) <= PP(B)$
+ $PP(A union B) = PP(A) + PP(B) - PP(A inter B)$

Sei $A_1, A_2, ... in cal(F)$, dann gilt:\
*Union Bound*
$ PP(union.big_(i=1)^oo A_i) <= sum_(i=1)^oo PP(A_i) $
*Siebformel*
$ PP(union.big_(i=1)^n A_i) = sum_(k=1)^n (-1)^(k+1) sum_(1 <= i_1 < ... < i_k <= n) PP(inter.big_(j=1)^k A_(i_j)) $
Für $n=2$: $quad PP(A union B) = PP(A) + PP(B) - PP(A inter B)$

== Bedingte Wahrscheinlichkeiten

Sei $(Omega, cal(F), P)$ ein Wahrscheinlichkeitsraum.

#mainbox(title: "Bedingte Wahrscheinlichkeit")[
  Sei $A, B in cal(F)$ und $PP(B) > 0$, dann ist die *bedingte Wahrscheinlichkeit von $A$ gegeben $B$*
  $ PP(A | B) = PP(A inter B) / PP(B) $
]

#mainbox(title: "Satz der totalen Wahrscheinlichkeit")[
Sei $B_1, ..., B_N$ mit $PP(B_n) > 0$ für jedes $1 <= n <= N$ eine Partition des Grundraums $Omega$, d.h. $union.big_(n=1)^N B_n = Omega$ mit $B_n inter B_m = empty$ für $n != m$. Dann gilt für alle $A in cal(F)$:
$ PP(A) = sum_(n=1)^N PP(A | B_n) PP(B_n) = sum_(n=1)^N PP(A inter B_n) $
]

*Satz von Bayes*

Aus der Definition der bedingten W'keit folgt sofort die Bayessche Formel, welche den Zusammenhang zwischen $PP(A | B)$ und $PP(B | A)$ beschreibt:
$ PP(B | A) = (PP(A | B) PP(B)) / PP(A) $
Mit dem _Satz der totalen W'keit_ erhalten wir:

Sei $B_1, ..., B_N in cal(F)$ eine *Partition* von $Omega$ mit $PP(B_n) > 0$ für alle $n$. Für jedes Ereignis $A$ mit $PP(A) > 0$ und jedes $n in {1, ..., N}$ gilt:
$ PP(B_n | A) = (PP(A | B_n) PP(B_n)) / (sum_(k=1)^N PP(A | B_k) PP(B_k)) $

*Intuition Bayessche Statistik*

In dieser Form würde man $A$ als das *eingetretene Ereignis* und die $B_i$ als die verschiedenen *Hypothesen* verstehen.

In der Bayesschen Statistik versucht man die Hypothese zu finden, so dass $PP(B_i | A)$ *maximiert* wird.

(Wurde in der Vorlesung nicht weiter behandelt)

== Unabhängigkeit

#mainbox()[
  Zwei Ereignisse $A, B in cal(F)$ heissen *(stochastisch) unabhängig*, wenn
  $ PP(A inter B) = PP(A) · PP(B) $
]

Es gilt ($star$):
- $PP(A) in {0, 1} => A$ zu jedem Ereignis unabhängig
- $A$ zu sich selbst unabhängig $=> PP(A) in {0,1}$
- $A, B$ unabhängig $=> A, B^c$ unabhängig

Wenn $PP(A) > 0, PP(B) > 0$ gilt:\
$A, B$ unabh. $<=> PP(A | B) = PP(A) <=> PP(B | A) = PP(B)$

#mainbox()[
  Eine Kollektion von Ereignissen $(A_i)_(i in I)$ heisst *(stochastisch) unabhängig*, wenn
  $ J subset.eq I "endlich" => PP(inter.big_(i in J) A_i) = product_(i in J) PP(A_i) $
]
