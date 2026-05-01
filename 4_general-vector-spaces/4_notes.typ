#import "@local/theorems:1.0.0": *

// Text

#align(center)[
  #text(size: 24pt, weight: "bold")[Topic 4 - General Vector Spaces]
]

= 4.1 General vector spaces

== Fields

The _scalars_ are members of a number system $FF$ called a *field* where addition, multiplication, subtraction and division by a non-zero scalar are defined. 

Every field $FF$ contains:
+ A zero scalar s.t. $alpha + 0 = alpha$
+ A unit scalar (with $1 != 0$) s.t. $1 alpha = alpha$

#note[Subject scope][
  MAST10007 mostly looks at $FF = RR$ and $FF = CC$, but also looks at $FF = FF_2 = {0, 1}$, the integers modulo 2.
]

== Vector spaces

The aim of vector spaces is to extend the properties of vectors from $RR^n$ to more general sets of objects.

A *vector space* is a set $V$ with two operations defined:
+ vector addition
+ scalar multiplication

We want these two to satisfy the basic properties of vectors in $RR^n$, which leads to a list of 10 _axioms_ that give the definition of a vector space.

#definition[Vector space][
  For a fixed field of scalars $FF$, a *vector space* _over $F$_ is a non-empty set $V$ with two operations: vector addition and scalar multiplication. The operations are required to satisfy 10 axioms:

  #axiom[Additive axioms][
    Vector addition behaves well:
    + $bold(u) + bold(v) in V$ #h(1fr) (closure in vector addition)
    + $(bold(u) + bold(v)) + bold(w) = bold(u) + (bold(v) + bold(w))$ #h(1fr) (associativity)
    + $bold(u) + bold(v) = bold(v) + bold(u)$ #h(1fr) #h(1fr) (commutativity)
    There must be a zero and an inverse:
    + There exists a vector *$0$* $in V$ s.t. $bold(v) + bold(0) = bold(v)$ for all $bold(v) in V$ #h(1fr) (existence of zero vector)
    + For all $bold(v) in V$, there exists a vector $-bold(v)$ s.t. $bold(v) + (-bold(v)) = bold(0)$ #h(1fr) (additive inverse)
  ]

  #axiom[Multiplicative axioms][
    Scalar multiplication behaves well:
    + $c bold(v) in V$ #h(1fr) (closure under scalar multiplication)
    + $c(bold(u) + bold(v)) = c bold(u) + c bold(v)$ #h(1fr) (distributivity over vector addition)
    + $(c + d) bold(v) = c bold(v) + d bold(v)$ #h(1fr) (distributivity over scalar addition)
    + $(c d) bold(v) = c(d bold(v))$ #h(1fr) (compatibility of scalar multiplication)
    + $1 bold(v) = bold(v)$ #h(1fr) (scalar multiplicative identity)
  ]
]

== Examples of vector spaces

#example[Complex numbers $CC$][
  $CC = {a + b i mid(|) a, b in RR}$ forms a vector space over $RR$, with addition
  $ (a + b i) + (c + d i) = (a + c) + (b + d) i $
  and scalar multiplication $lambda(a + b i) = lambda a + lambda b i$ for $lambda in RR$. The zero vector is $0 + 0i$.
]

#example[Integers mod 2: $ZZ_2^n$][
  $ZZ_2 = {0, 1}$ with arithmetic mod $2$ is a field, and $ZZ_2^n$ forms a vector space over $ZZ_2$. Addition is bitwise XOR and scalar multiplication is trivial ($0 dot bold(v) = bold(0)$, $1 dot bold(v) = bold(v)$). This space is fundamental in coding theory and cryptography.
]

#example[Polynomials $PP_n$][
  The set of all polynomials of degree at most $n$,
  $ PP_n = {a_0 + a_1 x + dots + a_n x^n mid(|) a_i in RR} $
  forms a vector space over $RR$ under standard polynomial addition and scalar multiplication. The zero vector is the zero polynomial. More generally, $PP$ (polynomials of arbitrary degree) is also a vector space.
]

#example[Function spaces $cal(F)(X, RR)$][
  The set of all functions $f: X -> RR$ from a non-empty set $X$ forms a vector space over $RR$, with pointwise operations
  $ (f + g)(x) = f(x) + g(x), quad (c f)(x) = c dot f(x) $
  The zero vector is the constant zero function $bold(0)(x) = 0$. Important subspaces include:
  - $C[a,b]$: continuous functions on $[a, b]$
  - $C^k [a,b]$: $k$-times continuously differentiable functions
  - $C^infinity [a,b]$: smooth (infinitely differentiable) functions
]

