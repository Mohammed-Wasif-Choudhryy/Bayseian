Bayesian Methods and its Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios MATH1189 UoG 1 / 16
Objective
To learn about conjugate models, that is when the Bayesian framework is easy!
Ana Paula Palacios MATH1189 UoG 2 / 16
Conjugate models
Last week we saw that for the example of the coin tosses, a beta prior distribution
lead to a beta posterior distribution. This is an example of conjugate prior.
Conjugacy
If the posterior distribution belongs to the same probability distribution family as
the prior distribution, the prior and posterior are then called conjugate
distributions, and the prior is called a conjugate prior for the likelihood.
Likelihood Conjuagate Prior
Binomial Beta
Geometric Beta
Multinomial Dirichlet
Poisson Gamma
Normal (σ known) Normal
Normal (µ known) Inverse Chi-Square
Normal (µ known) Gamma
Exponential Gamma
Ana Paula Palacios MATH1189 UoG 3 / 16
Advantages of conjugate models
Simplicity in the calculation: because prior and posterior are of the same
family, the update of belief affects only the parameters that index the
conjugate distributions.
Interpretability: we can see that α (β) plays the same role as x (n − x) and
therefore we can think as the information of the prior as equivalent to
previous success and failures.
Mixture of distributions are still conjugate: if the prior is a mixture of k
betas, the posterior is still a mixture of k betas.
Ana Paula Palacios MATH1189 UoG 4 / 16
Poisson-Gamma model for a rate
The poisson-gamma conjugate pair is useful for estimating the rate of events per
unit of time (or space), denoted by θ.
NFL concussions
Concussions are an increasingly serious concern in the American National Football
League (NFL). Frontline provides data about the number of concussions per
season, Y . And each regular-season has 256 games, N. In this case, the rate θ
represents the number of concussions per game.
The variable Y represents the number of events occurred in a time period of
length N and θ > 0 is the unknown event rate. For this data we might assume the
model Y |θ ∼ Poisson(Nθ). So, the likelihood is
f (Y |θ) = e
−Nθ
(Nθ)
Y
Y !
∝ e
−Nθ
θ
Y
The kernel of the likelihood resembles a Gamma distribution...
Ana Paula Palacios MATH1189 UoG 5 / 16
Poisson-Gamma model for a rate
Therefore, a Gamma prior distribution θ ∼ Gamma(a, b), that is
f (θ) = b
a
Γ(a)
e
−bθ
θ
a ∝ e
−bθ
θ
a
.
is conjugate. Thus, the posterior distribution is
f (θ|Y ) ∝ e
−Nθ
θ
Y
| {z }
likelihood
e
−bθ
θ
a
| {z }
prior
∝ e
−b
∗
θ
θ
a
∗
∼ Gamma(a
∗
, b
∗
)
where a
∗ = Y + a and b
∗ = N + b.
Ana Paula Palacios MATH1189 UoG 6 / 16
Poisson-Gamma model for a rate
The mean and the variance of the posterior Gamma(a
∗
, b
∗
) distribution are a
∗/b
∗
and a
∗/b
∗2
, respectively. So, the posterior mean is
E(θ|Y ) = a + Y
b + N
,
which can be written as
E(θ|Y ) = b
N + b
a
b
+
N
N + b
Y
N
E(θ|Y ) = w
a
b
+ (1 − w)
Y
N
E(θ|Y ) = wE(θ) + (1 − w)
ˆθ
where w = b/(b + N).
Ana Paula Palacios MATH1189 UoG 7 / 16
Poisson-Gamma model for a rate
The information in the prior has an easy interpretation: a represents the prior
equivalent to the number of events to occur in a period of time of length b.
Letting a, b → 0, then w → 0 and the posterior mean coincides with the
sample rate, Y /N which is the MLE.
Ana Paula Palacios MATH1189 UoG 8 / 16
Normal-normal model for a mean
Consider the simpler model Yi
|µ, σ2 ∼iid Normal(µ, σ2
), for i = 1, . . . , n.
This model has two parameters, the mean µ and the variance σ
2
.
Here we assume that σ
2
is fixed and focus on estimating µ.
Assuming σ
2
to be fixed, a conjugate prior for the unknown mean is
µ ∼ N(µ0, σ2/m).
The hyperparameter m > 0 controls the strength of the prior (small m
implies large prior variance).
Ana Paula Palacios MATH1189 UoG 9 / 16
Normal-normal model for a mean
It can be shown that the posterior is
µ|Y ∼ N

