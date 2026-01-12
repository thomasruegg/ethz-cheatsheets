#let cblock(content, fill: rgb("#FF8ECC")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

#cblock[
  = Determinant (Def. 7.2.3)

  Let $A in RR^(n times n)$, the determinant $"det"(A)$ is defined as $ "det"(A) = sum_(sigma in Pi_n) "sgn"(sigma)Pi_(i=1)^n A_(i, sigma(i)), $ where $Pi_n$ is the set of all permutations of $n$ elements. Moreover,

  #grid(
    columns: 2,
    inset: 2pt,
    gutter: 2pt,
    align: horizon,
    [$"det"(I) = 1$], [(Prop. 7.2.4)],
    [If $A in RR^(1 times 1)$, $"det"(A) = A$], [(Def. 7.2.3)],
    [$"det"(A^T) = "det"(A)$], [(Theo. 7.2.5)],
    [If $A$ is triangular, $"det"(A) = Pi_(k=1)^n A_(k k)$], [(Prop. 7.2.4)],
    [If $A$ is orthogonal, $"det"(A) = 1 "or" -1$], [(Prop. 7.2.4)],
    [$A$ is invertible if and only if $"det"(A) != 0$], [(Theo. 7.2.6)],
    [If $"det"(A) != 0$, $"det"(A^(-1)) = 1 / "det"(A)$], [(Theo. 7.2.6)],
    [Given some $B in RR^(n times n)$, $"det"(A B) = "det"(A) dot "det"(B)$], [(Theo. 7.2.6)],
  )
]

- $det(A+B) != det(A) + det(B)$
- If any two rows are equal, then $det(A) = 0$.
- If $A$ has a row of zeros, then $det(A) = 0$.
- If any Eigenvalue of $A$ is $0$, then $det(A) = 0$.
- If we swap the rows of $A -> B$ once, then $det(B) = -det(A)$ (Prop. 7.3.6).
- The determinant is a linear function of each row separately. 
  - If a single row of $A$ is multiplied by some scalar $t$, then \ $det(A') = t dot det(A)$. 
    - If the whole matrix is multiplied by $t$ (i.e. all $n$ rows are multiplied by $t$), then $det(t dot A) = t^n dot det(A)$.
  - If a row of $A$ is replaced by the sum of itself and a multiple of another row, the determinant stays unchanged.

== Determinant of a $2 times 2$ Matrix

Let $A = mat(a, b; c, d;)$, then $"det"(A) = a d - b c$.

== Det. through Co-Factors

=== Co-Factors (Def. 7.3.1)

Let $A in RR^(n times n)$, for each $1 <= i, j <= n$, let $cal(A)_(i j)$ denote the matrix obtained by removing the $i$-th row and $j$-th column from $A$. The co-factors or $A$ are $ C_(i j) = (-1)^(i+j) "det"(cal(A)_(i j)). $

#cblock[
  === Determinant (Prop. 7.3.2)

  We can then rewrite the determinant of $A$ as $ "det"(A) = sum_(j=1)^n A_(i j) C_(i j), $ for some $1 <= i <= n$. As in make a $+-+...$ grid, pick a row or column and calculate $plus.minus A_(i,j) det(...)$ for that whole row or column recursively.
]

== Cramer's Rule (Prop. 7.3.5)

Let $A in RR^(n times n)$, such that $"det"(A) != 0$ and $bold(b) in RR^n$. Then the solution $bold(x) in RR^n$ for $A bold(x) = bold(b)$ is given by $ x_j = "det"(cal(B)_j) / "det"(A), $ where $cal(B)_j$ is the matrix obtained by replacing the $j$-th column of $A$ with $bold(b)$.

== Lineary of the Determinant (Prop. 7.3.7)

The determinant is linear in each row or each column, i.e., $ mat(delim: "|", bar.h, alpha_0 a_0^T + alpha_1 a_1^T, bar.h; bar.h, a_2^T, bar.h; , dots.v, ; bar.h, a_n^T, bar.h;) = alpha_0 vec(delim: "|", bar.h a_0^T bar.h, bar.h a_2^T bar.h, dots.v, bar.h a_n^T bar.h) + alpha_1 vec(delim: "|", bar.h a_1^T bar.h, bar.h a_2^T bar.h, dots.v, bar.h a_n^T bar.h). $

#cblock(fill: luma(240))[
  == Example

  Let $bold(v)_1, bold(v)_2, bold(u)_1, bold(u)_2 in RR^n$ and $M in RR^((n-2) times n)$ be arbitrary and consider the four $n times n$ matrices $ A &= vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_1^T bar.h, M), B = vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_2^T bar.h, M), \ C &= vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_1^T bar.h, M), D = vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_2^T bar.h, M) $ as well as the following $n times n$ matrix $ E = vec(bar.h (bold(v)_1 - bold(v)_2)^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M). $ Find a formula for $"det"(E)$ in terms of $"det"(A)$, $"det"(B)$, $"det"(C)$ and $"det"(D)$. #line(length: 100%, stroke: 0.75pt) Use Prop. 7.3.7 to get $ "det"(A) - "det"(B) &= "det" vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_1^T bar.h, M) - "det" vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_2^T bar.h, M) \ &= "det" vec(bar.h bold(v)_1^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) $ and $ "det"(C) - "det"(D) &= "det" vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_1^T bar.h, M) - "det" vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_2^T bar.h, M) \ &= "det" vec(bar.h bold(v)_2^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) $ together this gives us $ "det" vec(bar.h bold(v)_1^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) - "det" vec(bar.h bold(v)_2^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) \ = "det" vec(bar.h (bold(v)_1 - bold(v)_2)^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M). $ Hence, $"det"(E) = "det"(A) - "det"(B) - ("det"(C) - "det"(D))$.
]