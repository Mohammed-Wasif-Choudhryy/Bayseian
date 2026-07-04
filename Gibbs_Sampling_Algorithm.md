Bayesian Methods and its Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios STAT1044 UoG 1 / 43
Objectives for today
To introduce Gibbs sampler algorithms which are particularly useful in
multidimensional problems and discuss convergence in MCMC methods.
Ana Paula Palacios STAT1044 UoG 2 / 43
Gibbs samplers
The aim of the Gibbs sampler is to make sampling from a high-dimensional
distribution more tractable by sampling from a collection of more manageable
smaller dimensional distributions.
The Gibbs sampling algorithm is a particular version of block MH algorithm where
the proposal distributions are exactly the conditional posterior distributions, so
that the acceptance probability is always equal to 1.
The appeal of this algorithm is that break complex problems into a series of easier
problems, like a sequence of small-dimension targets.
The caveats of this simplification is that it may take a long time to converge, but
Gibbs sampling is nonetheless an interesting candidate when dealing with a new
problem.
Ana Paula Palacios STAT1044 UoG 3 / 43
The two-stage Gibbs sampler
It creates a Markov chain from the joint distribution in the following way. If two
random variables X and Y have joint density f (x, y), with corresponding
conditional densities fX|Y and fY |X , the two stage Gibbs sampler generates a
Markov chain (Xt
, Yt) according to the following steps:
1 Take X0 = x0
2 For t = 1, 2, . . . , generate
I Yt ∼ fY |X (y|xt−1)
I Xt ∼ fX|Y (x|yt)
It is straightforward to implement as long as simulating from both conditional is
feasible.
Ana Paula Palacios STAT1044 UoG 4 / 43
The two-stage Gibbs sampler
Beta-binomial model
Consider the pair of distributions
X|θ ∼ Bin(n, θ), θ ∼ Beta(a, b)
The join distribution is
f (x, θ) = 
n
x

Γ(a + b)
Γ(a)Γ(b)
θ
x+a−1
(1 − θ)
n−x+b−1
The conditional θ|x is Beta(x + a, n − x + b). Write a code to implement the
Gibbs sampler.
Ana Paula Palacios STAT1044 UoG 5 / 43
Example: the beta-binomial model
1.a) Specify an initial value for θ0
1.a) Sample x0 from fx|θ(x|θ0), the Bin(n, θ0) distribution
2.a) Sample θ1 from fθ|x (θ|x0), the Beta(x0 + a, n − x0 + b) distribution
2.b) Sample x1 from fx|θ(x|θ1), the Bin(n, θ1) distribution
3.a) Sample θ2 from fθ|x (θ|x1), the Beta(x1 + a, n − x1 + b) distribution
3.b) Sample x2 from fx|θ(x|θ2), the Bin(n, θ2) distribution
We continue generating values (xt
, θt) till convergence.
Ana Paula Palacios STAT1044 UoG 6 / 43
Ana Paula Palacios STAT1044 UoG 7 / 43
Ana Paula Palacios STAT1044 UoG 8 / 43
Ana Paula Palacios STAT1044 UoG 9 / 43
Ana Paula Palacios STAT1044 UoG 10 / 43
The Gaussian model
Consider the model
Xi
, ∼ Normal(µ, σ2
) i = 1, . . . , n,
µ ∼ Normal(µ0, τ 2
)
σ
2 ∼ IG(a, b)
where IG(a, b) is the inverted gamma distribution with density
f (x) = b
a
(1/x)
a+1e
−b/x
/Γ(a)
and with µ0, τ 2
, a, b specified.
Given x = (x1, . . . , xn), the posterior distribution of (µ, σ2
) is
f (µ, σ2
|x ) ∝

1
(σ
2)
n/2
e
−
P
i
(xi−µ)
2/(2σ
2
)

×

1
τ
e
−(µ−µ0)
2/(2τ
2
)

×

1
(σ
2)
a+1 e
1/bσ
2

from which we can get the full conditionals of µ and σ
2
. For conjugacy we know
that µ|σ
2
, x follows a normal distribution and σ
2
|µ follows an inverse gamma.
Ana Paula Palacios STAT1044 UoG 11 / 43
Example: the Gaussian model
Full conditional posterior distribution: the distribution of the parameter
conditional on all other parameters and the data.
Note: recognising the full conditionals from the joint distribution is not that
difficult.
The posterior distribution is obtained by multiplying the densities specified in
the model (likelihood x prior distributions)
To find a full conditional we merely need to pick out all the terms in the joint
distribution that involve that parameter.
Ana Paula Palacios STAT1044 UoG 12 / 43
Example: the Gaussian model
Full conditonal of σ
2
:
f (σ
2
|µ, x ) ∝

