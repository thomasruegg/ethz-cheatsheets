#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#FFADAD"),
  content,
)

= Orthogonality

== Orthogonal Subspaces (Def. 5.1.1)

Two subspaces $V$ and $W$ are orthogonal if for all $bold(v) in V$ and $bold(w) in W$, $v dot w = 0$.

More specifically, this also holds for the bases, i.e., let $v_1,...,v_k$ be a basis of $V$ and $w_1,...,w_l$ be a basis of $W$. $V$ and $W$ are orthogonal if and only if $v_i dot w_j = 0$ $forall i in [k] "and" j in [l]$ (Lemma 5.1.2).

== Orthogonal Complement (Def. 5.1.5)

Let $V$ be a subspaces of $RR^n$, the orthogonal complement to $V$,

$
  V^bot := {bold(w) in RR^n : bold(w) dot bold(v) = 0 "for all" bold(v) in V}.
$

#cblock[
  == Orthogonal Decomp. (Theo. 5.1.7)

  Let $V$, $W$ be subspaces of $RR^n$, then these are equivalent

  1. $W = V^bot$,
  2. $"dim"(V)+"dim"(W) = n$,
  3. Every $bold(u) in RR^n$ can be written as $bold(u) = bold(v) + bold(w) "with" bold(v) in V " and" bold(w) in W$.
]

#cblock[
  == Orthogonal Matrix Subspaces (Cor. 5.1.9)

  Let $A in RR^(m times n)$, then
  1. $"N"(A) = "C"(A^T)^bot$,
  2. $"C"(A^T) = "N"(A)^bot$.
]

#cblock[
  == Decomp. of the Sol. Space (Theo. 5.1.10)

  Let $A in RR^(m times n)$ and $bold(b) in RR^m$. $"Sol"(A, bold(b)) = bold(x)_1 + "N"(A)$ with $bold(x)_1 in "R"(A)$ such that $A bold(x)_1 = b$.
]
