Bayesian Methods and Their Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios Bayesian Methods UoG 1 / 36
Objective
To introduce the main numerical methods that can be used to evaluate the
integrals necessary in many Bayesian problems.
Ana Paula Palacios Bayesian Methods UoG 2 / 36
Introduction
Practical implementation of Bayesian methods requires substantial computation.
Computing the posterior distribution requires the evaluation of an integral:
f (θ|x) = f (x|θ)f (θ)
f (x)
=
f (x|θ)f (θ)
R
f (x|θ)f (θ) dθ
.
Most summarization operations also require the evaluation of an integral of the
form
I =
Z
g(x)f (θ|x) dθ.
For example, when evaluating the posterior mean g(θ) = θ. Exact Bayesian
inference is sometimes infeasible or intractable and therefore, numerical methods
are often needed.
Ana Paula Palacios Bayesian Methods UoG 3 / 36
Approximate methods of inference
Numerical integration (not valid for large dimensions)
Gaussian approximations (not valid for small samples)
Monte Carlo approaches:
I direct methods
I via Markov chains
Ana Paula Palacios Bayesian Methods UoG 4 / 36
Monte Carlo Integration
Suppose that we wish to estimate E[g(X)] for some function g(x) with respect to
a density f (x). Thus,
E[g(X)] = Z
g(x)f (x) dx.
Monte Carlo integration involves the following:
1 Sample N independent values x1, x2, . . . , xN from f (x)
2 Calculate g(xi) for each xi
3 Estimate E[g(X)] by the sample mean of the g(xi)
g¯(x) = 1
N
X
N
i=1
g(xi)
Note that ¯g(x) is an unbiased estimator, i.e. as N → ∞, ¯g(x) → E[g(X)].
Ana Paula Palacios Bayesian Methods UoG 5 / 36
Monte Carlo Integration
Posterior mean
To compute the posterior mean we have
E[θ|x] = Z
θ
θf (θ|x) dθ
Example
Consider the likelihood X ∼ Binomial(n, θ) and the prior distribution
θ ∼ Beta(a, b). We have seen that the posterior distribution is
θ|x ∼ Beta(x + a, n − x + b). Assuming n = 100, x = 40, a = 1 and b = 1, use R
to compare the posterior mean with its Monte Carlo approximation. Repeat the
comparison for the 95% centred credible interval.
Ana Paula Palacios Bayesian Methods UoG 6 / 36
Example
Ana Paula Palacios Bayesian Methods UoG 7 / 36
Example
Ana Paula Palacios Bayesian Methods UoG 8 / 36
Example
N = 100, 000
True Posterior Monte Carlo
Mean 0.401961 0.401962
Median 0.401318 0.401231
CI (0.309309, 0.498256) (0.309826, 0.498621)
P(θ < 0.5) 0.976978 0.976670
Note that by increasing the Monte Carlo sample, the precision of the
approximation improves.
Ana Paula Palacios Bayesian Methods UoG 9 / 36
Importance Sampling
In many real cases it is not possible to generate a sample directly from f (x) or it
is too complicated. Suppose instead that we can easily sample from another
density, q(x), called the importance function, which is an approximation to f (x).
Now, we have
Ef
[g(X)] = Z
g(x)f (x) dx
=
Z
g(x)f (x)
q(x)
q(x) dx
=
Z
g(x)ω(x)q(x) dx
= Eq[g(x)ω(x)]
where ω(x) = f (x)
q(x)
. Now, we can approximate the expectation by generating a
sample of size N from q(x):
Ef
[g(x)] ≈
1
N
X
N
i=1
ω(xi)g(xi) for i = 1, . . . , N.
Ana Paula Palacios Bayesian Methods UoG 10 / 36
Importance Sampling
Furthermore, if the density f (x) = ck(x) is known only up to an integration
constant,
f (x) ∝ k(x),
then we can extend the approximation to give
E[g(X)] ≈
PN
i=1 ω(xi)g(xi)
PN
i=1 ω(xi)
where ω(xi) = k(xi)/q(xi). In this case PN
i=1 ω(xi)/N is equal to c
−1
.
Posterior density
Typically, we shall be concerned with focusing on the posterior
f (θ|x) = cg(θ)
where g(θ) = f (x|θ)f (θ) and c is the normalising constant. In many cases c will
be unknown because the integral of the normalising constant cannot be carried
out analytically.
Ana Paula Palacios Bayesian Methods UoG 11 / 36
Importance Sampling
Ana Paula Palacios Bayesian Methods UoG 12 / 36
R code: Importance Sampling
True value Importance Sampling
Mean 0.6363636 0.6348629
Beta function 6.142808e-07 6.193125e-07
Ana Paula Palacios Bayesian Methods UoG 13 / 36
Importance Sampling
Remarks:
In principle we can choose any importance function. The only requirement is
that supp (q) ⊃ supp (g × f ). Otherwise, a smaller support of q will truncate
the integral and produce a biased result.
The choice of the importance function q(x) will strongly influence the
efficiency of this algorithm. We cannot choose importance functions with
lighter tails than f (x).
Moreover, if the importance function, q(x), is not similar to f (x) (or k(x)),
so that the centre of f (x) (or k(x)) is in the tail of q(x), this can lead to
many of the importance weights being very small and thus, the integral
estimates may be largely determined by a very small number of data.
Therefore, an an efficient importance function will be similar to the true
density, but with heavier tails
Ana Paula Palacios Bayesian Methods UoG 14 / 36
Sampling Importance Resampling (SIR)
The importance sampling technique does more than approximate integrals,
though, since it provides an alternative way to simulate from complex distributions.
Recall that the method produces a sample x1, . . . , xn simulated from q(x) along
with its importance weights f (xi)/q(xi).
This sample can be recycled by multinomial resampling into a sample that is from
f (x).
Sampling Importance Resampling
Generate an approximate sample, ˜x1, . . . , x˜M of size M < N from f (x) by setting
x˜j = xi for i = 1, . . . , N and j = 1, . . . , M with probability ωi
, where
ωi =
ω(xi)
PN
i=1 ω(xi)
=
(f (xi)/q(xi))
PN
i=1(f (xi)/q(xi))
.
Ana Paula Palacios Bayesian Methods UoG 15 / 36
R code: Sampling Importance Resampling
Ana Paula Palacios Bayesian Methods UoG 16 / 36
Example: Sampling Importance Resampling
The
SIR sample data well approximate the beta density.
Ana Paula Palacios Bayesian Methods UoG 17 / 36
The Rejection Algorithm
Assume the we wish to generate a sample from f (x), which is not easy to
simulate from. The rejection approach chooses to generate data from a proposal
distribution, h(x), such that
f (x) ≤ Mh(x)
for some given M ≥ 1. The algorithm proceeds as follows:
For i = 1, . . . , N:
1 Generate ˜xi ∼ h(x)
2 Generate ui ∼ U(0, 1)
3 If Muih( ˜xi) < f (˜xi), set xi = ˜xi
4 Otherwise, repeat from step 1
Ana Paula Palacios Bayesian Methods UoG 18 / 36
The Rejection Algorithm
The main problem with rejection sampling is to find a good proposal distribution
so that only a small number of candidates are rejected. Note that the probability
of accepting a draw is:
P

