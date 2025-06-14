#import "template.typ": *
#import "@preview/physica:0.9.2": *
#import "@preview/xarrow:0.3.0": xarrow

#show: project.with(
  title: "CSCI575 Homework 1",
  authors: (
    "Edward Kim",
  ),
  show_info: true,
)

#question("Problem 1")[

  First, observe that the Bell state $ket(Phi^+) = 1 / sqrt(2) (ket(00) + ket(11)) = 1 / sqrt(2) (ket(++) + ket(--))$. This can be seen through direct calculation:

    $ 1 / sqrt(2) (ket(++) + ket(--)) & = 1 /sqrt(2) [ {(ket(0) + ket(1))/sqrt(2)} times.circle {(ket(0) + ket(1))/sqrt(2)} + {(ket(0) - ket(1))/sqrt(2)} times.circle {(ket(0) - ket(1))/sqrt(2)} ]\
    & = 1 / sqrt(2) [1/2{2 ket(00) + 2 ket(11)} + 1/2(cancel(ket(01) + ket(10) - ket(01) - ket(10)))] \
    & = 1 / sqrt(2) (ket(00) + ket(11))
    $

    This shows that that a measurement on the first qubit in the $ket(+),ket(-)$ basis will yield $ket(++),ket(--)$ with equal probability.
]

#question("Problem 2")[
    Suppose we have $ket(Psi^-) = 1 / sqrt(2) (ket(01) - ket(10))$. We will expand out the tensor products using the orthogonal decompositions $ket(0) = a ket(u) + b ket(v)$ and $ket(1) = c ket(u) + d ket(v)$.

    $ ket(Psi^-) & = 1 / sqrt(2) [{a ket(u) + b ket(v)} times.circle { c ket(u) + d ket(v) } - { c ket(u) + d ket(v) } times.circle {a ket(u) + b ket(v)}] \
                 & = 1 /sqrt(2) [{cancel(a c ket(u u)) + a d ket(u v) + b c ket(v u) + cancel(b d ket(v v))} - {cancel(c a ket(u u)) + c b ket(u v) + d a ket(v u) + cancel(b d ket(v v))} ] \
                 & = 1 /sqrt(2) [{a d - c b} ket(u v) + {b c - d a} ket(v u)] \
                 & = (a d - c b) / sqrt(2) (ket(u v) - ket(v u) )$

    We see that this entangled state is actually entangled under any orthonormal basis, not just the computational basis.
]

#question("Problem 3")[

    #part[To see that $beta_(11)$ is entangled, it suffices to see that any non-entangled state in the computational basis must have the following form: For some $ket(phi) = alpha ket(0) + beta ket(1)$ and $ket(psi) = gamma ket(0) + delta ket(1)$: $ ket(phi) times.circle ket(psi) = alpha gamma ket(00) + alpha delta ket(01) + beta gamma ket(10) + beta delta ket(11) $ If $beta_(11) = ket(phi) times.circle ket(psi)$, then by the orthonormality of the computational basis, we find that $alpha delta = 0$ and $beta gamma = 0$. Analyzing cases reveals that either $ket(phi) times.circle ket(psi) = ket(00), ket(11)$, contradicting our original assumption.

          ]

    #part[This result follows from direct computation:

            $ ket(11) xarrow(sym: -->, H times.circle I) {(ket(0) - ket(1))/sqrt(2)} times.circle ket(1) = (ket(01) - ket(11))/sqrt(2) xarrow(sym: -->, "CNOT") (ket(01) - ket(10))/sqrt(2) $

          ]
]
