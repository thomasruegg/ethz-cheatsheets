#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#B1E6F3"),
  content,
)

= Projections

== Projection (Def. 5.2.1)
The projection of a vector $bold(b) in RR^m$ on a subspace $S$ is the point in $S$ closest to $bold(b)$:
$ "proj"_S (bold(b)) = "argmin"_(bold(p) in S) ||bold(b) - bold(p)|| $

== Normal Equations (Lemma 5.2.3)
The projection of $bold(b)$ on $S = C(A)$ is well defined and given by $bold(p) = A bold(hat(x))$, where $bold(hat(x))$ satisfies the *normal equations*:
$A^T A bold(hat(x)) = A^T bold(b)$

#cblock[
  == Projection Matrix (Theo. 5.2.5)

  Let $S$ be a subspace of $RR^m$ and $A$ be a matrix with columns that are a basis of $S$. The projection of $bold(b) in RR^m$ on $S$ is given by

  $ "proj"_S (bold(b)) = P bold(b) "with" P = A(A^T A)^(-1) A^T. $

  Moreover,
  1. $A^T A$ is invertible $<==>$ $A$ has linearly independent columns (Lemma 5.2.4),
  2. if $A$ has linearly independent columns, then $A^T A$ is square, invertible and symmetric.
]

=== Remark 5.2.6

For any projection matrix $P$ and corresponding subspace $S$,

1. $P^2 = (A (A^T A)^(-1) A^T)^2 = A (A^T A)^(-1) overbrace(A^T A (A^T A)^(-1), I) A^T = A (A^T A)^(-1) A^T = P$
2. $"proj"_(S^bot) (bold(b)) = bold(b)-P bold(b) = (I - P) bold(b)$.