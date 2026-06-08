#import "config.typ": *

= Konfidenzintervalle

#mainbox(title: "Definition Konfidenzintervalle")[
  Sei $alpha in [0,1]$. Ein *Konfidenzintervall für $theta$ mit Niveau $1 - alpha$* ist ein Zufallsintervall $I = [A,B]$, sodass für alle $theta in Theta$ gilt 
  $ PP_(theta)[theta in [A,B]] = PP_(theta)[A <= theta <= B] >= 1 - alpha, $ 
  wobei $A, B$ ZV der Form $A = a(X_1,...,X_n), B = b(X_1,...,X_n)$ mit Funktionen $a,b: RR^n -> RR$ sind.
  
]