#let cblock(content, fill: rgb("#EEEAFD")) = block(
  width: 100%,
  inset: 0.75em,
  radius: 1pt,
  fill: fill,
  content,
)

#cblock[
  = Eigenvalues/vectors (Def. 8.2.1)

  Let $A in RR^(n times n)$, $lambda in CC$ is an eigenvalue of $A$ and $bold(v) in CC^n without {bold(0)}$ is the associated eigenvector of $A$, if $ A bold(v) = lambda bold(v). $

  To calculate eigenvalue/vector pairs, we use Lemma 8.2.3:

  1. $"det"(A-lambda I) = 0 <==>$ $lambda$ is an eigenvalue of $A$,
  2. $bold(v)$ is an eigenvector of $A$ (associated with $lambda$) $<==>$ $bold(v) in "N"(A-lambda I)$ and $bold(v) != bold(0)$.

  Every matrix $A in RR^(n times n)$ has an eigenvalue (Theo. 8.2.5).
]

#cblock(fill: luma(240))[
  == Eigenvector Recurrence in "Closed Form"
  Consider the sequence of numbers given by $a_0 = 1$, $a_1 = 1$ and $a_n = -a_(n-1)+6a_(n-2) "for" n >= 2$. Find $alpha, beta in RR$ such that $a_n = 4/5alpha^n + 1/5beta^n$ for all $n in NN_0$. Prove your answer. #line(length: 100%, stroke: 0.75pt)

  1. Define sequence algebraically: Let $bold(v)_n = vec(a_(n+1), a_n)$. We translate the recurrence $a_n = -a_(n-1) + 6a_(n-2)$ into matrix form.
    $
      underbrace(vec(a_n, a_(n-1)), bold(v)_(n-1)) = underbrace(mat(-1, 6; 1, 0;), A) underbrace(vec(a_(n-1), a_(n-2)), bold(v)_(n-2))
    $
    *Note:* Since $bold(v)_0 = vec(a_1, a_0)$ has $a_0$ at the bottom, our target $a_n$ (which we'll need later) will always correspond to the *bottom component* of $bold(v)_n$. This is more clear if we shift the above stated matrix equation:
    $
      underbrace(vec(a_(n+1), a_n), bold(v)_(n)) = underbrace(mat(-1, 6; 1, 0;), A) underbrace(vec(a_n, a_(n-1)), bold(v)_(n-1))
    $
  3. Find the corresponding eigenvectors $bold(v)_i in N(A-lambda_i I)$: $                                     (A-lambda_i I)bold(v)_i = 0 \
    mat(-3, 6; 1, -2) mat((bold(v)_1)_1; (bold(v)_1)_2) = vec(0, 0) & ==> bold(v)_1 = vec(2, 1), \
      mat(2, 6; 1, 3) mat((bold(v)_2)_1; (bold(v)_2)_2) = vec(0, 0) & ==> bold(v)_2 = vec(-3, 1), $
  4. Express $bold(v)_0$ as a linear combination $c_1 bold(v)_1 + c_2 bold(v)_2$:
    We solve the system for the initial vector $bold(v)_0 = vec(1, 1)$:
    $
      c_1 vec(2, 1) + c_2 vec(-3, 1) = vec(1, 1)
      ==> cases(
        2c_1 - 3c_2 & = 1,
        c_1 + space c_2 & = 1
      )
    $
    From the second equation, $c_1 = 1 - c_2$. Substituting into the first:
    $
      2(1 - c_2) - 3c_2 = 1 \
      2 - 5c_2 = 1 ==> 5c_2 = 1 ==> c_2 = 1/5
    $
    Then, $c_1 = 1 - 1/5 = 4/5$.
    Thus:
    $ vec(a_1, a_0) = vec(1, 1) = 4/5 bold(v)_1 + 1/5 bold(v)_2 $
  5. Rewrite $bold(v_n) = vec(a_(n+1), a_n)= A^n bold(v_0)$ as $ bold(v_n) = A^n (4/5bold(v)_1 + 1/5bold(v)_2)
    = 4/5 A^n bold(v)_1 + 1/5 A^n bold(v)_2 \
    = 4/5 lambda_1^n bold(v)_1 + 1/5 lambda_2^n bold(v)_2
    = 4/5 2^n vec(2, 1) + 1/5 (-3)^n vec(-3, 1). $
  6. Consider second component: $a_n = 4/5 dot 2^n dot 1 + 1/5 dot (-3)^n dot 1$.
]

