#let cblock(content, fill: rgb("#D8BBFF")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

= Pseudoinverses

#cblock[
  == Full Column Rank (Def. 5.5.1)

  For any $A in RR^(m times n)$ with $"rank"(A) = n$, \
  $A^+_"left" = (A^T A)^(-1) A^T$ is a *left* inverse, $==> A^+ A = I$.
]

#cblock[
  == Full Row Rank (Def. 5.5.3)

  For any $A in RR^(m times n)$ with $"rank"(A) = m$, \
  $A^+_"right" = A^T (A A^T)^(-1)$ is a *right* inverse, $==> A A^+ = I$.
]

#cblock[
  == All Matrices (Def. 5.5.7)

  For any $R in RR^(m times n)$ with $A = C R$, $ A^+ &= (C R)^+ = R^+ C^+ \
  &= R^T (R R^T)^(-1) (C^T C)^(-1) C^T \
  &=R^T (C^T A R^T)^(-1) C^T. $
]

== Pseudoinverses with rank $r$ (Prop. 5.5.9)

For $A in RR^(m times n)$ with rank $r$, let $S in RR^(m times r)$ and $T in RR^(r times n)$, such that $A = S T$, then $A^+ = T^+ S^+$.

== Properties of $A^+$ (Theo. 5.5.11)

1. $A A^+ A = A$
2. $A^+ A A^+ = A^+$
3. $A A^+$ is symmetric & the projection matrix on $C(A)$.
4. $A^+ A$ is symmetric & the projection matrix on $C(A^T)$.
5. $(A^T)^+ = (A^+)^T$.

#cblock(fill: luma(240))[
  == Properties of Pseudoinverses

  1. Prove that if $"rank"(A) = "rank"(B) = n$, we have $(A B)^+ = B^+ A^+$. #line(length: 100%, stroke: 0.75pt) $C(A B) = C(A)$ (as $"rank"(B) = n$ implies that $C(B) = n$). Then using Prop. 5.5.9 we get $(A B)^+ = B^+ A^+$.
  2. Prove that $A^+A A^+ = A^+$. #line(length: 100%, stroke: 0.75pt) $A^+ A A^+ = (C R)^+ C R (C R)^+ = R^+ (C^+ C) (R R^+) C^+ = R^+ C^+ = A^+.$
  3. Prove that $(A^T)^+ = (A^+)^T$. #line(length: 100%, stroke: 0.75pt) _prove for full row & column rank seperately_, then use Prop. 5.5.9 to get $(A^T)^+ = (C^T)^+ (R^T)^+ = (C^+)^T (R^+)^T = (R^+ C^+)^T = (A^+)^T$.
  4. Prove that $A^+A$ is symmetric and that it is the projection matrix for the subspace $C(A^T)$. #line(length: 100%, stroke: 0.75pt) projection matrix: $A^+ A = (C R)^+ C R = R^+ C^+ C R = R^T (R R^T)^(-1) R. " " (C(A^T) = C(R^T))$ \ symmetric: $(A^+ A)^T = (R^T (R R^T)^(-1) R)^T = R^T ((R R^T)T)^(-1) R = R^T (R R^T)^(-1) R = A^+ A$.
]