1
(σ
2)
n/2
e
−
P
i
(xi−µ)
2/(2σ
2
)

×

1
(σ
2)
a+1 e
1/bσ
2

∝

1
σ
2
(n+2a+2)/2
e
− 1
2σ2 (
P
i
(xi−µ)
2+2/b)
The full conditional distributions is
σ
2
|µ, x ∼ IG
n
2
+ a,
1
2
X
i
(xi − µ)
2 + b
!
Ana Paula Palacios STAT1044 UoG 13 / 43
Example: the Gaussian model
Full conditional of µ:
f (µ|σ
2
, x ) ∝

1
(σ
2)
n/2
e
−
P
i
(xi−µ)
2/(2σ
2
)

×

1
τ
e
−(µ−µ0)
2/(2τ
2
)

With some tedious algebra it is possible to show that the full conditional
distribution is
µ|σ
2
, x ∼ N
Pn
i=1 xi/σ2 + µ0/τ 2
n/σ2 + 1/τ 2
,
1
n/σ2 + 1/τ 2

∼ N

σ
2/n
σ
2/n + τ
2
µ0 +
τ
2
σ
2/n + τ
2
x¯,
σ
2
τ
2
σ
2 + nτ
2

where ¯x is the sample mean.
Ana Paula Palacios STAT1044 UoG 14 / 43
Example: the Gaussian model
Ana Paula Palacios STAT1044 UoG 15 / 43
Gibbs sampling for censored data
Assume that Zi s the lifetime of a machine i, with density f (Zi
|θ). Usually, tests
do not last long and therefore we only observe a few complete lifetimes. The
other observations are truncated to the length of the experiment T. So, the
observed data is
Xi =
(
Zi for Xi < T
T for Xi > T
and the likelihood function is of the form
l(θ|x ) ∝
Yn1
i=1
f (zi
|θ)(1 − F(T|θ)
n2
)
where we observed n1 complete lifetimes and n2 is the data truncated to T. This
is usually a complex likelihood function to deal with. But, we can use Gibbs
sampling to simulate the latent variables Xn1+1, . . . , Xn1+n2
.
Ana Paula Palacios STAT1044 UoG 16 / 43
Example: Gibbs sampling for censored data
Example
Suppose that the lifetime (in hours) of a machine, X, has normal distribution so
that X|θ ∼ N(θ, 1) and that we observe n machines during α hours. If, at the end
of this time, n1 machines have failed, with failure times x1, . . . , xn1
and
n2 = n − n1 machines are still working, then the likelihood function is:
l(θ)|x ∝ exp
−
1
2
Xn1
i=1
(xi − θ)
2
!
(1 − Φ(α − θ))n2
.
Thus an explicit form for the posterior of θ (assuming uniform prior) is
unavailable. However, if we knew the true values of the latent variables
xn1+1, . . . , xn, then it is clear that θ|x ∼ N(¯x, 1/n) where ¯x =
Pn
i=1 xi
.
Ana Paula Palacios STAT1044 UoG 17 / 43
Example: Gibbs sampling for censored data
Ana Paula Palacios STAT1044 UoG 18 / 43
The Multistage Gibbs sampler
It is a natural extension from the two-stage Gibbs sampler to the general
multistage Gibbs sampler.
Let X be a random variable X = (X1, . . . , Xp)) for some p > 1. Moreover,
suppose that we can simulate from the corresponding conditional densities
f1, . . . , fp., that is we can simulate
Xi
|x1, x2, . . . , xi−1, xi+1, . . . , xp ∼ fi(xi
|x1, x2, . . . , xi−1, xi+1, . . . , xp)
for i = 1, . . . , p. For short, it can be written as Xi
|x−i ∼ fi(xi
|x−i).
The associated Gibbs sampling algorithm is given by the following transition from
X
(t)
to X
(t+1):
At iteration t = 1, 2, . . ., given x
(t) = (x
(t)
1
, . . . , x
(t)
p ), generate
1) X
t+1
1 ∼ f1(x1|x
(t)
2
, . . . , x
(t)
p )
2) X
t+1
2 ∼ f2(x2|x
(t+1)
1
, x
(t)
3
, . . . , x
(t)
p )
.
.
.
p) X
t+1
p ∼ fp(xp|x
(t+1)
1
, . . . , x
(t+1)
p−1
)
Ana Paula Palacios STAT1044 UoG 19 / 43
Example: Hierarchical Poisson-gamma model
NFL concussion data
The data consists in the number of concussions in the years 2012-2015, x1 = 171,
x2 = 152, x3 = 123 and x4 = 199, respectively. The model assumes that
concussion on year i follow a Poisson with parameter λi
. For a given season with
N = 256 games, the number of concussions xi
is a Poisson(Nλi) random variable.
We assume the model
Xi
|λi ∼ Poisson(Nλi) i = 1, . . . , 4
λi
|γ ∼ Gamma(1, γ)
γ ∼ Gamma(a, b)
with a and b being the specified hyper-parameters.
Ana Paula Palacios STAT1044 UoG 20 / 43
Example: Hierarchical Poisson-gamma model
The joint distribution is
f (λ1, λ2, λ3, λ4, γ) ∝
Y
4
i=1

