# Chapitre 1 --------------------------------------------------------------

## ----rcode=1.1----------------------------------------------------------
c(1,2,3) + c(4,5,6)

## ----rcode=1.2----------------------------------------------
# l'aide pour la fonction de régression linéaire 'lm'
?lm

## ----rcode=1.3---------------------------------------
# Démarrer l'interface pour le documentation
# et naviguer les différentes resources
help.start()

# trouver l'aide pour la fonction rnorm
?rnorm

# Connaitre le répertoire de travail
getwd()

## ----rcode=1.4----------------------------------------------
# On additionne
39 + 3

# On soustrait
58 - 16

# On multiplie
6 * 7

# Et on peut même diviser
8 / 3

## ----rcode=1.5----------------------------------------------
# Générer deux vecteurs de nombres pseudo-aléatoires
# issus d’une loi normale centrée réduite.
x <- rnorm(50)
y <- rnorm(50)

# Graphique des couples (x, y)
plot(x, y)

# Graphique d'un histogramme de x
hist(x)

## ----rcode=1.6----------------------------------------------
# voir la matière de x
x

# voir les objets de votre workspace
ls()

# supprimer les deux vecteurs x et y
rm(x,y)

# voir la matière de x
x

# voir les objets de votre workspace
ls()

## ----rcode=1.7----------------------------------------------
# Générer la suite 1, 2, ..., 20.
x <- 1:20

# créer un autre vecteur en fonction de x
y <- 2*x+3

# créer un data frame de deux colonnes et
# voir sa matière
dt <- data.frame(x, y)
dt

# estimer un modèle linéaire et voir les
# résultats
fit <- lm(y ~ x, data = dt)
summary(fit)


# Chapitre 2 --------------------------------------------------------------

## ----rcode=2.1, tidy=FALSE, eval=FALSE----------------------------------
# chercher la rubrique d'aide pour racine carrée
?sqrt

# on voit que la fonction prend un argument
sqrt(49)

## ----rcode=2.2-------------
# chercher la rubrique d'aide pour logarithme
?log

# on précise pas de valeur pour le second argument
log(2)

# On peut spécifier le second argument en l'appelant par son nom
log(2, base = exp(1))

## ----rcode=2.3-------------------------------
c(1, 2, 5)

## ----rcode=2.4------------------------------
c(1, 2.5, 4.5) # numeric
c(1L, 6L, 10L) # integer
c("ceci sont", "des characters") #character
c(TRUE, FALSE, T, F) # logical

## ----rcode=2.5-------------------------------
# combiner un character et integer donne un character
str(c("a", 1))

## ----rcode=2.6--------
x <- c(FALSE, FALSE, TRUE)
as.numeric(x)
# Nombre total de TRUE
sum(x)
# La proportion de TRUE
mean(x)

## ----rcode=2.7--------
(x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9)))

## ----rcode=2.8----------
# rempli par colonne par défaut
matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)

## ----rcode=2.9----------
# automatiquement converti en données homogène
matrix(c(1,2,3,"a","b","c"), nrow = 2, ncol = 3)

## ----rcode=2.10----------
# une colonne 'id' pour identifier les sujets
# une colonne 'age' pour leur age
data.frame(id = c("didier","patrice","laurent"),
           age = c(37,34,32))

## ----rcode=2.11--------------------------------
2+3
pi
cos(pi/4)

## ----rcode=2.12--------------------------------
a <- 5
a
b <- a - 2
b

## ----rcode=2.13------------------------------
# création d'un vecteur
x <- c(a = -1, b = 2, c = 8, d = 10)

# extraction par position
x[1]

# extraction par étiquette
x["c"]

# remplacer le deuxième élément par 5
x[2] <- 5

## ----rcode=2.14------------------------------
# création d'un data frame
d <- data.frame(Noms = c("Pierre", "Jean", "Jacques"),
Age = c(42, 34, 19),
Fumeur = c(TRUE, TRUE, FALSE))

d[1, ] # première rangé

d[ ,1] # première colonne

d[3,2] # troisième rangé, deuxième colonne

## ----rcode=2.15------------------------------
# création d'un list
x <- list(joueur = c("V", "C"),
		  score = c(10, 12))
		
# premier élément de la liste
x[[1]]

# 1er élément du 2e élément de la list
x[[2]][1]

## ----rcode=2.16------------------------------
# modifier le répertoire de travail
setwd("~/git_repositories/atelier-R-GERAD/data")

# importer les fichiers
# affectation aux objets 'lung' et 'admit'
lung <- read.csv("lung.csv")

admit <- read.table("admit.txt")

