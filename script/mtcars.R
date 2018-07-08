##################################
# R script pour l'atelier R 
# 
# Créer par Sahir, July 28th, 2015
# Updated: 
# NOTE: 
##################################

# importer les donnés (mtcars fait parti du library datasets, ce qui 
# viens pré-installer avec R)
df <- mtcars

df <- mtcars[-1,]

# voir les variables en df
str(df)

# histogram de mpg
hist(mtcars[,"mpg"])

# régression linéaire
fit <- lm(mpg ~ disp, data=df)

# sommaire des résultat
summary(fit)

save(fit, file = "script/mtcars.RData")
