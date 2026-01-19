= Vector and Matrix Norms

== Vector Norms

For $1 <= p <= infinity$, the $l_p$ norm is given by $ norm(bold(x))_p = (sum_(i=1)^n abs(x_i)^p)^(1/p), $ for $p < infinity$, and $norm(bold(x))_infinity = max_i abs(x_i)$.

In particular let $norm(bold(x))_p$ for $p = 1$ denote the _Manhattan distance_.

=== Relations (Prop. 10.0.1)
For all $bold(x) in RR^n$,
$norm(bold(x))_2 <= norm(bold(x))_1 <= sqrt(n) norm(bold(x))_2$

== Matrix Norms (Def. 10.0.2)

Let $A in RR^(m times n)$ then consider

$
  &"Frobenius norm" &&norm(A)_F := sqrt(sum_(i=1)^m sum_(j=1)^n A_(i j)^2) \ &"operator/spectral norm" &&norm(A)_"op" := max_(bold(x) in RR^n "s.t." norm(x) = 1) norm(A bold(x))
$

=== Properties with Singular Values (Prop. 10.0.3)
Given singular values $sigma_1 >= ... >= sigma_"min"{m,n}$ of $A$:
1. $norm(A)_F^2 = "Tr"(A^T A) = sum_(i) sigma_i^2$
2. $norm(A)_"op" = sigma_1$
3. $norm(A)_"op" <= norm(A)_F <= sqrt(min{m,n}) norm(A)_"op"$