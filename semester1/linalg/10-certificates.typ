#let cblock(content) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: rgb("#FCEFB4"),
  content,
)

#cblock[
  = Certificate of Unsolvability (Theorem 6.2.4)

  Let $A in RR^(m times n)$ and $bold(b) in RR^m$. The system of linear equations has no solution iff there exists vector $bold(z)$ s.t.:
  $
    {bold(x) in RR^n | A bold(x) = bold(b)} = emptyset \ <==> {bold(z) in RR^m | A^T bold(z) = bold(0), bold(b)^T bold(z) = 1} != emptyset
  $
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
where $bold(x)_r$ is the *unique* vector in the row space $R(A) = C(A^T)$ such that $A bold(x)_r = bold(b)$. This is because every solution $bold(x)$ is a mix of two perpendicular parts:
$ bold(x) = underbrace(bold(x)_r, "Row Space (unique)") + underbrace(bold(x)_n, "Nullspace (any)") $

1. *The "Pure" Solution ($bold(x)_r$):*
  There is exactly one solution living entirely in the Row Space (the "Active Zone" of $A$). This is the solution with the _shortest length_ because it contains no "waste."

2. *The "Invisible" Noise ($bold(x)_n$):*
  You can add _any_ vector $bold(x)_n$ from the Nullspace to $bold(x)_r$ without changing the result.
  *Why?* Because the matrix is blind to it:
  $ A(bold(x)_r + bold(x)_n) = A bold(x)_r + A bold(x)_n = bold(b) + 0 = bold(b) $