U ≤
f (X)
Mh(X)

= E

I
U≤
f (X)
Mh(X)

= E

E[I
U≤
f (X)
Mh(X)
|X]

= E

P

U ≤
f (X)
Mh(X)
|X

= E

f (X)
Mh(X)

=
Z
x:h(x)>0
f (x)
Mh(x)
h(x) dx
=
1
M
Z
x:h(x)>0
f (x) dx =
1
M
So that we would like M to be as close to 1 as possible.
Ana Paula Palacios Bayesian Methods UoG 19 / 36
Example: Beta distribution
Beta distribution
Assume Beta(a, b) is our target distribution and the proposal distribution is
Unif (0.1). The M that attains the inequality
f (θ|x) ≤ Mh(θ)
is simply the density of the Beta(a, b) at its mode. Since the mode is
c = (a − 1)/(a + b − 2), then M = Beta(c; a, b).
Perform 1,000 iterations of the rejection sampling to generate a sample of the
target distribution. Compute the acceptance probability, theoretically and
empirically.
Ana Paula Palacios Bayesian Methods UoG 20 / 36
Example: Beta distribution
Ana Paula Palacios Bayesian Methods UoG 21 / 36
Example: Truncated normal
Probability of acceptance is 1/M = 0.2582361. The empirical probability of
acceptance is 0.25.
Ana Paula Palacios Bayesian Methods UoG 22 / 36
MCMC methods
As simple Monte Carlo algorithms are not always straightforward to implement,
another alternative is to use algorithms which generate approximate Monte Carlo
samples.
The most popular approach is Markov chain Monte Carlo (MCMC) methods, a
tool that generates samples from complex multi-dimensional posterior
distributions in cases where the distribution is analytically intractable.
A Markov chain is a random process with the property that, conditional upon its
current value, future values are independent of the past.
Under certain conditions such a chain will converge to a stationary distribution so
that eventually values may be treated as a sample from the stationary distribution.
Thus, the objective of the MCMC approach is to construct a Markov chain with a
given stationary distribution which is the distribution from which we wish to
sample.
Ana Paula Palacios Bayesian Methods UoG 23 / 36
Markov Chain: definition
A Markov chain is a stochastic process in discrete time with finite or countable
state space, S, characterized by the Markov property:
P(Xn+1 = j|Xn = in, Xn−1 = in−1, . . . , X0 = i0) = P(Xn+1 = j|Xn = in)
for every n and every i0, . . . , in and j ∈ S.
Markov property
The future path of the Markov chain given the current state and the past
history, depends only on the current state (not on how this state has been
reached).
Given the state of the process at an instant its future and past are
conditionally independent.
The current state contains all the information (summary of the past) that is
needed to characterize the future behaviour of the process.
Ana Paula Palacios Bayesian Methods UoG 24 / 36
Markov Chain: transition probabilities
The one-step transition probability from state i to state j at time n is
pij(n, n + 1) = P(Xn+1 = j|Xn = i), i, j ∈ S.
Time homogeneity: the transition probability does not depend on n:
pij = P(Xn+1 = j|Xn = i) ∀n.
The probability of a path i0, i1, . . . , in is
p(X0 = i0, X1 = i1, . . . , Xn = in) = P(X0 = i0)pi0i1 pi1i2
. . . pin−1in
Ana Paula Palacios Bayesian Methods UoG 25 / 36
Markov Chain: transition matrix
The transition probability matrix P = (pij):
P =


