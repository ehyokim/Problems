#set heading(numbering: "1.")
#set page(numbering: "1")

#let name = "Edward Kim"
#let class = "EE 562"
#let hw_num = 11
#set enum(numbering: "a)",
          indent: 2em,
          spacing: 2em)



#[
 #set text(font: "Linux Libertine",
           size: 20pt)
 #align(center)[#class HW  #hw_num]]
#align(center)[#name]


= Problem 1

+ The mean can be directly computed from the transition probabilities provided:
  $ R_X(tau) & = EE[X_s X_t] \
           & = 1 dot.c (P_(1,1)(tau) + P_(-1,-1)(tau)) + (-1) dot.c (P_(1,-1)(tau) + P_(-1,1)(tau)) \
           & = 1 dot.c (1 + e^(-2 alpha tau)) + (-1) dot.c (1 - e^(-2 alpha tau)) \
           & = 2 e ^(-2 alpha tau) $

+ Observe the series of implications:
  $ & lim_(s,s' -> t) (R_X(s,s') - R_X(s,t) - R_X(t,s') + R_X(t,t))/((s - t)(s' - t)) \
  = & lim_(tau,tau' -> 0) (2e^(-2 alpha (tau - tau')) - 2e^(- 2 alpha tau) - 2 e^(-2 alpha tau') + 2)/(tau dot.c tau') \
  = & lim_(tau -> 0) 1/(tau) (lim_(tau' -> 0) (2e^(-2 alpha (tau - tau')) -2 e^(-2 alpha tau) - 2 e^(-2 alpha tau') + 2)/(tau')) \
  = & lim_(tau -> 0) 1/(tau) (4 alpha e^(-2 alpha (tau - 0)) + 4 alpha e^(-2 alpha dot.c 0)) \
  = & -8 alpha^2 $

+
