#import "@preview/cetz:0.4.2"
#let cblock(content, fill: rgb("#CAFFBF")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

#cblock[
  = Matrices (Def. 2.1)

  An $m times n$ matrix is a rectangular array of numbers with $m$ columns and $n$ rows, i.e.,

  $
    A in RR^(m times n) := mat(a_11, a_12, ..., a_(1n); a_21, a_22, ..., a_(2n); dots.v, dots.v, dots.down, dots.v; a_(m 1), a_(m 2), ..., a_(m n);).
  $
]

#cblock[
  == The Rank (Def. 2.10)

  The _rank_ of a matrix $A in RR^(m times n)$ is its number of _linearly independent_ columns.
]

#cblock[
  == The Transpose (Def. 2.12)

  Let $A in RR^(m times n)$, the transpose of $A$, $A^T$, is equal to $A$ with interchanged rows and columns.

  1. *Reverse Order:* $(A B)^T = B^T A^T$ (Lemma 2.40).
  2. *Scalars:* $(r A)^T = r A^T$ for any $r in RR$.
     - This implies $(-A)^T = -A^T$.
  3. *Powers:* $(A^n)^T = (A^T)^n$ for any $n in NN$.
     - Combined with scalars: $((-A)^n)^T = ((-A)^T)^n$.
  4. *Inverse:* $(A^(-1))^T = (A^T)^(-1)$ (if $A$ is invertible).
]

#cblock[
  == Square Matrix Classes (Def. 2.3)

  Let $A in RR^(m times m)$, $A$ is

  1. _upper triangular_ if all entries below the diag. are $0$,
  2. _lower triangular_ if all entries above the diag. are $0$,
  3. _diagonal_ if it is both _upper_ and _lower_ triangular, i.e., the matrix only has non-zero values on its diagonal,
  4. _symmetric_ if the values above and below the diagonal are equal. Let $A in RR^(m times m)$, $A$ is symmetric $<==>$ $A = A^T$.
]


== Matrix-Vector Multiplication (Def 2.4)

The product $A bold(x)$ can be understood in three different ways:

=== Matrix Picture

$
  mat(a_11, a_12, ..., a_(1n); a_21, a_22, ..., a_(2n); dots.v, dots.v, dots.down, dots.v; a_(m 1), a_(m, 2), ..., a_(m n);) vec(x_1, x_2, dots.v, x_n) = vec(a_11 dot x_1 + ... + a_(1n) dot x_n, a_21 dot x_1 + ... + a_(2n) dot x_n, dots.v, a_(m 1) dot x_1 + ... + a_(n m) dot x_n).
$

=== Row Picture

$
  vec(bar.h bold(u)_1 bar.h, bar.h bold(u)_2 bar.h, dots.v, bar.h bold(u)_m bar.h) vec(x_1, x_2, dots.v, x_n) = vec(bold(u)_1 dot bold(x), bold(u)_2 dot bold(x), dots.v, bold(u)_m dot bold(x)).
$

=== Column Picture

$
  mat(bar.v, , bar.v; bold(w)_1, ..., bold(w)_n; bar.v, , bar.v;) vec(x_1, x_2, dots.v, x_n) = x_1 dot bold(w)_1 + x_2 dot bold(w)_2 + ... + x_n dot bold(w)_n.
$

== Matrix-Matrix Multiplication (Def. 2.36)

For any two matrices $A in RR^(m times k)$ and $B in RR^(k times n)$, the product $A B in RR^(m times n)$ can also be understood in three ways:

=== The Matrix Picture

$
  vec(bar.h bold(u)_1 bar.h, bar.h bold(u)_2 bar.h, dots.v, bar.h bold(u)_m bar.h) mat(bar.v, bar.v, , bar.v; bold(v)_1, bold(v)_2, ..., bold(v)_n; bar.v, bar.v, , bar.v) = mat(bold(u)_1 dot bold(v)_1, bold(u)_1 dot bold(v)_2, ..., bold(u)_1 dot bold(v)_n; bold(u)_2 dot bold(v)_1, bold(u)_2 dot bold(v)_2, ..., bold(u)_2 dot bold(v)_n; dots.v, dots.v, dots.down, dots.v; bold(u)_m dot bold(v)_1, bold(u)_m dot bold(v)_2, ..., bold(u)_m dot bold(v)_n).
