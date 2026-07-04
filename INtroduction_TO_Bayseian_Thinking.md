UNIVERSITY OF
GREENWICH
RESIT COURSEWORK
MATH1189 -Bayesian Methods and its Applications
Deadline Wednesday 10th of July, 17:00hs.
This coursework is designed to assess the following learning outcomes:
1 UnderstandthefoundationsandprinciplesofBayesianthinkinganddiscussitsdifferences
with respect to alternative approaches.
2 Demonstrate knowledge and understanding of the mathematical formulation of a problem
within the Bayesian framework and its implementation.
3 Select and apply appropriate Bayesian methods to a range of problems such as statistical
inference, decision-making and optimisation
4 Use Bayesian computational methods and interpret the results in context
In this coursework you will build a Bayesian model for tumour rate in rats based on data from 70
experiments. You will write a power point presentation and record a video (using the record- ing
facility of power point). You will submit two files: i) a power point file that contains the problem,
your model and your output of the fitting as suggested from questions 1-5 (10 slides maximum).
ii) a 12 minutes video where you will explain the problem, the rationality of the chosen model, the
derivation of the posteriors, the explanation of the R code, the fitting and the critical discussion of
the solutions. Note that here you need to show your understanding of the problem, explain the
decisions you have made during the modelling process, explain your R code, and interpret the
solutions and outcome of the fitting. This is where you can show your understanding, explaining
with your own words the model and results. You will lose the marks for communication if you read
during the presentation.
Problem: Several scientific studies investigate the proportion of laboratory animals that de- velop
a tumour after being exposed to a specific chemical dose. Such research is essential in toxicology
and cancer risk assessment, because it helps determine whether a compound has carcinogenic
potential, how strong the effect is, and whether the risk changes with the admin- istered dose.
Data: For this question you will use data from a paper published in Biometrics (available in
Moodle). Students with an even ID number will use the data from Table 3 and students with an
odd ID number will use the data from Table 5.
Tasks:
1. Choose one of the models seen in class, or a combination of them, or a modification of
them, to represent this data and estimate 0, the tumour rate. State the lecture and slide
number of the models you have chosen. Explain the rationality of your choice. Write the model
mathematically.
2. Explain the rationality of the prior distributions you have chosen for the parameters of
your model.
1
3. Derive analytically their posterior distributions (or full posterior distributions if appropriate).
4. Use R to perform Bayesian inference, either directly from the posterior distributions (if
possible), or by using MCMC algorithms. In the latter case, develop the MCMC algo- rithm and
write an R code. Discuss the results (including convergence when needed). You can compute
point estimators (for example posterior mean, median, posterior standard deviation), plot the
posterior distribution, evaluate probability statements, etc.
5. Discuss how your approach differ from a frequentist analysis.
6. This time choose one of the models seen in class, or a combination of them, or a modified
version of them, to model the data and estimate 0, the tumour rate in experiment
i. State the lecture and slide number of the models you have chosen and write your
model mathematically. Explain the rationality of your model and explain the differences
with the frequentist alternative. (Hint: assume vague Gamma prior distributions for the
hyperparameters of the model).
7. Fit the new model in JAGS and discuss the results. Provide a conclusion for your whole
analysis, comparing both models using appropriate measures.
Assessment:
The coursework will be assessed on:
• Content, knowledge and mathematical skills (60%)
• Communication, organisation and presentation (40%)
Please see the rubric for more details.
2