#pagebreak(weak: true)

= 4.2 Subspaces

#definition[Subspace][
  A *subspace* $W$ of a vector space $V$ is a subset $W subset.eq V$ that is a vector space using the vector addition and scalar multiplaction definitions of $V$.
]

The subspace theorem can be used to check if a vector space is a subspace (and hence a vector space) without checking all 10 axioms.

#theorem[Subspace theorem][
  For a vector space $V$ with scalars $FF$, A subset $W subset.eq V$ is a subspace of $V$ iff:
  + $W$ contains the zero vector *0* from $V$
  + W is closed under vector addition ($bold(u), bold(v) in W => bold(u) + bold(v) in W$)
  + W is closed under scalar multiplication ($bold(u), bold(v) in W => bold(u) bold(v) in W$)
]

#example[A plane through the origin in $RR^3$][
  Let $W = {(x, y, z) in RR^3 mid(|) 2x - y + z = 0}$. We claim $W$ is a subspace of $RR^3$.

  *Zero:* $2(0) - 0 + 0 = 0$ #h(1fr) $checkmark$

  *Closure under addition:* Let $bold(u) = (u_1, u_2, u_3), bold(v) = (v_1, v_2, v_3) in W$, so
  $ 2u_1 - u_2 + u_3 = 0 quad "and" quad 2v_1 - v_2 + v_3 = 0. $
  Adding these equations gives $2(u_1 + v_1) - (u_2 + v_2) + (u_3 + v_3) = 0$, so $bold(u) + bold(v) in W$. #h(1fr) $checkmark$

  *Closure under scalar multiplication:* Let $bold(v) = (v_1, v_2, v_3) in W$ and $c in RR$. Then
  $ 2(c v_1) - (c v_2) + (c v_3) = c(2v_1 - v_2 + v_3) = c dot 0 = 0 $
  so $c bold(v) in W$. #h(1fr) $checkmark$

  Hence $W$ is a subspace of $RR^3$.
]

#example[Symmetric matrices $S_n$][
  Let $S_n = {A in M_(n times n)(RR) mid(|) A^TT = A}$ be the set of $n times n$ symmetric matrices. We claim $S_n$ is a subspace of $M_(n times n)(RR)$, where the vector space operations are entrywise addition and scalar multiplication.

  *Zero:* The zero matrix $bold(0)$ satisfies $bold(0)^TT = bold(0)$, so $bold(0) in S_n$. #h(1fr) $checkmark$

  *Closure under addition:* Let $A, B in S_n$, so $A^TT = A$ and $B^TT = B$. Using properties of the transpose,
  $ (A + B)^TT = A^TT + B^TT = A + B $
  so $A + B in S_n$. #h(1fr) $checkmark$

  *Closure under scalar multiplication:* Let $A in S_n$ and $c in RR$. Then
  $ (c A)^TT = c A^TT = c A $
  so $c A in S_n$. #h(1fr) $checkmark$

  Hence $S_n$ is a subspace of $M_(n times n)(RR)$.

  #remark[][
    The dimension of $S_n$ is $display(binom(n+1, 2)) = frac(n(n+1), 2)$, since a symmetric matrix is uniquely determined by its entries on and above the main diagonal.
  ]
]

#pagebreak(weak: true)

= 4.3 Linear combinations and spans

#definition[Linear combination][
  A *linear combination* of vectors $bold(v)_1, bold(v)_2, ..., bold(v)_k in V$ is the sum of scalar multiples of the vectors:
  $ sum_(i=1)^k alpha_i bold(v)_i = alpha_1 bold(v)_1, alpha_2 bold(v)_2, ..., alpha_k bold(v)_k $

  where each $alpha_i in FF$.
]

#definition[Span of a set of vectors][
  For a vector space $V$ over $FF$, the *span* of vectors $bold(v)_1 ... bold(v)_k in V$ is the _set of all linear combinations_ of the vectors:
  $ "span"{bold(v)_1, ..., bold(v)_k} = {alpha_1 bold(v)_1 + ... + alpha_k bold(v)_k | alpha_1, ..., alpha_k in FF} $
]

#theorem[Spans and subspaces][
  For vectors in a vector space, the span of these vectors is a subspace of the vector space.
]

== General method to determine if vectors span $FF^n$