[Nλi
]
xi e
−Nλi γ
1λ
1−1
i
e
−γλi

γ
a−1
e
−bγ
∝
Y
4
i=1

λ
xi
i
e
−(N+γ)λi

γ
4+a−1
e
−bγ
from which we can see that the full conditionals are
λi
|λ−i
, xi
, γ ∝ λ
xi
i
e
−(N+γ)λi
∼ Gamma(xi + 1, N + γ)
γ|λi ∝
Y
4
i=1

e
−γλi

γ
4+a−1
e
−bγ
∝ γ
4+a−1
e
−γ(
Pn
i=1 λi +b)
∼ Gamma(4 + a,
Xn
i=1
λi + b)
Ana Paula Palacios STAT1044 UoG 21 / 43
Slice sampler
Slice sampler is a general version of the Gibbs sampler. It applies to most
distributions and is based on the simulation of specific uniform random variables.
Given a density of interest fX (x), we can always represent it as the marginal
density of the joint density
f (x, u) = I{0 < u < fX (x)}
since integrating the above in u return fX . The associated conditional densities are
fU|X (u|x) = I{0 < u < fX (x)}
R
I{0 < u < fX (x)} du
fX|U (x|u) = I{0 < u < fX (x)}
R
I{0 < u < fX (x)} dx
which means they are both uniform.
Ana Paula Palacios STAT1044 UoG 22 / 43
Slice sampler
These two conditional then define the slice sampler as: At iteration t, simulate
1 Given xt
, generate ut+1 ∼ U[0, f (xt)]
2 Given ut+1, generate x
t+1 ∼ U[{x : f (x) > ut+1}]
The appeal of this algorithm is that it formally applies to any density known up to
a multiplicative constant with no restriction on its shape or dimension.
Example
Suppose that we wish to sample from an exponential density X ∼ Exp(λ). Then,
we know that f (x) ∝ e
−λx
and a slice sampler could proceed as:
1 Given xt
, generate ut+1 ∼ U[0, e
−λxt
]
2 Given ut+1, generate xt+1 ∼ U[0, −
1
λ
log ut+1]
Ana Paula Palacios STAT1044 UoG 23 / 43
Example: Slice sampling
Ana Paula Palacios STAT1044 UoG 24 / 43
Convergence monitoring
When running an MCMC algorithm, it is important to assess when the sampled
values θt have approximately converged to the stationary distribution π(θ). This
will depend on how well the MCMC algorithm is able to explore the state space
and also on the correlation between the θ
0
t
s
Also, we need to assess the convergence of MCMC averages, 1
T
PT
t=1 θt → E[θ]
and finally we need to be able to assess how close a given sample is to being
independent and identically distributed.
Ana Paula Palacios STAT1044 UoG 25 / 43
Selecting initial values
Theoretically, Gibbs and Metropolis-Hastings sampling should converge for any
initial values, but good initial values will speed up convergence.
There are two common approaches:
Select initial values close to the posterior mode and run one long chain
Run several parallel chains with intentionally diffuse starting values to check
convergence
The first method has the advantage of requiring less number of iterations (shorter
burn-in period). Common choices are the MLE or MAP estimates. The
disadvantage is that we cannot rule out the possibility of being stuck in a local
mode and miss a chunk of the distribution.
Running several chains requires a greater number of total iterations, but if all
chains give the same results then this provides evidence of convergence.
Moreover, parallel computing can be used in this case.
Ana Paula Palacios STAT1044 UoG 26 / 43
Convergence
The first few samples are probably not draws from the target distribution. It make
take many iterations to move from the initial values to the target. When the
sampler reaches the target this is called convergence.
Samples before convergence are discard as burn-in.
After convergence the samples should not converge to a single point They should
be draws from the target distribution, and ideally look like a caterpillar or bar code.
Ana Paula Palacios STAT1044 UoG 27 / 43
Convergence diagnostic: trace plots
First, we can produce graphs of θt against t to show the mixing of the chain and
any deviations from stationarity.
0 200 400 600 800 1000
−4 −2
0
2
4
Iteration number
MCMC sample
The chain presents a good mixing performance and convergence in only a few
iterations.
Ana Paula Palacios STAT1044 UoG 28 / 43
Convergence diagnostic: trace plots
0 200 400 600 800 1000
−2
0
2
4
6
Iteration number
MCMC sample
The plot shows convergence in a hundred iterations.
Ana Paula Palacios STAT1044 UoG 29 / 43
Convergence diagnostic: trace plots
These are examples of badly mixing chains.
Ana Paula Palacios STAT1044 UoG 30 / 43
Convergence diagnostic: trace plots
0 200 400 600 800 1000
0
5 10 15 20
Iteration number
MCMC sample
This chain has never converged.
Ana Paula Palacios STAT1044 UoG 31 / 43
Convergence diagnostic: trace plots
0 200 400 600 800 1000
−2
0
2
4
Iteration number
MCMC sample
Convergence is questionable
Ana Paula Palacios STAT1044 UoG 32 / 43
Convergence diagnostic: several chains
The 3 parallel chains converge around iteration 1,000.
Ana Paula Palacios STAT1044 UoG 33 / 43
Convergence diagnostic: MCMC average
Secondly, we can plot running means of the parameters of interest to see when
they have converged.
It can be seen that the means appear to have converged after about 3000
iterations. Thus, one possibility is to run the sampler for longer, using these initial
iterations as a burn in period.
Ana Paula Palacios STAT1044 UoG 34 / 43
Autocorrelation
Ideally the samples would be independent across iteration
The autocorrelation function ρ(h) is the correlation between samples h
iterations apart
Lower values are better, but if the chains are long enough even large values
can be OK
Thinning: If autocorrelation is zero after lag h you can thin the samples by h
to achieve independence
This is always less efficient than using all samples, but can save memory
Ana Paula Palacios STAT1044 UoG 35 / 43
Convergence diagnostic: autocorrelation
Thirdly, we can plot the autocorrelation functions of the generated values. In
general, as we are generating from a Markov chain, the successive values, θt
, will
be positively correlated.
In the random walk sampler, the autocorrelation disappears after about lag 9,
while in the independence sampler about lag 4. One possibility is thus to thin the
samples, choosing just every 9th and 4h datum, resp., which are now
approximately independent.
Ana Paula Palacios STAT1044 UoG 36 / 43
Convergence diagnostics
So far we have visually inspected the chains for convergence
There are many formal diagnostics
The CODA package in R has dozens of diagnostics
Most give a measure of convergence for each parameter
Checking convergence using these one-number summaries is more efficient
and objective than visual inspection
Ana Paula Palacios STAT1044 UoG 37 / 43
Convergence diagnostics
Did my chains converge?
I Geweke
I Gelman-Rubin
Did I run the sampler long enough after convergence?
I Effective sample size
I Standard errors for the posterior mean estimate
Ana Paula Palacios STAT1044 UoG 38 / 43
Geweke diagnostic
Compares the mean in the beginning of the chain with the mean at the end
of the chain
Can we used for a single chain
Done separately for each parameter
A common choice is to compare the first 10% with the last 50%
The test accounts for autocorrelation
The test statistic is a z-score, so |Z| > 2 indicates poor convergence
Ana Paula Palacios STAT1044 UoG 39 / 43
Gelman-Rubin statistic
If we run multiple chains, we hope that all chains give same result
The Gelman-Rubin statistics measures agreement between chains
Is it essentially an ANOVA test of whether the chains have the same mean
It is scaled so that 1 is perfect and 1.1 is decent but not great convergence
Ana Paula Palacios STAT1044 UoG 40 / 43
Effective sample size
Highly correlated samples have less information than independent samples
Say S is the actual number of MCMC samples
The effective samples size is
ESS =
S
1 + 2P∞
h=1 ρ(h)
The correlated MCMC sample of length S has the same information as ESS
independent samples
ESS should be at least a few thousand for all parameters
Ana Paula Palacios STAT1044 UoG 41 / 43
Standard errors of posterior mean estimates
The sample mean of the MCMC draws is an estimate of the posterior mean
The standard error of this estimate as another diagnostic
Assuming independence the standard error is
Naive SE = s
√
S
where s is the sample SD and S is the number of samples
A more realistic standard error is
Times-series SE = s
√
ESS
Ana Paula Palacios STAT1044 UoG 42 / 43
What to do if the chains haven’t converged?
Increase the number of iterations
Tune the MH candidate distribution
Improve initial values
Use a more advanced algorithm
Simplify the model
In Bayesian inference, pick more informative priors
Run a simulation study
Ana Paula Palacios STAT1044 UoG 43 / 43