Tutorial: Probability and Bayes Theorem
1. Define the following events for a student of a given university: A = drives 10 miles
per hour above the speed limit,B = gets a speeding ticket, C = did statistics
at A levels, D = has used R, E = likes pop music, and F = is from East End
of London. Several facts about these events are listed below. Specify each of
these facts using probability notation, paying special attention to whether it is a
marginal, conditional, or joint probability.
(a) 73% of people that drive 10 miles per hour above the speed limit get a speeding
ticket.
(b) 20% of students drive 10 miles per hour above the speed limit.
(c) 15% of students have used R.
(d) 91% of students with A level in statistics have used R.
(e) 38% of students are East enders that like pop music.
(f) 95% of the students from East end of London like pop music.
2. Students on the BSc Mathematics degree were surveyed regarding their favourite
area of study. Of the total sample, 20% were in their first year, 20% were in
their second year and 60% were in their final year. For each grade, the following
table shows the proportion of respondents who chose each of three areas as their
favourite:
Pure Mathematics Calculus Data Science/Statistics
1st Year 0.3 0.6 0.1
2nd Year 0.2 0.5 0.3
3rd Year 0.1 0.3 0.6
(a) From the above information, construct a table with the joint probabilities of
year and area of mathematics.
(b) Show whether year and area are independent or not.
3. A company found that from the 50 employees that received an extra bonus at the
end of the year, 20 of them attended a course on sales as part of their professional
development training. The company has 200 employees in total. Let B be the
event received a bonus and A the event attended a course on sales. Find P(B),
P(A|B) and P(A ∩ B).
4. Assume that 5.7% of all computers break down during their predicted lifespan, and
9.5% of all computers are infected by a virus. Furthermore, 92% of all computers
that break down are infected by a virus. What is the probability that a computer
that is infected by a virus breaks down?
1
5. PCR tests for COVID-19 in the UK have analytical sensitivity and specificity of
95%. Sensitivity is the percentage of people with COVID who (correctly) tested
positive; while the specificity represents the percentage of people without COVID
that correctly tested negative. Assume that by the most recent estimation from
the Office of National Statistics, 1 in 90 people within the population in England
has COVID.
(a) If you were tested positive, what is the probability that you really have
COVID?
(b) To confirm your diagnosis you decide to take another test. If the test comes
positive again, what will be the updated probability that you have COVID?
Use the probability calculated in part a) as the new prior probability of
COVID.
∗6. Each of your parents has two copies of each of their genes, and each parent passes
along just one copy to make up the genes you have. A girl was born to a mother
with (a, a) gene pair. The girl was born with genes (a, A). There are two possible
fathers: Boris with genes (A, A) and Michael with genes (A, a). Let p be the
probability that Boris is the father and (1 − p) the probability that Michael is the
father.
(a) Compute the probability that the father of the girl that was born with (a, A)
gene pair is Boris?
(b) Find a range of values for p such that it is more likely that the father of the
girl born with (a, A) gene pair is Michael.
2



