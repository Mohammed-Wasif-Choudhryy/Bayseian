Bayesian Methods and its Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios STAT1044 UoG 1 / 35
Objectives for today
Introduce Bayesian models:linear regression, GLM and hierarchical models.
Ana Paula Palacios STAT1044 UoG 2 / 35
Linear regression
Linear regression is by far the most common statistical model
It includes as special cases the t-test and ANOVA
The multiple linear regression model is
Yi ∼ Normal(β0 + Xi1β1 + ... + Xipβp, σ2
)
independently across the i = 1, ..., n observations
As we’ll see, Bayesian and classical linear regression are similar if n >> p and
the priors are uninformative.
However, the results can be different for challenging problems, and the
interpretation is different in all cases
Ana Paula Palacios STAT1044 UoG 3 / 35
Example: T.Rex growth chart
Gigantism and comparative life-history parameters of tyrannosaurid
dinosaurs (Ericson et al, 2004)
How evolutionary changes in body size are brought about by variance in
developmental timing and/or growth rates (also known as heterochrony) is a topic
of considerable interest in evolutionary biology. In particular, extreme size change
leading to gigantism occurred within the dinosaurs on multiple occasions.
Whether this change was brought about by accelerated growth, delayed maturity
or a combination of both processes is unknown. A better understanding of
relationships between non-avian dinosaur groups and the new found capacity to
reconstruct their growth curves make it possible to address these questions
quantitatively. Here we study growth patterns within the Tyrannosauridae, the
best known group of large carnivorous dinosaurs, and determine the
developmental means by which Tyrannosaurus rex, weighing 5,000 kg and more,
grew to be one of the most enormous terrestrial carnivorous animals ever.
Ana Paula Palacios STAT1044 UoG 4 / 35
Example: T.Rex growth chart
Ana Paula Palacios STAT1044 UoG 5 / 35
Review of least squares
Linear regression is often simpler to describe using linear algebra notation
Let Y = (Y1, ..., Yn)
T be the response vector and X be the n × (p + 1)
matrix of covariates
Then the mean of Y is Xβ and the least squares solution is
βˆ
OLS = argmin
β
(Y − Xβ)
T
(Y − Xβ) = (X
TX)
−1X
TY
If the errors are Gaussian then the sampling distribution is
βˆ
OLS ∼ Normal h
β, σ2
(X
TX)
−1
i
If the variance σ
2
is estimated using the mean squared residual error then the
sampling distribution is multivariate t
Ana Paula Palacios STAT1044 UoG 6 / 35
T.Rex growth data: MLE
Ana Paula Palacios STAT1044 UoG 7 / 35
Disadvantages
The model requires more data than parameters.
The model requires independence of predictors (multicollinearity)
Th matrix (X
TX) must be invertible
To overcome this difficulties, some models include a penalisation factor:
Ridge regression
minXn
i=1

yi −
X
p
j=1
βjxij


2
+ λ
X
p
j=1
β
2
j
Lasso regression
minXn
i=1

yi −
X
p
j=1
βjxij


2
+ λ
X
p
j=1
|βj
|
Ana Paula Palacios STAT1044 UoG 8 / 35
Bayesian regression
In the Bayesian framework we need to specify prior distributions for the
parameters of the model
The likelihood remains
Yi ∼ Normal(β0 + Xi1β1 + ... + Xipβp, σ2
)
independent for i = 1, ..., n observations
We will focus on prior specification since this piece is uniquely Bayesian.
Options:
1 Conjugate priors
2 Non-informative priors
3 Semi-conjugate priors
Ana Paula Palacios STAT1044 UoG 9 / 35
1. Conjugate Prior: normal-gamma distribution
Likelihood:
Y|β, σ ∼ MVN(Xβ, Iσ
2
)
Prior distribution: a multivariate normal-gamma distribution for β, φ:
β|φ ∼ Normal 
m,
1
φ
V

φ ∼ Gamma 
a
2
,
b
2

where φ = 1/σ2
.
Posterior distribution:
f (β, φ|X) ∼ NormalGamma(m∗
, V
∗
, a
∗
, b
∗
)
which is proper distribution as long as the prior is proper even if p > n and
the covariates are perfectly collinear.
Ana Paula Palacios STAT1044 UoG 10 / 35
1. Conjugate Prior: the posterior distribution
m∗ = (V
−1 + X
TX)
−1

