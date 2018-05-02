#need to load package since it's not one of R's inbuilt packages
library(pwr)

#this is a power analysis for a between subjects ttest, to decide sample size
#it runs for the number of subjects, but you can set this instead with n = ,
#and remove another aspect to calculate this value instead e.g. effect size
#type can be changed to 'paired' or 'one.sample'
pwr.t.test(sig.level = 0.05, power = 0.80, d = 0.2, type = 'two.sample')

#this is a power analysis for a correlation, to decide sample size
#it runs for the number of subjects, but you can set this instead with n = ,
#and remove another aspect to calculate this value instead e.g. effect size
pwr.r.test(sig.level = 0.05, power = 0.80, r = 0.5)

#google "PWR help" for more info or type ??pwr into the RStudio console