p11 p12 p13 . . .
p21 p22 p23 . . .
.
.
.
.
.
.
.
.
.
.
.
.


Note that the matrix is square with as many columns (and rows) as states
has the sample space.
The row i contains the transition probabilities from state i to other states.
P is a stochastic matrix: it has non-negative elements such that the sum of
each row equals 1.
Ana Paula Palacios Bayesian Methods UoG 26 / 36
Examples
Gambler’s ruin
Consider a gambler who starts with an initial fortune of $50 and then on each
successive gamble either wins $25 or loses $25 independent of the past with
probabilities p and q = 1 − p respectively. Let Xn denote the total fortune after n
gambles. The gambler’s objective is to reach a total fortune of $75, without first
getting ruined (running out of money).
Write the state space and the transition matrix.
Ehrenfest’s urn
Suppose we have two urns, labelled 1 and 2, that contain a total of d balls.
labelled 1, 2, . . . , d. Initially, some of these balls are in urn 1 and the rest are in
urn 2. At each step, one of the d balls is chosen at random and moved from the
urn that it is in into the other urn. This procedure is repeated indefinitely with
selections being independent from trial to trial. let Xn be the number of balls in
urn 1 after the n-th trial.
Write the state space and the transition matrix for the case d = 4.
Ana Paula Palacios Bayesian Methods UoG 27 / 36
Markov Chain: transition probabilities
Two step transition probability: p
(2)
ij =
P
k
pik pkj .
This is the element {i, j} of the matrix P2
.
The Chapman-Kolmogorov equation: p
(n)
ij =
P
k
p
(m)
ik p
(n−m)
kj for 0 ≤ m ≤ n
This is the element {i, j} of the n-step transition probability matrix
P
n = PmP
n−m.
This expresses the law of total probability, where the transition in n steps
from state i to state j is conditioned on the system begin in state k after m
steps.
Ana Paula Palacios Bayesian Methods UoG 28 / 36
Markov Chain: transition probabilities
Example
Let P be the transition matrix of a Markov chain with states {1, 2, 3} and p = 1/3.
P =


1 − p p(1 − p) p
2
1 − p p(1 − p) p
2
0 (1 − p) p


P
2 =


0.5926 0.2716 0.1358
0.5926 0.2716 0.1358
0.4444 0.3704 0.1852


Ana Paula Palacios Bayesian Methods UoG 29 / 36
Markov Chain: state probabilities
The probability that the process is in state i at time n is denoted by:
π
(n)
i = P(Xn = i).
The state distribution at time n is the vector
π
(n) = (π
(n)
1
, π
(n)
2
, π
(n)
3
, . . .)
Let Pn be the n-step transition probability matrix, then
π
(n) = π
(0)P
n
Example
P
2 =


0.5926 0.2716 0.1358
0.5926 0.2716 0.1358
0.4444 0.3704 0.1852

 P
8 =


0.5714 0.2857 0.1429
0.5714 0.2857 0.1429
0.5714 0.2857 0.1429