#cblock(fill: luma(240))[
  == Reverse Diagonalization Example
  Construct a square matrix $B$ with eigenvalues $0, 1, 2$, such that $B$ is not a diagonal matrix. #line(length: 100%, stroke: 0.75pt) Let $A$ be the diagonal matrix with $0, 1, 2$ on its diagonals and let $V = mat(bar.v, bar.v, bar.v; bold(e)_1 + bold(e)_2, bold(e)_1 - bold(e)_2, bold(e)_3; bar.v, bar.v, bar.v)$, then $B = V A V^(-1)$. Ensure $det(V) != 0.$
]
== Quadratic Formula (for finding $lambda$)
To find zeros of $a x^2 + b x + c = 0$ are given by $ x = (-b plus.minus sqrt(b^2 - 4 a c)) / (2a). $

== Special Eigenvalues

1. If $lambda$ and $bold(v)$ are an eigenvalue-eigenvector pair of $A$, then $lambda^k$ and $bold(v)$ are one for $A^k$. Induction _Proof:_ $A^k bold(v) = A(A^(k-1) bold(v))=A(lambda^(k-1) bold(v))=lambda^(k-1)(A bold(v))=lambda^k bold(v)$ (Prop. 8.3.1).
2. Let $A$ be invertible, if $lambda$ and $bold(v)$ are an eigenvalue-eigenvector pair of $A$, then $1/lambda$ and $bold(v)$ are an eigenvalue-eigenvector pair of $A^(-1)$. _Proof:_ $A bold(v)=lambda bold(v) <==> bold(v)=A^(-1)(lambda bold(v)) <==> lambda A^(-1) bold(v) = bold(v) <==> A^(-1) bold(v) = 1/lambda bold(v)$ (works since $lambda != 0$) (Prop. 8.3.1).
3. Let $A in RR^(n times n)$, the eigenvalues of $A$ are the same ones as of $A^T$. _Proof:_ $det(A-z I)=det((A-z I)^T)=det(A^T-z I)$ (Lemma 8.3.5).
4. Let $Q in RR^(n times n)$ be an orthogonal matrix, if $lambda$ is an eigenvalue of $Q$, then $abs(lambda) = 1$. _Proof:_ $||bold(v)||^2=||Q bold(v)||^2=||lambda bold(v)||^2=|lambda| dot ||bold(v)||^2$ (Prop. 8.2.7).
5. Let $A in RR^(n times n)$, if $(lambda, bold(v))$ is an eigenvalue-eigenvector pair of $A$, then $(overline(lambda), overline(bold(v)))$ is an eigenvalue-eigenvector pair of $A$ too. Thus, if $lambda in CC$ is an eigenvalue of $A$, then $overline(lambda)$ is also an eigenvalue of $A$ (Lemma 8.2.8). _Proof_: See "Eigenvalues of Sym. Matrices (Cor. 9.2.2)" in the middle of the next page.
6. Let $P in RR^(n times n)$ be a projection matrix, then $P$ has two distinct eigenvalues, $0$ and $1$ (every single one of the $n$ eigenvalues is either 0 or 1) and a _complete set_ of eigenvectors (Prop. 9.1.6).
7. Let $D in RR^(n times n)$ be a diagonal matrix, then its eigenvalues are its diagonal entries and the standard basis ($e_1, e_2, ..., e_n$) is a complete set of eigenvectors of $D$ (Example 9.1.4).
8. Let $T in RR^(n times n)$ be a triangular matrix, then its eigenvalues are its diagonal entries, however, $T$ might not have a complete set of eigenvectors (Example 9.1.5).
9. $A + (k dot I) <==>$ adding $k$ to all eigenvalues of $A$. Eigenvectors stay the same. _Proof:_ $A bold(v) = lambda bold(v) quad ==> quad (A + k I) bold(v) = (A bold(v))+k I v = lambda bold(v) + k bold(v) = (lambda + k) bold(v)$
10. If matrix $A$ has an eigenvalue $lambda$, then the matrix $c A$ (where $c$ is a scalar number) has the eigenvalue $c lambda$. \ _Proof:_ $(c A) bold(v) = c (A bold(v)) = c (lambda bold(v)) = (c lambda) bold(v)$.
11. For $A in RR^(2 times 2)$, $lambda_1, lambda_2 = m plus.minus sqrt(m^2 - p), m = (a + d)/2, p = det(A)$

== Important Words Of Caution

1. Even though the _eigenvalues_ of $A$ and $A^T$ are the same, _*the eigenvectors are not*_!
2. The eigenvalues of $A + B$ _*are not the sum*_ of the eigenvalues of $A$ and the eigenvalues of $B$!
3. The eigenvalues of $A B$ _*are not the product*_ of the eigenvalues of $A$ and the eigenvalues of $B$!
4. _*Gaussian Elimination does not preserve eigenvalues and eigenvectors*_!