V
−1m + X
T
y

V
∗ = (V
−1 + X
TX)
−1
a
∗ = a + n
b
∗ = b + mTV
−1m + y
T
y − m∗TV
∗−1
m∗
The posterior expected value of β is a weighted average of the prior mean
and the MLE
E(β|y) = (V
−1 + X
TX)
−1

V
−1m + (X
TX)βˆ

The MAP estimator is the ridge regression estimator, with λ = 1/τ 2
and
V = τ
2
I.
Ana Paula Palacios STAT1044 UoG 11 / 35
T.Rex growth data: Conjugate priors
Ana Paula Palacios STAT1044 UoG 12 / 35
Conjugate Prior: prediction
Assume we want to make a prediction for a new observation
Y˜ =
X
k
j=1
βjx˜j + ˜
where xj
is the observed value of the j-th predictor variable, and k is equal to the
number of predictors (p) plus one.
It is straight forward to make predictions using Monte Carlo. First, we generate a
sample of the posterior distribution of (β, φ) and then we simulate values of 
from a normal distribution with precision equal to the simulated values of φ. In
this way, we would have generated a sample of Y˜.
Ana Paula Palacios STAT1044 UoG 13 / 35
T.Rex growth data: Conjugate priors
Prediction for a 10 years old T. Rex
Ana Paula Palacios STAT1044 UoG 14 / 35
2. Non-informative Prior: Jeffrey’s prior
Likelihood:
Y|β, σ ∼ MVN(Xβ, Iσ
2
)
Prior distribution: improper prior distribution for β, φ:
f (β, φ) ∝ 1/φ
Posterior distribution:
f (β, φ|X) ∼ NormalGamma(m∗
, V
∗
, a
∗
, b
∗
)
Ana Paula Palacios STAT1044 UoG 15 / 35
2. Non-informative priors
m∗ = (X
TX)
−1X
T
y = βˆ
V
∗ = (X
TX)
−1
a
∗ = a + n − k
b
∗ = (y − Xβˆ)
T
(y − Xβˆ)
If the matrix (X
TX)
−1
exists, then the posterior mean of β is equal to the
MLE.
If the matrix (X
TX)
−1 does not exists (for example when n ≤ k or when
X
TX is not invertible) then the posterior distribution is not proper.
Ana Paula Palacios STAT1044 UoG 16 / 35
3. Semi-conjugate prior
When there are many covariates or when the covariates are collinear, the βˆ
OLS is
unstable. In modern problems, it is typically assumed independent priors for β and
φ, for example:
β ∼ Normal(m, V)
φ ∼ Gamma(
a
2
,
b
2
)
In this case, we can implement a Gibbs sampling algorithm to generate a sample
of the posterior distribution.
Ana Paula Palacios STAT1044 UoG 17 / 35
Generalized Linear Models
Multiple linear regression assumes that the response variable is normal and
thus them mean response can be any real number.
The generalized linear model generalizes the linear regression models by
allowing the possibility of a non-normal response (non-normal error
distributions) and by allowing for a non-linear relationship between Y and X.
The basic steps to selecting a GLM are:
1 determine the support of the response and select an appropriate distribution
family parametrized by a mean parameter, µ = E(Y |X), and (possibly) a
dispersion parameter that is independent of X.
2 link the covariates to the parameters that define this distribution family
through a link function: g(µ) = Xβ
Multiple linear regression
In this case the support of the response is (−∞, ∞), so a natural parametric
family is the normal distribution. The link function is the identity as in this model
E(Y |X) = µ = Xβ
Ana Paula Palacios STAT1044 UoG 18 / 35
Binary data
Binary outcomes Yi ∈ {0, 1} occur frequently when the result of an experiment
is recorded only as an indicator of a success or failure. For example, whether the
result of a diagnostic test is positive.
Binary variables follows a Bernoulli distribution with parameter p, the
probability of success.
Since the parameter is a probability, the link function must have input range [0, 1]
and output range (−∞, ∞).
Two possible link functions are:
logistic link function: g(p) = log p
1 − p
probit link function: g(p) = Φ−1
(p)
where Φ−1
is the quantile function of the standard normal distribution (i.e
the inverse of the CDF).
Ana Paula Palacios STAT1044 UoG 19 / 35
Logistic regression
The logistic regression model is often used for predicting the occurrence of an
event given covariates. It is assumed that
Yi
|pi ∼ Be(pi)
g(pi) = log 
pi
1 − pi

