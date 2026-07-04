Bayesian Methods and Their Applications
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios Bayesian Methods UoG 1 / 40
Objective
To re-familiarize with random variables and distributions, and the frequentist
approach for inference.
Ana Paula Palacios Bayesian Methods UoG 2 / 40
Random variable
A random variable is a function that allocates a real number to each outcome in
the sample space.
Ana Paula Palacios Bayesian Methods UoG 3 / 40
Random variables
Random variables can be classified into two categories based on their support,
S ⊆ R:
Discrete random variable: if X assumes values over a finite or infinite
countable set, we say that X is a discrete r.v.
Continuous random variable: if X assumes values over an interval of the real
line (infinite possible outcomes), we say that X is a continuous r.v.
Ana Paula Palacios Bayesian Methods UoG 4 / 40
Discrete random variables
Let X be a discrete r.v. with support S = {x1, x2, . . .}. We define:
The probability mass function
p(xi) = P(X = xi), for all xi ∈ S and such that P
xi∈S P(X = xi) = 1.
The cumulative distribution function
An application F : R → [0, 1], that to each x ∈ R assigns the probability:
F(x) = P(X ≤ x) = X
xi<x
P(X = xi)
The moments
E [g(X)] = X
xi∈S
g(xi)P(X = xi)
Ana Paula Palacios Bayesian Methods UoG 5 / 40
Example: The Poisson distribution
Ana Paula Palacios Bayesian Methods UoG 6 / 40
Example: The Poisson distribution
Definition
A random variable X, taking on one of the values 0, 1, 2, . . . , is said to be a
Poisson random variable with parameter λ, X ∼ Poiss(λ), if for some λ > 0,
p(k) = P(X = k) = λ
k
e
−λ
k!
for k = 0, 1, 2, . . ..
E(X) = V(X) = λ
The function p(k) indicates the probability of k events occurring in a fixed time
interval if these events occur with a known average rate and independently of the
time since the last event.
Ana Paula Palacios Bayesian Methods UoG 7 / 40
Continuous random variables
Density function
It is a function f (x) such that
P(a ≤ X ≤ b) = Z b
a
f (x)dx,
for any real numbers a and b with a < b.
Distribution function
For a continuous r.v. X the distribution function is
F(x) = P(X ≤ x) = Z x
−∞
f (x)dx ∀x ∈ R
For a continuous r.v. X with distribution function F(x), the density function of X
can be obtained as:
f (x) = dF(x)
dx = F
′
(x)
Ana Paula Palacios Bayesian Methods UoG 8 / 40
Continuous random variables
Moments
Let X be a continuous r.v. over S ⊂ R with density function f (x). Then the
expectation of X is
E(X) = Z ∞
−∞
x f (x)dx
and the expectation of a function of a random variable g(X) is given by
E(g(X)) = Z ∞
−∞
g(x)f (x)dx
Ana Paula Palacios Bayesian Methods UoG 9 / 40
Example: The Gamma distribution
Ana Paula Palacios Bayesian Methods UoG 10 / 40
Gamma distribution
Definition
A gamma random variable X has density function
f (x) = β
α
Γ(α)
x
α−1
e
−βx
for x ≥ 0
where Γ(·) is the gamma function and α > 0 (shape) and β > 0 (rate).
The gamma function is defined by
Γ(α) = Z ∞
0
e
−u
u
α−1
du, α > 0.
For any α > 1, Γ(α + 1) = (α)Γ(α) and for any positive integer n,
Γ(n) = (n − 1)!
If X ∼ Gamma(α, λ), then E(X) = α/β and V(X) = α/β2
Note that there are alternative parametrizations for the gamma distribution
(θ = 1/β)
Ana Paula Palacios Bayesian Methods UoG 11 / 40
Joint distributions
Definition
Let X and Y be any discrete random variables defined on the same sample
space S. The function
p(x, y) = P(X = x, Y = y)
where x is any possible value of X and y is any possible value of Y , is called the
joint probability distribution or joint probability mass function of the discrete
random variables X and Y if
p(x, y) ≥ 0 for all (x, y),
X
x
X
y
p(x, y) = 1.
If Z = g(X, Y ) then
E(Z) = E(g(X, Y )) = X
x
X
y
g(x, y)p(x, y)
Ana Paula Palacios Bayesian Methods UoG 12 / 40
Marginal distributions
Definition
The marginal probability mass function of X, denoted by pX (x) is given by
pX (x) = X
y:p(x,y)>0
p(x, y) for each possible value x
Similarly, the marginal probability mass function of Y , denoted by pY (y) is
given by
pY (y) = X
x:p(x,y)>0
p(x, y) for each possible value y
Ana Paula Palacios Bayesian Methods UoG 13 / 40
Joint density function
Definition
The function f (x, y) is a joint density function of the continuous random
variables X and Y if
1 f (x, y) ≥ 0, for all (x, y),
2
R ∞
−∞
R ∞
−∞ f (x, y)dxdy = 1,
3 P((X, Y ) ∈ A) = R R
A
f (x, y)dxdy for any region A in the xy plane.
If Z = g(X, Y ) then
E(Z) = E(g(X, Y )) = Z ∞
−∞
Z ∞
−∞
g(x, y)f (x, y) dxdy
Ana Paula Palacios Bayesian Methods UoG 14 / 40
Joint density function
Definition
If X and Y are continuous random variables with joint distribution density
function f (x, y), then the marginal density function of X and Y are
fX (x) = Z ∞
−∞
f (x, y)dy
fY (y) = Z ∞
−∞
f (x, y)dx
Ana Paula Palacios Bayesian Methods UoG 15 / 40
Conditional Distributions
The relationship between two random variables can often be clarified by
consideration of the conditional distribution of one variable given the value of the
other.
Definition
The conditional probability mass function for the discrete random variable X,
given Y is
pX|Y (x|y) = P(X = x|Y = y) = P(X = x, Y = y)
P(Y = y)
=
pX,Y (x, y)
pY (y)
if pY (y) > 0.
Ana Paula Palacios Bayesian Methods UoG 16 / 40
Conditional Distributions
Definition
For continuous random variables, the conditional probability density function is
fX|Y (x|y) = fX,Y (x, y)
fY (y)
assuming that fY (y) > 0. Then,
P(X ∈ A|Y = y) = Z
A
fX|Y (x|y)dx.
Note that fX,Y (x, y) = fX|Y (x|y)fY (y) = fY |X (y|x)fX (x). This can sometimes be
useful.
Ana Paula Palacios Bayesian Methods UoG 17 / 40
Example
Let X|Y = y ∼ Poisson(y) and Y ∼ Gamma(α, β), compute the joint
distribution.
Ana Paula Palacios Bayesian Methods UoG 18 / 40
Conditional expectation
Discrete case:
E(X|Y = y) = X
x
x P(X = x|Y = y)
Continuous case:
E(X|Y = y) = Z ∞
−∞
x f (x|y) dx
The conditional expectation of a function g(x, y) is
E(g(x, y)|Y = y) = Z ∞
−∞
g(x, y)f (x|y) dx
Ana Paula Palacios Bayesian Methods UoG 19 / 40
Law of iterated expectation
Law of total expectation:
E(X) = E(E(X|Y ))
Law of total variance
V(X) = E(V(X|Y )) + V(E(X|Y ))
Example (continuation): Use these laws to compute E(X) and V(X).
Ana Paula Palacios Bayesian Methods UoG 20 / 40
Law of total probability for random variables
For discrete Y :
P(X = x) = X
y
P(X = x|Y = y)P(Y = y)
For continuous Y :
P(X = x) = Z ∞
−∞
P(X = x|Y = y)fY (y) dy
Example (continuation): use the law of total probability to find P(X = x)
Ana Paula Palacios Bayesian Methods UoG 21 / 40
Bayes’ theorem for variables
For discrete Y
P(Y = y|X = x) = P(X = x|Y = y)P(Y = y)
P(X = x)
=
P(X = x|Y = y)P(Y = y)
P
y P(X = x|Y = y)P(Y = y)
For continuous Y
fY |X (y|X = x) = P(X = x|Y = y)P(Y = y)
P(X = x)
=
P(X = x|Y = y)P(Y = y)
R ∞
−∞ P(X = x|Y = y)fY (y) dy
Ana Paula Palacios Bayesian Methods UoG 22 / 40
Example (continuation)
Find f (y|x).
Ana Paula Palacios Bayesian Methods UoG 23 / 40
Probability as frequency
Probability as a Frequency
The probability of an event is equal to the long-term relative frequency of the
event’s occurrence when the same process is repeated many times.
Suppose that we have a coin and we would like to estimate the probability of
Heads (θ)
We flipped the coin 14 times and we observe 10 Heads.
What is the classical estimation of the probability of Heads?
θˆ = 10/14 ≈ 71.5%
Ana Paula Palacios Bayesian Methods UoG 24 / 40
Maximum Likelihood Estimator
The maximum likelihood estimator of a parameter θ, is ˆθ such that
l(θ|data) = max
θ
l(θ|data)
The likelihood function is the model for the data
For the coin example, the number of heads we get when flipping a coin n
times follows a binomial distribution X ∼ B(n, p):
f (x|p) = 
n
x