If $A = [bold(v)_1 ... bold(v)_k]$ where $bold(v)_i in FF^n$ are column vectors, then:
+ $bold(v)_1, ..., bold(v)_k$ span $FF^n <=>$ the linear system with augmented matrix $[A | bold(w)]$ has a solution for all $bold(w) in FF^n$
+ $bold(v)_1, ..., bold(v)_k$ span $FF^n <=>$ rank($A$) = n

#theorem[rank and span][
  If $k lt n$, then vectors $bold(v)_1, ..., bold(v)_k in FF^n$ do not span $FF^n$.
]

#proof[
  Since $A = [bold(v)_1 ... bold(v)_k]$ has k columns, $"rank"(A) lt.eq k$.
  Since $k lt n$ this implies that $"rank"(A) != n$.
  Hence, $bold(v)_1, ..., bold(v)_k$ do not span $FF^n$
]

= 4.4 Linear dependence and linear independence

A vector space can have many sets that span it. To get a small spanning set, we need to remove 'redundant' vectors. This leads to the ideas of *linear dependence and independence*.

#definition[Linear dependence][
  The vectors $bold(v)_1, ..., bold(v)_k in V$ are *linearly dependent* if there exist scalars $alpha_1, ..., alpha_k in FF$, _with at least one $alpha_i$ non-zero_, s.t.
  $ sum_(i=1)^k alpha_i bold(v)_i = bold(0) $.
]

#definition[Linear independence][
  The vectors $bold(v)_1, ..., bold(v)_k in V$ are *linearly independent* if there exist scalars $alpha_1, ..., alpha_k in FF$, s.t.
  $ sum_(i=1)^k alpha_i bold(v)_i = bold(0) $
  has only the solution $alpha_i = 0$ for all $i lt k$.
]

#theorem[Linear dependence and combinations][
  The vectors $bold(v)_1, ..., bold(v)_k (k gt.eq 2)$ are _linearly dependent_ iff one vector is a linear combination of the others.
]

#example("Vectors in $RR^3$")[
  *Question.* Are the vectors
  $
    bold(v)_1 = vec(1, 0, 1), quad
    bold(v)_2 = vec(0, 1, 1), quad
    bold(v)_3 = vec(1, 1, 0)
  $
  linearly independent in $RR^3$?

  *Solution.* Row-reduce the matrix with these as rows:
  $
    mat(1, 0, 1; 0, 1, 1; 1, 1, 0)&
    R_3 arrow.l R_3 - R_1 \
    mat(1, 0, 1; 0, 1, 1; 0, 1, -1)&
    R_3 arrow.l R_3 - R_2 \
    mat(1, 0, 1; 0, 1, 1; 0, 0, -2)&.
  $
  Three pivots, so $bold(v)_1, bold(v)_2, bold(v)_3$ are *linearly independent*.
]

#example([Functions in $C(RR)$])[
  *Question.* Are $f_1(x) = sin^2 x$, $f_2(x) = cos^2 x$, $f_3(x) = cos(2x)$ linearly independent in $C(RR)$?

  *Solution.* Suppose $alpha f_1 + beta f_2 + gamma f_3 = 0$ for all $x$. Evaluating at $x = 0, pi/2, pi/4$ gives the system
  $
    beta + gamma = 0, quad alpha - gamma = 0, quad alpha + beta = 0,
  $
  which has the non-trivial solution $(alpha, beta, gamma) = (1, -1, 1)$.
  So $f_1, f_2, f_3$ are *linearly dependent*,.
]

== General method for determining if vectors are linearly independent

If $A = [bold(v)_1 ... bold(v)_k]$ where $bold(v)_i, ..., bold(v)_k in FF^n$ are column vectors, then:
+ $bold(v)_i, ..., bold(v)_k in FF^n$ are linearly dependent $<=>$ the linear system with augmented matrix $[A | bold(0)]$ has a unique solution.
+ $bold(v)_i, ..., bold(v)_k in FF^n$ are linearly independent $<=>$ rank$(A) = k$.
+ If $k = n$ then
$ bold(v)_i, ..., bold(v)_k in FF^n "are linearly independent" <=> det(A) != 0 $

#theorem[Vector count][
  Let $bold(v)_i, ..., bold(v)_k in FF^n$. If $k > n$, then the vectors are linearly dependent.
]

#proof[
  Let $A = [bold(v)_i ... bold(v)_k]$ where $bold(v)_i in FF^n$.
  Then rank$(A) lt.eq n$.
  Since $k lt n$ this implies that rank$(A) != k$.
  Hence the vectors are linearly dependent.
]

== Linear combinations via reduced row-echelon form