wY¯ + (1 − w)µ0,
σ
2
n + m

where w = n/(n + m) is the weight given to the sample mean
Y¯ =
Pn
i=1 Yi/n.
Letting m → 0 gives w → 1 and the posterior mean coincides with the
sample mean as the prior variance increases.
The posterior standard deviation is σ/√
n + m, which is less than the
standard error of the sample mean, σ/√
n.
Ana Paula Palacios MATH1189 UoG 10 / 16
Example: Blood alcohol concentration1
The BAC level is percent of your blood that is concentrated with alcohol. The
legal limit for operating a vehicle is BAC ≤ 0.08 in most US states. Let Y be the
measured BAC and µ be your true BAC. Laboratories established that the error
standard deviation of the tests is 0.01. Your BAC is measured to be Y = 0.082.
Assuming a normal prior distribution with mean 0.05 and variance 0.022
, what is
the probability that your have exceed the limit?
Find the posterior distribution of µ.
1Bayesian statistical methods, Reich and Ghosh, CRC Press
Ana Paula Palacios MATH1189 UoG 11 / 16
Example: Blood alcohol concentration
We have that n = 1, Y = 0.082, σ = 0.01 and m = 0.25. Then,
µ|Y ∼ Normal(0.0756, 0.00892
)
pnorm(0.08, mean=0.0757, sd=0.0089, lower.tail=FALSE)
Therefore, P(µ > 0.08|Y ) = 0.311, which implies that is considerable uncertainty
about whether your BAC exceeds the legal limit and in fact the posterior odds
that your BAC is below the legal limit,
p(µ ≤ 0.08|Y )
P(µ > 0.08|Y )
are greater than two.
Ana Paula Palacios MATH1189 UoG 12 / 16
Example: Blood alcohol concentration
Ana Paula Palacios MATH1189 UoG 13 / 16
When does a conjugate prior exist?
If f (x|θ) is an exponential family distribution, then a conjugate prior
distribution for θ exists.
The exponential distribution is the simplest example of an exponential family
distribution.
Exponential Family
A probability density f (x|θ) where θ ∈ R is said to belong to the one-parameter
exponential family if it has form
f (x|θ) = h(x)g(θ)e
(η(θ)T(x))
for given functions h(·), g(·), η(·) and T(·). If the support of X is independent of
θ then the family is said to be regular and otherwise it is irregular.
Ana Paula Palacios MATH1189 UoG 14 / 16
Examples of Exponential Family
The binomial distribution
f (x|θ) = 
m
x

θ
x
(1 − θ)
m−x
for x = 0, 1, . . . , m
= (1 − θ)
m

m
x

exp 
x log θ
1 − θ

The Poisson distribution
f (x|θ) = θ
x
e
−θ
x!
for x = 0, 1, . . .
= e
−θ
1
x!
exp(x log θ)
Homework: are the uniform and Cauchy density exponential family
distributions?
Ana Paula Palacios MATH1189 UoG 15 / 16
A conjugate prior to an exponential family distribution
The exponential family likelihood for a sample of size n is
l(θ|x) = Yn
i=1
h(xi)g(θ) exp (η(θ)T(xi))
∝ g(θ)
n
exp (η(θ)nT¯(x))
where T¯ =
Pn
i=1 xi/n is a sufficient statistic.
Thus if we used a prior distribution
f (θ) = g(θ)
a
exp(bη(θ))
then the posterior distribution would be
f (θ|x) ∝ g(θ)
a
∗
exp(b
∗
η(θ))
where a
∗ = a + n and b
∗ = b + nT¯. So, the posterior is from the same family as
the prior with updated parameter values.
#Ploting a beta distribution

#define range
p = seq(0,1, length=100)

#create plot of Beta distribution with shape parameters alpha=4 and beta=4
alpha=4
beta=4
plot(p, dbeta(p, alpha, beta), type='l')



