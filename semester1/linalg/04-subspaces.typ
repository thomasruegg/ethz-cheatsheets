#let cblock(content, fill: rgb("#FFD6A5")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

= The Four Fundamental Subspaces

== Vectorspaces (Def. 4.1)

A vector space is a triple $(V, +, dot)$, where

1. $V$ is a set,
2. $+ : V times V -> V$ a function (vector addition),
3. $dot : RR times V -> V$ a function (scalar multiplication).

Such that they satisfy

1. $bold(v) + bold(w) = bold(w) + bold(v)$ #h(1fr) (commutativity)
2. $bold(u) + (bold(v) + bold(w)) = (bold(u) + bold(v)) + bold(w)$ #h(1fr) (associativity)
3. There is $bold(0)$ such that $bold(v) + bold(0) = bold(v)$ for all $bold(v)$ #h(1fr) (zero vector)
4. There is $-bold(v)$ such that $bold(v) + (-bold(v)) = 0$ for all $bold(v)$ #h(1fr) (inverse)
5. $1 dot bold(v) = bold(v)$ for all $bold(v)$ #h(1fr) (identity)
6. $(lambda dot mu) bold(v) = lambda (mu bold(v))$ #h(1fr) (compatability in $RR$)
7. $lambda(bold(v) + bold(w)) = lambda bold(v) + lambda bold(w)$ #h(1fr) (distributivity over $+$)
8. $(lambda + mu)bold(v) = lambda bold(v) + mu bold(v)$ #h(1fr) (distributivity over $+$ in $RR$)

== Subspaces (Def. 4.8)

Let $V$ be a vector space, a non-empty subset $U subset.eq V$ is called a subspace of $V$ if $forall bold(v), bold(w) in U$ and $lambda in RR$.

1. $bold(v) + bold(w) in U$,
2. $lambda bold(v) in U$.

#cblock(fill: luma(240))[
  == Example

  Let $V subset.eq RR^m$, show that $V$ is a subspace of $RR^m$.

  #line(length: 100%, stroke: 0.75pt)

  1. Show that $bold(v) + bold(w) in V$ for all $bold(v), bold(w) in V$.
  2. Show that $lambda bold(v) in V$ for all $bold(v) in V$ and $lambda in RR$.

]

#cblock(fill: luma(240))[
  == Example

  Let $V$ be a vector space and $U, W$ subspaces of $V$. Show that $U union W$ is a subspace of $V$ $<==>$ $U subset.eq W$ or $W subset.eq U$.

  #line(length: 100%, stroke: 0.75pt)

  "$<==$": Assume $U subset.eq W$, then $U union W = W$, which is a subspace of $V$ be assumption. (Analogous for $W subset.eq U$).
  "$==>$": Assume $U union W$ is a subspace of $V$ and $W subset.eq.not U$, then there is some $bold(w) in W without U$. Let $bold(u) in U$ be arbitrary, then $bold(w) + bold(u) in W union U$. If $bold(w) + bold(u) in U$, then $bold(w)$ also $in U$ (not possible), thus $bold(w) + bold(u) in W$. Following, $bold(u) in W$, thus $U subset.eq W$.
]

#v(1cm)

== Bases and Dimensions

#cblock[
  === Basis (Def. 4.16)
  Let $V$ be a vector space. A subset $B subset.eq V$ is called a _basis_ of $V$ if $B$ is linearly independent and $"Span"(B) = V$.
]

#cblock[
  === Dimensions (Def. 4.23)
  Let $V$ be a finitely generated vector space. Then $"dim"(V) = abs(B)$, for any basis $B subset.eq V$. Moreover, the size of all bases of a vector space is equal (Theo. 4.20).
]

#cblock(fill: luma(240))[
  == Example

  Let $V subset.eq RR^m$, what is the dimension of $V$?

  #line(length: 100%, stroke: 0.75pt)

  1. Find a basis of $V$,
  2. show it is a basis (linearly independent & span is $V$),
  3. dimension is the cardinality of the base.
]

=== Steinitz Exchange Lemma (Lemma 4.19)

Let $V$ be a vector space, $F subset.eq V$ a _finite_ set of linearly independent vectors, and $G subset.eq V$ a finite set of vectors with $"Span"(G) = V$. Then

1. $abs(F) <= abs(G)$,
2. there is some subset $E subset.eq G$ with $abs(E) = abs(G) - abs(F)$ such that $"Span"(F union E) = V$.

#cblock[
  == The Column Space of $A$ (Def. 2.8)

  Let $A in RR^(m times n)$. The _column space_ of $A$ is the span of its columns,

  $ "C"(A) := {A bold(x) : bold(x) in RR^n} subset.eq RR^m. $
]

#cblock[
  === Basis of $"C"(A)$ (Theo. 4.25)

  The basis of $"C"(A)$ is the set of its _linearly independent columns_, and hence $"dim"("C"(A)) = "rank"(A)$. These can be calculated using Gauss-Jordan.
]

== The Row Space of $A$ (Def. 2.13)

Let $A in RR^(m times n)$. The _row space_ of $A$ is the span of its rows,

