#set enum(numbering: "1.")
= Surjectivity, Injectivity, Bijectivity
#image("img/injectivityAndSurjectivity.png")

// = Multiple Choice Solutions

// == HS23

// 1. Let $A in RR^(5 times 6)$ with $"rank"(A) = 5$ and $bold(b) in RR^5$ be arbitrary. Which of the following statements must be true?
//   - The linear system $A bold(x) = bold(b)$ has no solution, i.e. there is no $bold(x) in RR^6$ such that $A bold(x) = bold(b)$.
//   - The linear system $A bold(x) = bold(b)$ has exactly one solution, i.e. there is exactly one $bold(x) in RR^6$ such that $A bold(x) = bold(b)$.
//   - *The linear system $A bold(x) = bold(b)$ has infinitely many solutions, i.e. there exists infinitely many $bold(x) in RR^6$ such that $A bold(x) = bold(b)$*.
//   - The linear system $A bold(x) = bold(b)$ has exactly two solutions, i.e. there are exactly two $bold(x) in RR^6$ such that $A bold(x) = bold(b)$.
// 2. Let $n in NN^+$. Consider arbitrary non-zero vectors $bold(v), bold(w) in RR^n$. Let $A$ be the $n times n$ matrix $A = bold(v) bold(w)^T$. Which of the following statments must be true?
//   - $A$ has a real eigenvalue $lambda$ with $lambda != 0$.
//   - *The largest singular value of $A$ is $sigma = norm(bold(v)) norm(bold(w))$*.
//   - If $bold(v)$ is orthogonal to $bold(w)$, then $A = 0$.
//   - $"det"(A-lambda I) = (-1)^n lambda^n$ for all $lambda in RR$.
// 3. Let $n in NN^+$. We call a matrix $A in RR^(n times n)$ nilpotent if there exists a $k in NN^+$ such that $A^k = 0$. Which of the following statements must be true?
//   - Every $A in RR^(n times n)$ with nullspace $"N"(A) != {bold(0)}$ is nilpotent.
//   - If $A in RR^(n times n)$ is nilpotent and $B in RR^(n times n)$ is nilpotent, then $A + B$ is nilpotent.
//   - *If $A in RR^(n times n)$ is nilpotent, then $"rank"(A) < n$*.
//   - If $A in RR^(n times n)$ is nilpotent and $B in RR^(n times n)$ is nilpotent, then $A B$ is nilpotent.
// 4. Let $n in NN^+$ and let $A in RR^(n times n)$ be a symmetric positive semidefinite matrix. Which of the following statements must be true?
//   - $A B = B A$ for all matrices $B in RR^(n times n)$.
//   - All diagonal entries of $A$ are non-zero
//   - The trace of $A$ is strictly positive.
//   - *All diagonal entries of $A$ are non-negative*.
// 6. Consider the $2 times 2$ matrix $A = mat(3, 2; -4, -3;)$ with eigenvalues $1$ and $-1$. Which of the following statments must be true?
//   - $A^1024 = A$.
//   - $A^1024 = 2A$.
//   - *$A^1024 = I$*.
//   - $A^1024 = 2I$.
// == FS24

// 1. Let $A in RR(5 times 5)$ with $sum_(j=1)^5 A_(i j) = 0$ for all $i in {1, 2, ..., 5}$. Which of the following statemenst must be true?
//   - $A$ is the zero matrix, i.e. $A = 0$.
//   - $A$ has an inverse $A^(-1)$.
//   - *The rank of $A$ is less than $5$, i.e. $"rank"(A) < 5$*.
//   - There are only finitely many vectors $bold(x) in RR^5$ with $A bold(x) = 0$.
// 2. Let $n in NN^+$ and let $A in RR^(n times n)$ be an arbitrary symmetric and positive semidefinite matrix. Which of the following statments must be true?
//   - $"Tr"(A^2) = "Tr"(A)^2$.
//   - *$"Tr"(A^2) <= "Tr"(A)^2$*.
//   - $"Tr"(A^2) >= "Tr"(A)^2$.
//   - $"Tr"(A^2) != "Tr"(A)^2$.
// 6. Let $m, n in NN^+$ with $m < n$. Let $A in RR^(m times n)$ and $bold(b) in RR^m$ and consider the system of equations $A bold(x) = bold(b)$. Which of the following statements must be true?
//   - The system $A bold(x) = bold(b)$ has infinitely many solutions.
//   - There exist choices for $A$ and $bold(b)$ such that the system has a unique solution.
//   - *The system $A bold(x) = bold(b)$ either has no solution of infinitely many*.
//   - If the system $A bold(x) = bold(b)$ has a solution for some specific $bold(b)$, then it must have a solution for all possible choices of $bold(b)$.
