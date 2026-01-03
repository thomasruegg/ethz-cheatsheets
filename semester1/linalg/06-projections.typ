#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#B1E6F3"),
  content,
)

= Projections

#cblock[
  == Projection Matrix (Theo. 5.2.6)

  Let $S$ be a subspace of $RR^m$ and $A$ be a matrix with columns are a basis of $S$. The projection of $bold(b) in RR^m$ on $S$ is given by

  $ "proj"_S (bold(b)) = P bold(b) "with" P = A(A^T A)^(-1) A^T. $

  Moreover,
  1. $A^T A$ is invertible $<==>$ $A$ has linearly independent columns (Lemma 5.2.4),
  2. if $A$ has linearly independent columns, then $A^T A$ is square, invertible and symmetric (Cor. 5.2.5).
]



=== Remark 5.2.7

For any projection matrix $P$ and corresponding subspace $S$,

1. $P^2 = P$,
2. $"proj"_(S^bot) (bold(b)) = (I - P) bold(b)$.
