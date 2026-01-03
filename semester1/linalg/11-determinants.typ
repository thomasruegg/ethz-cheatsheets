#let cblock(content, fill: rgb("#FF8ECC")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

#cblock[
  = Determinant (Def. 6.0.6)

  Let $A in RR^(n times n)$, the determinant $"det"(A)$ is defined as $ "det"(A) = sum_(sigma in Pi_n) "sgn"(sigma)Pi_(i=1)^n A_(i, sigma(i)), $ where $Pi_n$ is the set of all permutations of $n$ elements. Morever,

  #grid(
    columns: 2,
    inset: 2pt,
    gutter: 2pt,
    align: horizon,
    [$"det"(A^T) = "det"(A)$], [(Theo. 6.0.9)],
    [If $A$ is triangular, $"det"(A) = Pi_(k=1)^n A_(k k)$], [(Prop. 6.0.8)],
    [If $A$ is orthogonal, $"det"(A) = 1 "or" -1$], [(Prop. 6.0.10)],
    [$A$ is invertible if and only if $"det"(A) != 0$], [(Prop. 6.0.11)],
    [If $"det"(A) != 0$, $"det"(A^(-1)) = 1 / "det"(A)$], [(Prop 6.0.13)],
    [Given some $B in RR^(n times n)$, $"det"(A B) = "det"(A) dot "det"(B)$],
    [(Prop. 6.0.12)],
  )
]

== Determinant of a $2 times 2$ Matrix

Let $A = mat(a, b; c, d;)$, then $"det"(A) = a d - b c$.

== Det. through Co-Factors

=== Co-Factors (Def. 6.0.15)

Let $A in RR^(n times n)$, for each $1 <= i, j <= n$, let $cal(A)_(i j)$ denote the matrix obtained by removing the $i$-th row and $j$-th column from $A$. The co-factors or $A$ are $ C_(i j) = (-1)^(i+j) "det"(cal(A)_(i j)). $

#cblock[
  === Determinant (Prop. 6.0.16)

  We can then rewrite the determinant of $A$ as $ "det"(A) = sum_(j=1)^n A_(i j) C_(i j), $ for some $1 <= i <= n$.
]

== Cramer's Rule (Prop. 6.0.19)

Let $A in RR^(n times n)$, such that $"det"(A) != 0$ and $bold(b) in RR^n$. Then the solution $bold(x) in RR^n$ for $A bold(x) = bold(b)$ is given by $ x_j = "det"(cal(B)_j) / "det"(A), $ where $cal(B)_j$ is the matrix obtained by replacing the $j$-th column of $A$ with $bold(b)$.

== Lineary of the Determinant (Prop. 6.0.22)

The determinant is linear in each row and each column, i.e., $ mat(delim: "|", bar.h, alpha_0 a_0^T + alpha_1 a_1^T, bar.h; bar.h, a_2^T, bar.h; , dots.v, ; bar.h, a_n^T, bar.h;) = alpha_0 vec(delim: "|", bar.h a_0^T bar.h, bar.h a_2^T bar.h, dots.v, bar.h a_n^T bar.h) + alpha_1 vec(delim: "|", bar.h a_1^T bar.h, bar.h a_2^T bar.h, dots.v, bar.h a_n^T bar.h). $

#cblock(fill: luma(240))[
  == Example

  Let $bold(v)_1, bold(v)_2, bold(u)_1, bold(u)_2 in RR^n$ and $M in RR^((n-2) times n)$ be arbitrary and consider the four $n times n$ matrices $ A &= vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_1^T bar.h, M), B = vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_2^T bar.h, M), \ C &= vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_1^T bar.h, M), D = vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_2^T bar.h, M) $ as well as the following $n times n$ matrix $ E = vec(bar.h (bold(v)_1 - bold(v)_2)^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M). $ Find a formula for $"det"(E)$ in terms of $"det"(A)$, $"de"(B)$, $"det"(C)$ and $"det"(D)$. #line(length: 100%, stroke: 0.75pt) Use Prop. 6.0.22 to get $ "det"(A) - "det"(B) &= "det" vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_1^T bar.h, M) - "det" vec(bar.h bold(v)_1^T bar.h, bar.h bold(u)_2^T bar.h, M) \ &= "det" vec(bar.h bold(v)_1^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) $ and $ "det"(C) - "det"(D) &= "det" vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_1^T bar.h, M) - "det" vec(bar.h bold(v)_2^T bar.h, bar.h bold(u)_2^T bar.h, M) \ &= "det" vec(bar.h bold(v)_2^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) $ together this gives us $ "det" vec(bar.h bold(v)_1^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) - "det" vec(bar.h bold(v)_2^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M) \ = "det" vec(bar.h (bold(v)_1 - bold(v)_2)^T bar.h, bar.h (bold(u)_1 - bold(u)_2)^T bar.h, M). $ Hence, $"det"(E) = "det"(A) - "det"(B) - ("det"(C) - "det"(D))$.
]
