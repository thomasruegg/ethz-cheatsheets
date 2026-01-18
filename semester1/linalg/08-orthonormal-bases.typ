#let cblock(content, fill: rgb("#FFAAFF")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

= Orthonormal Bases

== Orthonormal Vectors (Def. 6.3.1)

Vectors $bold(q)_1, ..., bold(q)_n in RR^m$ are orthonormal if they are orthogonal and have norm $1$, i.e., if for all $i, j in [n]$ $ bold(q)_i dot bold(q)_j = cases(1 "if" i = j, 0 "otherwise"). $

#cblock[
  == Orthogonal Matrix (Def. 6.3.3)

  A square matrix $Q in RR^(n times n)$ is orthogonal when $Q^T Q = I$. Then $Q Q^T = I$ and the columns of $Q$ form an orthonormal basis of $RR^n$.

  Additionally, orthogonal matrices _preserve norm and dot product_, i.e., $ norm(Q bold(x)) = norm(bold(x)) "and" (Q bold(x))^T (Q bold(y)) = bold(x)^T bold(y), $

  for all $bold(x), bold(y) in RR^n$ (Prop. 6.3.6).
]

- If $A$ and $B$ are orthogonal, then so is $A B$.

#cblock[
  == Gram-Schmidt (Alg. 6.3.8)

  Given $n$ linearly independent vectors $a_1, ..., a_n$ that span $S$, $q_1, ..., q_n$ can be constructed as follows:

  1. $q_1 = a_1 / norm(a_1)$
  2. For $k = 2, ..., n$, $ q_k' & = a_k - sum_(i=1)^(k-1) underbrace((a_k^T q_i), R_(i k)) q_i
  quad --> quad 
  q_k & = q_k'/underbrace(norm(q_k'), norm(q_k')=R_(i i)). $

  The vectors $q_1, ..., q_n$ form an orthonormal basis of $S$ (Theorem 6.3.9).
]

#cblock(fill: luma(240))[
  == Example

  An upper triangular $n times n$ matrix with non-zero diagonals that does *not* yield the canonical basis after the Gram-Schmidt process is $-I$.
]

== QR-Decomposition (Def. 6.3.10)

Let $A in RR^(m times n)$ with linearly independent columns. $ A = Q R $ where $Q$ is an $m times n$ matrix with orthonormal columns and $R$ is an upper triangular matrix given by $R = Q^T A$. Use Gram-Schmidt on the columns of $A$ to get $Q$.

== Projections with QR (Fact 6.3.12)

1. Any projection on $C(A)$ can also be done by $Q$, following $"proj"_(C(A)) (bold(b)) = Q(Q^T Q)^(-1) Q^T bold(b) = Q Q^T bold(b)$.
2. The normal equation can be re-written as $ A^T A accent(x, hat) & = A^T b \
  R^T R accent(x, hat) & = R^T Q^T bold(b) " ("R^T "is invertible)" \
      R accent(x, hat) & = Q^T bold(b). "(useful for least squares)" $