= β0 + β1Xi1 + . . . + βpXip
for i = 1, . . . , n. The inverse logistic function is g
−1
(x) = exp(x)/[1 + exp(x)],
and then the model can also be expressed as
Yi
|pi ∼ Be 
exp(β0 + β1Xi1 + . . . + βpXip)
1 + exp(β0 + β1Xi1 + . . . + βpXip)

i = 1, . . . , n
.
βj
is interpreted as the increase of the log odds corresponding to an increase
of one in Xj with all other covariates held fixed.
Similarly, with all other covariates held fixed, increasing Xj by one multiplies
the odds by exp(βj).
Ana Paula Palacios STAT1044 UoG 20 / 35
Poisson regression for count data
Count data with support Yi ∈ {0, 1, 2, . . .} often arise as the number of events
that occur in a time interval or spatial region. In Poisson regression, we will model
the mean of Yi as a function of the covariates.
The Poisson regression assume that
Yi
|λi ∼ Poisson(λi)
log(λi) = β0 + β1Xi1 + . . . + βpXip
where the logarithm is taken to ensure that the mean of Yi
is positive.
If Xj
increases by one with all other covariates remaining fixed, the mean is
multiplied by exp(βj)
Ana Paula Palacios STAT1044 UoG 21 / 35
Generalized linear models
The Bayesian specification of a GLM is completed by defining (typically
normal or normal gamma) prior distributions over the unknown model
parameters.
As with standard linear models, when improper priors are used, it is then
important to check that these lead to valid posterior distributions.
Clearly, these models will not have conjugate posterior distributions, but,
usually, they are easily handled by Gibbs sampling.
Ana Paula Palacios STAT1044 UoG 22 / 35
Logistic regression: NBA clutch free throws
Do basketball players have the same success rate when they are under
pressure?
Clutch shooting is basically when a player or team hits a shot at an
important time of the game
The data set has the overa free throw proportion and results of free throws
taken in pressure situations, defines as clutch for the ten National basketball
Association players that received the most votes as Most Valuable Player
Award 2016-2017.
Ana Paula Palacios STAT1044 UoG 23 / 35
Logistic regression: NBA clutch free throws
We will study the relationship between the success rates in clutch situations and
overall success rate via logistic regression.
Ana Paula Palacios STAT1044 UoG 24 / 35
Logistic regression: NBA clutch free throws
The support of the response is Yi ∈ {0, 1, . . . , ni} and so we select a binomial
likelihood Yi ∼ Binomial(ni
, pi) where pi
is the probability of player i of
making a clutch shot.
ni
is the number of shots and it is known.
Two alternative models
logit(pi) = β0 + β1Xi
logit(pi) = β0 + Xi
where Xi
is the log odds of making a regular free throw.
We set uninformative Normal(0,100) priors for all the parameters.
Ana Paula Palacios STAT1044 UoG 25 / 35
Logistic regression: NBA clutch free throws
In the second model, we find that the intercept is negative with posterior
probability around 0.95. If the intercept is negative this implies that the clutch
probability is less than the overall probability. Therefore, there is some evidence
that free throw percentage decreases in clutch situations.
Ana Paula Palacios STAT1044 UoG 26 / 35
Hierarchical models
Suppose we have data, x, and a likelihood function f (x|θ) where the
parameter values θ = θ1, θ2, . . . , θk are judged to be exchangeable, that is,
any permutation of them has the same distribution.
In this situation, it makes sense to consider a multilevel modelling assuming a
prior distribution, f (θ|φ), which depends upon a further, unknown
hyperparameter, φ and use a hyperprior distribution, f (φ).
In theory, this process could continue further, using hyperhyperprior
distributions to estimate the hyperprior distributions. This is a method to
elicit the optimal prior distributions.
One alternative is to estimate the hyperparameter using classical methods,
which is known as empirical Bayes.
Ana Paula Palacios STAT1044 UoG 27 / 35
Hierarchical models
In most hierarchical models, the joint posterior distributions will not be
analytically tractable as it will be,
f (θ, φ|x) ∝ f (x|θ)f (θ|φ)f (φ)
However, often a Gibbs sampling approach can be implemented by sampling
from the conditional posterior distributions:
f (θ|x, φ) ∝ f (x|θ)f (θ|φ)
f (φ|x, θ) ∝ f (θ|φ)f (φ)
It is important to check the propriety of the posterior distribution when
improper hyperprior distributions are used. An alternative (as in for example
Winbugs) is to use proper but high variance hyperprior distributions.
Ana Paula Palacios STAT1044 UoG 28 / 35
Hierarchical normal linear models
Example
Various individual i = 1, . . . , n, take an IQ test where it is supposed that the
result is
Yi
|θi
, φ ∼ N(θi
, 1/φ)
where the outcome for subject i is supposed to depend on their true IQ θi
. Now if
we suppose that the true IQ’s of the people in the study are exchangeable then we
might reasonably assume that
θi
|µ, ψ ∼ N(µ, 1/ψ)
where the unknown hyperparameters are µ, representing the mean true IQ in the
population, and ψ.
Ana Paula Palacios STAT1044 UoG 29 / 35
Hierarchical Poisson model
Example
The number of failures, Xi at a power plant i is assumed to follow a Poisson
distribution:
Xi
|λi ∼ P(λiti) i = 1, . . . , n
where λi
is the failure rate for pump i and ti
is the length of operation time of the
pump (in 1000s of hours). It seems natural to assume that the failure rates are
exchangeable and thus we might assume:
λi
|γ ∼ Exp(γ)
where γ is the prior hyperparameter.
The observed data are:
Ana Paula Palacios STAT1044 UoG 30 / 35
Information criteria
Several information criteria have been proposed that do not require fitting
the model several times
Many are functions of the deviance, i.e., twice the negative log likelihood
D(Y|θ) = −2 log[f (Y|θ)]
Ideally, models will have small deviance (high likelihood)
However, if a model is too complex it will have small deviance but it might
be unstable (over-fitting)
Ana Paula Palacios STAT1044 UoG 31 / 35
AIC and BIC
The most well known classical information criteria are:
The Akaike information criteria:
AIC = D(Y|θˆ) + 2p
where θˆ is the MLE
The Bayesian information criteria:
BIC = D(Y|θˆ) + log(n)p
Note that these measures include a complexity penalty term
Models with smaller AIC and BIC are preferred
Ana Paula Palacios STAT1044 UoG 32 / 35
Deviance information criteria (DIC)
Deviance information criteria
DIC is a popular Bayesian analog of AIC or BIC
DIC = D(Y|θˆ) + 2pD
where θˆ is the posterior mean of θ, pD is the effective number of parameters
pD = D¯ − D(Y|θˆ).
and D¯ = E[D(Y |θ)|Y] is the posterior mean of the deviance.
We prefer models that are simple and fit well, so we select the model with
smallest DIC. Rule of thumb: a difference of DIC of less than 5 is not
definitive and a difference greater than 10 is substantial
DIC can also be written as
DIC = D¯ + pD
For non-hierarchical, linear models with a non-informative prior on θ,
DIC = AIC.
Ana Paula Palacios STAT1044 UoG 33 / 35
DIC
If there are p parameters and we have uninformative priors then pD ≈ p.
However, pD << p if there are strong priors.
Very easy to calculate from MCMC output.
Useful in nested models
Inconsistent (like AIC)
pD can be negative
Doesn’t work in latent variable models.
For alternatives, see Celeux et al (2003)
Ana Paula Palacios STAT1044 UoG 34 / 35
Watanabe-Akaike information criteria (WAIC)
WAIC is written in terms of the posterior of the likelihood rather than
parameters
Let mi and vi be the posterior mean and variance of
log[f (Yi
|θ)]
The effective model size is pW =
Pn
i=1 vi
The criteria is
WAIC = −2
Xn
i=1
mi + 2pW
Models with smaller WAIC are preferred.
In practice WAIC and DIC often give similar results, but WAIC is arguably
more theoretically justified
Ana Paula Palacios STAT1044 UoG 35 / 35#
# Simple linear regression
#################################################################################
# FREQUENTIST APPROACH
################################################################################
## T.Rex data
mass <- c(29.9, 1761, 1807, 2984, 3230, 5040, 5654)
age <- c(2, 15, 14, 16, 18, 22, 28)
#
# Correlation
cor(mass, age)
plot(age, mass, pch=19)
#
model <- lm(mass ~ age)  
print(model)
abline(model,col='red',lwd=2)
#
# ANOVA TABLE
anova(model)
#
# PREDICTION
# Predict for a 10 years old T. Rex
xnew <- data.frame(10)
names(xnew) <- "age"
predict(model,xnew,interval="confidence")
predict(model,xnew,interval="prediction")
#
#
#
################################################################################
#                  BAYESIAN APPROACH

