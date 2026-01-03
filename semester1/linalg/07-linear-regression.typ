#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#8AF0BF"),
  content,
)

= Linear Regression

#cblock[
  == Least Squares Approximation

  A linear regression through the data points $(t_1, b_1), (t_2, b_2), ..., (t_m, b_m)$ can be expressed in algebraic terms as minimizing the sum of the squared errors,

  $
    min_(alpha_0, alpha_1) norm(bold(b) - A vec(alpha_0, alpha_1)), "where" bold(b) = vec(b_1, b_2, dots.v, b_m) "and" A = mat(1, t_1; 1, t_2; dots.v, dots.v; a, t_m).
  $

  This can be converted into $ vec(alpha_0, alpha_1) &= (A^T A)^(-1)A^T bold(b) \ &= mat(m, sum_(k=1)^m t_k; sum_(k=1)^m t_k, sum_(k=1)^m t_k^2;)^(-1) vec(sum_(k=1)^m b_k, sum_(k=1)^m t_k b_k). $
]

== Remark 5.3.3

If the columns of $A$ are pairwise orthogonal, then $A^T A$ is a diagonal matrix and we can further simply the expresion,

$
  vec(alpha_0, alpha_1) = mat(1 / m, 0; 0, 1 / (sum_(k=1)^m t_k^2)) vec(sum_(k=1)^m b_k, sum_(k=1)^m t_k b_k) = vec(1/m sum_(k=1)^m b_k, (sum_(k=1)^m t_k b_k) / (sum_(k=1)^m t_k^2))
$