# Inference for the parameter theta of a binomial distribution (n,theta).
#
rm(list=ls())
#
# Generating the data
#
tosses <- 20
theta <- 0.3
heads <- rbinom(1,tosses,theta)
tails <- tosses-heads
#
# Frequentist approach
# a) MLE
#
emvtheta <- heads/tosses
emvtheta 
#
# b) Confidence interval
#
ci <- 0.95 
c <- qnorm((1+ci)/2,0,sqrt(emvtheta*(1-emvtheta)/tosses))
interval <- c(emvtheta-c,emvtheta+c)
interval
#
# c) Hypothesis test and p-value
#
alpha <- 0.05
theta0 <- 0.5
H1 <- "lower"
if (H1=="lower"){
  pvalue <- pnorm(emvtheta,theta0,sqrt(theta0*(1-theta0)/tosses))
}else if (H1=="greater"){
  pvalue <- 1-pnorm(emvtheta,theta0,sqrt(theta0*(1-theta0)/tosses))
}
pvalue
#
# d) Prediction
#
newtosses <- 10
pxpredclas <- dbinom(c(0:newtosses),newtosses,emvtheta)
#
# BAYESIAN INFERENCE 
# a) A prioris
#
a <- 1
b <- 1
#
# b) A posterioris
#
apost <- a+heads
bpost <- b+tails
#
# c) Mean, moda and Median a posteriori
#
thetam <- apost/(apost+bpost)
thetamoda <- (apost-1)/(apost+bpost-2)
thetame <- qbeta(0.5,apost,bpost)
c(thetam,thetamoda,thetame)
#
# d) Credible interval 
#
binterval <- c(qbeta(alpha/2,apost,bpost),qbeta(1-alpha/2,apost,bpost))
binterval
#
# e) Posterior probability of  H0.
#
if (H1=="lower"){
  pH0 <- 1-pbeta(theta0,apost,bpost)
}else if (H1=="greater"){
  pH0 <- pbeta(theta0,apost,bpost)
}
#
# f) Prediction: the package "extraDistr" has the beta-binomial distribution
#
if(!require("extraDistr")) install.packages("extraDistr")
library(extraDistr)
pxpredpost <- dbbinom(x=c(0:newtosses),size=newtosses,alpha=apost,beta=bpost,log=FALSE)
pxpredpri <- dbbinom(x=c(0:newtosses),size=newtosses,alpha=a,beta=b,log=FALSE)
#
# Plot: prior distribution (red), scaled likelihood (green) and posterior distribution (black) 
#
thetagrid <- seq(0,1,0.001)
like <- dbeta(thetagrid,heads+1,tails+1)
priori <- dbeta(thetagrid,a,b)
posteriori <- dbeta(thetagrid,apost,bpost)
fmax <- max(like,priori,posteriori)
plot(thetagrid,like,type='l',, lty=1, lwd=1,col='green',ylim=c(0,fmax),xlab=expression(theta),ylab='f')
lines(thetagrid,priori,type='l',lwd=2,col="red")
lines(thetagrid,posteriori,type='l',lty=2, lwd=2,col='black')
#
# Plot of predictive distributions frequentist (blue),  bayesian a priori (red) and a posteriori (green)
# 
pxmax <- max(pxpredpri,pxpredpost,pxpredclas)
plot(c(0:newtosses),pxpredpost,type='h',lwd=2,col='green',xlab='x',ylab='p',ylim=c(0,pxmax))
lines(c(0:newtosses)-0.1,pxpredpri,type='h',lwd=2,col="red")
lines(c(0:newtosses)+0.1,pxpredclas,type='h',lwd=2,col="blue")


