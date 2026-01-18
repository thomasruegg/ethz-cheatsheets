#let cblock(content, fill: rgb("#FFADAD")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

= Orthogonality

== Orthogonal Subspaces (Def. 5.1.1)

Two subspaces $V$ and $W$ are orthogonal if for all $bold(v) in V$ and $bold(w) in W$, $v dot w = 0$.

More specifically, this also holds for the bases, i.e., let $v_1,...,v_k$ be a basis of $V$ and $w_1,...,w_l$ be a basis of $W$. $V$ and $W$ are orthogonal if and only if $v_i dot w_j = 0$ $forall i in [k] "and" j in [l]$ (Lemma 5.1.2).

== Orthogonal Complement (Def. 5.1.5)

Let $V$ be a subspace of $RR^n$, the orthogonal complement to $V$ is defined as

$
  V^bot := {bold(w) in RR^n : bold(w) dot bold(v) = 0 "for all" bold(v) in V}.
$

  == Double Complement (Lemma 5.1.8)
  Let $V$ be a subspace of $RR^n$. Then:
  $V = (V^bot)^bot$


#cblock[
  == Orthogonal Decomp. (Theo. 5.1.7)

  Let $V$, $W$ be subspaces of $RR^n$, then these are equivalent

  1. $W = V^bot$,
  2. $"dim"(V)+"dim"(W) = n$,
  3. Every $bold(u) in RR^n$ can be written as $bold(u) = bold(v) + bold(w) "with" bold(v) in V " and" bold(w) in W$.
]

== Intersection of Orthogonal Subspaces (Cor. 5.1.4)
Let $V$ and $W$ be orthogonal subspaces. Then their intersection is trivially only at the origin:
$ V inter W = {0} $

#cblock[
  == Orthogonal Matrix Subspaces (Cor. 5.1.9 & Lemma 5.1.10)

  Let $A in RR^(m times n)$, then
  1. $"N"(A) = "C"(A^T)^bot$, also $N(A) = N(A^T A)$,
  2. $"C"(A^T) = "N"(A)^bot$, also $C(A^T) = C(A^T A)$.
]

// #cblock(fill: luma(240))[
//   *Proof $N(A) = C(A^T)^bot$:*
//   Let $bold(x) in N(A)$, then $A bold(x) = bold(0)$. For any $bold(y) in RR^m$, we have $(A^T bold(y)) dot bold(x) = bold(y)^T (A bold(x)) = bold(y)^T bold(0) = 0$, thus $bold(x) in C(A^T)^bot$. \

//   *Proof $N(A) = N(A^T A)$:*
//   Let $bold(x) in N(A)$, then $A bold(x) = bold(0)$, so $A^T A bold(x) = A^T bold(0) = bold(0)$, thus $bold(x) in N(A^T A)$. Conversely, let $bold(x) in N(A^T A)$, then $A^T A bold(x) = bold(0)$, so $bold(x)^T A^T A bold(x) = 0$, which implies $A bold(x)^T A bold(x) = 0$, hence $A bold(x) = 0$, so $bold(x) in N(A)$.

//   *Proof $C(A^T) = C(A^T A)$:*
//   $C(A^T) = N(A)^bot = N(A^T A)^bot = C((A^T A)^T) = C(A^T A)$.
// ]

#cblock[
  == Decomp. of the Sol. Space (Theo. 6.2.2)

  Let $A in RR^(m times n)$ and $bold(b) in RR^m$. $"Sol"(A, bold(b)) = bold(x)_1 + "N"(A)$ with $bold(x)_1 in "R"(A)$ such that $A bold(x)_1 = b$.
]