After some time, the process forgets its initial state.
Ana Paula Palacios Bayesian Methods UoG 30 / 36
Classification of states of a Markov Chain
State i leads to state j, (i → j), if p
(n)
ij > 0 for some n ≥ 0.
State i and state j communicate, (i ↔ j), if (i → j) and (j → i).
A set of states is called a communicated class (or irreducible) if all its states
communicate with each other.
A set of states is called closed if none of its states leads to any of the states
outside the set.
A Markov chain with only one communicated class is called irreducible.
Ana Paula Palacios Bayesian Methods UoG 31 / 36
Classification of states of a Markov Chain
A single state which alone forms a closed set is called an absorbing state.
A state i is transient if the probability of returning to the state is < 1 (there
is a positive probability that the system will never return to i).
A state i is recurrent if the probability or returning to the state is = 1 (with
certainty the system will returns to state i).
According with the expectation of the time, Ti,i
, it takes to return to the
state, recurrent states are further classified as:
I Positive recurrent: E(Ti,i) < ∞
I Null recurrent: E(Ti,i) = ∞
Ana Paula Palacios Bayesian Methods UoG 32 / 36
Classification of states of a Markov Chain
The period of the state i is defined by
d(i) = g.c.d of n
n ≥ 1 : p
(n)
ii > 0
o
If d(i) = 1 the state is called aperiodic.
The state i is called periodic if the first return time of state i can only be a
multiple of an integer d > 1,
A state is called ergodic if it is aperiodic positive recurrent.
A Markov chain is called ergodic if and only if all its states are ergodic.
Ana Paula Palacios Bayesian Methods UoG 33 / 36
Stationary distribution
In an irreducible, aperiodic Markov chain, there always exist the limits
πj = lim
n→∞
π
(n)
j = 1/E(Tj,j)
and this are independent of the initial state.
Furthermore, if all the states are positive recurrent, there exists a unique
stationary distribution π = πP.
Example
Let P be the transition matrix of a Markov chain with two states, say {1, 2} .
P = 
a (1 − a)
b (1 − b)

Compute the stationary distribution.
Ana Paula Palacios Bayesian Methods UoG 34 / 36
Ergodic
Theorem
Let Xt be an ergodic Markov chain with limiting distribution π. If Eπ[g(X)] < ∞
then the sample mean converges to the expectation of g(X) under π,
P

1
N
X
N
i=1
g(xi) → Eπ[g(X)]!
= 1
If we can construct an ergodic Markov chain θt which has the posterior distribution
f (θ|x) as the stationary distribution π(θ) then, starting from an initial point θ0, if
we run the Markov chain for long enough, we will sample from the posterior.
Ana Paula Palacios Bayesian Methods UoG 35 / 36
MCMC for Bayesian Statistics
The basic idea behind MCMC techniques for Bayesian statistics is:
1 Construct a Markov chain that has the required posterior distribution as its
stationary distribution. This is sometimes referred to as the target distribution
2 From some starting point, generate sequential values from the chain until
(approximate) convergence.
3 Continue generating values from the chain which are now viewed as a sample
of values from the posterior distribution. (As the chain has converged, we are
now sampling from the stationary distribution.)
4 Use the resulting sample (from the stationary distribution) to estimate
properties of the posterior distribution.
# 1) Example: Monte Carlo approximation for Beta-Binomial model

## Load the data
n <- 100     # Number of trials
Y <- 40      # Number of success 
a <- 1       # Hyperparameter of prior distribution
b <- 1       # Hyperparameter of prior distribution
A <- Y + a   # Updated parameters of posterior distribution
B <- n - Y + b  # Updated parameters of posterior distribution

# Analytical solutions
A/(A + B)       # Posterior mean
qbeta(0.5,A,B)  # Posterior median (0.5 quantile)
qbeta(c(0.025,0.975),A,B) # Equal-tailed 95% credible interval
pbeta(0.5,A,B)  # Posterior probability P(theta<0.5|Y)

# Monte Carlo approximation
S <- 100000
samples <- rbeta(S,A,B)   # Sampling from posterior distribution
mean(samples)
median(samples)
quantile(samples,c(0.025,0.975))
length(samples[samples<0.5])/S

# Plotting the posterior and the Monte Carlo samples
theta <- seq(0,1,.001) # Define a grid of points for plotting
pdf <- dbeta(theta,A,B) # Evaluate the density at these points
# Histrogram of Monte Carlo samples
hist(samples, prob = TRUE, ylab="Posterior",xlab=expression(theta), main="Monte Carlo samples (N=100,000)") 
lines(theta,pdf,type="l") # Plot the posterior density