################################################################################
# CONJUGATE PRIOR
################################################################################
#
# Choose hyperparameter values. 
m <- c(0,1)
V <- 1000*diag(2)
Vinv <- solve(V)
a <- 1
b <- 1
#
# Update parameter values for posterior distribution
n = length(age)
X = cbind(1, age)
y <- mass
XTX <- t(X)%*%X
Vpost <- solve(XTX+Vinv)
mpost <- Vpost%*%(Vinv%*%m+t(X)%*%y)
apost <- a+n
bpost <- b+t(m)%*%Vinv%*%m+t(y)%*%y-t(mpost)%*%solve(Vpost)%*%mpost
#
# Monte Carlo simulation
simuls <- 10000
library(MASS)
phi <- rgamma(simuls,apost/2,bpost/2)
beta <- matrix(rep(NA,simuls*2),nrow=simuls)
for (i in 1:simuls){
  beta[i,] <- mvrnorm(n = 1, mpost, Vpost/phi[i])
}
#
# Posterior mean and credible intervals for regression coefficients
apply(beta,2,mean)
apply(beta,2,quantile,probs=c(0.025,0.975))
#
# Predicting the mean weight of a new observation (10 years old T.Rex )
xnew <- as.numeric(xnew)
mediap <- beta[,1]+beta[,2]*xnew
mean(mediap)
quantile(mediap,p=c(0.025,0.975))
#
# Predicting the weight of a new observation (10 years old T. Rex)
yp <- rnorm(simuls,mediap,1/sqrt(phi))
hist(yp,freq=FALSE,xlab='y',ylab='f',main="")
mean(yp)
quantile(yp,c(0.025,0.975))

