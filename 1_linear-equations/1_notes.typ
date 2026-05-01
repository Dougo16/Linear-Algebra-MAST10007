#import "@local/theorems:1.0.0": *
#import "@preview/cetz:0.3.1": canvas, draw

// Text

#align(center)[
  #text(size: 24pt, weight: "bold")[Topic 1 - Linear Equations]
]

= 1.1 Systems of linear equations

== Linear systems

#definition[Linear equation and linear system][
  A *linear equation* in _n_ variables $x_1, x_2,..., x_n$ is an equation of the form 
  $ a_1 x_1 + a_2 x_2 + ... + a_n x_n = b $
  where the coefficients ($a$) and the constant term ($b$) are _constants_.

  A finite collection of linear equations of $x_1, ..., x_n$ is a system of linear equations or a *linear system*.
]

#example[Two equations in two unknowns][
  $ 2x + y &= 5 \
    x - y  &= 1 $
  Adding gives $3x = 6$, so $x = 2$, $y = 1$.
]

#definition[Homogenous linear system][
  A system of linear equations is *homogenous* if all the constant terms on the RHS are zero.
]

#remark[Trivial solution][
  Every homogeneous system is consistent as $bold(x) = bold(0)$ is always a solution,
  called the *trivial solution*.
]

#example[Homogeneous system][
  $ x + 2y - z &= 0 \
    2x - y + z &= 0 $
]

#pagebreak(weak: true)

== Solving linear systems

#definition[Solution of a linear system][
  A *Solution to a linear system* is the set of values for the variables that satisfies _every_ equation of the system.
]

#definition[Matrix][
  A *matrix* is a rectangular array of numbers. An $m * n$ matrix has _m rows_ and _n columns_.
]

#definition[Coefficient matrix and augmented matrix][
  The *coefficient matrix* for a linear system is the matrix formed from the coefficients in the equations.

  The *augmented matrix* for a linear system is the matrix formed by the coefficient matrix being squished together side-by-side with the constant terms, seperated by a vertical line.
]

#example[Augmented matrix][
  Let:
  $ x + 2y =& 3 \
  4 x + 5 y =& 6 $
  The *augmented matrix* for this linear system is:
  $ mat(augment: #2, 1, 2, 3; 4, 5, 6) $
]

#definition[Elementary row operations][
  The *elementary row operations* are:
  + Swapping two rows
  + Multiplying a rwo by a non-zero constant
  + Adding a multiple of one row to another
]

#warning[Equal and Equivalent][
  Matrices that have undergone elementary row operations to go from one to another are *equivalent*, _not_ equal.
]

#pagebreak(weak: true)

= 1.2 Reduction of systems to row-echelon form

#definition[Leading entry][
  The first _non_zero_ entry in each row of a matrix is called the *leading entry*.
]

#definition[Row-echelon form][
  A matrix is in *row-echelon form (REF)* iff:
  + For any two non_zero rows, the leading entry of the lower row is further right than that of the higher one.
  + Any rows that consist entirely of zeros are grouped together at the bottom of the matrix.
]

#note[REF formatting][
  These conditions imply that in each column with a leading entry, all entries below it are 0.
]

#example[REF vs. not REF][
  In REF:
  $ mat(1, 2, -1; 0, 1, 3; 0, 0, 1) "   " mat(1, 4, 2, -1; 0, 0, 1, 3; 0, 0, 0, 0) $

  _Not_ in REF:
  $ mat(2, 4, -2; 1, 3, 1; 0, 1, 2) "   " mat(1, 2, 3; 0, 0, 4; 0, 1, 2) $
]

#definition[Gaussian elimination][
  Gaussian elimination is a way to reduce a matrix using row operations. The form obatined is not unique.
  Steps:
  + Interchange rows (only if you need to) to bring a non-zero number to the top left corner.
  + (Optional) Divide the first row by its leading entry so the leading entry becomes 1.
  + Add multiples of the first row to lower rows so that all entries below the leading entry of the top row are zero.
  + Repeat on the lower rows.
]

#pagebreak(weak: true)


#example[Gaussian Elimination][
Solve the system  
$ x + 2y - z =& 8 \  
-3x - y + 2z =& -11 \  
-2x + y + 2z =& -3 $

Augmented matrix:  
$ mat(
  1, 2, -1, 8;
  -3, -1, 2, -11;
  -2, 1, 2, -3
) $

Apply row operations  
$ R_2 <- R_2 + 3R_1 \ R_3 <- R_3 + 2R_1 $

$ mat(
  1, 2, -1, 8;
  0, 5, -1, 13;
  0, 5, 0, 13
) $

Then  
$ R_3 <- R_3 - R_2 $

$ mat(
  1, 2, -1, 8;
  0, 5, -1, 13;
  0, 0, 1, 0
) $

Back substitute:  
$ z = 0 \ 5y - z = 13 => y = 13/5 \ x + 2y - z = 8 => x = 14/5 $

Hence  
$ (x, y, z) = (14/5, 13/5, 0) $
]


#pagebreak(weak: true)

= 1.3 Reduction of systems to reduced row-echelon form

