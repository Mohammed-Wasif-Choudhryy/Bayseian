Bayesian Methods and Their Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios Bayesian Methods UoG 1 / 29
Objective
To introduce the idea of Markov Chain Monte Carlo methods, in particular
Metropolis Hastings algorithm.
Ana Paula Palacios Bayesian Methods UoG 2 / 29
MCMC methods
As simple Monte Carlo algorithms are not always straightforward to implement,
another alternative is to use algorithms which generate approximate Monte Carlo
samples.
The most popular approach is Markov chain Monte Carlo (MCMC) methods, a
tool that generates samples from complex multi-dimensional posterior
distributions in cases where the distribution is analytically intractable.
The objective of the MCMC is to sample from a Markov chain whose limit
distribution (provided it exists) is the distribution from which we wish to sample.
Ana Paula Palacios Bayesian Methods UoG 3 / 29
Markov Chains
Definition
A Markov chain {Xt} with finite state space S, is defined to be a sequence of
variables X0, X1, X2, . . . such that the distribution of Xt given the previous values
X0, . . . , Xt−1 only depends on Xt−1 (Markov property), so that
P(Xn+1 = j|Xn = in, Xn−1 = in−1, . . . , X0 = i0) = P(Xn+1 = j|Xn = in)
for every n and every i0, . . . , in and j ∈ S.
Ana Paula Palacios Bayesian Methods UoG 4 / 29
Transition probabilities
The one-step transition probability from state i at time n to state j at time
n + 1 is
pij(n, n + 1) = P(Xn+1 = j|Xn = i), i, j ∈ S.
Time homogeneity: the transition probability does not depend on k:
pij = P(X1 = j|X0 = i) = P(Xk+1 = j|Xk = i) for any k.
A time-homogeneous Markov chain is completely defined by the initial state,
X0, and by the transition matrix,(pij)
P = (pij) =
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
Ana Paula Palacios Bayesian Methods UoG 5 / 29
t-step transition probabilities
The t-step transition probabilities are
pij(t) = P(Xt = j|X0 = i)
which is the element {i, j} of the t-step transition probability matrix P
t
Note that in the continuous case,
P(Xt ∈ A|Xt−1 = xt−1) = Z
A
K(x|xt−1)dx
where K(x|xt−1) is the transition kernel.
We will later see the conditions under which these probabilities converge, i.e.
pij(t) → π(j) as t → ∞
Ana Paula Palacios Bayesian Methods UoG 6 / 29
Limiting distribution
The probability that the process is in state i at time t is denoted by:
π
(t)
i = P(Xt = i).
The state distribution at time t is the vector
π
(t) = (π
(t)
1
, π
(t)
2
, π
(t)
3
, . . .)
Let Pt be the t-step transition probability matrix, then
π
(n) = π
(0)P
t
Definition
The limit distribution of a Markov Chain is defined as
π∞ = lim
t→∞
πt = lim
t→∞
π0P
t
Ana Paula Palacios Bayesian Methods UoG 7 / 29
Limiting distribution
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
Ana Paula Palacios Bayesian Methods UoG 8 / 29
Irreducible
Definition
A Markov chain is said to be irreducible if for every i, j there exists some t such
that
pij(t) > 0
that is, all states can be reached from any other state in a finite number of steps.
Ana Paula Palacios Bayesian Methods UoG 9 / 29
Recurrent
Definition
A state i of a Markov chain is said to be recurrent if the return to state i is
certain. That is, if we define τi to be the minimum number of steps needed to
return to the state i, then P(τi < ∞) = 1. A recurrent state is further said to be
positive recurrent if the expected return time is finite, so that E(τi) < ∞.
It can be shown that if any state of an irreducible Markov chain is positive
recurrent, then all states are.
Ana Paula Palacios Bayesian Methods UoG 10 / 29
Periodic/Aperiodic
Definition
A state i is called periodic with period di
if the first return time of state i can only
be a multiple of di
, the period of the state i defined by
d(i) = g.c.d of n
t ≥ 1 : p
(t)
ii > 0
o
where gcd is the greatest common divisor. IF di = 1 then the state i is said to be
aperiodic.
Irreducible Markov chains have the property that all states have the same period.
A Markov chain is called aperiodic if some (and hence all) states are aperiodic.
Ana Paula Palacios Bayesian Methods UoG 11 / 29
Ergodic
Definition
A state i of a Markov chain is called ergodic if it is aperiodic positive recurrent.
A Markov chain is called ergodic if and only if all its states are ergodic.
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
Ana Paula Palacios Bayesian Methods UoG 12 / 29
Stationary distribution
Definition
A distribution π is said to be a stationary distribution of a Markov chain with
transition matrix P if
π = πP
.
For an irreducible, positive recurrent, aperiodic Markov chain, with t-step
transition probabilities pij(t), then a unique stationary distribution π exists so that
for all i, j,
π(j) = lim
t→∞
pij(t)
and they are independent of the initial state.
Ana Paula Palacios Bayesian Methods UoG 13 / 29
Reversibility
It can be shown that a sufficient condition for the existence of a unique stationary
distribution is reversibility.
Definition
A Markov chain with transition probabilities pij = P(Xt+1=j
|Xt = i) is said to be
reversible if there exists a probability density π that satisfies the detailed balance
conditions, so that for any i, j, then
π(i)pij = π(j)pji
Ana Paula Palacios Bayesian Methods UoG 14 / 29
Our Aim
We can construct an irreducible, aperiodic, and reversible Markov chain that has
the target distribution, f (x), as the stationary distribution. Then, starting from an
initial point, if we run the Markov chain for long enough, we will sample from the
target distribution.
Ana Paula Palacios Bayesian Methods UoG 15 / 29
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
Ana Paula Palacios Bayesian Methods UoG 16 / 29
Metropolis-Hastings
This algorithm was first proposed by Metropolis et al (1953) and then extended by
Hastings (1970).
Let π(x) be the target distribution, that is the distribution that we want to sample
from. This algorithm will generate a candidate, x
∗
, from a proposal distribution,
q(x
∗
|x), and accept/reject with some probability.
The proposal should be a distribution that can easily sample from
The proposal should have the same support as the target distribution
The proposal should be as similar as possible to the target distribution
Ana Paula Palacios Bayesian Methods UoG 17 / 29
The Metropolis-Hastings algorithm
1 Given the current value xt
, generate a candidate value x
∗
from a proposal
density q(x
∗
|xt).
2 Calculate the acceptance probability
α(x, x
∗
) = min 
π(x
∗
)
π(xt)
q(xt
|x
∗
)
q(x
∗|xt)
, 1