plot(age, mass, pch=19)
abline(a=mean(beta[,1]), b=mean(beta[,2]), col="blue", lwd = 2, lty=2)
abline(a=2, b=80, col="green", lwd = 2, lty=2)

################################################################################
# NON-INFORMATIVE PRIOR
################################################################################
mpost <- model$coefficients
Vpost <- solve(XTX)
k <- 2
apost <- n-k
bpost <- t(y-X%*%mpost)%*%(y-X%*%mpost)
phi <- rgamma(simuls,apost/2,bpost/2)
beta <- matrix(rep(NA,simuls*2),nrow=simuls)
for (i in 1:simuls){
  beta[i,] <- mvrnorm(n = 1, mpost, Vpost/phi[i])
}
#
# Posterior mean and credible intervals
#
apply(beta,2,mean)
apply(beta,2,quantile,probs=c(0.025,0.975))
mediap <- beta[,1]+beta[,2]*xnew
mean(mediap)
quantile(mediap,p=c(0.025,0.975))
#
# Prediction for a new observation
#
yp <- rnorm(simuls,mediap,1/sqrt(phi))
hist(yp,freq=FALSE,xlab='y',ylab='f',main="")
mean(yp)
quantile(yp,c(0.025,0.975))
#
###############################################################################
# SEMI-CONJUGATE PRIORS
###############################################################################
m <- c(0,1)
V <- 1000*diag(2)
a <- 1
b <- 1
#


# GIBBS SIMULATIONS USING MCMC PACKAGE
#
if (!require("MCMCpack")) install.packages("MCMCpack")
library(MCMCpack)
cc <- MCMCregress(mass ~ age, burnin = 1000, 
                  mcmc = 10000, thin = 1,
                  beta.start = model$coefficients, 
                  marginal.likelihood = c("none"))
