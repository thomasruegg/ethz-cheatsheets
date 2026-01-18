#let cblock(content, fill: rgb("#FCEFB4")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

#cblock[
  = Certificate of Unsolvability (Theo 6.2.4)

  Let $A in RR^(m times n)$ and $bold(b) in RR^m$. The system of linear equations has no solution iff there exists non-zero vector $bold(z)$ s.t.:
  $
    {bold(x) in RR^n | A bold(x) = bold(b)} = emptyset \ <==> {bold(z) in RR^m | A^T bold(z) = bold(0), bold(b)^T bold(z) = 1} != emptyset
  $
]

#cblock(fill: luma(240))[
  == Parametric Solvability Example
  For $A = mat(2, 1; 1, 3; 0, 2)$ and $B = vec(b_1, b_2, b_3)$. Find $b_i$ s.t. $A bold(x) + B y = bold(c)$ is solvable for all $bold(c)$.
  #line(length: 100%, stroke: 0.75pt)
  We know $A bold(x) + B y = bold(c)$ is solvable for all $bold(c)$ iff the only solution to $vec(A^top, B^top) bold(z) = bold(0)$ is with $bold(z)=bold(0)$.
  $ mat(2, 1, 0; 1, 3, 2; b_1, b_2, b_3) vec(z_1, z_2, z_3) = bold(0) ==> cases(
      2z_1 + z_2 &= 0,
      z_1 + 3z_2 + 2z_3 &= 0,
      b_1 z_1 + b_2 z_2 + b_3 z_3 &= 0
    ) 
  $
  $
  ==> cases(2z_1 = -z_2, z_1 + 3z_2 = -2z_3) ==> z_1 = -1/2 z_2, quad z_3 = -5/4 z_2 $
  Sub. into row 3: $b_1(-1/2 z_2) + b_2 z_2 + b_3(-5/4 z_2) = 0$.
  $ (-1/2 b_1 + b_2 - 5/4 b_3) z_2 = 0 $
  A non-zero $bold(z)$ can only exist if $(-1/2 b_1 + b_2 - 5/4 b_3) = 0$, which would mean $A bold(x) + B y = bold(c)$ is *not* solvable. But we want it to be solvable, so we must force $bold(z)$ to be 0, which is only possible if $-1/2 b_1 + b_2 - 5/4 b_3 != 0 ==> -2b_1 + 4b_2 - 5b_3 != 0$.
]

== The Algebraic Certificate
The vector $bold(z)$ serves as a "certificate" that $A bold(x) = bold(b)$ is impossible.
If both $bold(x)$ and $bold(z)$ existed, we would reach the following contradiction:
$ 0 = bold(0)^T bold(x) = (bold(z)^T A) bold(x) = bold(z)^T (A bold(x)) = bold(z)^T bold(b) = 1 $

== Characterizing Solvability

- *Row Independence:* If the rows of $A$ are linearly independent, then $A^T bold(z) = bold(0)$ only has the trivial solution $bold(z) = bold(0)$. Since $bold(b)^T bold(0) = 0 != 1$, a certificate $bold(z)$ can never exist. Therefore, $A bold(x) = bold(b)$ always has a solution for every $bold(b)$.
- *Linear Independence:* A vector $bold(b)$ is linearly independent from the columns of $A$ if and only if $A bold(x) = bold(b)$ has no solution, which can be verified by finding the certificate $bold(z)$.
To find $bold(z)$, use Gaussian elimination (RREF) on the augmented matrix: $ mat(A^T; bold(b)^T) bold(z) = mat(bold(0); 1). $

== The Set of All Solutions (Theorem 6.2.2)
If the system is solvable, the set of all solutions is a shifted copy of the nullspace:
$ {bold(x) in RR^n | A bold(x) = bold(b)} = bold(x)_r + N(A) $
where $bold(x)_r$ is the *unique* vector in the row space $R(A) = C(A^T)$ such that $A bold(x)_r = bold(b)$. This uniqueness is guaranteed because $A$ acts injectively on its row space (Lemma 6.2.1).

Every solution $bold(x)$ is a mix of two orthogonal parts:
$ bold(x) = underbrace(bold(x)_r, "Row Space (unique)") + underbrace(bold(x)_n, "Nullspace (any)") $

1. *The "Pure" Solution ($bold(x)_r$):*
  There is exactly one solution living entirely in the Row Space (the "Active Zone" of $A$). This is the solution with the _shortest length_ because it contains no "waste" (Lemma 6.4.5).

2. *The "Invisible" Noise ($bold(x)_n$):*
  You can add _any_ vector $bold(x)_n$ from the Nullspace to $bold(x)_r$ without changing the result.
  *Why?* Because the matrix is blind to it:
  $ A(bold(x)_r + bold(x)_n) = A bold(x)_r + A bold(x)_n = bold(b) + 0 = bold(b) $
