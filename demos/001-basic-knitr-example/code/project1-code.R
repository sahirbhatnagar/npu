## ---- linear-regression ----
fit <- lm(mpg ~ . , data = mtcars)
summary(fit)


## ---- fit-table ----
texreg::texreg(fit)


## ---- not-used ----
# here you can put other code 

summary(mtcars)