#cblock[
  == Distinct Eigenvalues (Theo. 8.3.3)

  Let $A in RR^(n times n)$ with $n$ distinct, real eigenvalues, then there is a basis of $RR^n$ made up of eigenvectors of $A$. We also say that $A$ has a _complete set_ of eigenvectors (Def. 9.1.3).
]

== Complex Numbers

Complex numbers are of the form $z = (a + i b) in CC$ with $a, b in RR$ and $i^2 = -1$. The following operations are defined:

1. $(a+i b) + (x+i y) = (a+x) + i(b+y)$.
2. $(a+i b) dot (x+i y) = (a x-b y) + i(a y+b x)$.
3. $(a+i b) dot (a-i b) = a^2+b^2$.
4. $(a+i b)/(x+i y) = ((a+i b)(x-i y))/((x+i y)(x-i y)) = ((a x+b y) + i(b x - a y))/((x^2+ y^2)) = ((a x+b y)/(x^2+y^2))+i((b x-a y)/(x^2+y^2))$.
5. $abs(z) = sqrt(a^2+b^2)$ #h(1fr) (modulus).
6. $overline(a+i b) = a-i b$ #h(1fr) (conjugate).
7. $abs(z)^2 = z overline(z)$.
8. $overline(z_1 + z_2) = overline(z_1)+overline(z_2)$.
9. $1/z = overline(z)/abs(z)^2$.

A complex number $z = (a + i b) in CC$ can be written as $z = r e^(i theta)$ where $r = overline(z)$ and $theta = tan^(-1)(b/a)$.

=== Complex Matrices/Vectors

Let $A in CC^(m times n)$, the _conjugate transpose_ $A^* = overline(A)^T$.

Given $bold(v) in CC^n$, we have $ norm(bold(v))^2 = bold(v)^* bold(v) = overline(bold(v))^T bold(v) = sum_(i=1)^n overline(v)_i v_i = sum_(i=1)^n abs(v_i)^2. $

The dot-product in $CC^n$ is given by $chevron.l bold(v), bold(w) chevron.r = bold(w)^* bold(v)$.

#cblock[
  == Fund. Theorem of Algebra (Cor. 8.1.3)

  Any degree $n >= 1$ polynomial $P(z) = alpha_n z^n + ... + a_1 z + a_0$ with $a_n != 0$ has $n$ zeros: $lambda_1, ..., lambda_n in CC$ such that $ P(z) = alpha_n (z-lambda_1)(z-lambda_2) ... (z-lambda_n). $ The number of times $lambda in CC$ appears in this expression is called the _algebraic multiplicity_ of the zero (i.e. of the $P(lambda)=0$). This guarantees that an $n times n$ matrix always has exactly $n$ eigenvalues (if you count repeats and complex eigenvalues).
]

== Geometric Multiplicity

Let $A in RR^(n times n)$ with eigenval $lambda_i$, we call the dim of $"N"(A - lambda_i I)$ the _geometric multiplicity_ of $lambda_i$. Number of lin. indep. eigenvecs for $lambda_i$.

== Characteristic Polynomial

Let $A in RR^(m times n)$, the _characteristic polynomial_ of $A$ is
$ P(z) = (-1)^n "det"(A - z I) = (z - lambda_1) (z - lambda_2) dots (z - lambda_n) $
#text(fill: luma(50%))[$
  = z^n + underbrace((-sum_(i=1)^n lambda_i), - "Tr"(A)) z^(n-1) + underbrace(sum_(k=1)^(n-2)b_k z^k, "messy middle terms") + underbrace((-1)^n product_(i=1)^n lambda_i, (-1)^n "det"(A)).
$]

#cblock[
  == Trace and Determinant (Lemma 8.3.6)

  Let $A in RR^(n times n)$ and $lambda_1, ..., lambda_n$ its $n$ eigenvalues, then $ "Tr"(A) & = sum_(i=1)^n lambda_i "and" "det"(A) & = Pi_(i=1)^n lambda_i. $

  Following (Lemma 8.3.7), for matrices $A$, $B$ and $C$ $in RR^(n times n)$,

  1. $"Tr"(A B)"="sum_(i=1)^n sum_(j=1)^n A_(i j) B_(j i)"="sum_(j=1)^n sum_(i=1)^n B_(j i) A_(i j)"=""Tr"(B A). $
  2. $"Tr"(A (B C)) = "Tr"((B C) A) = "Tr"((C A) B)$.
]