##Example: Beta-Binomial model

Nsim=5000
n=15
a=3
b=7
X=T=array(0,dim=c(Nsim,1))
T[1]=rbeta(1,a,b) #Initial value for theta
X[1]=rbinom(1,n,T[1]) #Sample initial value of x given theta
for(i in 2:Nsim){
  X[i]=rbinom(1,n,T[i-1])
  T[i]=rbeta(1, a+X[i], n-X[i]+b)
}

plot( X[1:20] , T[1:20] , type="l" ,col="red",xlab="x",ylab=expression(theta),
      main = "Component-by-component updating")
XT=rep(X[1],2)
for(i in 2:50){
  XT=c(XT,rep(X[i],2))
}
TT=T[1]
for(i in 2:50){
  TT=c(TT,rep(T[i],2))
}
TT=c(TT,T[51])
plot( XT[1:15] , TT[1:15] , type="l" ,col="red",xlab="x",ylab=expression(theta),
      main = "Component-by-component updating")

plot( X[1:50] , T[1:50] ,  pch=20 ,cex=2,xlab="x",ylab=expression(theta),
      main="Plot of each (x, theta)")
plot( X , T , type="p" , pch="." ,cex=2,xlab="x",ylab=expression(theta),
      main="Plot of each (x, theta)")   