Tutorial: Conjugate models
1. For the following two scenarios related with coin tosses, compute the predicted
probability of heads for a new toss. Hint: use the R code coins.R to help you with
the calculations.
(a) Suppose that you have a new coin minted by the Royal Mint of UK, so you
have a strong prior belief that the coin is fair. You toss the coin 10 times and
it come up heads nine times. What is your predicted probability of heads for
the next toss? Explain your answer and justify your choice of prior.
(b) Repeat part (a) but this time you have a coin made by some magic-trick shop.
Explain your answer and justify your choice of prior.
(c) For each of the above scenarios compute the probability that the coin is biased.
2. We toss a coin 20 times and we observe 5 tails and 15 heads. Assume a uniform
prior distribution for the probability of tails θ = P(tails).
(a) Compute the maximum likelihood estimator of θ.
(b) Derive the posterior distribution of θ.
(c) Compute the posterior mean, median and mode.
3. For question 1, assume now that the prior distribution is the mixture distribution
θ ∼ 0.6 Beta(1, 1) + 0.4 Beta(5, 1).
(a) Derive the posterior distribution of θ.
(b) Compute the posterior mean.
(c) Use R to plot the prior, the likelihood and the posterior distribution.
4. Let Y |θ ∼ Exp(θ).
(a) Show that this distribution belongs to the exponential family of distributions.
(b) Find a conjugate prior distribution for θ. Which distribution is?
(c) Given a sample y1, y2, . . . , yn, find the posterior distribution of θ.
5. Pollution caused by industrial emissions is set to be reduced. Under the permits granted by environmental regulators to industrial facilities businesses must
prevent or minimise emissions and their impacts on the environment. With this
aim, a factory record the levels of contamination issue by an index. The prior
distribution of the CEO about the mean level of contamination emitted per day
is µ ∼ N(3000, 8002
). The prior distribution of environmental inspector is µ ∼
N(3300, 8002
). During 60 days the average daily emission level was 3246. Assume
that the daily variance of emissions is 8002
.
(a) Compute the posterior distribution of µ for the CEO and the inspector.
1
(b) Compute the posterior probability that µ > 3200 (the maximum level allowed
by law) for each case.
∗6. Today, Sasha checked their weight several times with different scales observing (in
kilograms): 92, 82, 83, 86, 86, 90, 83, 84, 89, 85. Assume that the data is normal
with variance σ
2 = 9 and a prior distribution for the true weight µ ∼ N(80, 100).
(a) What is the posterior distribution?
(b) Compute the credible interval of 95% for µ a priori and a posteriori.
(c) Compare both intervals with the frequentist 95% confidence interval. Can
you conclude that I was optimistic?


Tutorial: Conjugate models
1. For the following two scenarios related with coin tosses, compute the predicted
probability of heads for a new toss. Hint: use the R code coins.R to help you with
the calculations.
(a) Suppose that you have a new coin minted by the Royal Mint of UK, so you
have a strong prior belief that the coin is fair. You toss the coin 10 times and
it come up heads nine times. What is your predicted probability of heads for
the next toss? Explain your answer and justify your choice of prior.
(b) Repeat part (a) but this time you have a coin made by some magic-trick shop.
Explain your answer and justify your choice of prior.
(c) For each of the above scenarios compute the probability that the coin is biased.
2. We toss a coin 20 times and we observe 5 tails and 15 heads. Assume a uniform
prior distribution for the probability of tails θ = P(tails).
(a) Compute the maximum likelihood estimator of θ.
(b) Derive the posterior distribution of θ.
(c) Compute the posterior mean, median and mode.
3. For question 1, assume now that the prior distribution is the mixture distribution
θ ∼ 0.6 Beta(1, 1) + 0.4 Beta(5, 1).
(a) Derive the posterior distribution of θ.
(b) Compute the posterior mean.
(c) Use R to plot the prior, the likelihood and the posterior distribution.
4. Let Y |θ ∼ Exp(θ).
(a) Show that this distribution belongs to the exponential family of distributions.
(b) Find a conjugate prior distribution for θ. Which distribution is?
(c) Given a sample y1, y2, . . . , yn, find the posterior distribution of θ.
5. Pollution caused by industrial emissions is set to be reduced. Under the permits granted by environmental regulators to industrial facilities businesses must
prevent or minimise emissions and their impacts on the environment. With this
aim, a factory record the levels of contamination issue by an index. The prior
distribution of the CEO about the mean level of contamination emitted per day
is µ ∼ N(3000, 8002
). The prior distribution of environmental inspector is µ ∼
N(3300, 8002
). During 60 days the average daily emission level was 3246. Assume
that the daily variance of emissions is 8002
.
(a) Compute the posterior distribution of µ for the CEO and the inspector.
1
(b) Compute the posterior probability that µ > 3200 (the maximum level allowed
by law) for each case.
∗6. Today, Sasha checked their weight several times with different scales observing (in
kilograms): 92, 82, 83, 86, 86, 90, 83, 84, 89, 85. Assume that the data is normal
with variance σ
2 = 9 and a prior distribution for the true weight µ ∼ N(80, 100).
(a) What is the posterior distribution?
(b) Compute the credible interval of 95% for µ a priori and a posteriori.
(c) Compare both intervals with the frequentist 95% confidence interval. Can
you conclude that I was optimistic?
Solutions:
1. (a) To justify a prior, we might say that our strength of fairness is equivalent
to having previously seen the coin flipped 100 times and coming up heads
in 50% of those flips. Hence the prior would be θ ∼ Beta(50, 50). (This is
not the only correct answer; you might instead be more confident, and use
a Beta(500, 500) if you suppose you’ve previously seen 1,000 flips with 50%
heads.) The posterior is θ|x ∼ Beta(50 + 9, 50 + 1), which has a mean of
59/(59+51) = 0.536. This is the predicted probability of heads for the next,
i.e., 11th, flip.
(b) We use a θ ∼ Beta(0.5, 0.5) prior because it expresses a belief that the coin is
either head biased or tail biased. The posterior is θ|X ∼ beta(0.5 + 9, 0.5 + 1),
which has a mean of 9.5/(9.5+1.5) = 0.863. This is the predicted probability
of heads for the next, i.e., 11th, flip. Notice that it is quite different than the
conclusion from part a).
(c) The probability that the coin is biased is P(θ|x > 0.5). Using R:
> 1-pbeta(0.5, 59,51)
[1] 0.7781652
> 1-pbeta(0.5, 9.5,1.5)
[1] 0.9963101
2. (a) 5/20 = 0.25
(b) The uniform distribution is a beta distribution with parameters α = β = 1.
Then, the posterior distribution is Beta(1 + 5, 1 + 20 − 1) = Beta(6, 16).
(c) The mean is 6/(16 + 6) = 3/11 ≈ 0.273. THe mode is equal to the EMV and
the median is > qbeta(0.5, 6, 16) [1] 0.2657397
3. (a) By Bayes Theorem we have that:
2
f(θ|x) ∝