#cblock[
  == Diagonalization (Theo. 9.1.1)

  Let $A in RR^(n times n)$ be a matrix with a complete set of eigenvectors. Let $V = mat(bar.v, , bar.v; bold(v)_1, ..., bold(v)_n; bar.v, , bar.v;) in RR^(n times n)$ be the matrix whose columns are the eigenvectors, and $Lambda in RR^(n times n)$ the matrix whose diagonal entries are the eigenvalues ($Lambda_(i i) = lambda_i$ for all $i in [n]$), then 
  $ A & = V Lambda V^(-1) quad ==> A^k = V Lambda^k V^(-1) \
  A V & = V Lambda \
  [A bold(v)_1, A bold(v)_2, ..., A bold(v)_n] & = [lambda_1 bold(v)_1, lambda_2 bold(v)_2, ..., lambda_n bold(v)_n] $
]

== Diagonalizable Matrix (Def. 9.1.2)

A matrix $A in RR^(n times n)$ is said to be _diagonalizable_, if there are $n$ independent eigenvectors (complete set of eigenvectors), and thus there exists an invertible matrix $V$, such that $V^(-1) A V = Lambda$, where $Lambda$ is a diagonal matrix. _"Can we flatten A into a diagonal matrix?"_

== Complete Set of Eigenvectors (Lemma 9.1.11)
A matrix has a complete set of eigenvectors if all its eigenvalues are real and the geometric multiplicities are the same as the algebraic multiplicities, for all of its eigenvalues.

If given a matrix $A in RR^(n times n)$, we can build a basis of $RR^n$ with eigenvectors of $A$ (the eigenvectors are linearly independent), we say that $A$ has a _complete set_ of eigenvectors (Def. 9.1.3).

== Similar Matrices (Def. 9.1.7)

Two matrices $A$ and $B$ $in RR^(n times n)$ are _similar_, if exists an invertible matrix $S$, such that $B = S^(-1) A S.$ (Or $B = S A S^(-1)$, doesn't matter).

Similar matrices have the same eigenvalues, Trace and Determinant. _Proof:_ $A v = lambda v <==> lambda S^(-1) v = S^(-1) A v = S^(-1) A underbrace(S S^(-1), I) v = B(S^(-1) v)$.

Similar matrices are clones of each other. They represent the exact same linear transformation, just viewed from a different coordinate system ($S$ is a change of basis matrix).

#cblock(fill: luma(240))[
  == Characteristic Polynomial Example

  Assume that $A, B in RR^(n times n)$ are similar, prove that their characteristic polynomials are equal. #line(length: 100%, stroke: 0.75pt) As $A$ and $B$ are similar, there exists a matrix $S$ such that $B = S^(-1)A S$. Recall that $"det"(S)"det"(S^(-1)) = 1$. Thus, $"det"(A-z I) = "det"(S^(-1))"det"(A-z I)"det"(S) = "det"(S^(-1)(A-z I)S) = "det"(S^(-1) A S -z S^(-1) I S) = "det"(B-z I)$.
]

#cblock[
  == Spectral Theorem (Theo. 9.2.1)

  Any symmetric matrix $A in RR^(n times n)$ has $n$ real eigenvalues and an orthonormal basis consisting of its eigenvectors.
]

=== Diagonalization for Symmetric Matrices (Cor. 9.2.2)

For any symmetric matrix $A in RR^(n times n)$, there exists an *orthogonal* matrix $V in RR^(n times n)$ (whose columns are the eigenvectors of $A$) and a diagonal matrix $Lambda$ whose entries are the eigenvalues of $A$, such that $ A = V Lambda V^T "and" V^T V = I. $ (This is also called the _eigendecomposition_). *Normalize $V$!*

#cblock(fill: luma(240))[
  == Spectral Construction Example

  Find matrix $A$ with these given _orthonormal_ eigenvectors $ bold(v)_1 = 1/9vec(1, 8, -4), bold(v)_2 = 1/9vec(-4, 4, 7), bold(v)_3 = 1/9vec(8, 1, 4) $ and corresponding eigenvalues $lambda_1 = 1, lambda_2 = -1, lambda_3 = 0$. #line(length: 100%, stroke: 0.75pt) Let $V$ be the $3 times 3$ matrix with $bold(v)_1, bold(v)_2, bold(v)_3$ as its columns and $D$ the diagonal matrix with $lambda_1, lambda_2, lambda_3$ on its diagonal, then $A = V D V^T$. _Note that for $V^(-1) = V^T$ to work, V needs to be normed!_
]