p
x
(1 − p)
n−x
where x = 0, 1, . . . , n and 0 ≤ p ≤ 1 is the probability of Heads.
Find the value of p that maximises the likelihood function for the observed
data
Suppose we observe 10 Heads and 4 Tails (x = 10 and n = 14).
Ana Paula Palacios Bayesian Methods UoG 25 / 40
Maximum Likelihood Estimator
pˆMLE = max
p
L(x|p) = max
p
n
x

p
x
(1 − p)
n−x

pˆMLE = max
p
ln L(x|p) = max
p

ln n!
x!(n − x)! + x ln p + (n − x) ln(1 − p)

pˆMLE =
x
n
In our example: ˆp = 10/14 ≈ 0.71
Ana Paula Palacios Bayesian Methods UoG 26 / 40
Remarks
The definition of probability is objective. The probability of Heads is the
same for everyone.
The concept of probability is applicable only to experiments that can be
replicable
The unknown parameter θ is unknown but fixed.
The MLE has good asymptotic properties:
▶ Unbiased
▶ Minimum variance
▶ Consistent
▶ Normal distributed
Ana Paula Palacios Bayesian Methods UoG 27 / 40
Remarks
Recall our example: ˆθ = 71.5%. But, I have a lot of experience flipping coins, and
my experience says that the probability of Heads should be around 0.50. Why this
estimation went wrong1
?
Frequentist approach perform well in the long-run over some infinite number of
repetitions of the experiment.
1The data was simulated from a Binomial distribution with p = 0.5
Ana Paula Palacios Bayesian Methods UoG 28 / 40
Example: coin toss
Sample Size 50 100 500 1000 5000
ˆθ 0.5800 0.5900 0.5180 0.5070 0.4956
But it advantages are not so clear in small samples...
Ana Paula Palacios Bayesian Methods UoG 29 / 40
Remarks
Does it make sense the definition of
relative frequency when talking about
the probability that Manchester City
wins the Champion League this year?
And the experiments are not always replicable...
Ana Paula Palacios Bayesian Methods UoG 30 / 40
Probability as uncertainty
In the Bayesian philosophy the probability is a subjective concept. Each
person can have is own probability of an event, based on their own
experience, knowledge, etc.
Estimate the probability that Manchester City wins the Champion League
this year.
Bayesian Probability
Probabilities represent how certain we are about the truth of statements. These
statements/beliefs can refer to the past, the present, or the future. In the most
general sense, a probability is a number attached to a statement. That number
specifies how likely it is that the statement is true.
Ana Paula Palacios Bayesian Methods UoG 31 / 40
Probability elicitation
Many scientific experts in their field may not be familiar with the idea of
probabilities. Instead, we need to make more clear questions.
Which bet do you prefer?
1 You win £1000 if Manchester City
wins
2 You win £1000 if the roulette shows
yellow
Ana Paula Palacios Bayesian Methods UoG 32 / 40
Probability elicitation
We can adjust the areas of the roulette and ask again.
When the expert is indifferent between the two bets, the probability will be
proportional to the yellow area
Ana Paula Palacios Bayesian Methods UoG 33 / 40
Interval estimator
Given a value 1 − α between 0 and 1 called the confidence level and a random
sample X = (X1, . . . , Xn), an interval estimator for a parameter θ is defined as
two random variables L(X) and U(X) satisfying
P (L(X) ≤ θ ≤ U(X)) = 1 − α 0 ≤ α ≤ 1,
Given the sample observations, these two random variables will take two concrete
values, a and b. The interval [a, b] is called a confidence interval at the
100(1 − α)% level for θ
Ana Paula Palacios Bayesian Methods UoG 34 / 40
Random interval for the mean
Let X1, X2, . . . , Xn be a random sample from a normal distribution with mean µ
and known variance σ
2
. By properties of the normal distribution we know that
X¯ ∼ N(µ, σ2/n). Then:
Z =
X¯ − µ
σ/√
n
∼ N(0, 1)
0.95 = P(−1.96 < Z < 1.96)
= P