Let $A = [bold(v)_i ... bold(v)_k]$ and $B = [bold(u)_i ... bold(u)_k]$ be matrices with vectors in columns.

If A and B are row-equivalent (ie. $A ~ B$), then the columns of A satisfy the _same linear relations_ as the columns of B:

$ alpha_1 bold(v)_1 + ... + alpha_k bold(v)_k = 0 <=> alpha_1 bold(u)_1 + ... + alpha_k bold(u)_k = 0 $ 

If $A~B$ and B is in RREF, then the relations between the $bold(v)$ vectors can be read off from B.


#example([Row-equivalent matrices share column relations])[
  Let $A = [bold(v)_1 | bold(v)_2 | bold(v)_3 | bold(v)_4]$ where
  $
    bold(v)_1 = vec(1,2,1), quad
    bold(v)_2 = vec(2,3,1), quad
    bold(v)_3 = vec(1,1,0), quad
    bold(v)_4 = vec(3,5,2).
  $
  Row-reducing $A$ to RREF gives $A ~ B$:
  $
    A = mat(1,2,1,3; 2,3,1,5; 1,1,0,2)
    ~
    mat(1,0,-1,1; 0,1,1,1; 0,0,0,0) = B.
  $
  Columns 1 and 2 are pivot columns; columns 3 and 4 are free.
  Solving $B bold(x) = bold(0)$ gives $x_1 = x_3 - x_4$ and $x_2 = -x_3 - x_4$, so the null space is spanned by
  $
    bold(x) = x_3 vec(1,-1,1,0) + x_4 vec(-1,-1,0,1).
  $
  These two vectors give the *complete* set of linear relations among the columns.
  By row-equivalence the same relations hold for $A$:
  $
    bold(v)_1 - bold(v)_2 + bold(v)_3 = bold(0), quad
    -bold(v)_1 - bold(v)_2 + bold(v)_4 = bold(0).
  $
  We can verify the first directly: $(1,2,1) - (2,3,1) + (1,1,0) = (0,0,0)$. $square$
]

#pagebreak(weak: true)

= 4.5 Bases and Dimension

Sometimes spanning sets are larger than they need to be, so to get an efficient description of a vector space V, we want to find a set with the _minimum number of vectors_ needed to span V.

#definition[Basis][
  A *basis* for a vector space V is a set of vectors in V which:
  + Spans V, and
  + Is linearly independent.
]

#note[Unique bases][
  A vector space V can have many different bases, they are not unique, eg. any two linearly independent vectors in $RR^2$ will span $RR^2$
]

#theorem[Existence of bases][
  Let $V$ be a vector space. Then
  + V has a basis.
  + Any set that spans $V$ contains a basis for $V$
  + Any linearly independent set in $V$ can be extended to a basis of $V$
]

#theorem[Length of basis][
  For a vector space V with basis {bold(v)_1, ..., bold(v)_k}:
  + A subset of $V$ with more than $k$ vectors is linearly dependent
  + A subset of $V$ with fewer than $k$ vectors does not span $V$
  + Any two bases of $V$ have the same number of elements, $k$
]

This allows us to define the dimension of a vector space.

#definition[Dimension][
  The *dimension* of a vector space $V$ is the number of vectors in any basis for $V$. This is denoted by dim$(V)$.

  We call $V$ *finite dimensional* if it has a basis with a finite number of elements, and infinite dimensional otherwise.
]

#note[Empty basis][
  If $V = {bold(0)}$, we say that dim$(V) = 0$ and a basis for $V$ is the empty set.
]

#pagebreak(weak: true)

== Standard bases

- The *standard basis for $RR^n$* is
  $
    {(1,0,0,dots,0),\ (0,1,0,dots,0),\ dots,\ (0,0,0,dots,1)}.
  $
  These vectors are typically denoted as ${bold(e)_1, bold(e)_2, dots, bold(e)_n}$. 
  (In $RR^3$ the standard basis is also denoted by ${bold(i), bold(j), bold(k)}$)

  The dimension of $RR^n$ is $n$.

- The *standard basis for $M_(m,n)$* is
  $
    {
    mat(1,0,dots,0; 0,0,dots,0; dots.v,dots.v,,dots.v; 0,0,dots,0),
    mat(0,1,dots,0; 0,0,dots,0; dots.v,dots.v,,dots.v; 0,0,dots,0),
    dots,
    mat(0,0,dots,0; 0,0,dots,0; dots.v,dots.v,,dots.v; 0,0,dots,1)
    }.
  $
  The dimension of $M_(m,n)$ is $m n$.

