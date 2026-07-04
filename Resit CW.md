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