−1.96 <
X¯ − µ
σ/√
n
< 1.96
= P

X¯ − 1.96 σ
√
n
< µ < X¯ + 1.96 σ
√
n

The 95% random confidence interval for µ:

X¯ − 1.96 √σ
n
, X¯ + 1.96 √σ
n

Ana Paula Palacios Bayesian Methods UoG 35 / 40
Example
Assume we have a sample of size n = 25 from a normal population with mean µ
and variance σ
2 = 10. The sample mean is ¯x = 4. Then, the confidence interval is

4 − 1.96r
10
25
, 4 + 1.96r
10
25!
= (2.76, 5.24)
How do you interpret this interval? The probability that µ ∈ (2.76, 5.24) is
95%? No.
As for frequentists µ is fixed, in other words, it is not a random variable, it
does not make sense to talk about P(a < µ < b).
Bayesians instead consider µ as a random variable and therefore it is possible
to make probability statements about µ.
Ana Paula Palacios Bayesian Methods UoG 36 / 40
Interval estimator
If we generate many pairs a and b using the rule defining the interval estimator, it
holds that θ ∈ [a, b] for approximately 100(1 − α)% of the pairs (but not always)
Ana Paula Palacios Bayesian Methods UoG 37 / 40
Steps on hypothesis testing
1 Identify the parameter of interest and describe it in the context of the
problem situation
2 State the null and alternative hypotheses.
3 Give the formula for the computed value of the test statistic (assuming the
null hypothesis is true)
4 For a given or chosen significance level α, establish the rejection region.
(Plots may help)
5 Compute the observed value for the test statistic given the sample.
6 Make a decision: reject H0 if the computed test statistic is in the critical
region ( p-value < α). Otherwise, do not reject.
7 Draw scientific and applied conclusions.
Ana Paula Palacios Bayesian Methods UoG 38 / 40
Asking questions
A Bayesian hypothesis test seeks to answer: In light of the observed data,
what’s the chance that the hypothesis is correct?
A frequentist hypothesis test seeks to answer: If in fact the hypothesis is
incorrect, what’s the chance I’d have observed this, or even more extreme,
data?
Recall the quiz...“imagine that you tested positive for a rare disease and only
got to ask the doctor one question”.
Given that I tested positive, what are the chances that I actually have the
disease? (This is the Bayesian question)
If in fact I do not have the disease, what’s the chance that I would’ve gotten
this positive test result? (This is the frequentist question)
Ana Paula Palacios Bayesian Methods UoG 39 / 40
Example
Recall the coin example. The p-value can be calculated using the binomial
distribution:
P(X ≥ 10) = X
14
10

14
x

(0.5)x
(0.5)14−x = 0.08979
We fail to reject the null hypothesis at 5% significance level.
Common misinterpretations of p-value
p-value as the probability of H0 being true
concluding that H0 is true when p-value is greater than 0.05 (signifi
cance level)
concluding that H1 is true when p-value is lower than 0.05
The likelihood principle
The inference should depend only on the outcome of the experiment, and not on
the design of the experiment. The frequentist approach violates the likelihood
principle.
Ana Paula Palacios Bayesian Methods UoG 40 



Discrete Distributions
Distribution Notation P(X = x) Summaries
and parameters
Binomial X ∼ Bin(n, p) nxpx(1 − p)n−x E[X] = np
n > 0 integer: number of trials x = 0, 1, . . . , n var(X) = np(1 − p)
0 ≤ p ≤ 1 probability of success mode(X) = ⌊(n + 1)p⌋
Geometric X ∼ Geo(p) p(1 − p)x E[X] = 1−pp
0 < p < 1 x = 0, 1, 2, . . . var(X) = 1−p p2
Poisson X ∼ Po(λ) 1x!λx exp(−λ) E[X] = λ
rate λ > 0 x = 0, 1, 2, . . . var(X) = λ
mode(X) = ⌊λ⌋
Continuous Distributions
Distribution Notation Density Summaries
and parameters
Beta X ∼ Beta(α, β) Γ(α+β) Γ(α)Γ(β)xα−1(1 − x)β−1 E[X] = αα+β
a > 0, b > 0 0 ≤ x ≤ 1 var(X) = αβ (α+β)2(α+β+1)
mode(X) = α−1 α+β−2
Exponential X ∼ Exp(λ) λ exp(−λx) E[X] = 1λ
λ > 0 inverse scale x > 0 var(X) = 1λ2
The Exponential distribution is equivalent to Gamma(1, λ) mode(X) = 0
Chi-Squared X ∼ χ2ν 2−ν/2 Γ(ν/2)xν/2−1e−x/2 E[X] = ν
ν > 0 degrees of freedom x > 0 var(X) = 2ν
The Chi-squared distribution is equivalent to Gamma( ν2 , 12 ) mode(X) = ν − 2, ν ≥ 2
Distribution Notation Density Summaries
and parameters
Gamma X ∼ Gamma(α, β) βα Γ(α)xα−1e−βx E[X] = αβ
α > 0 shape x > 0 var(X) = αβ2
β > 0 inverse scale mode(X) = α−1 β , α ≥ 1
Inverse-Gamma X ∼ Inv-gamma(α, β) βα Γ(α)x−(α+1)e−β/x E[X] = βα−1 for α > 1
α > 0 shape x > 0 var(X) = β2 (α−1)2(α−2) for α > 2
β > 0 scale mode(X) = βα+1
Normal - univariate X ∼ N(µ, σ2) √ 12πσ2 exp − 12σ2 (x − µ)2	 E[X] = µ
µ location −∞ < x < ∞ var(X) = σ2
σ > 0 scale mode(X) = µ
Normal - multivariate X ∼ Np(µ, Σ) (2π)−p/2|Σ|−1/2 E[X] = µ
X = (X1, X2, . . . , Xp)T × exp −12 (x − µ)T Σ−1(x − µ)	 var(X) = Σ
Σ symmetric, positive definite p × p matrix mode(X) = µ
t-distribution X ∼ tν(µ, σ2) Γ((ν+1)/2) Γ(ν/2)σ√νπ (1 + 1ν ( x−µσ )2)−(ν+1)/2 E[X] = µ, ν > 1
(non-central) ν > 0 degrees of freedom −∞ < x < ∞ var(X) = ν ν−2σ2, ν > 2
µ location mode(X) = µ
σ > 0 scale
Uniform X ∼ U(a, b) 1 b−a E[X] = 12 (a + b)
boundaries a, b a ≤ x ≤ b var(X) = 112 (b − a)2