0.6 × 1 + 0.4
1
B(5, 1)θ
5−1

θ
5
(1 − θ)
15
∝ 0.6θ
6−1
(1 − θ)
16−1 + 0.4
1
B(5, 1)θ
10−1
(1 − θ)
16−1
∝ 0.6B(6, 16) 1
B(6, 16)θ
6−1
(1 − θ)
16−1 +
0.4B(10, 16)
B(5, 1)
1
B(10, 16)θ
10−1
(1 − θ)
16−1
∝ w
1
B(6, 16)θ
6−1
(1 − θ)
16−1 + (1 − w)
1
B(10, 16)θ
10−1
(1 − θ)
16−1
where
w =
0.6B(6, 16)
0.6B(6, 16) + 0.4B(10,16)
B(5,1)
(b) The mean is
E[θ|x]w
6
6 + 16
+ (1 − w)
10
10 + 16
≈ 0.968
(c)
4. (a) Assume that Y |θ ∼ U(θ). Then, f(x|θ) = 1/θ for 0 < x < θ which is a density
from the exponential family with g(θ) = 1/θ, h(y) = 1, η(θ) = T(y) = 0.
Then, a conjugate prior is
f(θ) ∝
1
θ
a
for θ > b > 0.
Writing α = a − 1 and β = b, we have a Pareto distribution
f(θ) = αβα
θ
α+1 for α, β > 0.
(b) In this case the posterior distribution is θ|x ∼ P areto(α + n, β8
), where β
∗ =
max{β, yi
: i = 1, . . . , n}.
3
(c) When α, β → 0, the posterior distribution is P areto(n, ˆθ) where ˆθ = max{yi
:
i = 1, . . . , n} is the maximum likelihood estimator. The posterior mean is
E[θ|x] = nθˆ
n−1 > ˆθ. The posterior mean is always greater than the MLE in this
case.
5. The model is
Y |µ, σ2 ∼ N(µ, σ2
)
µ ∼ N(µ0, σ2
/m)
(a) By conjugacy we know that the posterior distribution of the mean is
µ|Y ∼ N

wY¯ + (1 − w)µ0,
σ
2
n + m

.
where w = n/(n + m). In our example m = 1, n = 60, ¯y = 3246, σ
2 = 8002
and w = 60/61. Therefore, the posterior distributions are:
µ|x ∼ N(3241.967, 8002
/61) for the CEO
µ|x ∼ N(3246.885, 8002
/61) for the CEO
(b) By using in R the command 1-pnorm(3200, mean, sd) with the values of
the posterior mean, we have that the probability that the emission levels are
above the maximum allow for law is 0.5018 for the CEO and 0.5016 for the
inspector.