$

=== The Row Picture

$
  vec(bar.h bold(u)_1 bar.h, bar.h bold(u)_2 bar.h, dots.v, bar.h bold(u)_m bar.h) B = vec(bar.h bold(u)_1 B bar.h, bar.h bold(u)_2 B bar.h, dots.v, bar.h bold(u)_m B bar.h).
$

=== The Column Picture

$
  A mat(bar.v, bar.v, , bar.v; bold(v)_1, bold(v)_2, ..., bold(v)_n; bar.v, bar.v, , bar.v) = mat(bar.v, bar.v, , bar.v; A bold(v)_1, A bold(v)_2, ..., A bold(v)_n; bar.v, bar.v, , bar.v).
$

#linebreak()

=== Distributivity and Associativity (Lemma 2.42)

Let $A$, $B$, $C$ and $D$ be four matrices, then

1. $A(B + C) &= A B + A C "and" (B + C)D &= B D + C D$ #h(1fr) (distributivity)
2. $(A B)C = A(B C)$ #h(1fr) (associativity)

Keep in mind, that *MATRIX MULTIPLICATION IS NOT COMMUTATIVE*.

== CR' Decomposition $A = C R'$ (Theo. 2.46)

Let $A in RR^(m times n)$ with rank $r$. Let $C in RR^(m times r)$ be the submatrix of $A$ containing all its independent columns. Then there exists a unique $R' in RR^(r times n)$ such that $A = C R'$.

In other words, $C$ describes the linearly independent columns, while $R'$ ($R$ from Gauss-Jordan Elimination, but without the zero rows) shows how to combine them to create $A$. For instance,

$
  mat(1, 2, 0, 3; 2, 4, 1, 4; 3, 6, 2, 5;) = mat(1, 0; 2, 1; 3, 2;) mat(1, 2, 0, 3; 0, 0, 1, -2;).
$


#cblock[
  == Linear Transformation (Def. 2.21)

  Let $T: RR^n -> RR^m$ be a function. $T$ is called a linear transformation if $forall bold(v), bold(w) in RR^n "and" forall lambda, mu in RR$,

  $ T(lambda bold(v) + mu bold(w)) = lambda T(bold(v)) + mu T(bold(w)). $
]

#cblock(fill: luma(240))[
  == Example

  Let $T : RR^n -> RR^m$, is $T$ a linear transformation?

  #line(length: 100%, stroke: 0.75pt)

  1. Show $T(bold(v) + bold(w)) = T(bold(v)) + T(bold(w))$ for all $bold(v), bold(w) in RR^n$.
  2. Show $T(lambda bold(v)) = lambda T(bold(v))$ for all $bold(v) in RR^n$ and $lambda in RR$.
]

#cblock[
  === $T = T_A$ (Theo. 2.26)

  Let $T: RR^n -> RR^m$ be a linear transformation, there exists a unique $A in RR^(m times n)$ such that $T = T_A$.
]

#cblock[
  === Kernel and Image (Def. 2.27)

  Let $T: RR^n -> RR^m$ be a linear transformation,

  1. the _kernel_ of $T$ is $"Ker"(T) = "N"(T_A)$,
  2. the _image_ of $T$ is $"Im"(T) = "C"(T_A)$.
]

== Rotation Matrix

In $RR^(2 times 2)$, to rotate the $x y$ plane counterclockwise around an angle $theta$ we use $ R = mat(cos theta, -sin theta; sin theta, cos theta;). $ In $RR^(3 times 3)$, there are three different rotation matrices, one for each axis: $ R_x (theta) = mat(1, 0, 0; 0, cos theta, -sin theta; 0, sin theta, cos theta;) \ R_y (theta) = mat(cos theta, 0, sin theta; 0, 1, 0; -sin theta, 0, cos theta;) \ R_z (theta) = mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1;) $