Tutorial: Distributions and frequentist inference
Exercises marked with a star are part of coursework 1.
1. Let Y |θ ∼ Exponential(θ) with θ ∼ Gamma(α, β).
(a) Find the joint distribution of Y and θ.
(b) Find the marginal distribution of Y .
(c) Find E(Y )
(d) Find the distribution of θ given Y = y.
2. Let Y |µ ∼ Normal(µ, σ2
) with µ ∼ Normal(m, v) and σ known. (Hint: an easier
way to solve this question is by defining Y as Y = µ+ where  ∼ N(0, σ2
) -which
is equivalent to the previous expression- and then apply properties of the normal
distribution.)
(a) Find the joint distribution of Y and µ.
(b) Find the marginal distribution of Y .
(c) Find the mean of Y .
(d) Find the distribution of µ given Y = y.
3. In a given country there are national elections for presidency with two political
parties: party A and party B. Let p be the proportion of people supporting party
A. The most recent pool estimated the 95% confidence interval for p: (0.48, 0.61).
(a) Interpret the confidence interval
(b) Suppose that we performed following hypothesis test:
H0 : p = 0.5
H1 : p > 0.5
and find that the p-value is 0.02. Assuming a significance level α = 0.05, can we
conclude that part A has a higher probability of winning? Discuss.
4. Suppose that we want to test whether a coin is fair or not and thus we conduct
an experiment to test the coin for fairness. We run the experiment and we record
the following sequence of tosses: HHHHHT. Let θ be the probability of heads. We
define the following hypothesis test with significance level α = 0.05:
H0 : θ = 0.5
H1 : θ > 0.5
(a) Test the above hypothesis assuming that the experiment consisted in tossing
the coin exactly 6 times (Hint: use a binomial distribution for the data).
1
(b) Repeat part a) but this assume that the experiment consisted in tossing the
coin until the first tail appears (Hint: use a geometric distribution for your
data).
(c) What can you say about the results obtained in part a) and part b)?
∗5. Let Y |θ ∼ Uniform(0, θ) and θ ∼ Pareto(α, β), where α, β > 0 with density
function
f(θ) =



αβα
θ
α+1 for θ > β
0 otherwise
(a) Find the joint distribution of Y and θ.
(b) Find the marginal distribution of Y .
(c) Find the mean of Y .
(d) Find the distribution of θ given Y


Tutorial: Distributions and frequentist inference
Exercises marked with a star are part of coursework 1.
1. Let Y |θ ∼ Exponential(θ) with θ ∼ Gamma(α, β).
(a) Find the joint distribution of Y and θ.
(b) Find the marginal distribution of Y .
(c) Find E(Y )
(d) Find the distribution of θ given Y = y.
2. Let Y |µ ∼ Normal(µ, σ2
) with µ ∼ Normal(m, v) and σ known. (Hint: an easier
way to solve this question is by defining Y as Y = µ+ where  ∼ N(0, σ2
) -which
is equivalent to the previous expression- and then apply properties of the normal
distribution.)
(a) Find the joint distribution of Y and µ.
(b) Find the marginal distribution of Y .
(c) Find the mean of Y .
(d) Find the distribution of µ given Y = y.
3. In a given country there are national elections for presidency with two political
parties: party A and party B. Let p be the proportion of people supporting party
A. The most recent pool estimated the 95% confidence interval for p: (0.48, 0.61).
(a) Interpret the confidence interval
(b) Suppose that we performed following hypothesis test:
H0 : p = 0.5
H1 : p > 0.5
and find that the p-value is 0.02. Assuming a significance level α = 0.05, can we
conclude that part A has a higher probability of winning? Discuss.
4. Suppose that we want to test whether a coin is fair or not and thus we conduct
an experiment to test the coin for fairness. We run the experiment and we record
the following sequence of tosses: HHHHHT. Let θ be the probability of heads. We
define the following hypothesis test with significance level α = 0.05:
H0 : θ = 0.5
H1 : θ > 0.5
(a) Test the above hypothesis assuming that the experiment consisted in tossing
the coin exactly 6 times (Hint: use a binomial distribution for the data).
1
(b) Repeat part a) but this assume that the experiment consisted in tossing the
coin until the first tail appears (Hint: use a geometric distribution for your
data).
(c) What can you say about the results obtained in part a) and part b)?
∗5. Let Y |θ ∼ Uniform(0, θ) and θ ∼ Pareto(α, β), where α, β > 0 with density
function
f(θ) =



