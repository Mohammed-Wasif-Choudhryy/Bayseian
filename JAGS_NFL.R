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
