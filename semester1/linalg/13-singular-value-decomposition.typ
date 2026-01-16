#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#FCAB92"),
  content,
)

#cblock[
  = Singular Value Decomp. (Def. 9.3.1)

  Let $A in RR^(m times n)$. There exists orthogonal matrices $U in RR^(m times m)$ and $V in RR^(n times n)$ such that $ A = U Sigma V^T, $ where $Sigma in RR^(m times n)$ is a diagonal matrix whose entries $Sigma_(i i) = sigma_i$ are non-negative and ordered in descending order. Moreover,

  1. $U^T U = V^T V = I$.
  2. $sigma_1 >= ... >= sigma_"min"{m, n} >= 0$.
  3. The columns of $U$ are called the _left singular vectors_ and are orthonormal.
  4. The columns of $V$ are called the _right singular vectors_ and are orthonormal.
  5. The diagonal entries of $Sigma$ are called the _singular values_. The singular values of a matrix A are the square roots of the eigenvalues of the symmetric matrix $A^T A$ or $A A^T$.
]

#cblock[
  == Existence of SVD (Theo. 9.3.3)

  Every matrix $A in RR^(m times n)$ has a SVD. \ As in, *every linear transformation is diagonal when viewed in the bases of the singular vectors*.
]

== Compact Form (Remark 9.3.2)

If $A$ has rank $r$, the SVD can be written in a compact form: $ A = U_r Sigma_r V_r^T, $ where $U_r$ and $V_r$ contain the first $r$ left/right singular vectors respectively and $Sigma_r$ contains the first $r$ singular values (which are strictly positive).

== Calculating the SVD (Section 9.3)

Let $A in RR^(m times n)$ and $A = U Sigma V^T$ be its SVD, then $ A A^T = U (Sigma Sigma^T) U^T "and" A^T A = V (Sigma^T Sigma) V^T. $

In other words, the SVD of $A$ can be calculated by
1. Taking the eigendecomposition of $A A^T$ or $A^T A$.
2. $U=$ eigenvector matrix of $A A^T$,
3. $V=$ eigenvector matrix of $A^T A$,
4. $Sigma=$ descending ordered square roots of eigenvalues of $A A^T$ or $A^T A$.
5. If $A$ is invertible, then $A^(-1) = (U Sigma V^T)^(-1) = V^T^(-1) Sigma^(-1) U^(-1) = V Sigma^(-1) U^T$ (as $V^T V = I, U^T U = I$)
6. If $U,V$ are PSD $=>$ singular values are $>= 0$

== Rank $r$ Matrices (Prop. 9.3.4)

Let $A in RR^(m times n)$ with rank $r$ and $sigma_1, ..., sigma_r$ be the non-zero singular values of $A$, $bold(u)_1, ..., bold(u)_r$ the corresponding left singular vectors and $bold(v)_1, ..., bold(v)_r$ the corresponding right singular vectors. Then $A = sum_(k=1)^r sigma_k bold(u)_k bold(v)_k^T$.