# Plotting the true marginals and Gibbs samples

theta <- seq(0,1,.001) # Define a grid of points for plotting
pdf <- dbeta(theta,a,b) # Evaluate the density at these points
# Histrogram of Monte Carlo samples
hist(T, prob = TRUE, ylab="Marginal density",xlab=expression(theta), main="Beta(a,b)") 
lines(theta,pdf,type="l") 


if(!require("extraDistr")) install.packages("extraDistr")
library(extraDistr)
x <- seq(0,15,1) # Define a grid of points for plotting
pdf <- dbbinom(x,size=15,alpha=a,beta=b,log=FALSE)
hist(X, prob = TRUE, ylab="Marginal density",xlab=expression(X), main="Beta-binomial(x,n,a,b)") 
lines(x,pdf,type="l")

##############################################################

###Example: Gaussian model

# Load the data
Y <- c(2.68,1.18,-0.97,-0.98,-1.03)
n <- length(Y)
# Create an empty matrix for the MCMC samples
S <- 25000
samples <- matrix(NA,S,2)
colnames(samples) <- c("mu","sigma")
# Initial values
mu <- mean(Y)
sig2 <- var(Y)
# priors: mu ~ N(gamma,tau), sig2 ~ InvG(a,b)
gamma <- 0
tau <- 100^2
a <- 0.1
b <- 0.1
# Gibbs sampling
for(s in 1:S){
  P <- n/sig2 + 1/tau
  M <- sum(Y)/sig2 + gamma/tau
  mu <- rnorm(1,M/P,1/sqrt(P))
  A <- n/2 + a
  B <- sum((Y-mu)^2)/2 + b
  sig2 <- 1/rgamma(1,A,B)
  samples[s,]<-c(mu,sqrt(sig2))
}
# Trace plots 
par(mfrow=c(1,2))
plot(samples[,1],ylab=expression(mu),xlab="Iterations", type="l")
plot(samples[,2],ylab=expression(sigma^2),xlab="Iterations", type="l")
# Plot the joint posterior and marginal of mu
par(mfrow=c(1,2))
plot(samples,xlab=expression(mu),ylab=expression(sigma))
hist(samples[,1],xlab=expression(mu), breaks=50)
# Posterior mean, median and credible intervals
apply(samples,2,mean)
apply(samples,2,quantile,c(0.025,0.500,0.975))

##############################################################
# Example: Censored data 
rm(list=ls())
theta.true=20
al=21
n=50
x=rnorm(n,theta.true,1)
x=x[x<al]
n1=length(x)
n2=n-n1
burnin=100;iters=1000
N=burnin+iters
theta=mean(x)
for (t in 1:(N-1)){
  for (i in n1+1:n){
    x[i]=0
    while (x[i]<al) x[i]=rnorm(1,theta[t],1)
  }
  theta[t+1]=rnorm(1,mean(x),sqrt(1/n));
}
thetas=theta[burnin+1:iters]
mean(thetas)
dev.off()
hist(thetas, main="True theta=20")

