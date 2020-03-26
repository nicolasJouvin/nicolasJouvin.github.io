setwd("~/These/Enseignements/Analyse_des_donnee/2019_2020/Supports AC-20200319")
library(FactoMineR)

#######################################################################
#     Exemple 1 : Analyse des correspondances sur les donnees CSP     #
#######################################################################
csp <- read.table(file="./csp.txt",header=T)
dim(csp)

# Test d'independance
chisq.test(csp)

csp.ac <- CA(csp,ncp=7, axes=c(1,2))
csp.ac$eig
csp.ac$col
csp.ac$row

plot(csp.ac,axes=c(3,4),selectRow="cos2 0.4", selectCol="cos2 0.4")


#######################################################################
#    Exemple 2 : Analyse des correspondances sur les donnees vacances #
#######################################################################
vacances <- read.table(file="vacances.txt",header=T)
dim(vacances)

# Test d'independance
chisq.test(vacances)

vacances.ac <- CA(vacances,ncp=7,axes=c(1,2))
vacances.ac$eig
vacances.ac$col
vacances.ac$row

plot(vacances.ac,axes=c(1,2),selectRow="cos2 0.7")#, selectCol="cos2 0.7")


#######################################################################
#    Exemple 3 : Analyse des correspondances sur les donnees mariages #
#######################################################################
mariages <- read.table(file="mariages.txt",header=T)
dim(mariages)

mariages.ac <- CA(mariages,ncp=5,axes=c(1,2))
mariages.ac$eig
mariages.ac$col
mariages.ac$row

plot(mariages.ac,axes=c(1,2),selectRow="cos2 0.7", selectCol="cos2 0.7")


# Suppression des agriculteurs
mariages <- mariages[-1,]
mariages <- mariages[,-1]
mariages

mariages.ac <- CA(mariages,ncp=4,axes=c(1,2))
mariages.ac$eig
mariages.ac$col
mariages.ac$row

plot(mariages.ac,axes=c(1,2),selectRow="cos2 0.7", selectCol="cos2 0.7")