##########################################################################

## 2) Example: Importance sampling
rm(list=ls())
al=14;bet=8;
M=10000
t=runif(M)
w=t^(al-1)*(1-t)^(bet-1)
mean(w) # Estimation of Beta(al,bet)
beta(al,bet) # True value for Beta(al,bet)
sum(w*t)/sum(w) # Estimation for the mean of the Beta(al,bet) distribution 
al/(al+bet)# True value for the mean of the Beta(al,bet) distribution 

##########################################################################

## 3) Example: Sampling importance resampling
rm(list=ls())
al=14;bet=8;
N=10000
t=runif(N)
w=t^(al-1)*(1-t)^(bet-1);
M=1000
tt=sample(t,M, prob=w/sum(w),replace=TRUE)
x=seq(0,1,0.01)
hist(tt,freq=FALSE, main="", xlab=expression(theta), ylim=c(0, max(dbeta(x, al,bet))))
lines(x,dbeta(x,al,bet))

##########################################################################
# 4) Example: Rejection sampling 

rm(list=ls())
al=14;bet=8;
mode = (al-1)/(al+bet-2)  # mode of beta distribution
M=dbeta(mode,al,bet) # constant M
N=1000
tt=runif(N)    # sampling from proposal distribution
u=runif(N)     # sampling from uniform distribution 
accept=u < (dbeta(tt,al,bet)/(M*dunif(tt)))  # acceptance-rejection step
t = tt[accept] # Rejection Sample
1/M            # Probability of acceptance
sum(accept)/N  # Empirical acceptance probability

# Plot
x=seq(0,1,0.01)
curve(dbeta(x,al,bet), lwd=2, ylab="density", xlab=expression(x))
curve(dunif(x), add=TRUE, col="seagreen", lty=2, lwd=2)
curve(M*dunif(x), add=TRUE, col="seagreen", lwd=2)
points(tt, M*u, pch=ifelse(accept,1,4), col=ifelse(accept,"blue","red"), lwd=2)
legend("topleft", c("target","proposal * M","accepted","rejected"), 
       lwd=c(2,2,NA,NA), col=c("black","seagreen","blue","red"),
       pch=c(NA,NA,1,4), bg="white",  cex=0.75) 
Tutorial: Monte Carlo Methods and Markov Chains
1. Consider the integral
I =
Z 10
0
exp(−2|x − 5|) dx
(a) Assume that X ∼ U(0, 10). Show that the integral above is equal to the expectation of
10 exp(−2|X − 5|)) calculated with respect to the probability density function f(x), i.e.
I = Ef (10 exp(−2|X − 5|)). Write a pseudo-code for the Monte Carlo integration of I.
(b) Explain how to estimate I using the method of importance sampling where we sample
from the N(5, 1) distribution. Write the pseudo-code for the method.
(c) Use R to implement both methods for N = {100, 500, 1000, 5000} and 1,000 replications
of the methods. For each N value compute the sample mean and compare with the true
value.
(d) In the same figure plot the sampling distributions U(0, 10), N(5, 1) and the scaled target
function g(x)/10. Discuss which of the two methods is more efficient.
2. Let X ∼ N(0, 1).
(a) Write a pseudo-code to compute P(X > a) by the use of Monte Carlo integration.
(b) Write a code in R to estimate P(X > a) by the use of Monte Carlo integration and
estimate P(X > a) for a = {0, 1.96, 3, 4.5}. In each case sample 1, 000 observations and
repeat the procedure 1,000 times. Make a table showing the true P(X > a), the Monte
Carlo estimations and the number of non-zero samples (i.e. number of samples with
observation values > a). Based on your findings, discuss what are the difficulties with
the method for large values of a.
(c) Suppose instead we consider finding P(X > a) using the method of importance sampling
where we sample from N(µ, 1). By considering the cases when a = 3 and µ = 4 and
that when a = 4.5 and µ = 4.5 comment on the advantages of this approach over direct
Monte Carlo integration. Assume N = {100, 500, 1000} and 1,000 replications.
(d) This time approximate P(X > 4.5) using the method of importance sampling where
we sample from the Exp(1) distribution truncated at 4.5 which has probability density
function
q(x) = exp (−(x − 4.5))
for x > 4.5 and 0 otherwise.
3. Suppose that the posterior distribution of θ follows a truncated normal T N(0, 1) where
θ > α > 0. We want to generate samples from this distribution by using the Rejection Algorithm where we sample from: a) the N(0, 1), and b) a shifted exponential with
density function
h(θ) = λ exp(−(θ − α)) for θ > α
(a) Compute f(θ|x)/h(θ) and provide an expression for the probability of accepting a draw
in each case.
1
(b) Write a code in R to generate a sample of the posterior distribution by applying the
Rejection Algorithm for each case. Take N = 10, 000. For each case, plot the histogram
for the posterior sample with the true posterior distribution and compare the theoretical
acceptance probability with the empirical probability.
4. Suppose that there are three white and three black balls in two urns distributed so that each
urn contains three balls. We say the system is in state i if there are i white balls in urn one.
At each stage one ball is drawn at random from each urn and the balls are interchanged. Let
Xn denote the state of the system after the nth draw. Write the state space and the transition
matrix for the Markov chain {Xn, n ∈ N}.
5. The Land of Oz is blessed by many things, but not by good weather. There are never two nice
days in a row. Let {Xn, n ∈ N} denote the weather at day n, where the state space S = {rain,
nice, snow} represents the kinds of weather. The transition matrix for the Markov chain Xn
is
P =