αβα
θ
α+1 for θ > β
0 otherwise
(a) Find the joint distribution of Y and θ.
(b) Find the marginal distribution of Y .
(c) Find the mean of Y .
(d) Find the distribution of θ given Y = y.
Solutions:
1. Y |θ ∼ Exponential(θ) with θ ∼ Gamma(α, β).
(a) Joint distribution:
f(y, θ) = f(y|θ)f(θ)
= θe−θy β
α
Γ(α)
θ
α−1
e
−βθ
=
β
α
Γ(α)
θ
α
e
−(β+y)θ
for y, θ > 0
(b) Marginal distribution:
2
f(y) = Z ∞
−∞
f(y, θ) dθ
=
Z ∞
0
β
α
Γ(α)
θ
α
e
−(β+y)θ
=
β
α
Γ(α)
Z ∞
0
θ
α
e
−(β+y)θ
dθ
=
β
α
Γ(α)
Z ∞
0
θ
α
∗
z }| {
(α + 1) −1
e
−
β
∗
z }| {
(β + y) θ
dθ
=
β
α
Γ(α)
Z ∞
0
θ
α
∗−1
e
−β
∗θ
dθ
=
β
α
Γ(α)
Γ(α
∗
)
β
∗α∗
Z ∞
0
β
∗α
∗
Γ(α∗
)
θ
α
∗−1
e
−β
∗θ
| {z }
Gamma density(α
∗, β∗)
dθ
=
β
α
Γ(α)
Γ(α
∗
)
β
∗α∗
=
β
α
Γ(α)
Γ(α + 1)
(β + y)
α+1
=
αβα
(β + y)
α+1 for y > 0, because Γ(α + 1) = αΓ(α)
Note that β + y have a Pareto distribution. That is, calling X = β + Y
f(x) = αβα
x
α+1 for x > β.
3
(c) Applying the law of iterative expectation:
E(Y ) = E(E(Y |θ))
= E

1
θ

as Y |θ follows an exponential distribution
=
Z ∞
0
1
θ
β
α
Γ(α)
θ
α−1
e
−βθ
| {z }
θ∼Gamma(α,β)
dθ
=
β
α
Γ(α)
Z ∞
0
1
θ
θ
α
∗
z }| {
(α − 1) −1
e
−βθ dθ
=
β
α
Γ(α)
Γ(α
∗
)
β
α∗
Z ∞
0
β
α
∗
Γ(α∗
)
θ
(α
∗−1)e
−βθ dθ
=
β
α
Γ(α)
Γ(α
∗
)
β
α∗
=
β
α
Γ(α)
Γ(α − 1)
β
α−1
=
β
α
β
α−1
Γ(α − 1)
αΓ(α − 1)
=
β
α − 1
You could also find the answer by applying the definition of expectation
E(Y ) = Z
yf(y) dy.
(d) Distribution of θ|y:
f(θ|y) = f(y, θ)
f(y)
=
β
α
Γ(α)
θ
α
e
−(β+y)θ
αβα
(β + y)
α+1
=
(β + y)
α+1
Γ(α + 1) θ
(α+1)−1
e
−(β+y)θ
for θ > 0
θ|y ∼ Gamma(α + 1, β + y)
2. Y |µ ∼ Normal(µ, σ2
) with µ ∼ Normal(m, v) and σ known.
(a) We can write Y as Y = µ + , where  ∼ N(0, σ2
) is independent of µ. Then,
4
recalling properties of the normal distribution:
E(Y ) = E(µ) + E() = m + 0 = m
V (Y ) = V (µ) + V () = v + σ
2
COV (Y, µ) = COV (µ + , µ) = v(µ) = v

Y
µ

∼ Normal m
m

,

v + σ
2
v
v v
(b) By properties of the normal distribution, then
Y ∼ Normal(m, v + σ
2
)
(c) By properties of the normal distribution we know that E(Y ) = m. Alternatively, you can apply the law of iterative expectations (try it!).
(d) Distribution of µ|Y = y
f(µ|y) = f(y|µ)f(µ)
f(y)
∝
1
σ
√
2π
e
− 1
2σ2
(y−µ)
2 1
√
2πv
e
− 1
2v
(µ−m)
2
∝ e
− 1
2
[
1
σ2
(y−µ)
2+ 1
v
(µ−m)
2
]
∝ exp 
−
1
2

1
σ
2
(y − µ)
2 +
1
v
(µ − m)
2

∝ exp 
−
1
2

1
σ
2
(y − µ)
2 +
1
v
(µ − m)
2

∝ exp 
−
1
2
 1
σ
2
+
1
v

µ
2 − 2
 y
σ
2
+
m
v

µ +
y
2
σ
2
+
m2
v
2
 by expanding the squ∝ exp 
−
1
2
 1
σ
2
+
1
v

µ
2 − 2
 y
σ
2
+
m
v

µ
 by dropping constants
∝ exp 
−
1
2

1
σ
2
+
1
v
 µ
2 − 2
y
σ2 +
m
v
1
σ2 +
1
v
µ

∝ exp 
−
1
2v
∗2

µ
2 − 2m∗µ


where v
∗ =

1
σ
2
+
1
v
−1
and m∗ = v
∗
 y
σ
2
+
m
v

∝ exp 
−
1
2v
∗2

µ
2 − 2m∗µ + m∗2 − m∗2


completing the square
∝ exp 
−
1
2v
∗2
(µ − m∗
)
2

which is a normal distribution µ|y ∼ Normal(m∗
, v∗
)
3. (a) The confidence interval does not mean that the proportion of people that supports party A is between 48% and 61% with a probability of 95%. Remember
that p, the parameter of interest is a fixed quantity (not a variable). The 95%
5
CI only indicates that over infinitely many repetitions of the survey, 95% of
the confidence intervals constructed in this manner would contain the true
proportion.
(b) There is strong evidence to reject the null hypothesis. However, this is not the
same as saying that the alternative hypothesis is true. In fact, we can never
conclude that any of the hypothesis is true. The results of the test are either
reject or do not reject the null hypothesis. In addition, p is not a variable,
and then it makes no sense to talk about P(p > 0.50). Under the frequentist
approach we cannot make probability statements about the parameter.
4. (a) Assuming that the null hypothesis is true, for this experiment we have that
X ∼ Binomial(p = 0.5, n = 6). Therefore, P(X ≥ 5) = 0.109375. The
conclusion is that we do not reject the null hypothesis.
(b) In this case the likelihood is a geometric distribution X ∼ Geom(p = 0.5)
and P(X ≥ 5) = 0.03125. In this case, we reject the null hypothesis.
(c) The results are contradictory and they depend on the choice of the likelihood function. In other words, frequentist approach viola



Term 2: Bayesian Thinking
Dr Ana Paula Palacios
School of Computing and Mathematical Sciences
University of Greenwich
Ana Paula Palacios MATH1157 UoG 1 / 33
Objective
To learn to make predictions under the Bayesian framework and to study
situations when Bayesian statistics is easy!
Ana Paula Palacios MATH1157 UoG 2 / 33
The Big Bayesian Picture1
1Bayes Rules! An introduction to applied Bayesian modelling
Ana Paula Palacios MATH1157 UoG 3 / 33
The Big Bayesian Picture2
2Bayes Rules! An introduction to applied Bayesian modelling
Ana Paula Palacios MATH1157 UoG 4 / 33
The prior distribution
We are interested in the values of the unknown parameter θ
In the Bayesian framework, the parameter θ is a random variable.
The uncertainty about the parameter can be modelled through a probability
distribution.
Before performing any experiment or collecting new data, we can represent
our initial knowledge (or lack of knowledge) about θ by a probability
distribution f (θ), called the prior distribution
Ana Paula Palacios MATH1157 UoG 5 / 33
A prior distribution for P(Heads)
Let’s construct a prior distribution for θ = P(Heads)
We know that 0 ≤ θ ≤ 1
We are confident that θ is near 0.50
We need a distribution with support [0, 1] and centered at 0.50.
Ana Paula Palacios MATH1157 UoG 6 / 33
The Beta distribution
A continuous random variable Y follows a Beta distribution, B(α, β), if
fY (y) = Γ(α + β)
Γ(α)Γ(β)
y
α−1
(1 − y)
β−1
for y ∈ [0, 1]
where α > 0 and β > 0.
The expected value and variance are:
E(Y ) = α
α + β
V(Y ) = αβ
(α + β)
2(α + β + 1)
Ana Paula Palacios MATH1157 UoG 7 / 33
The Beta distribution
Ana Paula Palacios MATH1157 UoG 8 / 33
The Beta distribution
For the prior of P(Heads) we could choose a B(4, 4), for example.
Ana Paula Palacios MATH1157 UoG 9 / 33
The posterior distribution
We have some relevant data, suppose we have n observations
x = (x1, . . . , xn) which have a probability distribution that depends on the
unknown parameter value: f (x|θ) (the likelihood).
After observing the data, we update the beliefs about the unknown
parameter.
Ana Paula Palacios MATH1157 UoG 10 / 33
The Bayesian Theorem
The belief about θ are updated by applying the Bayes Theorem to random
variables
f (θ|x) = f (x|θ)p(θ)
f (x)
f (θ|x) ∝ f (x|θ)p(θ)
Posterior ∝ Likelihood × Prior
where f (x) = Z
θ
f (x|θ)f (θ)dθ. So, f (x) is the normalising constant, and its
distribution does not depend on the value of θ .
The inference about θ is made is based on the distribution of θ conditional on
the data, f (θ|x), called the posterior distribution
Ana Paula Palacios MATH1157 UoG 11 / 33
Choosing a Prior distribution
The relative influence of the prior and data on updated beliefs depends on
how much weight is given to the prior knowledge and the strength of the
data.
If the data has sufficient signal, then the prior will not influence greatly the
posterior
But if the data is weak or the sample size is small, then the choice of the
prior may have a big impact in the posterior
Normally, the location of a parameter (mean, mode) and its precision of the
prior is usually more critical than the shape of the distribution
If some prior information is available (past historical data, expert opinion,
etc), one should choose a prior distribution that reflects this prior knowledge.
This will be particularly useful when the sample size is small or the parameter
space is of high dimension
Ana Paula Palacios MATH1157 UoG 12 / 33
Informative vs Non-informative priors
Informative-Subjective priors
They represent our prior beliefs about parameter values before collecting any data.
The process of constructing the most suitable prior for θ is called prior elicitation.
Weakly informative priors
They express partial information about the parameter. They usually have very
high variance.
Noninformative-Objective Priors
They contain little or none information about θ (they do not favour any value of
θ). They are usually improper. The posterior distribution will highly depend on
the likelihood and inferences in this case are called objective. Examples:
U(−∞, ∞)
B(0, 0)
Jeffreys prior distribution
Ana Paula Palacios MATH1157 UoG 13 / 33
Proper posterior distribution
To perform valid inference, the posterior distribution must be proper. For the
continuous case that is R
θ
f (θ|x)dθ = 1.
Often we do not need to calculate the normalising constant because we can
recognize the form of f (x|θ)f (θ) as a probability distribution that we know.
Sometimes we can derive analytically the posterior distribution
Other times we can obtain random draws from the posterior distribution of
the parameter by using Markov Chain Monte Carlo methods (Gibbs
sampling, Metropolis Hasting algorithm, etc.).
Sometimes the posterior distribution belongs to the same probability
distribution family as the prior distribution
Conjugacy
If the posterior distribution belongs to the same probability distribution family as
the prior distribution, the prior and posterior are then called conjugate
distributions, and the prior is called a conjugate prior for the likelihood.
Ana Paula Palacios MATH1157 UoG 14 / 33
The Beta-Binomial model
Example (Bayesian Data Analysis, Gelman et al., 2003)
The proportion of births that are female has long been a topic of interest both
scientifically and to the lay public. Two hundred years ago it was established that
the proportion of female birth in European populations was less than 0.5, while
the currently accepted value of the proportion in very large European-race
populations is 0.485
Let x be the number of girls in n recorded births. The data can be modelled
with the binomial distribution, that is X ∼ B(n, θ), where θ is the probability
of a female birth. Therefore, the likelihood is of the form
f (x|θ) = 
n
x

θ
x
(1 − θ)
n−x
What about the prior?
Ana Paula Palacios MATH1157 UoG 15 / 33
The Beta-Binomial model
Well, we know that θ is a probability and therefore 0 ≤ θ ≤ 1. It is also likely to
take a value near 0.50, and less likely to be far away from 0.5.
A good candidate will be the Beta distribution
f (θ) = Γ(α + β)
Γ(α)Γ(β)
θ
α−1
(1 − θ)
β−1 where θ ∈ [0, 1]
where α > 0 and β > 0 are called hyperparameters
Ana Paula Palacios MATH1157 UoG 16 / 33
The Beta-Binomial model
The posterior density for θ is then
f (θ|x) ∝ f (x|θ)f (θ)
∝

n
x

θ
x
(1 − θ)
n−x Γ(α + β)
Γ(α)Γ(β)
θ
α−1
(1 − θ)
β−1
∝ θ
x
(1 − θ)
n−x
θ
α−1
(1 − θ)
β−1
∝ θ
α+x−1
(1 − θ)
β+n−x−1
Note that this looks like a Beta function with updated parameters, that is
f (θ|x) = Beta(α + x, β + n − x)
As the posterior distribution follows the same parametric form as the prior
distribution this is a case of conjugacy.
Note that the hyperparameters α and β can be seen as the prior number of
success (female birth in our example) and failures (males births)
Ana Paula Palacios MATH1157 UoG 17 / 33
A note on the priors
Returning to the example of female births, we choose to have a beta prior
distribution. How can we choose the values of the hyperparameters α and β?
We can interpret α and β as previous “successes” and “failures”
Experts may have some idea about the mean value, the variance, some
percentile, etc. We can use this information to derive the corresponding value
of α and β.
For example, if we have some knowledge about the mean, mode and/or the
variance, then we can solve a system of equations to find out the value of α
and β.
E(θ) = α
α + β
mode(θ) = α − 1
α + β − 2
V(θ) = αβ
(α + β)
2(α + β + 1)
Ana Paula Palacios MATH1157 UoG 18 / 33
Summarising the posterior: point estimators?
How do we extract a Bayesian point estimator for the unknown parameter θ?
The mode of the posterior distribution (its maximal value) is the most likely
value for θ given the data:
ˆθ = max
θ
{f (θ|x)}
This is called the maximum a posteriori estimator or MAP.
The mean of the posterior distribution is the posterior expected value of θ
given the data
ˆθ = E[θ|x] = Z
θf (θ|x)dθ
This is called the minimum mean square error estimator or MMSE
The median of the posterior distribution is the value θˆ that satisfies
P(θ > ˆθ|x) = P(θ < ˆθ|x) = 0.5
Z θˆ
∞
f (θ|x)dθ =
1
2
Ana Paula Palacios MATH1157 UoG 19 / 33
Summarising the posterior: quantiles and intervals
q-quantile of the posterior distribution: the value θq below which 100q
percentage of the posterior distribution of θ fall
P(θ < θq|x) = q
Credible interval: the 100(1 − α)% credible interval is given by any (a, b)
satisfying
P(a ≤ θ ≤ b|x) = Z b
a
f (θ|x)dθ = 1 − α
Central posterior interval: where the lower and upper limit of the interval
are the α/2 and 1 − α/2 quantiles.
Ana Paula Palacios MATH1157 UoG 20 / 33
Highest Posterior Density
Highest posterior density region(s): are the shortest intervals giving an
area of 1 − α
Ana Paula Palacios MATH1157 UoG 21 / 33
Credible vs Confidence Intervals
Frequentist: we are 95% confident that the true value of θ is contained in
the interval. By confident we mean that if we repeat the experiment a large
number of times, this will happen in 95% of the cases.
Bayesian: given the observed data, there is a 95% probability that the value
of θ lies in the credible interval
A very common mistake is to do a Bayesian interpretation of a frequentist
confidence interval. Remember that in the frequentist approach θ is not
random.
Ana Paula Palacios MATH1157 UoG 22 / 33
Recalling the coin example
We wanted to investigate whether the coin is fair or not. We tossed the coin
14 times and observed 10 Heads.
We consider the following Beta-Binomial model:
X|θ ∼ Binomial(14, θ)
θ ∼ Beta(4, 4)
As this is a case of conjugacy, we know that the posterior distribution is also
Beta with updated parameters equal to (α+Heads) and (β+Tails):
θ|x ∼ Beta(14, 8)
Ana Paula Palacios MATH1157 UoG 23 / 33
Posterior Mean
The posteriori mean is
E(θ|x) = α + h
α + h + β + t
where h is the number of observed Heads and h the number of tails. This can be
expressed in mixture form as
E(θ|x) = w
α
α + β
+ (1 − w)
h
h + t
= wE(θ) + (1 − w)
ˆθ
where w =
α+β
α+β+h+t
is the relative weight of the number of equivalent coin tosses
in the prior.
Note that when α, β → 0 (zero prior coin tosses), E(θ|x) → θˆ, the classical MLE.
Ana Paula Palacios MATH1157 UoG 24 / 33
Coin example
Recall the posterior distribution of our coin example:
θ|x ∼ Beta(14, 8)
Then, we have that:
E(θ|x) = 14
14 + 8
= 0.64
mode(θ|x) = 14 − 1
14 + 8 − 2
= 0.65
V(θ|x) = (14)(8)
(14 + 8)2(14 + 8 + 1) = 0.01
Ana Paula Palacios MATH1157 UoG 25 / 33
Posterior Distribution
The posterior mean of the probability of Heads is 0.64 and the standard deviation
is 0.10. The probability that the coin is biased in favour of tails is
P(θ|x < 0.5) = 0.09.
pbeta(0.50, 14,8)
Ana Paula Palacios MATH1157 UoG 26 / 33
Credible interval
There is a 95% probability that θ is between 0.43 and 0.82.
qbeta(c(0.025, 0.975), 14, 8)
Ana Paula Palacios MATH1157 UoG 27 / 33
The Predictive distribution
Suppose now that we want to predict out-of-sample data or future
observations, say ˜x.
We want to find the conditional distribution of ˜x given x.
The posterior predictive distribution, p(˜x|x), is the distribution of a new
outcome given the observed data:
p(˜x|x) = Z
p(˜x, θ|x)dθ
p(˜x|x) = Z
p(˜x|θ, x)p(θ|x)dθ
p(˜x|x) = Z
p(˜x|θ)p(θ|x)dθ
as ˜x and x are conditionally independent given θ.
The PPD accounts for the uncertainty in the model parameters; this is an
advantage of the Bayesian framework.
Ana Paula Palacios MATH1157 UoG 28 / 33
The Predictive distribution
Suppose we want to predict the number of Heads in m tosses more. For that, we
need the posterior predictive distribution:
p(˜x|x) = Z
p(˜x|θ)p(θ|x)dθ
=
Z 1
0

m
x˜

θ
x˜
(1 − θ)
m−x˜
1
B(α∗, β∗)
θ
α
∗−1
(1 − θ)
β
∗−1
dθ
=

m
x˜

1
B(α∗, β∗)
Z 1
0
θ
x˜
(1 − θ)
m−x˜
θ
α
∗−1
(1 − θ)
β
∗−1
dθ
=

m
x˜

1
B(α∗, β∗)
Z 1
0
θ
x˜+α
∗−1
(1 − θ)
m−x˜+β
∗−1
dθ
=

m
x˜

1
B(α∗, β∗)
B(˜x + α
∗
, m − x˜ + β
∗
)
X˜|x ∼ Beta-bin(m, α∗
, β∗
)
where α
∗ = α + x and β
∗ = β + n − x.
Ana Paula Palacios MATH1157 UoG 29 / 33
The Predictive distribution
X˜|x ∼ Beta-bin(m, α∗
, β∗
)
E(X˜|x) = mα
∗
α∗ + β
∗
V(X˜|x) = mα
∗β
∗
(α
∗ + β
∗ + m)
(α∗ + β
∗)
2(α∗ + β
∗ + 1)
Ana Paula Palacios MATH1157 UoG 30 / 33
The Predictive distribution
Return to our coin example. What is the posterior predictive distribution of Heads
in 10 more tosses? X˜|x ∼ Beta-bin(10, 14, 8).
Ana Paula Palacios MATH1157 UoG 31 / 33
Summarising
Frecuentists Bayesians
θ is fixed θ is a random variable
Data is random (and replicable) Data is fixed (given)
Probability as frequency Probability as uncertainty
Prior knowledge is ignored Prior knowledge can be included
Confidence intervals Credible intervals
Hypothesis test Posterior distribution of θ
Prediction via “plug in” Accounts for parameter uncertainty
Violation of Likelihood Principle Likelihood Principle
Ana Paula Palacios MATH1157 UoG 32 / 33
Some advantages of the Bayesian framework
Provides a complete characterisation of the parameter through a distribution
It provides a systematic and explicit way of incorporating previous knowledge
Formalise the data learning process by updating the results as new
information is available
Improves the precision of the estimation by the incorporation of extra
information and knowledge accumulation.
Improves the precision of the estimation in the case of sparse and missing
data trough borrowing strength.
It does not assume normality nor infinite samples
More intuitive interpretation



Tutorial: Bayesian inference vs frequentist
1. There are several graduate data scientist positions offered by a big company. Having
read the job description, you know for a fact that you are qualified for the position:
this is your data. Your goal is to predict whether you will actually be offered a
position: this is your hypothesis.
(a) From the perspective of someone using Bayesian thinking, what question is
answered in testing the hypothesis that you’ll be offered the position?
(b) Repeat part a) but using the frequentist approach.
(c) Which question would you rather have the answer to: the frequentist or the
Bayesian? Explain your reasoning
2. For each scenario below you are given a pair of events, A and B. Explain what you
believe to be the relationship between the posterior and prior probabilities of B:
P(B|A) > P(B) or P(B|A) < P(B)?
(a) A: You have watched the film “The power of the Dog” of Jane Campion, a
New Zealand filmmaker, and you very much enjoyed it. B: You will enjoy
Jane Campion’s next new film.
(b) A: it is 0  in Greenwich on the 1st of January. B: it will be 30  the day
after.
(c) A: students spent only one week working in their coursework. B: students
make many mistakes in their coursework.
3. A person claims that they can predict the outcome of rolling a die at least 50% of
the time. In an experiment, they predicts correctly three rolls out of ten.
(a) Using the frequentist approach, is there evidence against their claim?
(b) Let p be the probability of predicting the outcome of the die correctly. Assuming a uniform prior distribution for p, compute the posterior probability
that his claim is true.
4. Assume we have a coin that comes from a magic-trick store, and therefore we believe that the coin is strongly biased either for heads or for tails. Express this belief
as a beta prior (use the figure shown on the next page to help you). Now assume
we toss the coin five times and it comes up heads in four of the five tosses. What
is the posterior distribution? What is the posterior expected probability of heads?
1
2
5. Let θ be the probability that a patient with disease A that is being treated with
a new drug has recovered. In a clinial trial with 20 patients, 8 have recovered.
Assume an Haldane prior distribution for θ:
f(θ) ∝
1
θ(1 − θ)
.
(a) Find the posterior distribution of θ.
(b) Without treatment, about 30% of people with the disease A have recovered.
What is the posterior probability that the recovery rate after a treatment with
the new drug is greater than 30%?
(c) Ten new patients are treated with the new drug. What is the expected num