summary(cc)
beta <- cc[,1:2]
apply(beta,2,mean)
apply(beta,2,quantile,probs=c(0.025,0.975))
mediap <- beta[,1]+beta[,2]*xnew
mean(mediap)
quantile(mediap,p=c(0.025,0.975))
phi <- cc[,3]
yp <- rnorm(simuls,mediap,1/sqrt(phi))
hist(yp,freq=FALSE,xlab='y',ylab='f',main="")
mean(yp)
quantile(yp,c(0.025,0.975))
Bayesian Methods and its Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios STAT1044 UoG 1 / 7
MCMCpack R package
Perform Bayesian inference using posterior simulation for common statistical
models.
MCMCregress(formula, data, burnin = 1000, mcmc = 10000, b0 = 0,
B0 = 0, marginal.likelihood = c("none", "Laplace", "Chib95"),
...)
Generates a sample from the posterior distribution of a linear regression
model with Gaussian errors using Gibbs sampling (with a multivariate
Gaussian prior on the beta vector, and an inverse Gamma prior on the
conditional error variance).
The user supplies data and priors, and a sample from the posterior
distribution is returned as an mcmc object.
mcmc: The number of MCMC iterations after burnin
b0: The prior mean of β.
B0: The prior precision of β. Default value of 0 is equivalent to an improper
uniform prior for beta.
marginal.likelihood: "none" in which case the marginal likelihood will
not be calculated.Alternatively, other approximation methods can be used.
Ana Paula Palacios STAT1044 UoG 2 / 7
T. Rex Growth data: semi-conjugate prior
Ana Paula Palacios STAT1044 UoG 3 / 7
MCMC software options in R
Ana Paula Palacios STAT1044 UoG 4 / 7
JAGS
Ana Paula Palacios STAT1044 UoG 5 / 7
JAGS
The JAGS function coda.samples returns sample is the format that can be
passed to the CODA function which actually computes the diagnostics
The course website uses CODA to access convergence for a best-case and a
worst-case scenario
Download JAGS from https://mcmc-jags.sourceforge.io/
Ana Paula Palacios STAT1044 UoG 6 / 7
Important note on JAGS
Ana Paula Palacios STAT1044 UoG 7 / 7


JAGS_NFLR.R:
library(rjags)
# Load the NFL concussions data
Y <- c(171, 152, 123, 199)
n <- 4
N <- 256
# (1) Define the model as a string
model_string <- textConnection("model{
 # Likelihood
 for(i in 1:n){
 Y[i] ~ dpois(N*lambda[i])
 }
 # Priors
 for(i in 1:n){
 lambda[i] ~ dgamma(1,gamma)
 }
 gamma ~ dgamma(a, b)
}")
# (2) Load the data and compile the MCMC code
inits <- list(lambda=rgamma(n,1,1),gamma=1)
data <- list(Y=Y,N=N,n=n,a=0.1,b=0.1)
model <- jags.model(model_string,data = data, inits=inits, n.chains=2)
# (3) Burn-in for 10000 samples
update(model, 10000, progress.bar="none")
# (4) Generate 20000 post-burn-in samples
params <- c("lambda")
samples <- coda.samples(model,
                        variable.names=params,
                        n.iter=20000, progress.bar="none")

# (5) Summarise the output
summary(samples)
plot(samples)
# Compute 90% credible intervals
samps <- rbind(samples[[1]],samples[[2]]) #2S x 4 matrix of samples
apply(samps,2,quantile,c(0.05,0.95))

# To compute DIC
DIC  <- dic.samples(model,n.iter=20000,progress.bar="none") #where model is the output of the JAGS fit
DIC
# To compute WAIC
like        <- rbind(samps[[1]],samps[[2]]) # Combine the two chains. samps is the vector that contains the mcmc samples
fbar        <- colMeans(like)
Pw          <- sum(apply(log(like),2,var))
WAIC <- -2*sum(log(fbar))+2*Pw
WAIC
# Model statements for several GLMs in JAGS

