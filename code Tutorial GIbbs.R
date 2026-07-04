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
  


