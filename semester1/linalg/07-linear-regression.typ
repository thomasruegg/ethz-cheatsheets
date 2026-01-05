#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#8AF0BF"),
  content,
)

= Linear Regression

#cblock[
  == Least Squares Approximation (Section 6.1)

  A linear regression through the data points $(t_1, b_1), (t_2, b_2), ..., (t_m, b_m)$ can be expressed in algebraic terms as minimizing the sum of the squared errors (where $alpha_0$ is the intercept, and $alpha_1$ the slope),

  $
    min_(alpha_0, alpha_1) norm(bold(b) - A underbrace(vec(alpha_0, alpha_1), bold(alpha))), "where" bold(b) = vec(b_1, b_2, dots.v, b_m) "and" A = mat(1, t_1; 1, t_2; dots.v, dots.v; 1, t_m).
  $

  To minimize error, the error vector must be orthogonal to columns of $A$, so the minimizer satisfies the *normal equations* (Fact 6.1.1):
  $
    A^T (bold(b)-A bold(alpha)) &= 0 \
    A^T A bold(alpha) &= A^T bold(b) quad "(\"normal equation\")" \
    bold(alpha) &= (A^T A)^(-1)A^T bold(b) \
    vec(alpha_0, alpha_1) &= mat(m, sum_(k=1)^m t_k; sum_(k=1)^m t_k, sum_(k=1)^m t_k^2;)^(-1) vec(sum_(k=1)^m b_k, sum_(k=1)^m t_k b_k).
  $

  Moreover, the columns of the $m times 2$ matrix $A$ are linearly dependent $<==>$ $t_i = t_j$ for all $i != j$ (Lemma 6.1.2).
]

== Remark 6.1.3

If the columns of $A$ are pairwise orthogonal (which corresponds to $sum_(k=1)^m t_k = 0$), then $A^T A$ is a diagonal matrix and we can further simply the expression,

$
  vec(alpha_0, alpha_1) = mat(1 / m, 0; 0, 1 / (sum_(k=1)^m t_k^2)) vec(sum_(k=1)^m b_k, sum_(k=1)^m t_k b_k) = vec(1/m sum_(k=1)^m b_k, (sum_(k=1)^m t_k b_k) / (sum_(k=1)^m t_k^2))
$