Tutorial: Bayesian inference vs frequentist
1. There are several graduate data scientist positions offered by a big company. Having
read the job description, you know for a fact that you are qualified for the position:
this is your data. Your goal is to predict whether you will actually be offered a
position: this is your hypothesis.
(a) From the perspective of someone using Bayesian thinking, what question is
answered in testing the hypothesis that you’ll be offered the position?
(b) Repeat part a) but using the frequentist approach.
(c) Which question would you rather have the answer to: the frequentist or the
Bayesian? Explain your reasoning
2. For each scenario below you are given a pair of events, A and B. Explain what you
believe to be the relationship between the posterior and prior probabilities of B:
P(B|A) > P(B) or P(B|A) < P(B)?
(a) A: You have watched the film “The power of the Dog” of Jane Campion, a
New Zealand filmmaker, and you very much enjoyed it. B: You will enjoy
Jane Campion’s next new film.
(b) A: it is 0  in Greenwich on the 1st of January. B: it will be 30  the day
after.
(c) A: students spent only one week working in their coursework. B: students
make many mistakes in their coursework.
3. A person claims that they can predict the outcome of rolling a die at least 50% of
the time. In an experiment, they predicts correctly three rolls out of ten.
(a) Using the frequentist approach, is there evidence against their claim?
(b) Let p be the probability of predicting the outcome of the die correctly. Assuming a uniform prior distribution for p, compute the posterior probability
that his claim is true.
4. Assume we have a coin that comes from a magic-trick store, and therefore we believe that the coin is strongly biased either for heads or for tails. Express this belief
as a beta prior (use the figure shown on the next page to help you). Now assume
we toss the coin five times and it comes up heads in four of the five tosses. What
is the posterior distribution? What is the posterior expected probability of heads?
1
2
5. Let θ be the probability that a patient with disease A that is being treated with
a new drug has recovered. In a clinial trial with 20 patients, 8 have recovered.
Assume an Haldane prior distribution for θ:
f(θ) ∝
1
θ(1 − θ)
.
(a) Find the posterior distribution of θ.
(b) Without treatment, about 30% of people with the disease A have recovered.
What is the posterior probability that the recovery rate after a treatment with
the new drug is greater than 30%?
(c) Ten new patients are treated with the new drug. What is the expected num