3 Generate u ∼ U(0, 1). If u ≤ α(xt
, x
∗
) define xt+1 = x
∗
, otherwise reject the
proposed value and set xt+1 = xt
.
4 Repeat until convergence is judged and a sample of the desired size is
obtained
Ana Paula Palacios Bayesian Methods UoG 18 / 29
Why does this algorithm work?
Clearly, the sequence generated from the algorithm is a Markov chain: the
distribution of the next state depends only on the current state (and not the
past).
The chain is irreducible since at each step we have a positive probability to
reach any range in the support of the proposal distribution
For some state x
0 we will get a probability of acceptance lower than one and
therefore there is a positive probability of staying at x
0
. For that state the
period is 1.
The Markov chain is aperiodic (as all states have the same period).
Therefore, the chain has a stationary distribution.
We now need to prove that the transition kernel of the Markov chain holds
the detailed balance condition with regards to the target distribution, that is
π(xi)K(xi+1|xi) = π(xi+1)K(xi
|xi+1)
Ana Paula Palacios Bayesian Methods UoG 19 / 29
Why does this algorithm work?
The transition kernel can be expressed as:
K(xi+1|xi) = α(xi
, xi+1)q(xi+1|xi) + r(xi)δxi
(xi+1)
where
r(xi) = 1 −
Z
α(xi
, y)q(y|xi)dy
where r(xi) is the probability that the Markov chain remains at xi and δxi denotes
the delta-Dirac mass located at xi (takes the value one when the condition xi
is
met).
Ana Paula Palacios# Example: Metropolis Hastings
rm(list=ls())
n=100;theta=1;  # sample size 100, real theta=1
x=rcauchy(n,location=theta,scale=1)  # simulate data
burnin=3000;iters=10000;
N=burnin+iters;  # total number of iterations/simulations

### Random Walk sampler
theta1=rep(0,N)
pac1=0
sigma=0.25
theta1[1]=median(x)  # initialisation
for (t in 2:N){
  thetat=rnorm(1,mean=theta1[t-1],sd=sigma)  # candidate generation
  logal=sum(dcauchy(x,location=thetat,scale=1,log=T)) # loglike at candidate
  logal=logal-sum(dcauchy(x,location=theta1[t-1],scale=1,log=T)) #loglike ration (log candidate - loglike at current state
  if (log(runif(1))<logal){
    theta1[t]=thetat
    if (t>burnin){ pac1=pac1+1}
  }
  else   theta1[t]=theta1[t-1]
}
pac1/iters # Acceptance probability
theta1s=theta1[burnin+1:iters]
plot(density(theta1s),col="red")
mean(theta1s) # Estimated posterior mean