##############################################################
# Example: Slice sampling
rm(list=ls())
iters=10000
lam=2
theta=0.5
for (t in 1:iters){
  u=exp(-lam*theta[t])*runif(1)
  theta[t+1]=-log(u)*runif(1)/lam
}
hist(theta,freq=FALSE)
ax=seq(0,5,0.1)
lines(ax, dexp(ax,lam))


code tutorials R:
## TUtorial Gibbs Sampling

#################### Question  2 ###############################
# Generate data
#a)
data = rbinom(50, size=15, prob=0.30)
MLE = sum(data/(50*15)) # empirical rate of success

#b)
Nsim=5000
n=15
a=3
b=7
X=T=array(0,dim=c(Nsim,1))
#T[1]=rbeta(1,a,b) #Initial value for theta
T[1] = MLE
X[1]=rbinom(1,n,T[1]) #Sample initial value of x given theta
for(i in 2:Nsim){
  X[i]=rbinom(1,n,T[i-1])
  T[i]=rbeta(1, a+X[i], n-X[i]+b)
}

plot(cumsum(T[1])/1:Nsim, ylim=c(0,1),type="l", xlab="Iterations", ylab=expression(Running~mean~of~theta), main="")


#c)
Nsim=5000
n=15
a=3  # hypterparameter value. Make a=1 for part d)
b=7  # hypterparameter value. Make b=1 for part d)
X=T=array(0,dim=c(Nsim,3))
T[1,]=rbeta(3,a,b) #Initial value for theta
#T[1,] = MLE
T[1,]=c(0.60, 0.40, 0.20)
X[1,]=rbinom(3,n,T[1]) #Sample initial value of x given theta
for(j in 1:3){
for(i in 2:Nsim){
  X[i,j]=rbinom(1,n,T[i-1,j])
  T[i,j]=rbeta(1, a+X[i,j], n-X[i,j]+b)
}}


plot(cumsum(T[,1])/1:Nsim, ylim=c(0,1),type="l", xlab="Iterations", ylab=expression(Running~mean~of~theta), main="")
lines(cumsum(T[,2])/1:Nsim,col="red");lines(cumsum(T[,3])/1:Nsim,col="blue")

#################### Question  3 ###############################

#a)
#Simulate data
n <- 50
Y <- rnorm(n,mean=100,sd=15)

#b)
# Create an empty matrix for the MCMC samples
S <- 1000
samples <- matrix(NA,S,2)
colnames(samples) <- c("mu","sigma")
# Initial values
mu <- mean(Y)
sig2 <- var(Y)
# priors: mu ~ N(gamma,tau), sig2 ~ InvG(a,b)
gamma <- 0  # This is mu_0
tau <- 100^2
a <- 0.01
b <- 0.01

# Gibbs sampling
for(s in 1:S){
  P <- n/sig2 + 1/tau
  M <- sum(Y)/sig2 + gamma/tau
  mu <- rnorm(1,M/P,1/sqrt(P))
  A <- n/2 + a
  B <- sum((Y-mu)^2)/2 + b
  sig2 <- 1/rgamma(1,A,B)
  samples[s,]<-c(mu,sqrt(sig2))
}

sample3=samples

# Plot the joint posterior and marginal of mu
par(mfrow=c(1,2))
plot(samples,xlab=expression(mu),ylab=expression(sigma))
hist(samples[,1],xlab=expression(mu), breaks=50)
# Posterior mean, median and credible intervals
apply(samples,2,mean)
apply(samples,2,quantile,c(0.025,0.500,0.975))


# Convergence
# Trace plots 
par(mfrow=c(3,2))
plot(samples[,1],ylab=expression(mu),xlab="Iterations", type="l")
plot(samples[,2],ylab=expression(sigma^2),xlab="Iterations", type="l")
# Running mean
plot(cumsum(samples[,1])/1:S,type="l", xlab="Iterations", ylab=expression(Running~mean~of~mu), main="")
plot(cumsum(samples[,2])/1:S,type="l", xlab="Iterations", ylab=expression(Running~mean~of~sigma^2), main="")
# Autocorrelation
acf(samples[,1], main=expression(Autocorrelations~of~mu[t]))
acf(samples[,2], main=expression(Autocorrelations~of~sigma[t]^2))



######################### Question 4 #########################