1/2 1/4 1/4
1/2 0 1/2
1/4 1/4 1/2

 .
(a) If we assume that today there is a 40% chance of rain and a 60% chance of snow, what
is the probability that it will rain two days from now?
(b) Show that π = (2/5, 1/5, 2/5) is a stationary distribution of Xn.
6. Consider a Markov chain with state space S = {1, 2, 3, 4} and transition matrix
P =




0 p 1 − p 0
1 0 0 0
0 0 0 1
p 0 0 1 − p




where 0 < p < 1. Determine the pairs of states which communicate. Specify whether the
chain is irreducible and whether it is aperiodic. (You may want to plot the Markov chain as
a graph.)
2
Solutions:
1. (a)
I =
Z 10
0
exp(−2|x − 5|) dx =
Z 10
0
10 exp(−2|x − 5|)
1
10
dx
= E(10 exp(−2|X − 5|))
= E(g(X))
where g(X) = 10 exp(−2|X − 5|) and X ∼ U(0, 10) with density function f(x) = 1/10
for 0 < x < 10. Therefore, we can estimate I using Monte Carlo as follows:
1. Sample n values x1, . . . , xn independently from U(0, 10)
2. Compute g(xi) = 10 exp(−2|xi − 5|) for each xi
3. Estimate I by the sample mean of g(xi), so that
ˆI =
1
n
Xn
i=1
10 exp(−2|xi − 5|)
(b) For importance sampling, we want to write I as an expectation calculated with respect
to the N(5, 1) distribution which has support on the R, that is on (−∞,∞). Thus,
I =
Z 10
0
exp(−2|x − 5|) dx =
Z ∞
−∞
exp(−2|x − 5|)I0≤x≤10 dx
=
Z ∞
−∞
10 exp(−2|x − 5|)
1
10 I0≤x≤10
√
1
2π
exp{−1
2
(x − 5)2}
1
√
2π
exp{−1
2
(x − 5)2
} dx
=
Z ∞
−∞
g(x)f(x)
q(x)
q(x) dx
= E

g(X)f(X)
q(X)