- The *standard basis for $cal(P)_n$* is
  $
    {1, x, x^2, dots, x^n}.
  $
  The dimension of $cal(P)_n$ is $n+1$.

- Let $cal(P)$ be the set of *all* polynomials of all possible degrees:
  $
    cal(P) = {a_0 + a_1 x + dots + a_n x^n mid(|) n in NN,\ a_0, a_1, dots, a_n in RR}.
  $
  where $NN$ denotes the set of natural numbers. 
  $cal(P)$ is an *_infinite dimensional_* vector space. 
  The *standard basis for $cal(P)$* is
  $
    {1, x, x^2, dots}.
  $

#theorem[][
  Let $V$ be a vector space, and suppose dim$(V) = n$ is finite.
  + If a set with exactly $n$ elements spans $V$, then it is a basis of $V$
  + If a linearly independent subset of $V$ has exactly $n$ elements, then it is a basis for $V$
]

#pagebreak(weak: true)

== Finding a basis for the span of a set of vectors in $FF^n$

Recall that if $A~B$, then the columns of $A$ and $B$ satisfy the same linear relationships.

*Method 1:* Using columns

To find a basis for $V = "span"{bold(v)_1, ..., bold(v)_k}$ where $bold(v)_1 ... bold(v)_k in FF^n$.
+ Form the matrix $A$ with _columns_ $bold(v)_1, ..., bold(v)_k$.
+ Reduce $A$ to row-echelon form $B$.
+ The columns of $A$ corresponding to the leading entries of $B$ give a basis for $V$.

#note[][
  This method gives a basis that _is a subset_ of the original set of vectors.
]

*Method 2:* Using rows

To find a basis for $V = "span"{bold(v)_1, ..., bold(v)_k}$ where $bold(v)_1 ... bold(v)_k in FF^n$.
+ Form the matrix $A$ with _rows_ $bold(v)_1, ..., bold(v)_k$.
+ Reduce $A$ to row-echelon form $B$.
+ The non-zero rows of $B$ give a basis for $V$.

#note[][
  This method gives a basis that _usually is not a subset_ of the original set of vectors.

  This works because elementary row operations do not change the subspace spanned by the rows, and in the row-echelon form the non-zero rows are linearly independent.
]

#pagebreak(weak: true)

= 4.6 Solution space, column space, row space

#theorem[Solution space][
  Let $A in M_(m, n)(FF)$ be an $m*n$ matrix with entries in $FF$. Then the solution set
  $ S = {bold(x) in FF^n | A bold(x) = bold(0)} $
  is a subspace of $FF^n$, with *x* as a column vector.

  This is called the *solution space* or *nullspace* of $A$, and its dimension is called the _nullity_ of $A$, denoted by _nullity($A$)_.
]

#proof[
  Follows from the conditions of the subspace theorem.
]

#definition[Column space][
  Let $A in M_(m,n)(FF)$ be an $m*n$ matrix with entries in $FF$. The subspace of $FF^m$ spanned by the columns of $A$ is called the *column space* of $A$.
]

#definition[Row space][
  Let $A in M_(m,n)(FF)$ be an $m*n$ matrix with entries in $FF$. The subspace of $FF^n$ spanned by the rows of $A$ is called the *row space* of $A$.
]

#note[][
  - The column space and row space are subspaces, since the span of any set of vectors is a subspace.
  - To find a basis for the column space us the column method.
  - To find a basis for the row space use the row method.
]

== Effect of row operations

Assume that $A~B$ by a sequence of elementary row operations. Then:
- Solution space of $A = $ solution space of $B$,
- Row space of $A = $ row space of $B$,
- Column space of A is not necessarily the column space of $B$.

#theorem[][
  For any $m*n$ matrix $A$:
  $ "rank"(A) = "dim"("row space of "A) = "dim"("column space of "A) $
]

This is because in both case the number of leading entries in row-echelon form determines the number of basis vectors.

#linebreak()

#theorem[Rank-nullity theorem][
  Suppose $A$ is an $m*n$ matrix. Then:
  $ "rank"(A) + "nullity"(A) = n = "number of columns in "A $
]

#proof[
  Suppose $A$ has row-echelon form $B$.
  The rank of $A$ = the number of columns in $B$ containing a leading entry. 
  The nullity of $A$ equals the number of columns in B which do not contain a leading entry.
  Therefore, $"rank"(A) + "nullity"(A)$ is the number of columns in $B$, which is the number of columns in $A$.
]

#pagebreak(weak: true)

= 4.7 Coordinates relative to a basis