Nsim=1000
p=5     # number of variables
r=0.75  # correlation rho
X=cur=rnorm(p)
for (t in 2 :Nsim){
  for (j in 1 :p){
    m=sum(cur[-j])/(p-1)
    cur[j]=rnorm(1,(p-1)*r*m/(1+(p-2)*r),
                 sqrt((1+(p-2)*r-(p-1)*r^2)/(1+(p-2)*r)))
  }
  X=rbind(X,cur)
}
par(mfrow=c(1,5))
for (i in 1:p){
  hist(X[,i],prob=TRUE,col="wheat2",xlab="",main="")
  curve(dnorm(x),add=TRUE,col="sienna",lwd=2)}

par(mfrow=c(1,1))
plot(X[,1:2],xlab=expression(mu),ylab=expression(sigma))
plot(cumsum(X[,1])/1:Nsim,type="l", xlab="Iterations", ylab="Running mean", main="")
plot( X[1:50,1] , X[1:50,2] , type="l" ,col="red",xlab=expression(x[1]),ylab=expression(x[2]),
      main = "Component-by-component updating")

##################### Question 5 ####################################

# Load data
Y <- c(171, 152, 123, 199)
n <- 4
N <- 256
# Create an empty matrix for the MCMC samples
S <- 25000
samples <- matrix(NA,S,5)
colnames(samples) <- c("lam1","lam2","lam2","lam4","gamma")
# Initial values
lambda = Y/N
gamma <- 1/mean(lambda)
# priors: lambda[i]|gamma ~ Gamma(1,gamma), gamma ~ InvG(a,b)
a <- 0.1
b <- 0.1
# Gibbs sampling
for(s in 1:S){
  for(i in 1:n){
    lambda[i] <- rgamma(1,Y[i]+1,N+gamma)
  }
  gamma <- rgamma(1,4+a,sum(lambda)+b)
  samples[s,] <- c(lambda,gamma)
}

# Posterior mean, median and credible interval
apply(samples,2,mean)
apply(samples,2,quantile,c(0.025,0.500,0.975))

boxplot(samples[,1:4],outline=FALSE,
        ylab=expression(lambda),names=2012:2015)

#Convergence

for(i in 1:5){
  plot(samples[,i],type="l",xlab="Iteration")
}

for(i in 1:5){
  plot(cumsum(samples[,i])/1:S,type="l",xlab="Iteration")
}

for(i in 1:5){
  acf(samples[,i])
}

par(mfrow=c(1,3))
plot(samples[,5],type="l",xlab="Iteration", ylab=expression(gamma))
plot(cumsum(samples[,5])/1:S,type="l",xlab="Iteration", ylab=expression(gamma))
acf(samples[,5])
  





## TUtorial Gibbs Sampling

#################### Question  2 ###############################
# Generate data
#a)
data = rbinom(50, size=15, prob=0.30)
MLE = sum(data/(50*15)) # empirical rate of success

#b)
Nsim=5000
n=15
a=3
b=7
X=T=array(0,dim=c(Nsim,1))
#T[1]=rbeta(1,a,b) #Initial value for theta
T[1] = MLE
X[1]=rbinom(1,n,T[1]) #Sample initial value of x given theta
for(i in 2:Nsim){
  X[i]=rbinom(1,n,T[i-1])
  T[i]=rbeta(1, a+X[i], n-X[i]+b)
}

plot(cumsum(T[1])/1:Nsim, ylim=c(0,1),type="l", xlab="Iterations", ylab=expression(Running~mean~of~theta), main="")


#c)
Nsim=5000
n=15
a=3  # hypterparameter value. Make a=1 for part d)
b=7  # hypterparameter value. Make b=1 for part d)
X=T=array(0,dim=c(Nsim,3))
T[1,]=rbeta(3,a,b) #Initial value for theta
#T[1,] = MLE
T[1,]=c(0.60, 0.40, 0.20)
X[1,]=rbinom(3,n,T[1]) #Sample initial value of x given theta
for(j in 1:3){
for(i in 2:Nsim){
  X[i,j]=rbinom(1,n,T[i-1,j])
  T[i,j]=rbeta(1, a+X[i,j], n-X[i,j]+b)
}}


plot(cumsum(T[,1])/1:Nsim, ylim=c(0,1),type="l", xlab="Iterations", ylab=expression(Running~mean~of~theta), main="")
lines(cumsum(T[,2])/1:Nsim,col="red");lines(cumsum(T[,3])/1:Nsim,col="blue")

#################### Question  3 ###############################

#a)
#Simulate data
n <- 50
Y <- rnorm(n,mean=100,sd=15)

