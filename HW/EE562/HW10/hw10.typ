#set heading(numbering: "1.")
#set page(numbering: "1")

#let name = "Edward Kim"
#let class = "EE 562"
#let hw_num = 10
#set enum(numbering: "a)",
          indent: 2em,
          spacing: 2em)



#[
 #set text(font: "Linux Libertine",
           size: 20pt)
 #align(center)[#class HW  #hw_num]]
#align(center)[#name]


= Problem 1

+ The transition rate diagram for the chain is displayed in @mc1. As a finite irreducible chain, its stationary distribution can be
  determined directly through the transition rates out $q_(i)$ and the mean inter-arrival times to state $i$ denoted as $EE[W_i]$.
  The mean inter-arrival times can be found through reasoning on the transition rate diagram below:
  $ pi_1 & =  1/(nu_1 dot.c EE[W_1])  \
            & = 1/(3 dot.c (1/3 + 1/4 + 1)) \
            & = 4/19 $


   #align(center)[
     #figure(
            image("mc1.png", width: 80%),
            caption: [Transition Diagram for Problem 1 Part a]
            ) <mc1>
    ]

    Now performing the same sequence of steps shows that $pi = (4/19, 3/19, 12/19)$

+ The transition to the next state $i+1$ from state $i$ occurs with probability one for all such states, regardless of holdings times. Henec, the transition matrix $P_(tilde(M))$ for the
  jump chain $tilde(M)$ equates to: $ P_(tilde(M)) = mat(0,1,0; 0,0,1; 1,0,0) $

+ Let $X_1, X_2$ denote random variables respectively representing the holding times between transitions from states $1 arrow.r 2$ and transitions from states $2 arrow.r 3$. It suffices to compute the following probability:
$ PP[X_1 + X_2 <= 3] & = integral_0^3  (e^(-x/3)/3)(e^(-(3-x)/4)/4) dif x \
                     & = (1/12) integral_0^3 e^((9-x)/12) dif x \
                     & = (e^(-3/4)/12) (-12 e^(-x/12) bar.v_0^3 ) \
                     & = e^(-3/4) - e^(-1) \
                     & approx 0.104 $


= Problem 2

+ It is evident from the transition rates that $P_(i,i+1) = lambda_i / (lambda_i + mu_i)$ and $P_(i,i-1) = mu_i / (lambda_i + mu_i)$. Therefore,
  $ PP["First " k " are births" bar.v X_0 = i] = product_(ell = i)^(i+k) lambda_ell /(lambda_ell + mu_(ell))$.

+ Expanding the definition shows that:
  $ (d P_(i j)(t))/ (d t) & = sum_(k eq.not j) P_(i,k)(t) q_(k,j) - P_(i,j)(t) nu_j  \
                     & = (P_(i,j-1)(t) dot.c lambda_(j-1) + P_(i,j+1)(t) dot.c mu_(j+1)) - P_(i,j)(t) (lambda_(j) + mu_(j)) $

+ Reversability implies the existence of stationary distribution has been shown in lecture. Conversely, suppose such a stationary distribution exists. If $Q$ is the generator matrix of the
  Markov process, then it must be that $pi Q = 0$ by definition. Consider any entry in the row vector $ pi Q$. Any fixed column in $Q$ has at most three non-trivial elements:
  $ Q_(i j) = cases(lambda_i & "if" j=i+1,
                    mu_i & "if" j=i-1,
                     - lambda_i - mu_i & "if" j=i,
                    0 & "otherwise") $

  Hence, the relation $pi Q = 0$ above enforces that $lambda_(i-1) pi_(i-1) - (lambda_i + mu_i) pi_i mu_(i+1)pi_(i+1) = 0$ or alternatively:
  $ mu_(i+1) pi_(i+1) - lambda_i pi_i = mu_i pi_i - lambda_(i-1) pi_(i-1) $
  The rest of the argument can be finished through an induction on $i$ after noticing that the constraint imposed by the inner product of $pi$ and the first column of $Q$ shows that $pi_0 lambda_0 = pi_1 mu_1$ as needed.


= Problem 3
  The transtion rate diagram for the Markov model is given by @mc2. We determine the generator matrix $Q$ to be:
  $ Q = mat(-(lambda_1 + lambda_2), lambda_2, lambda_1, 0 ;
            mu_2, -(lambda_1 + mu_2), 0, lambda_1 ;
            mu_1, 0, -(mu_1 + lambda_2), lambda_2 ;
            0, mu_1, mu_2, -(mu_1 + mu_2)) $

   #align(center)[
     #figure(
            image("mc2.png", width: 80%),
            caption: [Transition Diagram for Problem 3]
            ) <mc2>
    ]


= Problem 4

+ Hitting probabilities do not depend on the holding times between state transitions. Hence, we ascertain the jump chain to be @mc3. Let $p_i = PP["Hitting 3" bar.v X_0 = 1]$. Now it is evident that:
  $ p_1 & = 1/2 + 1/2 p_2 \
    p_2 & = 2 p_1 \
    p_3 & = 1 $

  which implies that $p_1 = 2/3$.


+ Let $h_i^((4)) = EE[T_4 bar.v X_0 = i]$ denote the expected hitting time of state $4$ starting at state $i$. We can directly solve for $h^(4)_1$ as below:
  $ & h_3^((4))  = 1/2 + 1/2 [h_1^((4)) + 1] = h_2^((4)) \
    arrow.r.double & h_1^((4)) = 1/2 h_3^((4)) + 1/2 h_2^((2)) + 1 \
     = & 1 + (1/2 + 1/2[h_1^((4)) + 1]) \
     = & 2 + 1/2 h_1^((4))
  $

  This implies that $h_1^((4)) = 4$.

  #align(center)[
     #figure(
            image("mc3.png", width: 80%),
            caption: [Jump Chain Transition Diagram for Problem 4]
            ) <mc3>
    ]


= Problem 5

The jump chain transition diagram is pictured in @mc4 and the relevant communication class properties are shown in @tab1.

#figure(
 table(
  columns: (1fr, auto, auto),
  inset: 10pt,
  align: horizon,
  [Communication Class], [Recurrent (?)], [Closed (?)],
  [{1,3}], [No], [No],
  [{2,4}], [Yes], [Yes],
  [{5}], [No], [No],
),
caption: [Communication Classes and Properties]
)<tab1>


  #align(center)[
     #figure(
            image("mc4.png", width: 80%),
            caption: [Jump Chain Transition Diagram for Problem 5]
            ) <mc4>
    ]

