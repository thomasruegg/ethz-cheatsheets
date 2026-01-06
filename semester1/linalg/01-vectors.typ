#let cblock(content, fill: rgb("#9BF6FF")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

= Vectors

#cblock[
  == Linear Combination (Def. 1.4)

  Let $bold(v)_1, bold(v)_2, ..., bold(v)_n in RR^m$ and $lambda_1, lambda_2, ..., lambda_n in RR$, then $ lambda_1 bold(v)_1 + lambda_2 bold(v)_2 + ... + lambda_n bold(v)_n $ is a linear combination of $bold(v)_1, bold(v)_2, ..., bold(v)_n$.
]

=== Special Linear Combinations (Def. 1.7)

A linear combination $lambda_1 bold(v)_1 + lambda_2 bold(v)_2 + ... + lambda_n bold(v)_n$ is

1. _affine_ if $lambda_1 + lambda_2 + ... + lambda_n = 1$,
2. _conic_ if $lambda_i >= 0$ for $i = 1, 2, ..., n$,
3. _convex_ if it is both affine and conic.

#cblock[
  == Euclidean Norm (Def. 1.11)

  $
    norm(bold(v)) := sqrt(bold(v) dot bold(v)) = sqrt(v_1^2 + v_2^2 + ... + v_n^2).
  $

  To _normalize_ a vector, i.e. make it of _length_ one, we can divide by the Euclidean norm: $bold(v)' = bold(v) \/ norm(bold(v))$.
]

#cblock[
  == Dot Product and Angles (Def. 1.14)

  The angle $alpha$ between two non-zero vectors $bold(v)$ and $bold(w)$ is

  $ cos(alpha) = (bold(v) dot bold(w)) / (norm(bold(v)) norm(bold(w))), $

  where $-1 <= alpha <= 1$.
]

#cblock(fill: luma(240))[
  == Prove Formula Defines a Scalar Product

  Let $bold(A) = mat(3, -1; -1, 3)$. Prove that the following formula defines a scalar product in $V = RR^2$:
  $ chevron.l bold(x), bold(y) chevron.r_bold(A) = chevron.l vec(x_1, x_2), vec(y_1, y_2) chevron.r_bold(A) = vec(x_1, x_2)^T bold(A) vec(y_1, y_2). $

  #line(length: 100%, stroke: 0.75pt)

  To be a scalar product, three conditions must be satisfied:

  1. *Symmetry:* Since $bold(A)^T = bold(A)$, the matrix is symmetric. Thus,
  $ chevron.l bold(x), bold(y) chevron.r_bold(A) = bold(x)^T bold(A) bold(y) = (bold(x)^T bold(A) bold(y))^T = bold(y)^T bold(A)^T bold(x) = bold(y)^T bold(A) bold(x). $

  2. *Bilinearity:* Linearity in the first argument holds due to distributivity of matrix multiplication:
  $ (alpha bold(x) + beta bold(z))^T bold(A) bold(y) &= (alpha bold(x)^T + beta bold(z)^T) bold(A) bold(y) \ &= alpha bold(x)^T bold(A) bold(y) + beta bold(z)^T bold(A) bold(y). $

  3. *Positive Definiteness:* We determine if $bold(A)$ is Positive Definite by checking its eigenvalues via $det(bold(A) - lambda I) = 0$:
  $ det mat(3-lambda, -1; -1, 3-lambda) = (3-lambda)^2 - 1 = lambda^2 - 6lambda + 8 = (lambda - 4)(lambda - 2). $
  The eigenvalues are $lambda_1 = 4$ and $lambda_2 = 2$. Since all eigenvalues are strictly positive ($lambda_i > 0$), $bold(A)$ is Positive Definite. By Prop 9.2.12, this implies:
  $chevron.l bold(x), bold(x) chevron.r_bold(A) = bold(x)^T bold(A) bold(x) > 0 quad forall bold(x) != 0.$
]

=== Cauchy-Schwarz (Lemma 1.12)

For any two vectors $bold(v), bold(w) in RR^m$

$ abs(bold(v) dot bold(w)) <= norm(bold(v)) dot norm(bold(w)). $

Equality holds when one is a scalar multiple of the other.

=== Triangle Inequality (Lemma 1.17)

Let $bold(v), bold(w) in RR^m$. Then

$ norm(bold(v) + bold(w)) <= norm(bold(v)) + norm(bold(w)). $

=== Orthogonal Vectors (Def. 1.15)

Let $bold(v), bold(w) in RR^m$. $bold(v)$ and $bold(w)$ are orthogonal if and only if

$ bold(v) dot bold(w) = 0, $

i.e., the angle between them is $alpha = 90°$.

#cblock[
  == Linear Independence (Cor. 1.23)

  Let $bold(v)_1, bold(v)_2, ..., bold(v)_n in RR^m$. They are linearly indepedent if

  1. none of the vectors is a linear combination of the other ones,
  2. there are no scalars $lambda_1, lambda_2, ..., lambda_n$ besides $0, 0, ..., 0$ such that $sum_(j=1)^n lambda_j bold(v)_j = bold(0)$,
  3. none of the vectors is a linear combination of the previous ones.

  Following, the columns of a matrix $A$ are linearly independent if there is no $bold(x)$ besides $bold(0)$ such that $A bold(x) = 0$.
]

== The Span (Def. 1.25)

Let $bold(v)_1, bold(v)_2, ..., bold(v)_n in RR^m$, their Span is defined as the set of all linear combination, i.e.,

$
  "Span"(bold(v)_1, bold(v)_2, ..., bold(v)_n) := { sum_(j=1)^n lambda_j bold(v)_j : lambda_j in RR forall j in [n] }.
$

#cblock(fill: luma(240))[
  == Example

  Let $bold(v) = vec(v_1, v_2) "and" bold(w) = vec(w_1, w_2) in RR^2$ be arbitrary and assume $bold(v) != 0 "and" bold(w) != lambda bold(v), forall lambda in RR$. Show that $"Span"(bold(v), bold(w)) = RR^2$.

  #line(length: 100%, stroke: 0.75pt)

  To show this, prove that there are $lambda$ and $mu$ for each $bold(u) in RR^2$ such that $bold(u) = lambda bold(v) + mu bold(w)$, i.e. $ vec(u_1, u_2) = lambda vec(v_1, v_2) + mu vec(w_1, w_2) => cases(delim: #none, (1) & u_1 = lambda v_1 + mu w_1, (2) & u_2 = lambda v_2 + mu w_2). $ Assume $v_1 != 0$, thus from $(1)$ follows $ lambda = (u_1 - mu w_1) / v_1. $ Using this in $(2)$ (assuming $w_2 - (v_2 w_1) / v_1 != 0$), we get $ u_2 = ((u_1 - mu w_1) / v_1) v_2 + mu w_2 => mu = (u_2 - (u_1 v_2) / v_1) / (w_2 - (v_2 w_1) / v_1). $ Thus, choosing $lambda$ and $mu$ is possible for all $bold(u) in RR^2$.
]