#b)
# Create an empty matrix for the MCMC samples
S <- 1000
samples <- matrix(NA,S,2)
colnames(samples) <- c("mu","sigma")
# Initial values
mu <- mean(Y)
sig2 <- var(Y)
# priors: mu ~ N(gamma,tau), sig2 ~ InvG(a,b)
gamma <- 0  # This is mu_0
tau <- 100^2
a <- 0.01
b <- 0.01

# Gibbs sampling
for(s in 1:S){
  P <- n/sig2 + 1/tau
  M <- sum(Y)/sig2 + gamma/tau
  mu <- rnorm(1,M/P,1/sqrt(P))
  A <- n/2 + a
  B <- sum((Y-mu)^2)/2 + b
  sig2 <- 1/rgamma(1,A,B)
  samples[s,]<-c(mu,sqrt(sig2))
}

sample3=samples

# Plot the joint posterior and marginal of mu
par(mfrow=c(1,2))
plot(samples,xlab=expression(mu),ylab=expression(sigma))
hist(samples[,1],xlab=expression(mu), breaks=50)
# Posterior mean, median and credible intervals
apply(samples,2,mean)
apply(samples,2,quantile,c(0.025,0.500,0.975))


# Convergence
# Trace plots 
par(mfrow=c(3,2))
plot(samples[,1],ylab=expression(mu),xlab="Iterations", type="l")
plot(samples[,2],ylab=expression(sigma^2),xlab="Iterations", type="l")
# Running mean
plot(cumsum(samples[,1])/1:S,type="l", xlab="Iterations", ylab=expression(Running~mean~of~mu), main="")
plot(cumsum(samples[,2])/1:S,type="l", xlab="Iterations", ylab=expression(Running~mean~of~sigma^2), main="")
# Autocorrelation
acf(samples[,1], main=expression(Autocorrelations~of~mu[t]))
acf(samples[,2], main=expression(Autocorrelations~of~sigma[t]^2))



######################### Question 4 #########################


Nsim=1000
p=5     # number of variables
r=0.75  # correlation rho
X=cur=rnorm(p)
for (t in 2 :Nsim){
  for (j in 1 :p){
    m=sum(cur[-j])/(p-1)
    cur[j]=rnorm(1,(p-1)*r*m/(1+(p-2)*r),
                 sqrt((1+(p-2)*r-(p-1)*r^2)/(1+(p-2)*r)))
  }
  X=rbind(X,cur)
}
par(mfrow=c(1,5))
for (i in 1:p){
  hist(X[,i],prob=TRUE,col="wheat2",xlab="",main="")
  curve(dnorm(x),add=TRUE,col="sienna",lwd=2)}

par(mfrow=c(1,1))
plot(X[,1:2],xlab=expression(mu),ylab=expression(sigma))
plot(cumsum(X[,1])/1:Nsim,type="l", xlab="Iterations", ylab="Running mean", main="")
plot( X[1:50,1] , X[1:50,2] , type="l" ,col="red",xlab=expression(x[1]),ylab=expression(x[2]),
      main = "Component-by-component updating")

##################### Question 5 ####################################

# Load data
Y <- c(171, 152, 123, 199)
n <- 4
N <- 256
# Create an empty matrix for the MCMC samples
S <- 25000
samples <- matrix(NA,S,5)
colnames(samples) <- c("lam1","lam2","lam2","lam4","gamma")
# Initial values
lambda = Y/N
gamma <- 1/mean(lambda)
# priors: lambda[i]|gamma ~ Gamma(1,gamma), gamma ~ InvG(a,b)
a <- 0.1
b <- 0.1
# Gibbs sampling
for(s in 1:S){
  for(i in 1:n){
    lambda[i] <- rgamma(1,Y[i]+1,N+gamma)
  }
  gamma <- rgamma(1,4+a,sum(lambda)+b)
  samples[s,] <- c(lambda,gamma)
}

# Posterior mean, median and credible interval
apply(samples,2,mean)
apply(samples,2,quantile,c(0.025,0.500,0.975))

boxplot(samples[,1:4],outline=FALSE,
        ylab=expression(lambda),names=2012:2015)

#Convergence

for(i in 1:5){
  plot(samples[,i],type="l",xlab="Iteration")
}

for(i in 1:5){
  plot(cumsum(samples[,i])/1:S,type="l",xlab="Iteration")
}

for(i in 1:5){
  acf(samples[,i])
}

par(mfrow=c(1,3))
plot(samples[,5],type="l",xlab="Iteration", ylab=expression(gamma))
plot(cumsum(samples[,5])/1:S,type="l",xlab="Iteration", ylab=expression(gamma))
acf(samples[,5])
  