where g(x) = 10 exp(−2|xi − 5|), f(x) = 1
10 I0≤x≤10 is the density function for a U(0, 10)
and q(x) is the density function of a N(5, 1). Then, we can estimate I as:
1. Sample n values x1, . . . , xn independently from N(5, 1)
2. For each xi compute
g(xi)f(xi)
q(xi)
=
10 exp(−2|xi − 5|)
1
10 I0≤xi≤10
√
1
2π
exp{−1
2
(xi − 5)2}
3. Estimate I by the sample mean of g(xi)f(xi)
q(xi)
, so that
ˆI =
1
n
Xn
i=1
10 exp(−2|xi − 5|)
1
10 I0≤xi≤10
√
1
2π
exp{−1
2
(xi − 5)2}
3
(c) After applying both methods for n = {100, 500, 1000, 5000} and taking 1,000 replications
of each, we obtained the following results:
n Estimation of I |Error|
Monte Carlo Importance Sampling Monte Carlo Importance Sampling
100 0.9916413 1.000316 0.0083 0.00036
500 0.9945454 1.000546 0.0054 0.00059
1000 1.0002644 1.000014 0.0003 0.00006
5000 1.0000942 0.999886 0.0001 0.00007
Note that the true value of I is 1 − exp(−10) = 0.9999546. Although both methods are
unbiased, we can see that for a given value of n we get higher level of accuracy with the
importance sampling. If you also compute the variance of the m simulations you will see
that the sample variance for the Monte Carlo integration is about ten times that of the
importance sampling method.
(d) The figure below makes clear why the importance sampling is a preferable method in
this case. The function to integrate has a pick at 5 and decays quickly elsewhere in
the interval [0, 10]. When we sample from the U(0, 10) we create many values xi
for
which g(xi) is close to zero. Therefore, the precision of the estimate can be improve by
sampling from another distribution which attaches more weight, or importance, to the
region where g(x) is not close to zero.
2. (a) Note that
P(X > a) = Z ∞
a
f(x) dx
=
Z ∞
−∞
I{x>a}f(x) dx
= E(I{x>a})
We can use Monte Carlo as follows:
1. Sample n values x1, . . . , xn independently from the N(0, 1)
2. Compute I{xi>a} for each xi
, so I{xi>a} = 1 if xi > a and Ixi>a = 0 otherwise.
4
3. Estimate P(X > a) by the sample mean of Ixi>a, that is
1
n
Xn
i=1
I{xi>a}
(b) As a increases then P(X > a) decreases and we are interested in estimating the probability of an event that is every tie more rare. Our estimator of such probability is equal to
the number of simulations greater than a divided by n. But, for large a we only get a few
simulations greater than a and therefore our estimation has a big variance. We should
take n extremely large to have an stable estimate. For example, for a = 4.5 we only
observed 4 sample values greater than a. Therefore, we need a more efficient sampler.
An alternative will be to sample from a distribution that puts more mass on the event
of interest {X > a}.
a P(X > a) MC mean No of non-zero samples
0 0.5 0.500285 1000
1.96 0.025 0.024958 1000
3 0.001 0.001334 733
4.5 3.39 × 10−6 0.000004 4
(c) Let q(X) denote the probability density function of the N(µ, 1). Then, as q(X) > 0 for
all x ∈ (−∞,∞), we have
Ef (I{X>a}) = Z ∞
−∞
I{x>a}f(x) dx
=
Z ∞
−∞
I{x>a}f(x)
q(x)
q(x) dx
= Eq

I{X>a}f(X)
q(X)

= Eq

I{X>a} exp 
µ
2
2
− µX
as
f(X)
q(X)
=
√
1
2π
exp{−1
2X2}
√
1
2π
exp{−1
2
(X − µ)
2}
= exp 
µ
2
2
− µX
.
We thus use importance sampling as follows:
1. Sample n values x1, . . . , xn independently from the N(µ, 1)
2. Compute I{X>a} exp n
µ
2
2 − µXo
for each xi
3. Estimate P(X > a) by computing the sample mean
1
n
Xn
i=1
I{xi>a} exp 
µ
2
2
− µxi

n Estimated Prob No non-zeros samples
Monte Carlo Importance Sampling Monte Carlo Importance Sampling
100 0.001330 0.001341783 118 1000
500 0.001366 0.001342445 493 1000
1000 0.001324 0.001350002 727 1000
5
We can see that even for n = 100 observations, the method of importance sampling is
doing well: the true probability is 0.001349898.
If you repeat the process with a = 4.5 and µ = 4.5, you will see that while the importance
sampling is still doing well, Monte Carlo often fails (as there are only zero values) or
generates inaccurate estimations as it only uses a couple of non-zero observations.
(d) I leave this for you.
3. (a) To probability of acceptance is 1/M. We can calculate M as f(x)/h(x). When h(x) is
the N(0, 1) we have:
f(θ|x)
h(θ)
=
√
1
2π(1−Φ(α)) exp 
−
θ
2
2

√
1
2π
exp
−
θ
2
2

=
1
(1 − Φ(α))
So, the probability of acceptance is 1 − φ(α), where Φ denotes the standard normal
cumulative distribution function. If, alternatively, we proposed to sample from a shifted
exponential, then
f(θ|x)
h(θ)
=
1
λ
√
2π(1 − Φ(α))
exp 
−
θ
2
2
+ λ(θ − α)

≤
1
λ
√
2π(1 − Φ(α))
exp 
λ
2
2
− λα
= M
(b) The theoretical acceptance probability when h(x) is the N(0, 1) is 0.15865 and the empirical was 0.161. So, the acceptance rate is quite low. While for the case of the shifted
exponential the theoretical acceptance probability is 0.6556795 and the empirical one is
0.6605. Therefore, it is a lot more efficient the second case.
6
4. S = {0, 1, 2, 3, }
P =


0 1 0 0
1/9 4/9 4/9 0
0 4/9 4/9 1/9
0 0 1 0


