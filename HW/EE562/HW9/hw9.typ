#set heading(numbering: "1.")
#set page(numbering: "1")

#let name = "Edward Kim"
#let class = "EE 562"
#let hw_num = 9
#set enum(numbering: "a)",
          indent: 2em,
          spacing: 2em)



#[
 #set text(font: "Linux Libertine",
           size: 20pt)
 #align(center)[#class HW  #hw_num]]
#align(center)[#name]


= Problem 1

+ The transition diagram for the chain is listed in @mc1. The stationary distribution is found by solving the appropriate linear system of the form $pi P = pi$.
  This stationary distribution is readily found to be:
  $ pi & = mat(pi_0, pi_1, pi_2, pi_3, delim:"[") \
       & = mat(1/(2(1+a)), (1-a)/(2(1+a)), a/(1+a), (2a)/(2(1+a)),delim:"[") $

   #align(center)[
     #figure(
            image("mc1.png", width: 80%),
            caption: [Transition Diagram for Problem 1 Part a]
            ) <mc1>
    ]

+ Let $h_i = EE[min brace.l n >= 0: X_n = 3 brace.r bar.v X_0 = i]$ denote the expected hitting time for state three starting at state $i$.
  We seek $h_0$, which can be calculated through determining the relevant recurrence relations between the expected hitting times:
  $ h_0 & = h_1 + 1 \
    h_1 & = (1-a)(h_0 + 1) + a(h_2 + 1) \
    h_2 & = 1/2 (h_1 + 1) + 1/2 \
    h_3 &= 0 $

    Substituting $h_2$ into the expression for $h_1$ shows that: $ h_1 = 2((1-a)/(2-a))h_0 + 2((1+a)/(2-a)) $ Performing the final subsitution into $h_0 = h_1 + 1$ and solving for $h_0$ shows that:
    $ h_0 = 1 + 4/a $

= Problem 2

Consider the related Markov chain $(Y_n)_(n >= 0)$ with state space $cal(S) = {0,1,2,3,4}$ with transition probabilities listed as in @mc2 below.
We interpret this chain as the absolute distance from $-2$ to the current step of the walk. Hence, $Y_0 = 2$ and the desired hitting probability can be expressed as a variant of the Gambler's Ruin Problem with initial fortune $k = 2$ and success fortune $N = 4$.

   #align(center)[
     #figure(
            image("mc2.png", width: 80%),
            caption: [Transition Diagram for MC $Y$ in Problem 2]
            ) <mc2>
    ]

However, notice that by symmetry the probability of hitting $2 (4)$ first before $-2 (0)$ starting at $X_0 = 0 (Y_0 = 2)$ is identical to the probability of hitting $-2(0)$ first before $2(4)$ starting at $X_0 = 0(Y_0 = 0)$. Furthermore, with probablity one, one of these two disjoint events must occur. Hence, this shows that the required probability is $1/2$.

= Problem 3

+ The process $(X_n)_(n >= 0)$ is not a Markov chain as shown by the following simple counterexample:
  Let $X_0 = 1, X_1 = 1$. Notice that $PP[X_2 = 1 bar.v X_1=1]$ depends on the event ${X_0 = 0}$. However, $PP[X_2 = 1 bar.v X_1 = 1, X_0 = 1] = 1/3((0.7)^3 + (0.5)^3)$ as knowing the full previous history will allow us to determine if the coin has changed since the 0#super[th] day.
  The probability will simply be the sum of two conditional probabilities of sampling heads for three consecutive days in respect to a biased coin.

+  The process $(Y_n)_(n gt 0)$ is a Markov chain as it is evident that the coin to be flipped the next day is only dependent on the current day's coin. The transition probabilities are given by the @mc3 and the matrix:
   $ P_Y = mat(0.7, 0.15, 0.15 ; 0.25 , 0.5 , 0.25 ; 0.5, 0.5, 0) $

   #align(center)[
     #figure(
            image("mc3.png", width: 80%),
            caption: [Transition Diagram for MC $Y$ in Problem 3]
            ) <mc3>
    ]

