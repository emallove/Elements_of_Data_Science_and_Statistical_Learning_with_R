# different sample sizes we are going to try:
sample.sizes=c(3,10,50, 100, 500, 1000)
#sample.sizes = seq(0, 1000, 50)

# we will use the vector below to save the standard deviations of the 
# *distribution of the means* at each given sample size.
# Note that it's ok to initialize with an empty vector of length 0 - if we index 
# it out-of-bounds while assigning a value later, the vector will autoexpand 
# on assignment, see examples in the slides) 
mean.sds = double(0) 

# values <- rnorm(1000)
values = vector("integer", 1000)
values = runif(1000)

i = 1
for ( N in sample.sizes ) { # try different sample sizes
  
  # INSERT YOUR CODE HERE: (you may want to check the slides). 
  
  # 1) At each given N (i.e. in each iteration of the outer loop) you have to draw large number 
  # (e.g. 1000) of samples of that size N, from the distribution of your choice (e.g. normal, 
  # uniform, exponential, ...), and calculate the mean of *each* of those samples. 
  # Save all those means into a vector 'm'. 
  #
  
  #m <- NULL  # WHY DOES THIS LINE *FIX* THE SLOPE OF SAMPLE-SIZE-SEMS?
  for (l in 1:N) {
    m[l] = mean(sample(values, N))
  }

  # 2) Now, with vector m in hand, we want to characterize how much the sample mean fluctuates
  # from one experiment (experiment=drawing a sample of N measurements) to the next. Instead of just
  # plotting a histogram as we did in class, this time we will calculate the standard 
  # deviation of the distribution represented by the vector m. Use function sd() to achieve that.
  #
  
  sd_ = sd(m)
  
  # 3) save the result (sd of the distributions of the means for current N) into the vector mean.sds 
  # defined above. You can use c() to concatenate, or you can use an indexing variable; 
  #  in the latter case you will need to add it to the code and increment properly
  
  mean.sds[i] = sd_
  
  i = i + 1
}

# at this point, you should have the vector mean.sds filled. It should have length 6 and keep the 
# calculated values of the standard deviation of the mean (known as the standard error of the mean, SEM) 
# at different sample sizes: mean.sds[1] is the SEM at N=3, mean.sds[2] is the SEM at N=10, and so on.

# let us now plot the SEM (i.e. the "typical" error we expect the sample mean to exhibit in any 
# given experiment) as a function of the sample size, N. 

plot(sample.sizes, mean.sds, main="SEM vs sample size", pch=19)
lines(sample.sizes, 1/sqrt(sample.sizes), col='blue')