=== Composition of Rotations

Let $R(theta_1), R(theta_2) in RR^(2 times 2)$ be two rotation matrices, then $ R(theta_1) R(theta_2) = R(theta_1 + theta_2). $

Moreover, for every $R(theta) in RR^(2 times 2)$, there is some $R(-theta) in RR^(2 times 2)$ such that $R(theta) R(-theta) = R(0) = I$.

If we need to find an $A in RR^(2 times 2)$ that satisfies $A^k = I <==> $ k is a multiple of $t$, then $A$ can be a rotation matrix with $theta = (2 pi)/ t$. For higher dimensions $A in RR^(n times n)$, the same principle applies if we embed the 2D rotation e.g. into the top left corner (like in $R_z (theta)$ above) and fill the rest of the diagonal with $1$s. $quad$ Below: left $= cos(theta)$, right $= sin(theta)$.

#show math.equation: block.with(fill: luma(240), inset: 1pt)
#show math.equation: set text(size: 6pt)

#cblock(fill: luma(240))[
  #align(
    center,
    cetz.canvas(
      length: 3cm,
      {
        import cetz.draw: *

        set-style(
          mark: (fill: black, scale: 2),
          stroke: (thickness: 0.4pt, cap: "round"),
          angle: (
            radius: 0.3,
            label-radius: .22,
            fill: green.lighten(80%),
            stroke: (paint: green.darken(50%)),
          ),
          content: (padding: 1pt),
        )

        let radius = 0.9

        circle((x: 0, y: 0), radius: radius)

        for (nom, denom, marker) in (
          (1, 6, [$ sqrt(3) / 2, 1 / 2 $]),
          (1, 4, [$ sqrt(2) / 2, sqrt(2) / 2 $]),
          (1, 3, [$ 1 / 2, sqrt(3) / 2 $]),
          (1, 2, [$ 0, 1 $]),
          (2, 3, [$ -1 / 2, sqrt(3) / 2 $]),
          (3, 4, [$ -sqrt(2) / 2, sqrt(2) / 2 $]),
          (5, 6, [$ -sqrt(3) / 2, 1 / 2 $]),
          (1, 1, [$ -1, 0 $]),
          (7, 6, [$ -sqrt(3) / 2, -1 / 2 $]),
          (5, 4, [$ -sqrt(2) / 2, -sqrt(2) / 2 $]),
          (4, 3, [$ -1 / 2, -sqrt(3) / 2 $]),
          (3, 2, [$ 0, -1 $]),
          (5, 3, [$ 1 / 2, -sqrt(3) / 2 $]),
          (7, 4, [$ sqrt(2) / 2, -sqrt(2) / 2 $]),
          (11, 6, [$ sqrt(3) / 2, -1 / 2 $]),
          (2, 1, [$ 1, 0 $]),
        ) {
          line(
            (x: 0, y: 0),
            (
              x: radius * calc.cos((nom / denom) * calc.pi),
              y: radius * calc.sin((nom / denom) * calc.pi),
            ),
            name: str(nom) + str(denom),
          )
          content(
            (name: str(nom) + str(denom), anchor: 60%),
            math.equation(str((nom / denom) * 180) + "°"),
          )
          content(
            (name: str(nom) + str(denom), anchor: 85%),
            if nom == 1 and denom == 1 [$ pi $] else if nom == 1 [$
              pi / #denom
            $] else if denom == 1 [$ #nom pi $] else [$ (#nom pi) / #denom $],
          )
          content(
            (
              a: (name: str(nom) + str(denom), anchor: "start"),
              number: 124%,
              b: (name: str(nom) + str(denom), anchor: "end"),
            ),
            marker,
          )
        }
      },
    ),
  )
]