5. (a)
p
(2)
ij =
Xr
k=1
pikpkj
p
(2)
11 =
1
2
1
2
+
1
4
1
2
+
1
4
1
4
=
7
16
p
(2)
31 =
1
4
1
2
+
1
4
1
2
+
1
2
1
4
=
3
8
π
(2)
1 = 0.40
7
16
+ 0.60
3
8
= 0.40
(b) We know that π = πP and Pπi = 1. Then,
π =

2
5
,
1
5
,
2
5

6. All states communicate with each other, that is, the chain is irreducible. The period of each
state is 1, therefore the chain is aperiodic.
## Question 1

# First we create a function to compute m replications of the Monte Carlo
# In each Monte Carlo we will simulate n values

Monte <- function(n,m){
  vect = 1:m
  for(i in 1:m){
    x = runif(n, 0, 10)
    vect[i] = sum(10*exp(-2*abs(x-5)))/n
  }
  return(vect)
}

# Create a function to compute m replications of Importance sampling
# In each IS we will simulate n values

ImpS <- function(n,m){
  vect = 1:m
  for(i in 1:m){
    x = rnorm(n,5,1)
    w = dunif(x,0,10) / dnorm(x,5,1)
    vect[i] = sum(10*exp(-2*abs(x-5)) * w) / n
  }
  return(vect)
}


m=1000
n=c(100,500,1000,5000)
meansM=1:4
errorsM=1:4
for(i in 1:4){
  meansM[i]=mean(Monte(n[i],m))
  errorsM[i]=0.9999546-meansM[i]
}
meansM
errorsM

meansIS=1:4
errorsIS=1:4
for(i in 1:4){
  meansIS[i]=mean(ImpS(n[i],m))
  errorsIS[i]=0.9999546-meansIS[i]
}
meansIS
errorsIS

# Plots
x=seq(0,10,0.01)
plot(x,exp(-2*abs(x-5)), col="red", type="l", ylab="f(x)", xlim=c(0,10))
lines(x,dnorm(x,5,1), xlim=c(0,10),col="blue")
lines(x,dunif(x,0,10), xlim=c(0,10))
legend("topleft", c("exp(-2|x-5|)","pdf of U(0,10)","pdf of N(5,1)"), 
       lwd=c(1,1,1), col=c("red","black","blue"),
       pch=c(NA,NA,NA), bg="white",  cex=0.75) 

#####################################################################
##Question 2

MonteP <- function(a,n,m){
  vect = 1:m
  for(i in 1:m){
    x = rnorm(n)
    total = length(x[x > a])
    vect[i] = total/n
  }
  return(vect)
}
m=1000
n=1000
a=c(0,1.96,3, 4.5)
prob=1:4
nonzero=1:4
for(i in 1:4){
  sample = MonteP(a[i],n,m)
  prob[i]=mean(sample)
  nonzero[i] =  length(sample[sample>0])
}

#Part b
ImpSP <- function(a,mu,n,m){
  vect = 1:m
  for(i in 1:m){
    x = rnorm(n,mu)
    w = dnorm(x)/dnorm(x, mu)
    vect[i] = sum(w[x>a])/n
  }
  return(vect)
}

a=4.5
mu=4.5
m=1000
n=c(100,500,1000)
prob=matrix(NA,3,2)
nonzero=matrix(NA,3,2)
for(i in 1:3){
  sample1 = MonteP(a,n[i],m)
  prob[i,1]=mean(sample1)
  nonzero[i,1] =  length(sample1[sample1>0])
  sample2 = ImpSP(a,mu,n[i],m)
  prob[i,2]=mean(sample2)
  nonzero[i,2] =  length(sample2[sample2>0])
}

prob
nonzero

#####################################################################
#Question 3

#Rejection sampling I
rm(list=ls())
N=10000
al=1
tt=rnorm(N)
t=tt[tt>al]
hist(t,freq=FALSE,ylim=c(0,dnorm(al)/(1-pnorm(al))))
a=seq(al,al+3,by=0.01)
lines(a,dnorm(a)/(1-pnorm(al)))  # Density of the TN(0,1)
(1-pnorm(al)) # Theoretical acceptance probability
length(t)/N # Realized acceptance probability

#Rejection sampling II
N=10000
al=1
tt=rexp(N,al)+al
u=runif(N)
t=tt[tt^2/2-al*tt+al^2/2<(-log(u))]
hist(t,freq=FALSE,ylim=c(0,dnorm(al)/(1-pnorm(al))))
x=seq(al,al+3,0.1)
lines(x,dnorm(x)/(1-pnorm(al)))
al*sqrt(2*pi)*(1-pnorm(al))*exp(al^2/2) # Theoretical acceptance probability
length(t)/N #  Realized acceptance probability