## ----rcode=2.17--------------
# modifier le répertoire de travail
setwd("~/git_repositories/atelier-R-GERAD/script")

# exécute les commandes R du script 'mtcars.R'
# et montre le output
source("mtcars.R", echo = TRUE)

# sauvegarde les objets du environment
save(df, fit, file = "mtcars.RData")

# supprime les objets de ton environment
rm(df, fit)

# importer les objets R de 'mtcars.RData'
load("mtcars.RData")

## ----rcode=2.18------------------------------
# installer des packages pour créer des rapports
# reproductibles
install.packages(c("knitr","rmarkdown"))

# pour avoir accès aux fonctions dans ces packages
library(knitr)
library(rmarkdown)


# Chapitre 3 --------------------------------------------------------------

## ----rcode=3.1------------------------------
# Plot des valeurs d'un vecteur contre leurs indices
# équivalent à plot(mtcars[,"mpg"])
plot(mtcars$mpg, xlab = "Index", ylab = "mpg",
    main = "Titre")

# Graphique des couples (x, y)
plot(mtcars$mpg, mtcars$disp, xlab = "mpg",type = "p",
ylab = "disp", main = "mpg vs. disp")

## ----rcode=3.2------------------------------
# importer 'mtcars.RData'
load("mtcars.RData")
source("mtcars.R")
# Graphiques des 4 diagnostiques
# du modèle linéaire
# placer dans 2 rangés et 2 colonnes
par(mfrow=c(2,2))
plot(fit)
dev.off()

## ----rcode=3.3------------------------------
# la taille de 237 étudiants disponibles dans le jeu
# de données 'survey' du library(MASS)
library(MASS)

# voir le nom des colonnes
names(survey)

# histogram de la taille et montrer la fréquence
# de chaque barre
Histo <- "Titre"
i <- 1

hist(survey$Height, labels = TRUE,
     xlab = "Height", 
     main = paste(Histo, i))

## ----rcode=3.4------------------------------
# visualiser la différence de taille entre les
# hommes et les femmes dans le jeu
# de données 'survey' du library(MASS)

boxplot(survey$Height ~ survey$Sex,
         ylab = "Taille (cm)",
         col = c("lightpink","lightblue"))




## ----rcode=3.5------------------------------
# enregistrer dans le répertoire de travail courant
pdf("boxplot_surveyv2.pdf")
boxplot(survey$Height ~ survey$Sex,
         ylab = "Taille (cm)",
        col = c("lightpink","lightblue"))
dev.off()



# Chapitre 4 --------------------------------------------------------------

## ----rcode=4.1------------------------------
# enregistrer dans le répertoire de travail courant
summary(mtcars)

## ----rcode=4.2------------------------------
# variance par ligne

head(mtcars)
apply(mtcars, 1, var)

## ----rcode=4.3------------------------------
# variance par colonne
apply(mtcars, 2, var)

# écart type par colonne
apply(mtcars, 2, sd)

# minimum de chaque rangée
apply(mtcars, 1, min)


# maximum de chaque rangée
apply(mtcars, 1, max)


apply(mtcars, 2, function(i) i+2)


## ----rcode=4.4------------------------------
# la taille de 237 étudiants disponibles dans le jeu
# de données 'survey' du library(MASS)
# est-ce qu'il y a une différence de taille entre
# les hommes et les femmes?
t.test(Height ~ Sex, data = survey)
boxplot(survey$Height ~ survey$Sex)

homme <- survey[which(survey$Sex=="Male"),]

femme <- survey[which(survey$Sex=="Female"),]

mean(homme$Height, na.rm = T)
mean(femme$Height, na.rm = T)

## ----rcode=4.5------------------------------
# boxplot pour voir visuellement la différence entre
# les groupes
boxplot(InsectSprays$count ~ InsectSprays$spray)

# Les résultats ne sont pas affichés, ceux-ci sont
# copiés dans un objet nommé aov.spray
aov.spray <- aov(count ~ spray, data = InsectSprays)

# sommaire des résultats
summary(aov.spray)

## ----rcode=4.6------------------------------
# importer 'admit.txt'
admit <- read.table("~/git_repositories/atelier-R-GERAD/data/admit.txt", header = TRUE)

# est-ce que gpa et rank sont relier à gre
fit <- lm(gre ~ gpa+rank, data = admit)

# voir les résultats
summary(fit)

## ----rcode=4.7------------------------------
# est-ce que gpa et rank sont relier à gre
fit.glm <- glm(admit ~ gre+gpa+rank, data = admit,
           family = binomial(link = "logit"))

# voir les résultats
summary(fit.glm)

