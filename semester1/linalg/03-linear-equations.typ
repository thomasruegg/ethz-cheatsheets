#let cblock(content, fill: rgb("#FDFFB6")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)
#set grid(inset: 2.5pt, align: left)

#cblock[
  = Linear Equations

  A system of $m$ linear equations in $n$ variables,

  $
          a_11 x_1 + a_12 x_2 + ... + a_(1 n) x_n & = b_1 \
          a_21 x_1 + a_22 x_2 + ... + a_(2 n) x_n & = b_2 \
                                                  & dots.v \
    a_(m 1) x_1 + a_(m 2) x_2 + ... + a_(m n) x_n & = b_m,
  $

  can be expressed using matrices in the shape $A bold(x) = bold(b)$:

  $
    mat(a_11, a_12, ..., a_(1 n); a_21, a_22, ..., a_(2 n); dots.v, dots.v, dots.down, dots.v; a_(m 1), a_(m 2), ..., a_(m n);) vec(x_1, x_2, dots.v, x_n) = vec(b_1, b_2, dots.v, b_m).
  $
]
== Gauss Elimination

=== Back Substitution

We can directly solve $A bold(x) = bold(b)$, when $A$ is an _upper triangular_ matrix by solving the equations in reverse order.

#align(
  center,
  grid(
    columns: 2,
    [
      $
        lr(mat(2, 3, 4; 0, 5, 6; 0, 0, 7;) vec(x_1, x_2, x_3) = vec(19, 17, 14)})
      $
    ],
    [
      Solve for $x_3$ first and then work your way up (_backwards_ substitution).
    ],
  ),
)

=== Elimination

#align(
  center,
  grid(
    columns: 2,
    [
      Transform $A x = b$ to $U x = c$, where $U$ is upper triangular, by performing
      1. _row exchanges_,
      2. _scalar multiplication_,
      3. _row subtraction_.
    ],
    grid.vline(stroke: 0.5pt),
    [
      $
        mat(augment: #(-1), u_11, ..., , , c_1; 0, u_22, ..., , c_2; 0, 0, dots.down, ..., dots.v; 0, 0, ..., u_(r m), c_r; dots.v, dots.v, dots.down, dots.v, dots.v; 0, 0, ..., 0, c_m;)
      $
    ],
  ),
)

#cblock[Crucially, $A bold(x) = bold(b)$ and $U bold(x) = bold(c)$ have the same solutions (Lemma 3.2).] // Updated from 3.3

=== Elimination and Permutation Matrices

Elmination and row exchanges requires matrices as _linear combinations of the rows_ (multiply from the _left_).

#align(
  center,
  grid(
    columns: 2,
    [
      row 2 minus $c dot$ row $1$

      $ E_21 = mat(1, 0, 0; -c, 1, 0; 0, 0, 1;). $
    ],
    grid.vline(stroke: 0.5pt),
    [
      exchange row $2$ and row $3$

      $ P_23 = mat(1, 0, 0; 0, 0, 1; 0, 1, 0;). $
    ],
  ),
)

== Inverse Matrices (Def. 2.57) // Updated from 3.7

Let $M in RR^(m times m)$, $M$ is invertible, if there exists an $M^-1 in RR^(m times m)$ such that $ M M^(-1) = M^(-1) M = I. $

For invertible matrices, the following hold

1. inverses are unique, i.e. if $A M = M A = I$ and $B M = M B = I$, $A = B$ (Obs. 2.56), // Updated from Lemma 3.8
2. if $A$ and $B$ are invertible, then $(A B)^(-1) = B^(-1) A^(-1)$ (Lemma 2.59), // Updated from 3.9
3. if $A$ is invertible, then $(A^T)^(-1) = (A^(-1))^T$ (Lemma 2.60). // Updated from 3.10

#cblock[
  === Inverse Theo. (Lemma 2.53 / Theo. 3.8) // Updated from 3.11

  Let $A in RR^(m times m)$, the following is equivalent

  1. A is invertible,
  2. For every $b in RR^m$, $A bold(x) = bold(b)$ has a unique solution $bold(x)$,
  3. The columns of $A$ are linearly independent.
]