# (a) Logistic regression
for(i in 1:n){
  Y[i] ~ dbern(q[i])
  logit(q[i]) <- inprod(X[i,],beta[])
}
for(j in 1:p){beta[j] ~ dnorm(0,0.01)}
# (b) Probit regression
for(i in 1:n){
  Y[i] ~ dbern(q[i])
  probit(q[i]) <- inprod(X[i,],beta[])
}
for(j in 1:p){beta[j] ~ dnorm(0,0.01)}
# (c) Poisson regression
for(i in 1:n){
  Y[i] ~ dpois(lambda[i])
  log(lambda[i]) <- inprod(X[i,],beta[])
}
for(j in 1:p){beta[j] ~ dnorm(0,0.01)}
# (d) Negative binomial regression
for(i in 1:n){
  Y[i] ~ dnegbin(q[i],m)
  q[i] <- m/(m + lambda[i])
  log(lambda[i]) <- inprod(X[i,],beta[])
}
for(j in 1:p){beta[j] ~ dnorm(0,0.01)}
m ~ dgamma(0.1,0.1)

# (e) Zero-inflated Poisson
for(i in 1:n){
  Y[i] ~ dpois(q[i])
  q[i] <- Z[i]*lambda[i]
  Z[i] ~ dbern(p[i])
  log(lambda[i]) <- inprod(X[i,],beta[])
  logit(p[i]) <- inprod(X[i,],alpha[])
}
for(j in 1:p){beta[j] ~ dnorm(0,0.01)}
for(j in 1:p){alpha[j] ~ dnorm(0,0.01)}
# (f) Beta regression
for(i in 1:n){
  Y[i] ~ dbeta(r*q[i],r*(1-q[i]))
  logit(q[i]) <- inprod(X[i,],beta[])
}
for(j in 1:p){beta[j] ~ dnorm(0,0.01)}
r ~ dgamma(0.1,0.1)
# Define the model as a string
model_string <- textConnection("model{
 Y ~ dpois(exp(mu[1]+mu[2]))
 mu[1] ~ dnorm(0,0.001)
 mu[2] ~ dnorm(0,0.001)
}")
# Generate MCMC samples
inits <- list(mu=rnorm(2,0,5))
data <- list(Y=1)
model <- jags.model(model_string,data = data,
                    inits=inits, n.chains=3)
update(model, 1000, progress.bar="none")
samples <- coda.samples(model,
                        variable.names=c("mu"),
                        n.iter=5000, progress.bar="none")
# Apply convergence diagnostics
# Plots
plot(samples)
autocorr.plot(samples)

# Statistics
autocorr(samples[[1]],lag=1)
effectiveSize(samples)
gelman.diag(samples)
geweke.diag(samples[[1]])# Define the model as a string
model_string <- textConnection("model{
 Y1 ~ dpois(exp(mu[1]))
 Y2 ~ dpois(exp(mu[2]))
 mu[1] ~ dnorm(0,0.001)
 mu[2] ~ dnorm(0,0.001)
}")
# Generate MCMC samples
inits <- list(mu=rnorm(2,0,5))
data <- list(Y1=1,Y2=10)
model <- jags.model(model_string,data = data,
                    inits=inits, n.chains=3)
update(model, 1000, progress.bar="none")
samples <- coda.samples(model,
                        variable.names=c("mu"),
                        n.iter=5000, progress.bar="none")
# Apply convergence diagnostics
# Plots
plot(samples)
autocorr.plot(samples)

# Statistics
autocorr(samples[[1]],lag=1)
effectiveSize(samples)
gelman.diag(samples)
geweke.diag(samples[[1]])# Define the model as a string
model_string <- textConnection("model{
 Y1 ~ dpois(exp(mu[1]))
 Y2 ~ dpois(exp(mu[2]))
 mu[1] ~ dnorm(0,0.001)
 mu[2] ~ dnorm(0,0.001)
}")
# Generate MCMC samples
inits <- list(mu=rnorm(2,0,5))
data <- list(Y1=1,Y2=10)
model <- jags.model(model_string,data = data,
                    inits=inits, n.chains=3)
update(model, 1000, progress.bar="none")
samples <- coda.samples(model,
                        variable.names=c("mu"),
                        n.iter=5000, progress.bar="none")
# Apply convergence diagnostics
# Plots
plot(samples)
autocorr.plot(samples)

# Statistics
autocorr(samples[[1]],lag=1)
effectiveSize(samples)
gelman.diag(samples)
geweke.diag(samples[[1]])