$ "R" := {A^T bold(x) : bold(x) in RR^m} = "C"(A^T) subset.eq RR^n. $

=== Basis of $"R"(A)$ (Theo. 4.28)

The basis of $"R"(A)$ is the set of its _linearly independent rows_, and hence $"dim"("R"(A)) = "dim"("C"(A)) = "rank"(A)$. These correspond to the first $r$ rows of $A$ in REF, where $r$ is the rank of $A$.

== Bases in $A = C R$ (Theo. 4.30)

Let $A = C R$, then the columns of $C$ form a basis of $"C"(A)$ and the columns of $R$ form a basis of $"R"(A)$.

#cblock[
  == The Nullspace of $A$ (Def. 4.31)

  Let $A in RR^(m times n)$. The _nullspace_ of $A$ is the set of all solutions to $A bold(x) = bold(0)$,

  $ "N"(A) := {bold(x) in RR : A bold(x) = 0} subset.eq RR^n. $
]

=== Basis of $"N"(A)$ (Lemma 4.34)

We can calcuate a basis of $"N"(A)$, by converting $A$ to $R$ in RREF through Gauss-Jordan and then solving $R bold(x) = bold(0)$ with the _special cases_ where $bold(x)_i = 1$ for every $i = 1, ..., n$ for every linerly *dependent* columns in $R$.

For example, $A in RR^(2 times 4)$,

1. convert $A -> R$ through Gauss-Jordan,
2. solve $R bold(x) = bold(0)$ with special cases,

$
  underbrace(mat(1, 2, 0, 3; 0, 0, 1, -2), A "in RREF") vec(x_1, x_2, x_3, x_4) = bold(0) "with" bold(x) = underbrace(vec(x_1, 1, x_3, x_4) "and" vec(x_1, x_2, x_3, 1), "special cases").
$

3. The solutions $x_1, ..., x_n$ form a Basis of $"N"(R)$,

$
  bold(x)_1 = vec(-1, 1, 0, 0), bold(x)_2 = vec(-3, 0, 2, 1) => {bold(x)_1, bold(x)_2} "is a basis of N"(R).
$

4. Any basis of $"N"(R)$ is also a basis of $"N"(A)$ (Lemma 4.33).

Following, $"dim"("N"(A)) = n - "rank"(A)$ (Theo. 4.35).

== Left Nullspace of $A$ (Def. 4.36)

Let $A in RR^(m times n)$. The _left nullspace_ of $A$ is the set of all solutions to $A^T bold(y) = bold(0)$,

$ "LN"(A) := "N"(A^T) subset.eq RR^m. $

=== Basis of $"LN"(A)$ (Theo. 3.48)

We can calculate a basis of $"LN"(A)$ by,

1. convert $A -> R_0$ through Gauss-Jordan,
2. the last $m-r$ rows of the row operation matrix $M$ used in Gauss-Jordan form a basis of $"LN"(A)$.

Following, $"dim"("LN")(A) = m - "rank"(A)$.

#cblock(fill: luma(240))[
  #align(
    center,
    table(
      columns: 5,
      [*subspace*], [$ "C"(A) $], [$ "R"(A) $], [$ "N"(A) $], [$ "LN"(A) $],
      [*dimensions*], [$ r $], [$ r $], [$ n - r $], [$ m - r $],
    ),
  )
]

== The Solution Space of $A bold(x) = bold(b)$ (Def. 4.39)

Let $A in RR^(m times n)$, and $bold(b) in RR^m$, then _solution space_ of $A bold(x) = bold(b)$ is the set

$
  "Sol"(A, bold(b)) := { bold(x) in RR^n : A bold(x) = bold(b) } subset.eq RR^n.
$

For any $A bold(x) = bold(b)$ we have three options, 1. no solutions, 2. one solution and 3. infinite solutions.

1. If $A$ is not invertible and $bold(b) in.not "C"(A)$ then no solution exists.
3. If $A$ is is invertible then exactly one solution exists.
3. If $A$ is not invertible, but $bold(b) in "C"(A)$, then we can shift the non-trivial nullspace using a solution to get inifite solutions: $A(bold(x)+bold(y)= A bold(x) + 0 = bold(b)$ with $bold(y) in "N"(A)$.
#cblock(fill: luma(240))[
  #table(
    columns: 3,
    align: center,
    [], [$r=n$ \ (full rank)], [$r<n$ \ (dependent cols)],
    [$r=m$ \ (full rank)],
    [invertible $==>$ one solution],
    [underdetermined $==>$ $infinity$ solutions],

    [$r <m$ \ (zero rows)],
    [overdetermined $==>$ $0$ or $1$ solution],
    [$0$ or $infinity$ solutions],
  )
]

#cblock[
  === Sol. Space is shifted Nullspace (Theo. 4.40)

  Let $A in RR^(m times n)$ and $bold(b) in RR^m$. Let $bold(s)$ some solution to $A bold(x) = bold(b)$, then

  $ "Sol"(A, bold(b)) = { bold(s) + bold(x) : bold(x) in "N"(A) }. $
]