#cblock(fill: luma(240))[
  === Example

  Given $A, B in RR^(m times m)$ such that $A B = I$, prove $B A = I$.

  #line(length: 100%, stroke: 0.75pt)

  1. Show $B$ has linearly independent columns: Let $bold(x) in RR^m$ such that $B bold(x) = 0$, then $ bold(x) = I bold(x) = A B bold(x) = A bold(0) = bold(0). $ Hence by Obs. 2.5(ii), they are linearly independent. // Updated reference
  2. Show $A$ also has linearly independent colums: Let $bold(y) in RR^m$ such that $A bold(y) = 0$, then by Theorem 3.8 there is some $bold(x) in RR^m$ such that $B bold(x) = bold(y)$, then $ bold(y) = B bold(x) = B(I bold(x)) = B(A B bold(x)) = B(A bold(y)) = B bold(0) = bold(0). $
  3. Show $B A - I = bold(0)$: $ A(B A - I) = A B A - A = I A - A = bold(0). $ Thus, $B A = I$.
]

=== Inverse of a $2 times 2$ matrix

Let $A = mat(a, b; b, c;)$, then $ A^(-1) = 1/(a d - b c) mat(d, -b; -c, a;) ("if" a d - b c != 0). $

=== Inverse of a $n times n$ matrix (easy way)

We compute $A^(-1)$ by running Gauss-Jordan elimination on the augmented matrix $(A | I)$. If $A$ reduces to $I$, the right side becomes $A^(-1)$ (Theorem 3.19).

==== Inverse Formula (Prop. 7.3.3)

Let $A in RR^(n times n)$ with $"det"(A) != 0$. Then
$ A^(-1) = 1 / "det"(A) C^T, $
where $C$ is the matrix of _cofactors_, with entries $C_(i j) = (-1)^(i+j) "det"(A_(i j))$ (Def. 7.3.1).
Here, $A_(i j)$ is the $(n-1) times (n-1)$ submatrix obtained by removing row $i$ and column $j$ from $A$.


// == LU Decomposition (Theo. 3.13)

// Let $A in RR^(m times m)$. If Gauss succeeds on $A$ without row exchanges, resulting in $U$. Then $L = E^(-1)$, where $E$ is the product of all elimination matrices and $A = L U$.

// #align(
//   center,
//   grid(
//     align: horizon,
//     columns: 2,
//     [
//       $
//         E^(-1) = mat(1, , , ; c_21, 1, , ; dots.v, , dots.down, ; c_(m 1), ..., c_(m, m-1), 1;)
//       $
//     ],
//     grid.vline(stroke: 0.5pt),
//     [
//       $c_(i j)$ is the multiple of row $j$ subtracted from row $i$.
//     ],
//   ),
// )

// == LUP Decomposition (Theo. 3.18)

// Otherwise, $P A = L U$, where $P$ is the product of all permutation matrices.

== Gauss-Jordan Elimination

=== Reduced Row Echelon Form (Def. 3.13)

Let $M in RR^(m times n)$ with rank $r$, $M$ is in RREF, if

1. it contains the unit vectors $e_0, ..., e_r$ as its columns in ascending order,
2. the columns in between contain values only up to the $i$-th row, where $i$ refers to the index of the most recent unit vector.

#cblock[
  === Solving $A bold(x) = bold(b)$ (Theorem 3.20)

  We add the following step to Gauss Elimination:

  1. multiply each row with a pivot $p$ with $1\/p$ $=>$ $p = 1$
  2. eliminate any value above the pivot
  3. (at the end remove any zero-rows, $R_0 -> R$)

  Then $A bold(x) = bold(b)$ has solution if $b_i = 0$ $forall i > r$. Then $bold(x)$ is equal to the _direct solution_ where $ x_i = cases(b_i "if" j = j_i, 0 "otherwise"). $
]