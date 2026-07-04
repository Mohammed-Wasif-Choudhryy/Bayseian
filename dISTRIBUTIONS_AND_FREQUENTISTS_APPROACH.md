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