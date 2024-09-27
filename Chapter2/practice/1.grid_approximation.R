# Grid approximation - Bayesian updating
p_grid <- seq(from=0, to=1, length.out=200)

plot(p_grid)

prior <- rep(1, 200)

# step function prior
prior <- ifelse( p_grid < 0.5 , 0 , 1 )
# prior <- exp( -5*abs( p_grid - 0.5 ) )

plot(prior)

likelihood <- dbinom(6, size=9, prob=p_grid)

plot(likelihood)

# Pr(6 water 3 land|p)Pr(p) where p is assigned from the p_grid
# (Pr(p) - unconditioned probability of p; prior)
unstd.posterior <- likelihood * prior

# unstandardised posterior is == likelihood because the prior is uniformly distributed (just a bunch of 1s)
# It doesn't change the shape of the likelihood
plot(unstd.posterior)

# When we multiply the likelihood and the prior, we obtain the unstandardized posterior distribution.
# However, this distribution might not sum up to 1, meaning it's not a proper probability distribution.
# Normalizing it ensures that it sums up to 1, making it a valid probability distribution.



posterior <- unstd.posterior / sum(unstd.posterior)

plot(posterior)


