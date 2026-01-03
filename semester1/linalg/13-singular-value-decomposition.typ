#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#FCAB92"),
  content,
)

#cblock[
  = Singular Value Decomp. (Def. 8.1.1)

  Let $A in RR^(m times n)$. There exists orthogonal matrices $U in RR^(m times m)$ and $V in RR^(n times n)$ such that $ A = U Sigma V^T, $ where $Sigma in RR^(m times n)$ is a diagonal matrix whose entries are non-zero and ordered in descending order. Moreover,

  1. $U^T U = V^T V = I$.
  2. $sigma_1 >= ... >= sigma_"min"{m, n}$.
  3. The columns of $U$ are called the _left singular vectors_.
  4. The columns of $V$ are called the _right singular vectors_.
  5. The diagonal entries of $Sigma$ are called the _singular values_.
]

#cblock[
  == Existance of SVD (Theo. 8.1.5)

  Every matrix $A in RR^(m times n)$ has a SVD.
]

== Compact Form (Remark 8.1.2)

If $A$ has rank $r$, the SVD can be written in a compact form: $ A = U_r Sigma_R V_r^T, $ where $U_r$ and $V_r$ contain the first $r$ left/right singular vectors respectively and $Sigma_r$ contains the first $r$ singular values.

== Calculating the SVD (Remark 8.1.3)

Let $A in RR^(m times n)$ and $A = U Sigma V^T$ be its SVD, then $ A A^T = U (Sigma Sigma^T) U^T "and" A^T A = V (Sigma^T Sigma) V^T. $

#v(1cm)

In other words, the SVD of $A$ can be calculated by
1. Taking the eigendecomposition of $A A^T$ or $A^T A$.
2. Then $U$ corresponds to the eigenvectors of $A A^T$,
3. $V$ to the eigenvectors of $A^T A$,
4. $Sigma$ to the square roots of the shared eigenvalues.

== Rank $r$ Matrices (Prop. 8.1.4)

Let $A in RR^(m times n)$ with rank $r$ and $sigma_1, ..., sigma_r$ be the non-zero singular values of $A$, $bold(u)_1, ..., bold(u)_r$ the corresponding left singular vectors ane $bold(v)_1, ..., bold(v)_r$ the corresponding right singular vectors. Then $A = sum_(k=1)^r sigma_k bold(u)_k bold(v)_k^T$.


