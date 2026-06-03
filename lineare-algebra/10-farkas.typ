#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#FCEFB4"),
  content,
)

#cblock[
  = Farkas Lemma (Theoerem 5.6.7)

  Let $A in QQ^(m times n)$ and $bold(b) in QQ^m$. Only one of the following is true

  1. $exists bold(x) >= 0 in RR^n "such that" A bold(x) <= bold(b)$,
  2. $exists bold(y) >= 0 in RR^m "such that" bold(y)^T A = 0 "and" bold(y)^T bold(b) < 0$.
]

== Polyhedron (Def. 5.6.1)

Let $A in QQ^(m times n)$ and $bold(b) in RR^m$, then $P = {bold(x) in RR^n | A bold(x) <= bold(b)}$ is a polyhedron. The projection of $P$ on the subspace $RR^s$ is $ "proj"_s (P) := {bold(x) in RR^s | exists bold(y) in RR^(n-s) "such that" (bold(x), bold(y)) in P}. $

== Elimination of a Variable

/* @typstyle off */
1. Partition the indicies $M = {1, ..., m}$ into
  - $M_0 = {i in M | a_(i, n) = 0}$,
  - $M_+ = {i in M | a_(i, n) > 0}$,
  - $M_- = {i in M | a_(i, n) < 0}$.
// @typstyle off
2.
  - For every $i in M_+$, multiply with $1/a_(i, n) => bold(x)_n <= d_i + f_i^T accent(bold(x), macron) "where" d_i = b_i/a_(i, n), f_(i j) = -a_(i j)/a_(i n)$.
  - For every $k in M_0 => 0 <= d_k + f_k^T accent(bold(x), macron) "where" d_k = b_k, f_(k, j) = -a_(k, j)$.
  - For every $i in M_-$, multiply with $1/a_(i n) => bold(x)_n >= d_i + f_i^T accent(bold(x), macron) "where" d_i = b_i/a_(i, n), f_(i j) = -a_(i j)/a_(i n)$.

3. $Q = {accent(bold(x), macron) in RR^(n-1) cases(delim: "|", 0 <= d_k + f_k^T accent(bold(x), macron) "for all" k in M_0, d_l + f_l^T accent(bold(x), macron) <= d_i + f_i^T accent(bold(x), macron) "for all" l in M_- "and" i in M_+)}$.

The set $Q$ is a polyhedron (Theo. 5.6.3).

== Algebraic Description

Let $A in QQ^(m times n)$, $bold(b) in QQ^m$ and $P = {bold(x) in RR^n | A bold(x) <= bold(b)}$. For $k in [j]$ let $A^(j)$ be the submatrix of $A$ with columns vectors $A_k$. Let $P^(0) = P$ and $C^(0) = RR^m_+$. For $i in [n]$, $ C^(i) &= {bold(y) in RR^m_+ | bold(y)^T A_k = 0 "for all" k = n - i + 1, ..., n} \ P^(i) &= {accent(bold(x), macron) in RR^(n-i) | bold(y)^T A^(n-i) accent(bold(x), macron) <= bold(y)^T bold(b) "for all" bold(y) in C^(i)}. $

This allows us to describe the projection a polyhedron as $"proj"_(S_(n-i)) (P) = P^(i)$ (Theo. 5.6.6).