#### Independence sampler:
theta2=rep(0,N)
pac2=0
m=median(x);tau=0.2
theta2[1]=median(x)
for (t in 2:N){
  thetat=rcauchy(1,location=m,scale=tau)
  logal=sum(dcauchy(x,location=thetat,scale=1,log=T))
  logal=logal-sum(dcauchy(x,location=theta2[t-1],scale=1,log=T))
  logal=logal+dcauchy(theta2[t-1],location=m,scale=tau,log=T)
  logal=logal-dcauchy(thetat,location=m,scale=tau,log=T)
  if (log(runif(1))<logal){
    theta2[t]=thetat
    if (t>burnin){pac2=pac2+1}
  }
  else   theta2[t]=theta2[t-1]
}
pac2/iters # Acceptance probability
# Estimated posterior mean
theta2s=theta2[burnin+1:iters]
lines(density(theta2s),col="blue")
mean(theta2s) # Estimated posterior mean
legend("topright", c("Random Walk","Independence Sampler"), col=c("red","blue"), lty=1)

# Convergence diagnosis

plot(theta1,type="l")
plot(cumsum(theta1)/1:N,type="l")
acf(theta1,plot=T)

plot(theta2,type="l")
plot(cumsum(theta2)/1:N,type="l")
acf(theta2,plot=T)





# Example: Block Metropolis Hastings
rm(list=ls())
n=100;nu.true=4;lam.true=3;
x=rgamma(n,shape=nu.true,rate=lam.true)
burnin=3000;iters=10000
N=burnin+iters
a=0.01;b=0.01;nu.min=0;nu.max=100
nu=rep(0,N);lam=rep(0,N)
nu[1]=10;lam[1]=5;pac=0;
for (t in 2:N){
  lam[t]=rgamma(1,shape=a+n*nu[t-1],rate=b+sum(x))
  nuc=rnorm(1,nu[t-1],sd=1)
  if(nuc<nu.min || nuc>nu.max){nu[t]=nu[t-1]}
  else{
    logal=(nuc-1)*sum(log(x))-n*lgamma(nuc)+n*nuc*log(lam[t])
    logal=logal-(nu[t-1]-1)*sum(log(x))+n*lgamma(nu[t-1])-n*nu[t-1]*log(lam[t])
    if (log(runif(1))<logal){
      nu[t]=nuc
      if (t>burnin){pac=pac+1}
    }
    else   nu[t]=nu[t-1]
  }
}
pac=pac/iters
lam=lam[burnin+1:iters]
nu=nu[burnin+1:iters]
mean(lam)
mean(nu)
xpred=rgamma(iters,shape=nu,rate=lam)
hist(xpred,freq=F)
lines(seq(0,3,0.1),dgamma(seq(0,3,0.1),shape=nu.true,rate=lam.true))
lines(density(xpred))Tutorial: Metropolis-Hastings Algorithm
1. Consider a Metropolis-Hastings algorithm with target density the Beta(2.7, 6.3)
and proposal density the uniform over [0, 1].
(a) Which type of MH algorithm is this?
(b) Derive analytically the acceptance probability.
(c) Modify the code from class, to generate a MCMC sample of size 5,000 for the
current example.
(d) Make a trace plot for the generated sequence of random variables. Do you
observe large jumps? Does the chain stay for several iterations in the same
state? (You may need to zoom the trace or plot a subsection of it.)
(e) Make a plot of the autocovariance function and comment.
(f) Make a histogram for the sample and add to the plot the target distribution.
Comment.
2. Consider the same target distribution of the previous question, the Beta(2.7, 6.3).
Use R to generate samples from this density using a range of independent beta
candidates from a Beta(1, 1) to a beta distribution with small variance, for example
a Beta(20, 60). Compare; a) the acceptance rates of the algorithms; b) the accuracy
in the estimation of the mean.
3. Generate 105
samples of a Cauchy random variable C(0, 1)1
taking as proposal
density: i) the Normal(0, 1), and ii) Student’s t-distribution with 0.5 degrees of
freedom.
(a) For the normal proposal, run the algorithm for different initial values, say
x0 = {0, 1, 5, 10}.
(b) Plot the trace, the histogram and the autocorrelation function. Comment on
your findings.
(c) Use the samples to approximate the quantity P(X < 3) and compare the
accuracy of each algorithm.
4. The historical example of Hastings (1970) considers the formal problem of generating the normal distribution N(0, 1) based on a random walk proposal equal to
the uniform distribution on [−δ, δ].
(a) Compute the probability of acceptance
(b) Produce 3 samples of size 5,000 generated by this method for δ = {0.1, 1, 10}
and plot the trace, the histogram and the autocorrelation function.
(c) Study the difference in the produced chains.
1Note that the C(0, 1) is equivalent to a Student’s t-distribution with one degree of freed