#definition[Reduced row-echelon form][
  A matrix is in *reduced row-echelon form (RREF)* iff:
  + It is in row-echelon form
  + Each leading entry is 1
  + In each column containg a leading entry, all other entries are 0
]

#definition[Gauss-Jordan elimination][
  Systematic way to reduce a matrix to RREF. RREF is unique. Steps:
  + Reduce to REF
  + Multiply each non-zero row by an appropriate number to create a leading 1
  + Use row ops to create 0s above the leading entries
]

#example[Gauss-Jordan elimination][
  We row reduce the following matrix to RREF:
  $ mat(2, 4, -2, 2; 1, 2, 1, 3; 3, 6, 0, 8) $

  $R_1 <-> R_2$, then $R_2 <- R_2 - 2R_1$, $R_3 <- R_3 - 3R_1$:
  $ mat(1, 2, 1, 3; 2, 4, -2, 2; 3, 6, 0, 8)
  arrow.r
  mat(1, 2, 1, 3; 0, 0, -4, -4; 0, 0, -3, -1) $

  $R_2 <- -1/4 R_2$, then $R_3 <- R_3 + 3R_2$:
  $ mat(1, 2, 1, 3; 0, 0, 1, 1; 0, 0, -3, -1)
  arrow.r
  mat(1, 2, 1, 3; 0, 0, 1, 1; 0, 0, 0, 2) $

  $R_3 <- 1/2 R_3$, then $R_1 <- R_1 - 3R_3$, $R_2 <- R_2 - R_3$:
  $ mat(1, 2, 1, 3; 0, 0, 1, 1; 0, 0, 0, 2)
  arrow.r
  mat(1, 2, 1, 0; 0, 0, 1, 0; 0, 0, 0, 1) $

  $R_1 <- R_1 - R_2$ to reach RREF:
  $ mat(1, 2, 1, 0; 0, 0, 1, 0; 0, 0, 0, 1)
  arrow.r
  mat(1, 2, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) $

  Column 2 is free; setting $x_2 = t$ gives $x_1 = -2t$, $x_3 = 0$, $x_4 = 0$.
]

#pagebreak(weak: true)

= 1.4 Consistent and inconsistent systems

#theorem[Consistency][
  A system of linear equations has either zero, one or infinite solutions.
  A system is:
  + *Consistent* if it has _at least one solution_
  + *Inconsistent* if it has _no solutions_

  We can determine whether a system is consistent or not by reducing to REF.
]

#theorem[Determining consistency][
  The system is *inconsistent* iff there is at least one row the the REF matrix that is all 0 except for the final entry (the constant term)
]

#theorem[Row numbers & consistency][
  Suppose we have a _consistent_ linear system with n variables.
  + If the REF of the system has exactly $n$ non-zero rows, then the syste has a unique solution.
  + If the REF has $lt n$ non-zero rows, then the system has infinite solutions.
  + If $r$ is the number of non-zero rows, then $n - r$ parameters are needed to describe the solution set.
]

#example[Flow in a Traffic Network][
  A one-way road network has four intersections $A, B, C, D$ with measured
  external flows: 30 vehicles/min enter at $A$, 10 enter at $B$, 20 exit at
  $C$, and 20 exit at $D$. The internal branch flows $f_1, dots, f_5$ are:

  - $f_1$: $A -> B$
  - $f_2$: $A -> D$
  - $f_3$: $B -> C$
  - $f_4$: $D -> C$
  - $f_5$: $D -> B$ (can flow either way, we assume this direction)

  Conservation at each node gives:
  $ A: & quad f_1 + f_2 = 30 \
    B: & quad f_1 + f_5 + 10 = f_3 \
    C: & quad f_3 + f_4 = 20 \
    D: & quad f_2 = f_4 + f_5 + 20 $

  Rearranging and dropping the redundant equation at $D$, the augmented matrix is:
  $ mat(augment: #5,
    1,  1,  0,  0,  0,  30;
    1,  0, -1,  0,  1, -10;
    0,  0,  1,  1,  0,  20;
  )
  arrow.r
  mat(augment: #5,
    1,  1,  0,  0,  0,  30;
    0, -1, -1,  0,  1, -40;
    0,  0,  1,  1,  0,  20;
  ) $

  This is in REF with $f_4 = t$ as the free variable. Back-substituting:
  $ f_3 &= 20 - t \
    f_2 &= 20 - t - 40 + (20 - t) = t \
    f_1 &= 30 - t $

  So the general solution is
  $ bold(f) = vec(30, 0, 20, 0, -10) + t vec(-1, 1, -1, 1, 1). $

  For all flows to be non-negative we need $0 <= t <= 20$. For example
  setting $t = 10$ gives $(f_1, f_2, f_3, f_4, f_5) = (20, 10, 10, 10, 0)$,
  meaning no traffic uses the $D -> B$ branch.
]

#theorem[Superposition of solutions][
  If $A bold(x) = bold(b)$ is consistent, then the general solution is: 
  $ bold(x) = bold(p) + bold(h) $
  where *p* is one _particular solution_ of the equation and *h* is the general solution to $A bold(x) = bold(0)$
]

#note[*p* and *h*][
  *p* is a single vector, and *h* is a parameterised vector (vector multiplied by a parameter, mostly t)
]