+ Solving for the stationary distribution by the linear system $pi_Y P_Y = pi_Y$ yields that $pi_Y = (10/19, 6/19,3/19)$. By @mc3, it is evident that
  $Y$ is finite and irreducible. Hence, it must converge to the unique stationary distribution $pi_Y$. Let $X_n$ denote the indicator variable of rolling a head at step $n$ as defined above, and define $S_n = sum_(i=0)^n X_i$.
  We seek to find the limiting value of $S_n/n$ as $n -> oo$. To this end, we attempt to approximate $EE[X_n]$ when $n$ is sufficiently large enough to be well-approximated by the stationary distribution of $Y$:
  $ EE[X_n] = PP[X_n = 1] = 7/10 dot.c PP[Y_n = 1] + 1/2 dot.c PP[Y_n = 2] = 7/10 dot.c 10/19 + 1/2 dot.c 6/19 = 10/19$. In this limit, all $X_n$ will be distributed identically. Treating $PP[X_n = 1]$ as the proportion of heads flipped in the limit, $10/19$ becomes our required fraction.


= Problem 4

+ Since $p_i > 0$ for every $i >= 1$, it is clear that this chain only has one communication class. Hence, it is irreducible. It is aperiodic by inspecting the state $0$ and noticing that it has paths of all positive lengths $>= 2$. Hence, as a class, the whole chain must be aperiodic. As state $0$ is trivially recurrent, as a class, all states in the chain must be recurrent as well.

+ Let $T_(00)$ denote the time between the first return to state 0 after starting at state 0. By the definition of the chain, it is evident that $ EE[T_(00)] = sum_(i=1)^(oo)  (i+1) dot.c p_i$. Since $sum_(i = 1)^(oo) p_i = 1$, rearranging the terms of the infinite sum in the expectation yields that:
$ EE[T_(00)] = 2 + sum_(i =2)^(oo) PP[T_(00) gt n] $

= Problem 5

+ The relevant transition diagram is shown in @mc4. Let $p = PP[exists n >= 1: X_n = 0 bar.v X_0 = 0]$ denote the probability of the the Markov chain (call the chain $X$) eventually returning to state 0. To compute $p$, it serves to compute the easier complementary probability of the chain not returning to state 0:
  $ 1 - p = product_(n=0)^(oo) p_n $

  Hence, ensuring that state 0 is recurrent essentially amounts to imposing that $product_(i=0)^(n) p_i -> 0$ as $n -> oo$. Such a criterion can be enforced by requiring there exist an infinite number of $p_n$ such that $0 < p_n < 1$ such that their partial products vanish sufficiently quickly or at least one $p_n = 0$ for some $n$.
  In other words, let $E_n = {and.big_(i=1)^n X_i eq.not 0}$ denote the event where $X$ has not returned to state 0 within $n$ steps. By @mc4, it is clear that $PP[E_n] = product_(i=1)^n p_i$. By Borel-Cantelli, state 0 becomes recurrent if $sum_(i=1)^(oo) PP[E_n] < oo$ or equivalently if
  $ sum_(n = 1)^(oo) product_(j=1)^n p_j < oo $

  To ensure positive recurrence, we need $EE[T_(00)] < oo$ where $T_(00)$ is the inter-arrival time in respect to state 0. This is equivalent to saying
  $ sum_(n = 1)^(oo) (n+1) dot.c product_(i = 0)^(n-1) p_i (1-p_n) < oo$. This occurs when $ product_(i = 0)^(n-1) p_i (1-p_n) -> 0$ on the order of $1/(n^(2 + epsilon))$ for some constant $epsilon > 0$.

  As a final remark, the case where $p_i = p$ for some fixed probability will have state 0 as a positive recurrent state as $product_(i=0)^(n) p_i -> 0$ in exponential order $p^n$ as $n -> oo$.

   #align(center)[
     #figure(
            image("mc4.png", width: 80%),
            caption: [Transition Diagram for Problem 1 Part a]
            ) <mc4>
    ]

+ By our discussion in the previous part, a unique stationary distribution cannot exist if the chain has a non-trivial probability of never returning back to zero. In this case, it will continuously move to the right indefinitely with some non-zero probability. In the case where state 0 is positive recurrent.
  However, consider a special case of positive recurrence where $p_i = p$ for some fixed $0 < p < 1$. A quick inspection shows that the following must hold for any stationary distribution $pi$ of this chain:
  $  (1-p) dot.c sum_(i=0)^(oo) pi_i & = pi_0 \
  p dot.c pi_(i-1) & = pi_i " for " i >= 1 $

  The distribution $pi_i = (1-p) dot.c p^(i-1)$ for $i >= 0$ satisfies the above desiderata:
  $ sum_(i=0)^(oo) pi_i = pi_0 dot.c sum_(i=0)^(oo) p^i  = pi_0/(1-p) $

  Notice how as $p ->1$, the stationary distribution tend to spread out more towards higher values with $pi_0$ decreasing (as we would expect it to).


대만c