Tutorial: Probability and Bayes Theorem
1. Define the following events for a student of a given university: A = drives 10 miles
per hour above the speed limit, B = gets a speeding ticket, C = did statistics
at A levels, D = has used R, E = likes pop music, and F = is from East End
of London. Several facts about these events are listed below. Specify each of
these facts using probability notation, paying special attention to whether it is a
marginal, conditional, or joint probability.
(a) 73% of people that drive 10 miles per hour above the speed limit get a speeding
ticket.
(b) 20% of students drive 10 miles per hour above the speed limit.
(c) 15% of students have used R.
(d) 91% of students with A level in statistics have used R.
(e) 38% of students are East enders that like pop music.
(f) 95% of the students from East end of London like pop music.
Solution
(a) P(B|A)
(b) P(A)
(c) P(D)
(d) P(D|C)
(e) P(E ∩ F)
(f) P(E|F)
2. Students on the BSc Mathematics degree were surveyed regarding their favourite
area of study. Of the total sample, 20% were in their first year, 20% were in
their second year and 60% were in their final year. For each grade, the following
table shows the proportion of respondents who chose each of three areas as their
favourite:
Pure Mathematics Calculus Data Science/Statistics
1st Year 0.3 0.6 0.1
2nd Year 0.2 0.5 0.3
3rd Year 0.1 0.3 0.6
(a) From the above information, construct a table with the joint probabilities of
year and area of mathematics.
(b) Show whether year and area are independent or not.
Solution
(a) By using the multiplicative rule, we get:
1
Pure Mathematics Calculus Data Science/Statistics
1st Year 0.3 × 0.2 = 0.06 0.12 0.02
2nd Year 0.2 × 0.2 = 0.04 0.10 0.06
3rd Year 0.1 × 0.6 = 0.06 0.18 0.36
(b) Note that P(pure) = 0.06+0.04+0.06 = 0.16. Then, P(pure)×P(1st year) =
0.16 × 0.20 = 0.032, but P(pure|1st year) = 0.30. That, they are not independent.
3. A company found that from the 50 employees that received an extra bonus at the
end of the year, 20 of them attended a course on sales as part of their professional
development training. The company has 200 employees in total. Let B be the
event received a bonus and A the event attended a course on sales. Find P(B),
P(A|B) and P(A ∩ B).
Solution P(B) = 50/200 = 0.25, P(A|B) = 20/50 = 0.40, P(A ∩ B) = 0.40 ×
0.25 = 0.10.
4. Assume that 5.7% of all computers break down during their predicted lifespan, and
9.5% of all computers are infected by a virus. Furthermore, 92% of all computers
that break down are infected by a virus. What is the probability that a computer
that is infected by a virus breaks down?
Solution Let B be the event a computer breaks down and V be the event a
computer is infected by a virus. We know that P(B) = 0.057, P(V ) = 0.095 and
P(V |B) = 0.92. Then
P(B|V ) = P(V |B)P(B)
P(V )
=
0.92 × 0.057
0.095
= 0.552
5. PCR tests for COVID-19 in the UK have analytical sensitivity and specificity of
95%. Sensitivity is the percentage of people with COVID who (correctly) tested
positive; while the specificity represents the percentage of people without COVID
that correctly tested negative. Assume that by the most recent estimation from
the Office of National Statistics, 1 in 90 people within the population in England
has COVID.
(a) If you were tested positive, what is the probability that you really have
COVID?
(b) To confirm your diagnosis you decide to take another test. If the test comes
positive again, what will be the updated probability that you have COVID?
Use the probability calculated in part a) as the new prior probability of
COVID.
Solution.
2
(a) The information given is:
• P(+|COV ID) = 0.95, therefore P(−|COV ID) = 0.05
• P(−|NO COV ID) = 0.95, therefore P(+|NO COV ID) = 0.05
• P(COV ID) = 1/90, therefore P(NOCOV ID) = 1 −
1
90
We use Bayes Theorem to compute P(COV ID|+):
P(COV ID|+) = P(+|COV ID)P(COV ID)
P(+|COV ID)P(COV ID) + P(+|NO COV ID)P(NO COV ID)
=
0.95(1/90)
0.95(1/90) + 0.05
1 −
1
90 
= 0.1759
The probability that you have COVID given that the test was positive is only
17.59%.
(b) We use the Baye’s Theorem but now the prior probability that you have
COVID is 17.59%
P(COV ID|+) = P(+|COV ID)P(COV ID)
P(+|COV ID)P(COV ID) + P(+|NO COV ID)P(NO COV ID)
=
0.95(0.1759)
0.95(0.1759) + 0.05 (1 − 0.1759)
= 0.8021
The probability that you have COVID after your second testj positive is
80.21%.
∗6. Each of your parents has two copies of each of their genes, and each parent passes
along just one copy to make up the genes you have. A girl was born to a mother
with (a, a) gene pair. The girl was born with genes (a, A). There are two possible
fathers: Boris with genes (A, A) and Michael with genes (A, a). Let p be the
probability that Boris is the father and (1 − p) the probability that Michael is the
father.
(a) Compute the probability that the father of the girl that was born with (a, A)
gene pair is Boris?
(b) Find a range of values for p such that it is more likely that the father of the
girl born with (a, A) gene pair is Michael.
3







