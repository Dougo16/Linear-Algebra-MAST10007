#import "@local/theorems:1.0.0": *
#import "@preview/cetz:0.2.2": canvas, draw

// Text

#align(center)[
  #text(size: 24pt, weight: "bold")[Topic 2 - Matrices and Determinants]
]

= 2.1 Matrix Notation

#definition[Matrix][
  A *matrix* of size $m * n$ is a rectangular array of numbers with $m$ rows and $n$ columns.

  $ A = mat(
  A_(1 1), A_(1 2), dots.h, A_(1 n);
  A_(2 1), A_(2 2), dots.h, A_(2 n);
  dots.v,  dots.v,  dots.down, dots.v;
  A_(m 1), A_(m 2), dots.h, A_(m n)
) $

$A_(i j)$ is the entry in the i-th row and j-th column.
]

== Special matrices

- A matrix with an _equal number of columns and rows_ is a *square matrix*
- A matrix with _one row_ is called a *row vector*
- A matrix with _one column_ is called a *column vector*
- A square matrix with _entries only on the diagonal_ from the top left to bottom right is called a *diagonal matrix*
- A square matrix with entries only _on or above the diagonal_ is an *upper triangular matrix*
- A square matrix with entries only _on or below the diagonal_ is a *lower triangular matrix*
- A matrix with _all entries = 0_ is a zero matrix
- A diagonal matrix with _all non-zero entries = 1_ is an identity matrix

#example[Special matrices][
Square Matrix
$
A = mat(
  1, 2, 3;
  4, 5, 6;
  7, 8, 9
)
$

Diagonal Matrix
$
D = mat(
  3, 0, 0;
  0, 7, 0;
  0, 0, 2
)
$

Upper Triangular Matrix
$
U = mat(
  1, 4, 7;
  0, 2, 5;
  0, 0, 3
)
$

Lower Triangular Matrix
$
L = mat(
  1, 0, 0;
  4, 2, 0;
  7, 5, 3
)
$

Identity Matrix
$
I = mat(
  1, 0, 0;
  0, 1, 0;
  0, 0, 1
)
$
]

#pagebreak(weak: true)

= 2.2 Matrix operations

#definition[Scalar multiplication][
  For matrix $A$ and scalar $c$ (real or complex), the *scalar product $c A$* is the matrix where each element is the entry in $A$ multiplied by $c$.
  $ (c A)_(i j) = c (A_(i j)) $
]

#definition[Addition of matrices][
  Let $A$ and $B$ be $m * n$ matrices. The *sum $A + B$* is an $m * n$ matrix where each element is the som of that element in each of the matrices, ie.
  $ (A + B)_(i j) = A_(i j) + B_(i j) $
]

#definition[Matrix multiplication][
  Let A be an $m * n$ matrix and B be an $n * q$ matrix. The *product $A B$* is a matrix with dimensions $m * q$.

  The entry at _(i, j)_ of the product is the dot product of the i-th row of A and the j-th column of B, ie.

  $ (A B)_(i j) = sum_(k=1)^n A_(i k) B_(k j) $
]

#warning[Matrix product dimensions][
  $A B$ is only defined if the number of columns in $A$ is equal to the number of rows in $B$.
]

== Properties of matrix multiplication
As long as the matrix products and sums are defined:
+ $A(B + C) = A B + A C$ #h(1fr) (left distributivity)
+ $(A + B)C = A C + B C$ #h(1fr) (right distributivity)
+ $A (B C) = (A B) C$ #h(1fr) (associativity)
+ $alpha (A B) = (alpha A) B = A( alpha B)$
+ $A I_n = I_m A = A$ (where A has size $m * n$)
+ $A 0 = 0$ and $0A = 0$

#definition[Matrix powers][
  If $A$ is a square matrix and $n gt.eq 1$ is an integer we have:
  $ A^n = A A ... A $
  is the product of $n$ copies of $A$.
]

#example[Graphs and adjacency matrices][
Graph with vertices $V = {1, 2, 3, 4}$ and 5 edges:

#align(center)[
#image("graph.png", width: 30%)
]

Adjacency matrix $A$ where $A_(i j) = 1$ if an edge exists between vertex $i$ and $j$:

$
A = mat(
  0,   1,   0,   0,   1;
  1,   0,   1,   1,   1;
  0,   1,   0,   0,   1;
  0,   1,   0,   0,   1;
  1,   1,   1,   1,   0;
)
$

Note: $A$ is symmetric since the graph is undirected, and all diagonal entries are $0$ (no self-loops).
]

#theorem[Adjacency matrices and walks][
  If A is an $n * n$ adjacency matrix of a graph, then $A_(i j)^k$ is equal to the number of walks of length $k$ from $V_i$ to $V_j$.
]

#definition[Trace][
  The *trace* of an $n * n$ matrix $A$ is the sum of the diagonal entries, ie.
  $ T r (A) = A_11 + A_22 + ... + A_(n n) $
]

#definition[Transpose of a matrix][
  For an $m * n$ matrix $A$, the *transpose of $A$*, or *$A^T$* is the $n * m$ matrix whose entries are found by swapping the rows and columns of $A$:
  $ (A^T)_(i j) = A_(j i) $
]

== Properties of the transpose

+ $(A^T)^T = A$
+ $(A + B)^T = A^T + B^T$
+ $(alpha A)^T = alpha A^T$
+ $(A B)^T = B^T A^T$

#pagebreak(weak: true)