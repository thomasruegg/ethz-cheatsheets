= Vector and Matrix Norms

== Vector Norms

For $1 <= p <= infinity$, the $l_p$ norm is given by $ norm(bold(x))_p = (sum_(i=1)^n abs(x_i)^p)^(1/p), $ for $p < infinity$, and $norm(bold(x))_infinity = max_i abs(x_i)$.

In particular let $norm(bold(x))_p$ for $p = 1$ denote the _Manhatten distance_.

== Matrix Norms (Def. 8.2.1)

Let $A in RR^(m times n)$ then consider

$
  &"Frobenius norm" &&norm(A)_F := sqrt(sum_(i=1)^m sum_(j=1)^n A_(i j)^2) \ &"operator/spectral norm" &&norm(A)_"op" := max_(bold(x) in RR^n "s.t." norm(x) = 1) norm(A bold(x))
$

