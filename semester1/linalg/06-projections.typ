#let cblock(content, fill: rgb("#B1E6F3")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
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

== Matrix for Reflection Through a Plane

To find the matrix $B$ representing a reflection through a plane $P$ passing through the origin:

1. *Find the normal vector* $bold(v)$ from the plane equation ($a x+b y+c z=0 ==> bold(v) = vec(a, b, c)$). $bold(v)$ is orthogonal to the plane.
2. *Normalize it* to get the unit normal vector $bold(n) = bold(v) / norm(bold(v))$.
3. *Apply the reflection formula:*
  $B = I - 2 bold(n) bold(n)^T$ \
  _Note:_ This formula works because $bold(n) bold(n)^T$ is the projection onto the normal, i.e. $I-bold(n) bold(n)^T$ would be the projection onto the plane. Subtracting it twice reflects the vector across the plane.