#cblock[
  == Eigenvalues of Sym. Matrices (Cor. 9.2.4)
  The rank of a real symmetric matrix $A$ is the number of non-zero eigenvalues (counting repetitions).

  For general $n times n$ (non-symmetric) matrices, the rank is $n$ minus the dimension of the nullspace, so it is $n$ minus the geometric multiplicity of $lambda = 0$. Since symmetric matrices always have a complete set of eigenvalues and eigenvectors, the geometric multiplicities are always the same as the algebraic multiplicities (Remark 9.2.5).

  Every symmetric matrix has only real eigenvalues (Lemma 9.2.8). _Proof:_ $overline(lambda) norm(bold(v))^2 = overline(lambda) bold(v)^* bold(v) = (lambda bold(v))^* bold(v) = (A bold(v))^* bold(v) = bold(v)^* A^* bold(v) = bold(v)^* A bold(v) = bold(v)^* (lambda bold(v)) = lambda norm(bold(v))^2 ==> overline(lambda) = lambda$ only holds if $lambda in RR$.
]

== Rayleigh Quotient (Prop. 9.2.10)

Let $A in RR^(n times n)$ be a symmetric matrix, the _Rayleight Quotient_, defined for $bold(x) in RR^n without {bold(0)}$, as $ R(bold(x)) = (bold(x)^T A bold(x)) / (bold(x)^T bold(x)), $ attains its max at $R(bold(v)_"max") = lambda_"max"$ and its min at $R(bold(v)_"min") = lambda_"min"$, where $lambda_"max"$ and $lambda_"min"$ are the max and min eigenvalues of $A$ and $bold(v)_"max"$ and $bold(v)_"min"$ their eigenvectors.  Useful because it allows to plug in any vector $bold(x)$ and get back a number that's like a _weighted average_ of the eigenvalue contained in that vector. Measures "how much" the matrix stretches that specific direction $bold(x)$.

== Positive (Semi)-Definite (Def. 9.2.11)

A symmetric matrix $A in RR^(n times n)$ is said to be _positive semidefinite_ (PSD) if all its eigenvalues are $>= 0$ and _positive definite_ they are $> 0$. Moreover, (as per Prop. 9.2.12) $A$ is

1. PSD $<==>$ $bold(x)^T A bold(x) >= 0$ for all $bold(x) in RR^n$,
2. PD $<==>$ $bold(x)^T A bold(x) > 0$ for all $bold(x) in RR^n without {bold(0)}$.

- Given two matrices $A$ and $B$ that are PSD (PD), their sum is also PSD (PD), i.e. they are closed under taking addition.
- A diagonal dominant matrix (diagonal entries are greater than the *absolute* sum of rest of the row's elements) is always PSD!
- Matrix is PSD/PD $==>$ all diagonal entries are $>= 0$/$> 0$ _Proof:_ Choose $bold(x) = bold(e)_i$ in equations (i), (ii) to get the diagonal entry $A_(i i)$ only. (But the other way "$<==$" doesn't hold)! 

== Gram Matrix (Def. 9.2.13)

Let $V in RR^(m times n)$, the Gram matrix of $V$ is the inner product of the columns of $V$, i.e., $G = V^T V.$

Sometimes $V V^T$ is also called a Gram matrix of $V$ (the inner product of the rows) (Remark 9.2.14).

== Gram and Eigenvalues (Prop. 9.2.15)

Let $A in RR^(m times n)$, the non-zero eigenvalues of $A^T A$ are the same as the ones of $A A^T$. Both matrices are symmetric and PSD. \ _Proof:_ $x^T A^T A x = (A x)^T (A x) = ||A x||^2 >= 0$.

== Cholesky Decomposition (Prop. 9.2.16)

Every symmetric, PSD matrix $M$ is a gram matrix of an _upper triangular matrix_ $C$, i.e., $M = C^T C.$

#cblock(fill: luma(240))[
  === Calculating the Cholesky Decomposition

  1. Let $M$ be symmetric and PSD (PSD because we later do $sqrt(lambda)$), the eigendecomposition (Cor. 9.2.2) gives us $M = V Lambda V^T$
  2. We build $Lambda^(1/2)$ by taking the square root of each entry of $Lambda$, following, $M = (V Lambda^(1/2)) (V Lambda^(1/2))^T$ ($sqrt("neg")$ wouldn't work).
  3. We then take the QR decomposition $(V Lambda^(1/2))^T = Q R$, following, $M = (Q R)^T (Q R) = R^T Q^T Q R = R^T R = C^T C$. _We set $(V Lambda^(1/2))^T = Q R$, s.t. $C = R$ is upper triangular_.
]
