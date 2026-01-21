#let cblock(content, fill: rgb("#D8BBFF")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

= Pseudoinverses

#cblock[
  == Full Column Rank (Def. 6.4.1)

  For any $A in RR^(m times n)$ with $"rank"(A) = n$, \
  $A^+_"left" = (A^T A)^(-1) A^T$ is a *left* inverse, $==> A^+ A = I$.
]

#cblock[
  == Full Row Rank (Def. 6.4.3)

  For any $A in RR^(m times n)$ with $"rank"(A) = m$, \
  $A^+_"right" = A^T (A A^T)^(-1)$ is a *right* inverse, $==> A A^+ = I$.
]

#cblock[
  == All Matrices (Def. 6.4.7)

  For any $R in RR^(m times n)$ with rank $r$ and CR-decomposition $A = C R$, $ A^+ & = (C R)^+ = R^+ C^+ \
      & = R^T (R R^T)^(-1) (C^T C)^(-1) C^T \
      & =R^T (C^T A R^T)^(-1) C^T. $
]

== Pseudoinverses with rank $r$ (Prop. 6.4.9)

For $A in RR^(m times n)$ with rank $r$, let $S in RR^(m times r)$ and $T in RR^(r times n)$, such that $A = S T$, then $A^+ = T^+ S^+$.

== Optimization Properties (Lemma 6.4.8)

Given $A in RR^(m times n)$ and $bold(b) in RR^m$, the vector $bold(hat(x)) = A^+_"left" bold(b)$ is the unique solution to the problem:
$ min_(bold(x) in RR^n) ||bold(x)||_2 "subject to" A^T A bold(x) &= A^T bold(b) \ bold(x) &= (A^T A)^(-1) A^T bold(b) $
In words: $A^+_"left" bold(b)$ is the solution to the least squares problem with the smallest norm.

== Properties of $A^+$ (Theo. 6.4.10)

1. $A A^+ A = A$
2. $A^+ A A^+ = A^+$. _Proof:_ see below.
3. $A A^+_"left"$ is symmetric & the projection matrix on $C(A)$.
4. $A^+_"right" A$ is symmetric & the projection matrix on $C(A^T)$.
5. $(A^T)^+ = (A^+)^T$. _Proof:_ see below.

#cblock(fill: luma(240))[
  == Proof of Pseudoinverse Properties

  1. Prove that if $"rank"(A) = "rank"(B) = n$, we have $(A B)^+ = B^+ A^+$. #line(length: 100%, stroke: 0.75pt) $C(A B) = C(A)$ (as $"rank"(B) = n$ implies that $C(B) = RR^n$). Then using Prop. 6.4.9 we get $(A B)^+ = B^+ A^+$.
  2. Prove that $A^+A A^+ = A^+$. #line(length: 100%, stroke: 0.75pt) $A^+ A A^+ = (C R)^+ C R (C R)^+ = R^+ (C^+ C) (R R^+) C^+ = R^+ C^+ = A^+$.
  3. Prove that $(A^T)^+ = (A^+)^T$. #line(length: 100%, stroke: 0.75pt) _prove for full row & column rank seperately_, then use Prop. 6.4.9 to get $(A^T)^+ = (C^T)^+ (R^T)^+ = (C^+)^T (R^+)^T = (R^+ C^+)^T = (A^+)^T$.
  4. Prove that $A^+A$ is symmetric and that it is the projection matrix for the subspace $C(A^T)$. #line(length: 100%, stroke: 0.75pt) projection matrix: $A^+ A = (C R)^+ C R = R^+ C^+ C R = R^T (R R^T)^(-1) R. " " (C(A^T) = C(R^T))$ \ symmetric: $(A^+ A)^T = (R^T (R R^T)^(-1) R)^T = R^T ((R R^T)^T)^(-1) R = R^T (R R^T)^(-1) R = A^+ A$.
]
