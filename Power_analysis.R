# ------------------------------------------------------------------------------
# Author: Clare Sutherland
# Date: 21.02.19
#
# Script for power analysis
# -------|---------|---------|---------|---------|---------|---------|---------|

# need to load the power analysis package since it's not one of R's inbuilt packages
library(pwr)

# this is an apriori power analysis to decide sample size for a between subjects t-test
# the test calculates the number of subjects needed for a given power, effect size and sample size
# you can also run post-hoc power calculations by setting number of subjects instead with n = [whatever you want]
# then leave blank whatever aspect you want to calculate (e.g. observed power or effect size)
# note that the t-test type can be changed to 'paired' or 'one.sample'
pwr.t.test(sig.level = 0.05, power = 0.80, d = 0.2, type = 'two.sample')

# this is an apriori power analysis to decide sample size for a correlation
# the test calculates the number of subjects needed for a given power, effect size and sample size
# again, you can set the N and then leave other aspects blank to calculate these instead. Have a play!
pwr.r.test(sig.level = 0.05, power = 0.80, r = 0.5)

# for help, google "PWR help" for more info or type ??pwr into the RStudio console for help